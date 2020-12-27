Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714F62E319A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 15:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgL0Otx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 09:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgL0Otx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 09:49:53 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5A6C061794
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Dec 2020 06:49:12 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id cw27so7655624edb.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Dec 2020 06:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vf7xqAIlct0FZ9y55UdSrXZqbpkp0KKP1quWzU9GkMI=;
        b=Cij25xoyIQKybPsCKaWfm4QNIzQyVE/UBdmzX7tgepJCuIl6he1UZdjeW3dZ2orR9+
         js3z/wpBFU9xvS4apM2OXldlSZznMD0u78Tcoa5+0VrPhGi6q6rq/71GAIBBt4HIuTwK
         U3QDDyx/6WkYFmlg+T5ThGrJgbYdekPBBZt9R83iT+gOldxH7fhenRcEAAi8MYN2jtek
         +aBCLVgmC2ySGqFyoyCJgOEbsPSTSmNwwllHcnntqPNG/v8h3H7mFEzavdLLbkcJ1fro
         yiC2lOyTYKmwLhz5sAIqLXpUDTJ4QGYr8PAJ6UXyxaXHEIBac4z4AdL9FJAH8+68G+jt
         LeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vf7xqAIlct0FZ9y55UdSrXZqbpkp0KKP1quWzU9GkMI=;
        b=EPu4puJINxvazWWrqpuIO8SDuFgBNHXLJRV6MC5FHCRTdhYLJ4pMLmhzFNtChBR+kc
         6vaJv7B8KQeA6lxcDkRXS2wUHAejlL1l2cCi+By96JSrS22fJiDlgx8pT/vfzTkqq0uG
         1NasSZbNVH/wcbayxIw6rYp/VxpWXjAcG8lIY/7vAudHLfyS9jumiDe+nTgmvJAsRRo7
         mPcRk2lHTq2UDftP4KDnXiBceVwik87el/pIMjtTU2GQKyMojlbWQ0iMXgE0hcxVM7NU
         L8/Y+yaPOc8S/2/ewdytwBzkZBy5PLbup1Mu+VXNfwGs9RQ3w+YrZxPGBs3m4sOeFHcz
         YhsA==
X-Gm-Message-State: AOAM532YFrAy3fm52spUvBJ8b7Jx5zbcmQb1WEknW5gW5qnyTW67PFzO
        ZT/LX6Voe1OZDsXAGHOImC7AXw==
X-Google-Smtp-Source: ABdhPJxqIDNg3cJqSafKbntptXplAZP+T6zh3F+faG4JebVPK06L+r9wa9D1k2Ywm6EOxaV0gSSKrQ==
X-Received: by 2002:a50:8b66:: with SMTP id l93mr37969540edl.384.1609080551135;
        Sun, 27 Dec 2020 06:49:11 -0800 (PST)
Received: from localhost ([192.36.80.8])
        by smtp.gmail.com with ESMTPSA id ch30sm35707247edb.8.2020.12.27.06.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 06:49:10 -0800 (PST)
Date:   Sun, 27 Dec 2020 15:49:07 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Magnus Damm <damm@opensource.se>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/sh_cmt: Make sure channel clock
 supply is enabled
Message-ID: <X+ie4/6dt+ZJ8qH2@wyvern>
References: <20201210194648.2901899-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201210194648.2901899-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-12-10 20:46:48 +0100, Geert Uytterhoeven wrote:
> The Renesas Compare Match Timer 0 and 1 (CMT0/1) variants have a
> register to control the clock supply to the individual channels.
> Currently the driver does not touch this register, and relies on the
> documented initial value, which has the clock supply enabled for all
> channels present.
> 
> However, when Linux starts on the APE6-EVM development board, only the
> clock supply to the first CMT1 channel is enabled.  Hence the first
> channel (used as a clockevent) works, while the second channel (used as
> a clocksource) does not.  Note that the default system clocksource is
> the Cortex-A15 architectured timer, and the user needs to manually
> switch to the CMT1 clocksource to trigger the broken behavior.
> 
> Fix this by removing the fragile dependency on implicit reset and/or
> boot loader state, and by enabling the clock supply explicitly for all
> channels used instead.  This requires postponing the clk_disable() call,
> else the timer's registers cannot be accessed in sh_cmt_setup_channel().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Tested on R-Mobile APE6, R-Car M2-W, and R-Car H3 ES2.0.
> ---
>  drivers/clocksource/sh_cmt.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
> index e258230d432c0002..c98f8851fd680454 100644
> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -235,6 +235,8 @@ static const struct sh_cmt_info sh_cmt_info[] = {
>  #define CMCNT 1 /* channel register */
>  #define CMCOR 2 /* channel register */
>  
> +#define CMCLKE	0x1000	/* CLK Enable Register (R-Car Gen2) */
> +
>  static inline u32 sh_cmt_read_cmstr(struct sh_cmt_channel *ch)
>  {
>  	if (ch->iostart)
> @@ -853,6 +855,7 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
>  				unsigned int hwidx, bool clockevent,
>  				bool clocksource, struct sh_cmt_device *cmt)
>  {
> +	u32 value;
>  	int ret;
>  
>  	/* Skip unused channels. */
> @@ -882,6 +885,11 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
>  		ch->iostart = cmt->mapbase + ch->hwidx * 0x100;
>  		ch->ioctrl = ch->iostart + 0x10;
>  		ch->timer_bit = 0;
> +
> +		/* Enable the clock supply to the channel */
> +		value = ioread32(cmt->mapbase + CMCLKE);
> +		value |= BIT(hwidx);
> +		iowrite32(value, cmt->mapbase + CMCLKE);
>  		break;
>  	}
>  
> @@ -1014,12 +1022,10 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
>  	else
>  		cmt->rate = clk_get_rate(cmt->clk) / 8;
>  
> -	clk_disable(cmt->clk);
> -
>  	/* Map the memory resource(s). */
>  	ret = sh_cmt_map_memory(cmt);
>  	if (ret < 0)
> -		goto err_clk_unprepare;
> +		goto err_clk_disable;
>  
>  	/* Allocate and setup the channels. */
>  	cmt->num_channels = hweight8(cmt->hw_channels);
> @@ -1047,6 +1053,8 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
>  		mask &= ~(1 << hwidx);
>  	}
>  
> +	clk_disable(cmt->clk);
> +
>  	platform_set_drvdata(pdev, cmt);
>  
>  	return 0;
> @@ -1054,6 +1062,8 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
>  err_unmap:
>  	kfree(cmt->channels);
>  	iounmap(cmt->mapbase);
> +err_clk_disable:
> +	clk_disable(cmt->clk);
>  err_clk_unprepare:
>  	clk_unprepare(cmt->clk);
>  err_clk_put:
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
