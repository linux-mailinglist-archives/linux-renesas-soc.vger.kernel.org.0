Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59BE67CC03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 20:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbfGaSb3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 14:31:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38695 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730223AbfGaSb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 14:31:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so66616211ljg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2019 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vJsDdz97Zw8TmBEYszzsJ8gyO9JaskPZ5TL5se9kcjA=;
        b=ZtzyL0pke78WEoqcC1HmSkoKajJIDVMZeoe+5p+yaAmx3hD1xuoyzPkVkKjl8TmGjQ
         XC4pS7GjBwcmXhs7bWlqGDFa63FIbp6mh+52eJBo2HIdEY5z8GOlovv1IdNxyH/NYxMk
         Jx/re55xJAdBYszVzmOCGgVfsV3boxFF63AkE+tyz0hIpUbRdcUVKNMzgfyulgb5WhL9
         mof3sr9k3RHxdsMTdzLIXSPT61//tGAIe9dDTgFR5ak7leoMC2citpECb8nc7F983vUZ
         zXtTJlXNdZajRLk+IAj1xHuLbs0/ORQwlWec1U+v0hOOI9uyHT2j7LXc3GKgjJpNznTQ
         Y+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vJsDdz97Zw8TmBEYszzsJ8gyO9JaskPZ5TL5se9kcjA=;
        b=A7kaOGn2TL27DWO2+pzpFhF9B3rl8iRzAFgmCStMd+2JdJa5z+M0FuYlgj5/Miyi/L
         VSQJFSxgG4vDrF2QYRDAioFv+/nSrPKH/IpbevZv9T4LdU2OJVCVmIDcL3n6d32sE6Ji
         6kCZsX37jil0cGzWJ4m+eBQdsjw/tHBrE518O7LlX6VffEuggObDL2PtEKCDyDS/ne1a
         QtR3Jf1jpNixxJeCvBHVp8T5BxW7Hf+lAAzJ76Z2RKdi2neF3UcePFeBUvcdlm+G273u
         /wl1GGoeJ3wBE1JR2MecU5QMYzx5ZdV/xlIxKrYzfNV/jup6kyBU43jG0DqLtLd9+sg6
         6j1g==
X-Gm-Message-State: APjAAAVGcqIscHOHtwxbycpDC8YQR2teZM40BRT3L0pZpvzUc1Y4W7Xk
        vSIr46rIct7D8co4PvoRU1AVDs76
X-Google-Smtp-Source: APXvYqyMRZvxrjpzkGKYM5vNarRToNAYiMIQoNVYAKKWF6rx8DqNWkHQU9ZXrUOjSK/HVBfnxh5GEg==
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr67030510ljj.160.1564597886166;
        Wed, 31 Jul 2019 11:31:26 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id 27sm14067933ljw.97.2019.07.31.11.31.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 11:31:24 -0700 (PDT)
Date:   Wed, 31 Jul 2019 20:31:24 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: Use dev_notice_once() instead of
 open-coding
Message-ID: <20190731183124.GK3186@bigcity.dyn.berto.se>
References: <20190731132406.17381-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190731132406.17381-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-07-31 15:24:06 +0200, Geert Uytterhoeven wrote:
> At the time of commit 9a643c9a11259955 ("sh-pfc: Convert message
> printing from pr_* to dev_*"), the dev_*_once() variants didn't exist
> yet, so the once behavior was open-coded.
> 
> Since commit e135303bd5bebcd2 ("device: Add dev_<level>_once variants")
> they do, so "revert" to the good practice of using a helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in sh-pfc-for-v5.4.
> 
>  drivers/pinctrl/sh-pfc/gpio.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
> index 97c1332c1045739a..64c09aa374ae011f 100644
> --- a/drivers/pinctrl/sh-pfc/gpio.c
> +++ b/drivers/pinctrl/sh-pfc/gpio.c
> @@ -255,18 +255,13 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
>  #ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
>  static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
>  {
> -	static bool __print_once;
>  	struct sh_pfc *pfc = gpio_to_pfc(gc);
>  	unsigned int mark = pfc->info->func_gpios[offset].enum_id;
>  	unsigned long flags;
>  	int ret;
>  
> -	if (!__print_once) {
> -		dev_notice(pfc->dev,
> -			   "Use of GPIO API for function requests is deprecated."
> -			   " Convert to pinctrl\n");
> -		__print_once = true;
> -	}
> +	dev_notice_once(pfc->dev,
> +			"Use of GPIO API for function requests is deprecated, convert to pinctrl\n");
>  
>  	if (mark == 0)
>  		return -EINVAL;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
