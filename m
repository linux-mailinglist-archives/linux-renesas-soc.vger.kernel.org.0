Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A17FC080
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 08:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfKNHGJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Nov 2019 02:06:09 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35958 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNHGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 02:06:09 -0500
Received: by mail-lj1-f195.google.com with SMTP id k15so5453415lja.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2019 23:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HNwjRZVeJPW1DzQ2sDEPBOR29at5fBUhlCm7+UcxEts=;
        b=CWuDxKdGbMrWi87A/NeoOi6c6q3Z7UVyQkGGT9fgSO+HimLYkZ3HkfTSMSdsd3NRRl
         7jFje/KDNLMK1OwveRXEImTdzBJZOs6VixpFvJW05JsgQd7KV7PKjMsdOtPBGlaEmSaM
         LRPBvihYzHAJRvvpGjzDvGqmQ+dWxAlEWPljG8L+uDAuhXeQL8NwPw1A6NKGfEl6iTvd
         3//CTTiqsSQW+fROGTr1qWlkw+wZ6BQANcfy1SYHF/Z0arAKAi3mIJ8KBeTKKy9DKlrR
         UO8JeOuCexzv2ZqfWMc3Dm/v7sPknqgetP+i+NKTyGlr187v66iSLfueuxhHe/qj3/3e
         YChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HNwjRZVeJPW1DzQ2sDEPBOR29at5fBUhlCm7+UcxEts=;
        b=kAdMsnfFAyTMgqjPhMUJIhLvuY4eBrdvr9of667UEixk/m4wFJ2yMTD68XTJaJ9cV+
         lT07fk3Bq4SBXjm86BXY91miYbtqL3pg22sHYfp6eAKYvj9SJSoq9mCgMZSMEEvEtbeG
         y1jdsw87QKVhWrb3L/RZN1H2HPaRhcDFMmKriWdv9NnyRWePb1vdTFYdziT/HeDegT9f
         79ab5Ud22m0/X1lhY1oCrnOa1tz3XOPN8MWRGBmb2r/pCF58p1xX1oZ9V6i4cWoibShs
         axentO6cgTQ7i3zRaIX5fXMefcrzO8ry+w+wewNdILtgMqV5pi1odN6kjroivMthU/Qo
         S03Q==
X-Gm-Message-State: APjAAAUYCjlJK6yqPuM4rN1ZPxo+wVuF3B6M3XJh1TdwThYBeSrpyx5E
        E88I3kmQeKGtool3GmbY4vzWpg==
X-Google-Smtp-Source: APXvYqy4L+eE7JM/hdVvH0KG8Pjt9SfjYCWVVaFWIc+UlZ6iDLF/Ps0EWeqif+D7mNPCvVvCWrxAIw==
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr5432933ljk.81.1573715165904;
        Wed, 13 Nov 2019 23:06:05 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id a15sm2043327lfj.78.2019.11.13.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 23:06:04 -0800 (PST)
Date:   Thu, 14 Nov 2019 08:06:04 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: Make legacy function GPIO handling less
 fragile
Message-ID: <20191114070604.GB26902@bigcity.dyn.berto.se>
References: <20191113101809.28600-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113101809.28600-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-11-13 11:18:09 +0100, Geert Uytterhoeven wrote:
> If there are no function GPIOs, sh_pfc_register_gpiochip() returns early
> with a success indicator.  This is fragile, as new code may be added
> after the #ifdef block, which won't be executed in case of early return.
> 
> Invert the logic, so the code always continues until the end of the
> function on success.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in sh-pfc-for-v5.6.
> 
>  drivers/pinctrl/sh-pfc/gpio.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
> index 5a55b8da7919520e..8213e118aa408573 100644
> --- a/drivers/pinctrl/sh-pfc/gpio.c
> +++ b/drivers/pinctrl/sh-pfc/gpio.c
> @@ -386,12 +386,11 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
>  	}
>  
>  	/* Register the function GPIOs chip. */
> -	if (pfc->info->nr_func_gpios == 0)
> -		return 0;
> -
> -	chip = sh_pfc_add_gpiochip(pfc, gpio_function_setup, NULL);
> -	if (IS_ERR(chip))
> -		return PTR_ERR(chip);
> +	if (pfc->info->nr_func_gpios) {
> +		chip = sh_pfc_add_gpiochip(pfc, gpio_function_setup, NULL);
> +		if (IS_ERR(chip))
> +			return PTR_ERR(chip);
> +	}
>  #endif /* CONFIG_PINCTRL_SH_FUNC_GPIO */
>  
>  	return 0;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
