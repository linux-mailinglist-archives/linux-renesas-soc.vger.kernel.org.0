Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 068047CC2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 20:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfGaSoG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 14:44:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35786 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730426AbfGaSoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 14:44:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so66724620ljh.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2019 11:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=S8iymda7xPMQ4926S35iyef8N5nHE8NRBoOVEkW+KiU=;
        b=MOyunKS4ipxqo9LGPAcFwtqEOm8UGWkGuO7rQLbHcexMrHl3rDvDcdiO4C/Jo5RKI9
         J4nc/lBbKWNLaF+MFCp8pJkWbpFpwXpaEDPUs6xCyXwZXrK3wQWniYdrY/NSf/UAIc1f
         WJSkyj+AFRo5ypChNb3XX+Z8/xrdfdVsppMWYKlwrTj4xdMOfLTMNvsD2d8OGKiS27ny
         jzhap1hRgLGYCamoJYJO9sJOtpJUOFij5jc9V5FtuEmYOwwfVdBmEVjZXIJm94pWEJsq
         4xrheUp7DpybEuiXIh+NOJuyQ5KOK4NlU2zTmGmT3n6FzDJTiDO2LlI7kUsxMYERq126
         mb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=S8iymda7xPMQ4926S35iyef8N5nHE8NRBoOVEkW+KiU=;
        b=gv6JTi8V1ecqVwXSB5dLZSMP+pl3Fc8vOrtmKfPMJeRm8TEMvptzN/1n4xfGaFEpLK
         gknyKMVt7BXTCzO34BwsLjfBMu2o4Fu1qVp8rrmKeu0OpSs5g72d2tt+U69s+2soy3K4
         impZT6myRoXZ8xhiBb+xocWkvk63wWZCUABnK2zInSQWbTq0PnRdFcjHTRODkK4Wr85t
         DYgAchOY07nPKGgWcvUKcea7YcWV92+sMRwSItfVwFr5KXgaRIer0q7slwHY7Y9sLxPe
         vogRGbCPVUo8RsM3leCR46TKwQPJ8cXyNvBDjy7Pe1famEGc+NxQyVA5CV1ve3fv/vTr
         UdhQ==
X-Gm-Message-State: APjAAAUx17hq8odAr7g0K81hCcBWQI0K0tNGIdd1n3bFOJDiMjsHOgOP
        Q2y7b1KuKt27Q3VqH97sjVc=
X-Google-Smtp-Source: APXvYqzk/7IbaRdwdAyiPhPaBK+fYqXkLLaHXkk14KwsgUDgjDgxSu4c1Upcw5nTh1Zua41AOjxpdg==
X-Received: by 2002:a2e:994:: with SMTP id 142mr64164643ljj.130.1564598643913;
        Wed, 31 Jul 2019 11:44:03 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id f1sm14065815ljf.53.2019.07.31.11.44.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 11:44:03 -0700 (PDT)
Date:   Wed, 31 Jul 2019 20:44:02 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Use
 devm_add_action_or_reset() helper
Message-ID: <20190731184402.GL3186@bigcity.dyn.berto.se>
References: <20190731125053.14750-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190731125053.14750-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-07-31 14:50:53 +0200, Geert Uytterhoeven wrote:
> Use the devm_add_action_or_reset() helper instead of open-coding the
> same operations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index a56463308694e937..2db7e7f8baf939fd 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -443,11 +443,10 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		if (ret)
>  			goto error_unregister;
>  
> -		ret = devm_add_action(dev, rcar_gen3_hwmon_action, zone);
> -		if (ret) {
> -			rcar_gen3_hwmon_action(zone);
> +		ret = devm_add_action_or_reset(dev, rcar_gen3_hwmon_action,
> +					       zone);
> +		if (ret)
>  			goto error_unregister;
> -		}
>  
>  		ret = of_thermal_get_ntrips(tsc->zone);
>  		if (ret < 0)
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
