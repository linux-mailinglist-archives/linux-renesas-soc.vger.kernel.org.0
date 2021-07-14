Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716163C8632
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhGNOem (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 10:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhGNOel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 10:34:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2C4C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 07:31:49 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 22so3907912lfy.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H2V/kdI/HFQSQTzLTATWpsLMZMMUD+2Yxl+6O8w7UB4=;
        b=Kv/Dv6i4R/mRzmGJUkWkbMrdds2lMbMAy/mdmKQFOnfNANowDD2p+TkdbItLoLju+e
         BDlyLR+r42i2uoZ/XYqstwGHe7nR+XDtO+XY94WABpi4IRGiRTy83rLe+f8WWu2Gziiy
         xQQuurw2neyZdMYGxkXNIYdgi7R6LTYR4ypP2TuZHW3nLiURO7iGao+PvIYilARtyem3
         U+4Vx2plh56PS9alqx8XaRZE3J+r3s/zjTB3msXAa1R0qCmxMLRMrhE7Tdr4tJcFif/K
         vICsJJ8ifnwSe0QnhuXkhKlKNmn8fqDyLKIKHLj09RQzM3EXqBPs0NGOvKyaSfRzUrhz
         3mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H2V/kdI/HFQSQTzLTATWpsLMZMMUD+2Yxl+6O8w7UB4=;
        b=ttY5U7XVdgIL69bhAg1UadmVHfBnGChomq/mLxMJoPgt/2R0svQKq8TrRu7VK8hK1z
         0vDeP8YqHXXUBBhsKPPPTsMgc+3kru9MCQ/097hvt1PZR3BOVCpLAXZqXz0rIZEz5+sP
         e45pPRrdG0VadHFGzZgZmXkLDhByGquF1ZT789ou0Zo78fUmi/UuUMO8zx5KKcz2HPuc
         fIzidER/P/KgZBmzVoQfiTsAqcH9b5cQXHCM/hUTE3tikTuyi2mbDF+nbx/aHFAqoXBV
         eIy49rTJNJ6ZtnvhJbT1W3xHkb817u9aNVT3vxaTXYi93qYUgJDf8j/xZ//BCiIX122V
         ValA==
X-Gm-Message-State: AOAM53328f0e+ELqZQroc5ltabPYvYf/fhBvyLXkVB9HWo0pjKtQC5T/
        nKFRnuT/bOp+89sQdKgWGYKXwg==
X-Google-Smtp-Source: ABdhPJyLvnTyj20FZrRIG+ZFY4zKcSRRvm5LhDzva/HzPnprtgxVXzUkdBqS7MPOKOtPZqjenRgq4Q==
X-Received: by 2002:a19:fc03:: with SMTP id a3mr8377004lfi.327.1626273108029;
        Wed, 14 Jul 2021 07:31:48 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id c5sm256629ljj.17.2021.07.14.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 07:31:47 -0700 (PDT)
Date:   Wed, 14 Jul 2021 16:31:46 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Always use local variable dev in
 gpio_rcar_probe()
Message-ID: <YO71UmT5tqOpSxcB@oden.dyn.berto.se>
References: <c2d40c6934507ee694be43cda24387a1feef7b10.1626267044.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2d40c6934507ee694be43cda24387a1feef7b10.1626267044.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-07-14 14:51:13 +0200, Geert Uytterhoeven wrote:
> As we have already have a pointer to the device structure in a local
> variable in gpio_rcar_probe(), we can just use "dev" instead of
> "p->dev".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/gpio/gpio-rcar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index e7092d5fe700d2ce..ae1ffb2b230d4a32 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -564,9 +564,9 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>  	}
>  
>  	if (p->info.has_inen) {
> -		pm_runtime_get_sync(p->dev);
> +		pm_runtime_get_sync(dev);
>  		gpio_rcar_enable_inputs(p);
> -		pm_runtime_put(p->dev);
> +		pm_runtime_put(dev);
>  	}
>  
>  	dev_info(dev, "driving %d GPIOs\n", npins);
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
