Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270CC26D078
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 03:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgIQBRz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 21:17:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60412 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgIQBRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 21:17:53 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B0E6276;
        Thu, 17 Sep 2020 03:17:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600305470;
        bh=SVTL79fl8Ap5K1qUIIeWFv1drmw/w3ZyLJtJXx09Yts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kFH3CwO0mFid6NtNMubBOrA6HJvGdYUqgoErNGoed6cjWnIO8XoPoFZY473sl4gFy
         ZCCN7SgnhXEmxuXvDPwjWekeodXco5Znc26cRutPWSwSpwrDdSx4qECeun/EJarPqi
         CSqRJB079dlcOSDuT9obj/+u/AMulhRVRfc3fGrw=
Date:   Thu, 17 Sep 2020 04:17:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 2/3] src: monotonic-ts: Monotonic timestamp
 logging
Message-ID: <20200917011720.GT3853@pendragon.ideasonboard.com>
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
 <20200916144302.1483470-3-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916144302.1483470-3-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Sep 16, 2020 at 03:43:01PM +0100, Kieran Bingham wrote:
> Introduce a new utility which prefixes a monotonic timestamp rendered in the
> same format as the kernel logs to all lines fed in through stdin.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  src/Makefile       | 10 +++++++---
>  src/monotonic-ts.c | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 3 deletions(-)
>  create mode 100644 src/monotonic-ts.c
> 
> diff --git a/src/Makefile b/src/Makefile
> index d7f901f58be6..67216e81ffc4 100644
> --- a/src/Makefile
> +++ b/src/Makefile
> @@ -7,18 +7,22 @@ CFLAGS	?= -O0 -g -W -Wall -Wno-unused-parameter -Iinclude
>  LDFLAGS	?=
>  LIBS	:= -lm
>  GEN-IMAGE := gen-image
> +MONOTONIC_TS := monotonic-ts

s/MONOTONIC_TS/MONOTONIC-TS/ to match GEN-IMAGE ?
>  
>  %.o : %.c
>  	$(CC) $(CFLAGS) -c -o $@ $<
>  
> -all: $(GEN-IMAGE)
> +all: $(GEN-IMAGE) $(MONOTONIC_TS)
>  
>  $(GEN-IMAGE): gen-image.o
>  	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
>  
> +$(MONOTONIC_TS): monotonic-ts.o
> +	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
> +
>  clean:
>  	-rm -f *.o
> -	-rm -f $(GEN-IMAGE)
> +	-rm -f $(GEN-IMAGE) $(MONOTONIC_TS)
>  
>  install:
> -	cp $(GEN-IMAGE) $(INSTALL_DIR)/
> +	cp $(GEN-IMAGE) $(MONOTONIC_TS) $(INSTALL_DIR)/

I'd split this on two lines but I'm not sure why, so feel free to ignore
this :-)

> diff --git a/src/monotonic-ts.c b/src/monotonic-ts.c
> new file mode 100644
> index 000000000000..fcb671e06d27
> --- /dev/null
> +++ b/src/monotonic-ts.c
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* SPDX-FileCopyrightText: 2020 Kieran Bingham <kieran.bingham@ideasonboard.com> */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <time.h>
> +
> +int main(int argc, char ** argv)
> +{
> +	struct timespec tp;
> +	char *line = NULL;
> +	size_t size = 0;
> +	const char *label = "";
> +
> +	if (argc > 1)
> +		label = argv[1];
> +
> +	/*
> +	 * Explicitly set line buffering on stdin to be sure it is delivered
> +	 * in a timely fashion for our timestamping purposes when data is fed
> +	 * through a pipe.
> +	 */
> +	setlinebuf(stdin);
> +
> +	do {
> +		if (getline(&line, &size, stdin) <= 0)
> +			break;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &tp);
> +		printf("[%ld.%.9ld]%s %s", tp.tv_sec, tp.tv_nsec, label, line);
> +	} while (!feof(stdin));
> +
> +	free(line);
> +
> +	return 0;
> +}
> +

Extra blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
