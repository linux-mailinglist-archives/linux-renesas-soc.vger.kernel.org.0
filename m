Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940C524AF67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 08:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgHTGpV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 02:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgHTGpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 02:45:21 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC9BC061383
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 23:45:19 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k13so397697lfo.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 23:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZCw+J3eNKvckpSGIv9R1A41dRAL10YAzemWWZZj2TxM=;
        b=gn4feuvIJRGcm17jNvIi+Cs0oQkhPwFrCcF1fwZXkZsTBCf1COMIIzY9I3aoT1OO+D
         j8Ro8j93yknlukw/XCHHy/tpUxs5i6s2i6XuFepcDMxFfEtIRmr39aXwsi0MOaCxZQAH
         aJ5Z46auWf3uLNrTsxfSDedLWaRyb8P55xL8CRuBDRZlS09EawojZC3YNm3FkHCt0CPJ
         b8BqVrItpwW6qNYBqd84jEDIYSh20ou4l8zb47H5Mg2UUYH/yAHAeLSfkPVk5SJxbdWR
         nMNxEPunJJ0bWJ74vQqG66BdOjWdefZxFb9kV1Gb3ph+dGDg1xQcWjQLIpJjUzGNmTb1
         8AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZCw+J3eNKvckpSGIv9R1A41dRAL10YAzemWWZZj2TxM=;
        b=U4fW5zdhVHpW0HUQI/ffSe/S+phLyzmxP7qd60uTrsBN0R3RDm8OTWYDurabOTJ/TE
         IQthzC9xJPohZ5yZPHDOWKPMyRs6e+IKx0Wj/qxI/K8dnqqxplo4rUcKRl9pnXP1l0bL
         ovwOV4QcEiuPKqMzw9CH3dEz0WBp+RjXXuauo9cTCvP1lajtfoZ0WAFZ/FZE6y+z2Kpo
         7SBAXH2ECW1S8aa3xSWYGQKkXeRCEQGdTRf4K9KuBLyo5GcJj0j36W6uOzLtDuJApsEn
         D5MQWTBwrhFJIRDkHPww0RubkwIImJl2K8WcbFhngdWiODbaYslkzf/s0pSUxROTH1OQ
         p0cQ==
X-Gm-Message-State: AOAM533gbFkE55Whnr8UlWQjMEZO1GDBXDi+AGq5u0tfl3R3reWvKQ8Z
        5Tapyp+ICn1Ycj2fQ9bLN8oi6g==
X-Google-Smtp-Source: ABdhPJynGUW99aFPoSyRjPgckV+XoFAgcLbRS9hMSatRFjRqiz5jjL87Dz4FdSu2A+dvMdSEDdFfCQ==
X-Received: by 2002:ac2:5f48:: with SMTP id 8mr872579lfz.157.1597905918034;
        Wed, 19 Aug 2020 23:45:18 -0700 (PDT)
Received: from localhost (host-78-79-224-122.mobileonline.telia.com. [78.79.224.122])
        by smtp.gmail.com with ESMTPSA id h26sm283755lfj.20.2020.08.19.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:45:16 -0700 (PDT)
Date:   Thu, 20 Aug 2020 08:45:14 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal: rcar_thermal: Add missing braces to conditional
 statement
Message-ID: <20200820064514.GA33898@wyvern>
References: <20200819092716.3191-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200819092716.3191-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-08-19 11:27:16 +0200, Geert Uytterhoeven wrote:
> According to Documentation/process/coding-style.rst, if one branch of a
> conditional statement needs braces, both branches should use braces.
> 
> Fixes: bbcf90c0646ac797 ("thermal: Explicitly enable non-changing thermal zone devices")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_thermal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 787710bb88fee890..5c2a13bf249ccb87 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -546,11 +546,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  		if (ret < 0)
>  			goto error_unregister;
>  
> -		if (chip->use_of_thermal)
> +		if (chip->use_of_thermal) {
>  			priv->zone = devm_thermal_zone_of_sensor_register(
>  						dev, i, priv,
>  						&rcar_thermal_zone_of_ops);
> -		else {
> +		} else {
>  			priv->zone = thermal_zone_device_register(
>  						"rcar_thermal",
>  						1, 0, priv,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
