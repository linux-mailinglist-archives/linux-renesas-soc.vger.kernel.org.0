Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1647B2135
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 17:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbjI1P0l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 11:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbjI1P0d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 11:26:33 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23C8C0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:26:31 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c123eed8b2so216333931fa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1695914790; x=1696519590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wjnmamWQno/bcoFgz+0JU8vY7BMIaTQGJGqwToyUNas=;
        b=1uQ6oK8Fddlv0xbhfX7OP3l/U84VaoQSdlnioFAzQuTpv1Uki65+W6Sjx6rdF/Q2N/
         cI1OZ8Cl8UgAM9oaStUtfdGtibaGBa2yjHv7LG/2b+KBEYJgWPu4GvmSK47cPaDQmnUX
         EGGzAPaNI+F6ZKroOFeEYoOLh51+f7y9t6hIrapNeEVJ+y/dN5A8LSZ0nCW/5H2k8eKB
         qfgCYEJhL0d7n9AW7sghWYWAlWvm3Rm1R0Sb+8ZpsL+YCLWpQk7UHIubKuJnOLwtpJ7A
         BhUzAAuGpl+/Ao6RxQ10zTh8Q+DI8kPiQ8wL+Oxwq+Q37P4sNbvd9ptBaQ9WpL8GMREB
         VSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914790; x=1696519590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjnmamWQno/bcoFgz+0JU8vY7BMIaTQGJGqwToyUNas=;
        b=kklxCmLtdB/FGRFvTFlarj0PPjlqtPt1vv7QiCfurP7+eZF6v4KOHyn7l8fxV12C2M
         Dvztd2IJF54PHvOSWnXxidBSJb6ripFjQqs6oqTIY5V7zoLq6nTPMWa+rUeiGiHie1wP
         A7ql55MURDDaW/lH6Y4dB8RSqwav8jRb7oenXMIR2qUuGH1Oy/ZhY+bbBUJF0S+cq9do
         Nm5rfRlswd3S/k98jMa9HeRdZutj1iq8QCOnUkxsdysiFx/jwuqOuhMBHcQNfUMiw5IG
         l4G6tnXJAGQySSrvbb5tlS55I4cBtLSkemHa2j6kX/eTBQwRZGXBQ+wgh9+HVfrBy8T7
         g9Kw==
X-Gm-Message-State: AOJu0YwpQD6B32Sl8brXzjDBDujvD/kV7cP/Zr3K3g4nZ1KS6QP0m2tJ
        R2KYXVKfynndfO2gyfJoG1/oTvFXlygXN3zSOzc=
X-Google-Smtp-Source: AGHT+IHQa66ZKYAVhDg4WjfhBcnMaUXpsryjq/Bj5E8ZVyP7LYotJTLEEkI0YVAo0iyV+2fy4VtLyQ==
X-Received: by 2002:a2e:301a:0:b0:2bc:e470:1412 with SMTP id w26-20020a2e301a000000b002bce4701412mr1627591ljw.43.1695914790242;
        Thu, 28 Sep 2023 08:26:30 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id o21-20020a2e90d5000000b002b6c92fa161sm3561291ljg.61.2023.09.28.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:26:29 -0700 (PDT)
Date:   Thu, 28 Sep 2023 17:26:28 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 21/31] thermal: rcar: Convert to platform remove callback
 returning void
Message-ID: <ZRWbJAGofGHDoVKR@oden.dyn.berto.se>
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
 <20230927193736.2236447-22-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230927193736.2236447-22-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-09-27 21:37:26 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_thermal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 293f8dd9fe0a..feb848d595fa 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -371,7 +371,7 @@ static irqreturn_t rcar_thermal_irq(int irq, void *data)
>  /*
>   *		platform functions
>   */
> -static int rcar_thermal_remove(struct platform_device *pdev)
> +static void rcar_thermal_remove(struct platform_device *pdev)
>  {
>  	struct rcar_thermal_common *common = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> @@ -388,8 +388,6 @@ static int rcar_thermal_remove(struct platform_device *pdev)
>  
>  	pm_runtime_put(dev);
>  	pm_runtime_disable(dev);
> -
> -	return 0;
>  }
>  
>  static int rcar_thermal_probe(struct platform_device *pdev)
> @@ -581,7 +579,7 @@ static struct platform_driver rcar_thermal_driver = {
>  		.of_match_table = rcar_thermal_dt_ids,
>  	},
>  	.probe		= rcar_thermal_probe,
> -	.remove		= rcar_thermal_remove,
> +	.remove_new	= rcar_thermal_remove,
>  };
>  module_platform_driver(rcar_thermal_driver);
>  
> -- 
> 2.40.1
> 

-- 
Kind Regards,
Niklas Söderlund
