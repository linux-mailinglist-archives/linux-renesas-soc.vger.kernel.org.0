Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC1E2D6152
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 17:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389430AbgLJQLO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 11:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392377AbgLJQLG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 11:11:06 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44EEC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 08:10:25 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id f11so7278505ljm.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 08:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H9hu18o8blyYnuGKEqmYi2M2JSTcn+jz8VPPMy11ti4=;
        b=lNRhSz8ocGlUwD8y8ViOXXVooVExftagV4HO67zreuF9Gcwf0muXj3BAEe2SNdveEh
         SiHtD0xTEs3cNV3n3F/i+JOYw0sVuw5mvCW9gush2rBTN2mtQjDfY09eVtMDib5gRpIa
         08M6jtNWrOP5ByjMa1OyHD99vMNw7mYO+LuuACjJ8DqJjNNIqUcOt1Q60Ts9RsFvX2Ud
         XkhGReqgTAJPQxIwl3jacDDoSNvkxfQ4AjYZn66yhjlkFmpnJoKkAfkdWSIVtYEio8HP
         AoOzrF5yuKrI6DTBj2+JMPej6pWzkbcKQxwO5kTL1QSMcGBCZ7SZlv/b37BO2assl+sY
         hrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H9hu18o8blyYnuGKEqmYi2M2JSTcn+jz8VPPMy11ti4=;
        b=BHVWi/vOz0Wd1mj6Xp2AwQqFSSJV4bckQcoIrDVMr62hdju4jC29y969FhNX2tAasr
         B9SCfMWH3nVn9lYh9f8zSaKdtEABDbZyRFyyo1MIhEK96Ja/7Cx08Va+qA+EIx5nULxQ
         Ekjb/tIh9XsIL85NEWgAooRowvh6rTyiBxOOLUqSIAW24QWZlwgwO+MPe0Aftok6SchB
         m6OGfErjlVrpE7q772dkomuCPjwL05L4uXa4+lqhq8z/Wix3J3+P7KU7eMOcjtkWbKBp
         y+HBz4EbmwGD446xbjIJ50D+9v4MXDoNQvtok8nmniz6taeyCFpnDskJ6rOjzsMboWL2
         dCXg==
X-Gm-Message-State: AOAM533uwk2yDH6lxZI92BcjvId1VYvY9hJEPxYnGta7S8QQ2ESosB5T
        zcCIu0KkyY04YrmlIOScVfpEzw==
X-Google-Smtp-Source: ABdhPJxki6iAMIariQR3jYj9FL7Xs9sJEhAYXN+TrJRnE/LaDVlBKXLs+X5q+IwJjIVoTni7Xdpdsg==
X-Received: by 2002:a2e:3308:: with SMTP id d8mr3182165ljc.183.1607616624255;
        Thu, 10 Dec 2020 08:10:24 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j27sm568194lfm.178.2020.12.10.08.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 08:10:23 -0800 (PST)
Date:   Thu, 10 Dec 2020 17:10:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rui.zhang@intel.com, kai.heng.feng@canonical.com,
        lukasz.luba@arm.com, srinivas.pandruvada@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 4/5] thermal/drivers/rcar: Remove notification usage
Message-ID: <20201210161022.GE4186812@oden.dyn.berto.se>
References: <20201210121514.25760-1-daniel.lezcano@linaro.org>
 <20201210121514.25760-4-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201210121514.25760-4-daniel.lezcano@linaro.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thanks for your work.

On 2020-12-10 13:15:13 +0100, Daniel Lezcano wrote:
> The ops is only showing a trace telling a critical trip point is
> crossed. The same information is given by the thermal framework.
> 
> This is redundant, remove the code.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_thermal.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 6ae757d66f46..b49f04daaf47 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -323,24 +323,6 @@ static int rcar_thermal_get_trip_temp(struct thermal_zone_device *zone,
>  	return 0;
>  }
>  
> -static int rcar_thermal_notify(struct thermal_zone_device *zone,
> -			       int trip, enum thermal_trip_type type)
> -{
> -	struct rcar_thermal_priv *priv = rcar_zone_to_priv(zone);
> -	struct device *dev = rcar_priv_to_dev(priv);
> -
> -	switch (type) {
> -	case THERMAL_TRIP_CRITICAL:
> -		/* FIXME */
> -		dev_warn(dev, "Thermal reached to critical temperature\n");
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct thermal_zone_of_device_ops rcar_thermal_zone_of_ops = {
>  	.get_temp	= rcar_thermal_of_get_temp,
>  };
> @@ -349,7 +331,6 @@ static struct thermal_zone_device_ops rcar_thermal_zone_ops = {
>  	.get_temp	= rcar_thermal_get_temp,
>  	.get_trip_type	= rcar_thermal_get_trip_type,
>  	.get_trip_temp	= rcar_thermal_get_trip_temp,
> -	.notify		= rcar_thermal_notify,
>  };
>  
>  /*
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
