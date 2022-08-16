Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBEC595882
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 12:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbiHPKgk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 06:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbiHPKgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 06:36:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B989584
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 02:01:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id e15so14001483lfs.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=q+bgDPRgPRHSxrHtdS3PxKXnrSqyZcY4lba+sAly1/w=;
        b=XBVexQTwUHJ5vuvI5fwHlQzDP8BSNOYEEWzB2HwtcIdr9VgldN+f6gjCzgLc5YRghT
         bDTws6K01yYvmFxi+URd10lUW+EO+knrJSEUzk3wMm9S4Bxy/P9BjkJPyxwm5gVg/mLa
         Er83nwuGoQWKtrGCfqjk0once47DoY/L5U0f7CIw0OhZYPalN9hVk5KZV2tsROVueKwb
         hEhE+2ttmNq06MgugEwnbklerttW2i5JUUE29lvYheBllvPnrkYA1VfCjWsWIaC50yZZ
         i7Kj0FeFYQMKNs3MrBQyi5LxndolnW6WiN082esUuUgZgqe0vV0iZ3Jigi8cbdAMnAqz
         d9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=q+bgDPRgPRHSxrHtdS3PxKXnrSqyZcY4lba+sAly1/w=;
        b=e3hK6bktF2h1gppbtmJDEVGJydyKRZrZxV3CvodeI/rCytJH060Dv4EugRjmqy1lkV
         J/iC3DT/pdYZai7cso+vBsOYZ9yl8I1RqQswKba4LmSZigJnSviEYwkBaIdcJAWgIgYd
         bilzpWE1fbXAV2wvcYmeOfl7sYGg9a03ZIRDcnArVqDdTMmUetfSMpPmmDDcuc5ZX9bo
         G5oJ/g6TrBsDVx0mNS8uq+LQN6sSIiCDEK9GHURL3mos0lhjsLrUsAxtDkKYymDllNOB
         jabd0iWgqk2peiK2jP8UMW6gezw8tD+OPRADFwtaUOZ4UkyfAJN9rwCIHgdQ/Q8mpoBk
         i5HQ==
X-Gm-Message-State: ACgBeo2GXveZQQr6e4Xdo3masOLJ+sVLJFoAeAcvtsCLsDxZbTPxBF9X
        5MJHu9aZ9lmVaiV5eCrt+UUG/Q==
X-Google-Smtp-Source: AA6agR4Rrs4sw4cWiTGLXoKhr6OEFnD9GHLxlEK0MF5jg4T84VBOnAh9FVPk2fjCu0Ybz5mk/e5WJg==
X-Received: by 2002:a05:6512:3d8e:b0:48a:eff4:6b03 with SMTP id k14-20020a0565123d8e00b0048aeff46b03mr6570827lfv.49.1660640470377;
        Tue, 16 Aug 2022 02:01:10 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id p10-20020a05651211ea00b0048b04d494c6sm1323538lfs.51.2022.08.16.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:01:09 -0700 (PDT)
Date:   Tue, 16 Aug 2022 11:01:09 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rafael@kernel.org, rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 15/26] thermal/drivers/rcar_gen3: Use the generic
 function to get the number of trips
Message-ID: <Yvtc1adKkVSyRDIj@oden.dyn.berto.se>
References: <20220809220436.711020-1-daniel.lezcano@linaro.org>
 <20220809220436.711020-16-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220809220436.711020-16-daniel.lezcano@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Daniel,

Thanks for your work.

On 2022-08-10 00:04:25 +0200, Daniel Lezcano wrote:
> The thermal core framework allows to get the number of thermal trips,
> use it instead of visiting the thermal core structure internals.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 40ec63ad0a1b..6a6aaad2bcac 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -525,7 +525,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		if (ret)
>  			goto error_unregister;
>  
> -		ret = of_thermal_get_ntrips(tsc->zone);
> +		ret = thermal_zone_get_num_trips(tsc->zone);
>  		if (ret < 0)
>  			goto error_unregister;
>  
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
