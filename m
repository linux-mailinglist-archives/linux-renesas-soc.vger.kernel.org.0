Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C0E39E446
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 18:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFGQqx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 12:46:53 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:39639 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFGQqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 12:46:53 -0400
Received: by mail-lf1-f49.google.com with SMTP id p17so26575643lfc.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UCH4XuaXVFrfpcxb9bP1cFx2Gud3zEeTHMEmvlTBNjM=;
        b=OAsW2C/iXlAf0hbA45vWWDyy2q2a6JsIe3/CrYGLmR2gVSlsQ/CpVtX9WpHnTzKq7O
         6cwHbFgb7HIyajOBDaEtsbsGHSPhFPaxSSPUZa6Az7JHs9NhTA9JJg6AefN0lOOqtijI
         gi0xe+YMCcPlpj2FvN2No0M//9QEzAFiFQydpyE/pso9XbfXHJK+/4IsJCe87UcMUGTu
         hU7XcwIXxhZEZSSESykxrzQdOPUQPM/vqfYbSlONrpGVx3vgQJuCn0phafqJUg8rcyjH
         uRW2+kIXxgci4HsxzTO92A8KiRr1t29b0u3z4wg8s5h7xHBYILSbmb/+/XPWd16YylR5
         g6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UCH4XuaXVFrfpcxb9bP1cFx2Gud3zEeTHMEmvlTBNjM=;
        b=NdmTSuXQBHJ4rMe60+hI0ZZYN7fduwFTR5/eR3D4ORY6V1Me7Q3b5QUJExPozYh2oB
         Jgo+yb2lioc510vZEnliA6p8INlrmpdkowq6InmF+ZS0Cyisp67q/tVlw1oRbdFjrey3
         hkhZ/JYCqBT3dp1D4yWnfZ0K4dBrUH7Z2sPIzaiZ4ThCbXGH212HsNtvB/SV0jYzThEq
         dSYVJ+4GpBZycNi4f4HayqRqzJ0i77nZ3//f04GSt5chH+Tx8yaDGcxbTw3Y/SrwWcKa
         h0gtuTtoYazfvkX/BZHwPj6l7wBPDVsk3Cq8/am14MMGsud8W3TXaoKUZwDWkyA63hkF
         KDpA==
X-Gm-Message-State: AOAM531vybxpezJ5OkbuLnoozNFBuJFrzV5esI1PX4BRgkMXUk8p8wan
        wPDlGr77gpPxTM2UHBbNt8xNrg==
X-Google-Smtp-Source: ABdhPJxS3h81wx9WQ5tifbrrisgQHLS6vkOP3cf7NIh97cc+tRpRfHJ+1Wv9dWLUtFfUfzFmGcTZYg==
X-Received: by 2002:a19:c749:: with SMTP id x70mr12996580lff.77.1623084240705;
        Mon, 07 Jun 2021 09:44:00 -0700 (PDT)
Received: from localhost (h-62-63-236-217.A463.priv.bahnhof.se. [62.63.236.217])
        by smtp.gmail.com with ESMTPSA id p28sm1548743lfa.74.2021.06.07.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 09:44:00 -0700 (PDT)
Date:   Mon, 7 Jun 2021 18:43:59 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Do not shadow
 rcar_gen3_ths_tj_1
Message-ID: <YL5Mz3F/pHkMmZCS@oden.dyn.berto.se>
References: <9ea7e65d0331daba96f9a7925cb3d12d2170efb1.1623076804.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ea7e65d0331daba96f9a7925cb3d12d2170efb1.1623076804.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-07 16:41:20 +0200, Geert Uytterhoeven wrote:
> With -Wshadow:
> 
>     drivers/thermal/rcar_gen3_thermal.c: In function ‘rcar_gen3_thermal_probe’:
>     drivers/thermal/rcar_gen3_thermal.c:310:13: warning: declaration of ‘rcar_gen3_ths_tj_1’ shadows a global declaration [-Wshadow]
>       310 |  const int *rcar_gen3_ths_tj_1 = of_device_get_match_data(dev);
> 	  |             ^~~~~~~~~~~~~~~~~~
>     drivers/thermal/rcar_gen3_thermal.c:246:18: note: shadowed declaration is here
>       246 | static const int rcar_gen3_ths_tj_1 = 126;
> 	  |                  ^~~~~~~~~~~~~~~~~~
> 
> To add to the confusion, the local variable has a different type.
> 
> Fix the shadowing by renaming the local variable to ths_tj_1.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index e1e412348076b2ff..42c079ba0d51e4b3 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -307,7 +307,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  {
>  	struct rcar_gen3_thermal_priv *priv;
>  	struct device *dev = &pdev->dev;
> -	const int *rcar_gen3_ths_tj_1 = of_device_get_match_data(dev);
> +	const int *ths_tj_1 = of_device_get_match_data(dev);
>  	struct resource *res;
>  	struct thermal_zone_device *zone;
>  	int ret, i;
> @@ -352,8 +352,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		priv->tscs[i] = tsc;
>  
>  		priv->thermal_init(tsc);
> -		rcar_gen3_thermal_calc_coefs(tsc, ptat, thcodes[i],
> -					     *rcar_gen3_ths_tj_1);
> +		rcar_gen3_thermal_calc_coefs(tsc, ptat, thcodes[i], *ths_tj_1);
>  
>  		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
>  							    &rcar_gen3_tz_of_ops);
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
