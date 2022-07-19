Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0EB5795D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 11:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbiGSJLD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 05:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbiGSJLB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 05:11:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD11B23BCC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 02:10:59 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r9so23666990lfp.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7Mtd3J+03yO0iS9XA8aLlV/pFtrHZmqJ3Z5d/M8D54g=;
        b=6r+6877vSw2e0oYl9YY2c9JqBLTeh8tvGJGT4G5S7u9KlAlSMuXJBp23Wa+pL4r2dx
         R0a8DqA8j1b9HYRXUZ9t5HEv3GOVCpm289/Ja4VSH/OhKISr1M6hUk1L3MAoSXjuR6MP
         fOKJhAXrKSHQCY42apgBmR/vPclqr7x45EgLiGh0rq8HifeS9N3n95BrT3mdKiL5BOY5
         N5Dlo//MMiXlGKl4bnAFueqOVkv6fJ75IyWFc0w5UF+Wwd03k2pufDm9xt7/va+D3Xpg
         Kx2j3nB+SCeE3ldTaTnJ3FhSVQyXeXMhcyftCP4FsgNzt3UWYp5cuYX100FXJ356I6fj
         /LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7Mtd3J+03yO0iS9XA8aLlV/pFtrHZmqJ3Z5d/M8D54g=;
        b=WoD+ULKoFJwcL0SbXfbRxOBFp4XA4F3X2LrNdi6C76U5VE99k22uacbaqykRQodzmM
         Lh9V0ulcbVFHr3HR35ElctlDzouNeYgBdkdCdj7CCp5A48VM1KA20+vpQu7kfU/hrxg9
         9La5JKfk1h2mBNhYRmUZMirABpJs3k4zzxT3yQyiheCxdoc9ct2sY8wBj8VxlOkmHDp8
         tB1s9BGM854VHGoYv8rCH6EanFPRskAMLhV6SRjypvrXmoi6Lq0x3+lr+zctdIga3aqP
         MUGMey+eZMT96V0BMFOnzNRUHM81z6DlOo/NTr9m4XfTdWwo6jA/2u4X15gLvNHPVfN4
         W0Jw==
X-Gm-Message-State: AJIora9P92t4WLKTkTPdfOL7vaUXRpN9ZkDlecf5mPLGO6s3B8gEQ61V
        opuWmBOVPz2P7V/UJnc//V+ogw==
X-Google-Smtp-Source: AGRyM1uans68sAZ4YjjIACUwqygWHqFjMkoEiQApgqu5BOyWtuTmGobWzZZ9+zPY+tmvKUTiyagkGg==
X-Received: by 2002:a05:6512:3e28:b0:48a:a4b:c474 with SMTP id i40-20020a0565123e2800b0048a0a4bc474mr15554335lfv.254.1658221858236;
        Tue, 19 Jul 2022 02:10:58 -0700 (PDT)
Received: from localhost (h-46-59-88-103.A463.priv.bahnhof.se. [46.59.88.103])
        by smtp.gmail.com with ESMTPSA id m9-20020a05651202e900b0047f8cb9401fsm3107245lfq.89.2022.07.19.02.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 02:10:57 -0700 (PDT)
Date:   Tue, 19 Jul 2022 11:10:56 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linexp.org>
Cc:     daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com,
        khilman@baylibre.com, abailon@baylibre.com, amitk@kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        "open list:RENESAS R-CAR THERMAL DRIVERS" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1 17/33] thermal/drivers/rcar: Switch to new of API
Message-ID: <YtZ1IExNlsYaJkC9@oden.dyn.berto.se>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
 <20220710212423.681301-18-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220710212423.681301-18-daniel.lezcano@linexp.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thanks for your work.

On 2022-07-10 23:24:07 +0200, Daniel Lezcano wrote:
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach.
> 
> Use this new API.

I tested this together with the series it depends on and while 
temperature monitoring seems to work fine it breaks the emul_temp 
interface (/sys/class/thermal/thermal_zone2/emul_temp).

Before this change I can write a temperature to this file and have it 
trigger actions, in my test-case changing the cooling state, which I 
observe in /sys/class/thermal/cooling_device0/cur_state.

Likewise before this change I could trip the critical trip-point that 
would power off the board using the emul_temp interface, this too no 
longer works,

    echo 120000 > /sys/class/thermal/thermal_zone2/emul_temp

Is this an intention change of the new API?

> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 16 ++++++++--------
>  drivers/thermal/rcar_thermal.c      | 13 +++----------
>  2 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 43eb25b167bc..29946114a8f9 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -164,9 +164,9 @@ static int rcar_gen3_thermal_round(int temp)
>  	return result * RCAR3_THERMAL_GRAN;
>  }
>  
> -static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
> +static int rcar_gen3_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>  {
> -	struct rcar_gen3_thermal_tsc *tsc = devdata;
> +	struct rcar_gen3_thermal_tsc *tsc = tz->devdata;
>  	int mcelsius, val;
>  	int reg;
>  
> @@ -203,9 +203,9 @@ static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
>  	return INT_FIXPT(val);
>  }
>  
> -static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
> +static int rcar_gen3_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
>  {
> -	struct rcar_gen3_thermal_tsc *tsc = devdata;
> +	struct rcar_gen3_thermal_tsc *tsc = tz->devdata;
>  	u32 irqmsk = 0;
>  
>  	if (low != -INT_MAX) {
> @@ -225,7 +225,7 @@ static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
>  	return 0;
>  }
>  
> -static struct thermal_zone_of_device_ops rcar_gen3_tz_of_ops = {
> +static struct thermal_zone_device_ops rcar_gen3_tz_of_ops = {
>  	.get_temp	= rcar_gen3_thermal_get_temp,
>  	.set_trips	= rcar_gen3_thermal_set_trips,
>  };
> @@ -504,8 +504,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  	for (i = 0; i < priv->num_tscs; i++) {
>  		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
>  
> -		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
> -							    &rcar_gen3_tz_of_ops);
> +		zone = devm_thermal_of_zone_register(dev, i, tsc,
> +						     &rcar_gen3_tz_of_ops);
>  		if (IS_ERR(zone)) {
>  			dev_err(dev, "Can't register thermal zone\n");
>  			ret = PTR_ERR(zone);
> @@ -556,7 +556,7 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
>  
>  		priv->thermal_init(tsc);
>  		if (zone->ops->set_trips)
> -			rcar_gen3_thermal_set_trips(tsc, zone->prev_low_trip,
> +			rcar_gen3_thermal_set_trips(zone, zone->prev_low_trip,
>  						    zone->prev_high_trip);
>  	}
>  
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 1d729ed4d685..4df42d70d867 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -271,13 +271,6 @@ static int rcar_thermal_get_current_temp(struct rcar_thermal_priv *priv,
>  	return 0;
>  }
>  
> -static int rcar_thermal_of_get_temp(void *data, int *temp)
> -{
> -	struct rcar_thermal_priv *priv = data;
> -
> -	return rcar_thermal_get_current_temp(priv, temp);
> -}
> -
>  static int rcar_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
>  {
>  	struct rcar_thermal_priv *priv = rcar_zone_to_priv(zone);
> @@ -323,8 +316,8 @@ static int rcar_thermal_get_trip_temp(struct thermal_zone_device *zone,
>  	return 0;
>  }
>  
> -static const struct thermal_zone_of_device_ops rcar_thermal_zone_of_ops = {
> -	.get_temp	= rcar_thermal_of_get_temp,
> +static struct thermal_zone_device_ops rcar_thermal_zone_of_ops = {
> +	.get_temp	= rcar_thermal_get_temp,
>  };
>  
>  static struct thermal_zone_device_ops rcar_thermal_zone_ops = {
> @@ -534,7 +527,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  			goto error_unregister;
>  
>  		if (chip->use_of_thermal) {
> -			priv->zone = devm_thermal_zone_of_sensor_register(
> +			priv->zone = devm_thermal_of_zone_register(
>  						dev, i, priv,
>  						&rcar_thermal_zone_of_ops);
>  		} else {
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas S�derlund
