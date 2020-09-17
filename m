Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D422026D604
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 10:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgIQILz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 04:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIQICN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:02:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0218C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 01:02:12 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50A602DB;
        Thu, 17 Sep 2020 10:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600329697;
        bh=bV5cwmqhhrQLHbAIXHvGo9D6hQvfhlySJRjp1gVRuII=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=q5MLgg9ScRC0D7vsCEeRl+qlbCMT9OjDgy29kEHduFnXhRh2M8O/pUGrDwYQEJRTP
         Bk2aUi0UtEYFawJzzHO4qqWYFWRXB2bT5Exaj2qAy7ub3cvt1ifA2WhdxirYhX7TAB
         LXOWYyypVyZjF7m4XIyvoqnmSsZk0ut/o3TKqvOo=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [VSP-Tests PATCH 2/3] src: monotonic-ts: Monotonic timestamp
 logging
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
 <20200916144302.1483470-3-kieran.bingham@ideasonboard.com>
 <20200917011720.GT3853@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <036374c0-08ce-c5ee-0d62-b609c2a2f12e@ideasonboard.com>
Date:   Thu, 17 Sep 2020 09:01:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917011720.GT3853@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 17/09/2020 02:17, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Wed, Sep 16, 2020 at 03:43:01PM +0100, Kieran Bingham wrote:
>> Introduce a new utility which prefixes a monotonic timestamp rendered in the
>> same format as the kernel logs to all lines fed in through stdin.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  src/Makefile       | 10 +++++++---
>>  src/monotonic-ts.c | 37 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 44 insertions(+), 3 deletions(-)
>>  create mode 100644 src/monotonic-ts.c
>>
>> diff --git a/src/Makefile b/src/Makefile
>> index d7f901f58be6..67216e81ffc4 100644
>> --- a/src/Makefile
>> +++ b/src/Makefile
>> @@ -7,18 +7,22 @@ CFLAGS	?= -O0 -g -W -Wall -Wno-unused-parameter -Iinclude
>>  LDFLAGS	?=
>>  LIBS	:= -lm
>>  GEN-IMAGE := gen-image
>> +MONOTONIC_TS := monotonic-ts
> 
> s/MONOTONIC_TS/MONOTONIC-TS/ to match GEN-IMAGE ?

Hrm, habits of thinking I can't use a hyphen here, yet - clearly we can ;-)

>>  
>>  %.o : %.c
>>  	$(CC) $(CFLAGS) -c -o $@ $<
>>  
>> -all: $(GEN-IMAGE)
>> +all: $(GEN-IMAGE) $(MONOTONIC_TS)
>>  
>>  $(GEN-IMAGE): gen-image.o
>>  	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
>>  
>> +$(MONOTONIC_TS): monotonic-ts.o
>> +	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
>> +
>>  clean:
>>  	-rm -f *.o
>> -	-rm -f $(GEN-IMAGE)
>> +	-rm -f $(GEN-IMAGE) $(MONOTONIC_TS)
>>  
>>  install:
>> -	cp $(GEN-IMAGE) $(INSTALL_DIR)/
>> +	cp $(GEN-IMAGE) $(MONOTONIC_TS) $(INSTALL_DIR)/
> 
> I'd split this on two lines but I'm not sure why, so feel free to ignore
> this :-)

It was two lines, and I looked at it and thought it should be one.
But two makes it easier to extend without modifying the existing
lines... so I actaully prefer two...

>> diff --git a/src/monotonic-ts.c b/src/monotonic-ts.c
>> new file mode 100644
>> index 000000000000..fcb671e06d27
>> --- /dev/null
>> +++ b/src/monotonic-ts.c
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/* SPDX-FileCopyrightText: 2020 Kieran Bingham <kieran.bingham@ideasonboard.com> */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <time.h>
>> +
>> +int main(int argc, char ** argv)
>> +{
>> +	struct timespec tp;
>> +	char *line = NULL;
>> +	size_t size = 0;
>> +	const char *label = "";
>> +
>> +	if (argc > 1)
>> +		label = argv[1];
>> +
>> +	/*
>> +	 * Explicitly set line buffering on stdin to be sure it is delivered
>> +	 * in a timely fashion for our timestamping purposes when data is fed
>> +	 * through a pipe.
>> +	 */
>> +	setlinebuf(stdin);
>> +
>> +	do {
>> +		if (getline(&line, &size, stdin) <= 0)
>> +			break;
>> +
>> +		clock_gettime(CLOCK_MONOTONIC, &tp);
>> +		printf("[%ld.%.9ld]%s %s", tp.tv_sec, tp.tv_nsec, label, line);
>> +	} while (!feof(stdin));
>> +
>> +	free(line);
>> +
>> +	return 0;
>> +}
>> +
> 
> Extra blank line.

It's ok - you can have that one for free ;-)


> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, will update.


-- 
Regards
--
Kieran
