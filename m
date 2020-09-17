Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3713526D079
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 03:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgIQBRz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 21:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgIQBRz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 21:17:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569FEC06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 18:17:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33075329;
        Thu, 17 Sep 2020 03:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600305471;
        bh=SW+gaQQ/uIYtkqkYhD+oUdkXdmfaj4EzwiIB/X5Nwf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gcgU1oxZn/8SSiGRZrtwbIxODycKfAZiZm5JzgBa5zpx0jpzLxiT6hojuJHX5K887
         prfDOmYrcA3x/LhUjKHrGN0RWhJQ3P3yZ30rfIf+nf5tZosgG4AtDMyHc6ecx4oWhL
         XKu5vVIe8rJLmMHItEURMPN0j03luoEBpKbHTmyY=
Date:   Thu, 17 Sep 2020 04:17:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 3/3] scripts/logger: Use new monotonic-ts tool
Message-ID: <20200917011721.GA14923@pendragon.ideasonboard.com>
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
 <20200916144302.1483470-4-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916144302.1483470-4-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Sep 16, 2020 at 03:43:02PM +0100, Kieran Bingham wrote:
> Utilise the new monotonic timestamping tool to remove the manual parsing of
> timestamps via /proc/timer_list which can only be read by root.
> 
> This also simplifies the processing required and contains all timestamping
> actions within a single process space.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  scripts/logger.sh | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/scripts/logger.sh b/scripts/logger.sh
> index 97e1f582da2b..452ebc8c82ba 100755
> --- a/scripts/logger.sh
> +++ b/scripts/logger.sh
> @@ -2,23 +2,11 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
>  
> -now() {
> -	awk '/^now/ {time=$3; printf("[%u.%06u]", time / 1000000000, (time % 1000000000) / 1000) ; exit}' /proc/timer_list
> -}
> -
>  label=${1:+ [$1]}
>  
>  TRACE_MARKER=/sys/kernel/debug/tracing/trace_marker
> -if [ -e $TRACE_MARKER ]; then
> -	extra_log_files=$TRACE_MARKER
> +if [ -e $TRACE_MARKER ] && [ $(id -u) == 0 ]; then
> +	./monotonic-ts $label | tee -a $TRACE_MARKER
> +else
> +	./monotonic-ts $label
>  fi
> -
> -while read line ; do
> -	newline="$(now)$label $line"
> -
> -	echo "$newline"
> -
> -	for f in $extra_log_files; do
> -		echo "$newline" >> $f;
> -	done;
> -done

In logger.sh line 8:
if [ -e $TRACE_MARKER ] && [ $(id -u) == 0 ]; then
                             ^------^ SC2046: Quote this to prevent word splitting.
                                      ^-- SC2039: In POSIX sh, == in place of = is undefined.


In logger.sh line 9:
        ./monotonic-ts $label | tee -a $TRACE_MARKER
                       ^----^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
        ./monotonic-ts "$label" | tee -a $TRACE_MARKER


In logger.sh line 11:
        ./monotonic-ts $label
                       ^----^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
        ./monotonic-ts "$label"

For more information:
  https://www.shellcheck.net/wiki/SC2039 -- In POSIX sh, == in place of = is ...
  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
  https://www.shellcheck.net/wiki/SC2086 -- Double quote to prevent globbing ...

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
