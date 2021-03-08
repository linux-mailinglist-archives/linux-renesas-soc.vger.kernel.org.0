Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D8D330D10
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 13:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhCHMFE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 07:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhCHMEp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 07:04:45 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6A2C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 04:04:44 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id q14so15740966ljp.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 04:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PofKU5fYnxxOMgDa7t33J+cuJBqENnTThP7WGOHCZv0=;
        b=cWKXRDEg9DF0vSw0nmIT+Q3dQhbsxAYl9CH/93CahPPQg3c1sF9wfhPuVbcoA+W9zN
         5zLqENvPWNDHihvL5Yrn+qyIVgtABZlt13RUT0I/Bo40CqW04XCi8F44+u57qWpehevv
         feecPzQX/SEqFX74RLyVVwaG/xjShciCDfTnLf9yDm7jq7yeIOJCyfZkc9mjQ6/2jKDg
         8uYqxeslEtmflGwBRQuob2nmKrPP2oXC6k87K5+7Ow498/lruUqduP5KTV2SKN8uP6+A
         lKics7ODvAzuGOQ08WwRNlY2zv4GTfxhgr1KB5VS1dKp3PC52CZhb+2DUMwtY55uzk5X
         DAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PofKU5fYnxxOMgDa7t33J+cuJBqENnTThP7WGOHCZv0=;
        b=qPvukDeWTC+r/j+wvwSGDKVT3lHkhSVTrehf+0DurCzJQ++2rzvlbrZB/puzTJEoYv
         yVUToSDrcb+dHxNonWefA87JkCaEd8ysaFcNysl31jCVy0vEKPh4cnusW8KAilCn5x8W
         AVUJNCU7aTIS51VIhQdoi7a1ZFnmIOlOJqNuDrvpv1RHmUUrhC6d8foSmKKLvsibONBu
         SRgAc7+zWyWHKqKO54NBUTA5IIi4GmTeE6+V/rTWuzfJ8nBXG8kBfdR8SPRXkweE3rMa
         SJVKUGGvDibJC2Yqa4wp+wCHNWnx+66y/b60Mx2zUheMCHu61TGpbMYFpEoBG3TaUcdj
         Y/mg==
X-Gm-Message-State: AOAM531vXBHKOqZiIeO5ss6zckk2QOmjZgUCEBmtxPu3zxpYialrfR4K
        S0TLCPNlA1U39Ug1+noByFibFg==
X-Google-Smtp-Source: ABdhPJyKsYUK3p1THrKqpc10r4ZRrHOtC5I98vqFKGBhDSdvsbrXiZL6WVtGkFDNJDhvtWWNR/7vyw==
X-Received: by 2002:a2e:9098:: with SMTP id l24mr8532795ljg.150.1615205083214;
        Mon, 08 Mar 2021 04:04:43 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e30sm1330671lfc.261.2021.03.08.04.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 04:04:42 -0800 (PST)
Date:   Mon, 8 Mar 2021 13:04:41 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH] clocksource: sh_cmt: use CMTOUT_IE only when supported
Message-ID: <YEYS2YZF3xcyzQpf@oden.dyn.berto.se>
References: <20210305132859.8208-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305132859.8208-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2021-03-05 14:28:59 +0100, Wolfram Sang wrote:
> CMTOUT_IE is only supported for older SoCs. Newer SoCs shall not set
> this bit. So, add a version check.
> 
> Reported-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Confirmed with datasheets and could successfully repeat Niklas' CMT
> tests on an R-Car M3N based Salvator-XS.
> 
>  drivers/clocksource/sh_cmt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
> index c98f8851fd68..3b53c6cb1da9 100644
> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -143,6 +143,7 @@ struct sh_cmt_device {
>  #define SH_CMT32_CMCSR_SSIE		(1 << 10)
>  #define SH_CMT32_CMCSR_CMS		(1 << 9)
>  #define SH_CMT32_CMCSR_CMM		(1 << 8)
> +/* CMTOUT_IE only for SH_CMT_32BIT and SH_CMT_48BIT */
>  #define SH_CMT32_CMCSR_CMTOUT_IE	(1 << 7)
>  #define SH_CMT32_CMCSR_CMR_NONE		(0 << 4)
>  #define SH_CMT32_CMCSR_CMR_DMA		(1 << 4)
> @@ -339,8 +340,9 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
>  		sh_cmt_write_cmcsr(ch, SH_CMT16_CMCSR_CMIE |
>  				   SH_CMT16_CMCSR_CKS512);
>  	} else {
> -		sh_cmt_write_cmcsr(ch, SH_CMT32_CMCSR_CMM |
> -				   SH_CMT32_CMCSR_CMTOUT_IE |
> +		u32 cmtout = ch->cmt->info->model <= SH_CMT_48BIT ?
> +			      SH_CMT32_CMCSR_CMTOUT_IE : 0;
> +		sh_cmt_write_cmcsr(ch, cmtout | SH_CMT32_CMCSR_CMM |
>  				   SH_CMT32_CMCSR_CMR_IRQ |
>  				   SH_CMT32_CMCSR_CKS_RCLK8);
>  	}
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
