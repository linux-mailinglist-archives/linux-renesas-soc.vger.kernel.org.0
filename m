Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F230A73F5FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jun 2023 09:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjF0Hr5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jun 2023 03:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjF0Hr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jun 2023 03:47:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE0410D5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jun 2023 00:47:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb7acaa7a5so2125243e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jun 2023 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1687852069; x=1690444069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KZs6V3WoqaN2ypay6C0mcFsBihk+1Lib6W1lzqZUXcA=;
        b=Rz8K10r/ZmO1qzysKmpchpOle08tg4KT4u6GRsFni1e+KT+Q7GV6ApCy00Dz7OcOqM
         6n/XfFhdt/yzeWgoH4zyeRpxb7EurE6UK2KevyqJGWZuO+slFkp+sUiO41sIeBpuNIk8
         jyK9euk926FUJXyXApfk42got5hopxVWBVlLhhfMWmJGhzi3WaX9kim9j/oaySZ+jeVK
         6qyoKOEDNNtqRtX0CY072wjGXtRBKd4mshBzIatfkZI70N+csz+9SQ8EcdVxpBG1qsZi
         6K2DQAjanlRgPFiXYosaHHjyMDzEt9JxkUdDEt2KB/KmbJpx4drs7cVFPfknmtfIjKp7
         2HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852069; x=1690444069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZs6V3WoqaN2ypay6C0mcFsBihk+1Lib6W1lzqZUXcA=;
        b=CC1rBfKIcsMqfGf8xyrbohkWP0+lKIhKREep9WzKedoz1wTe09jQ2Et7jRDmnOETpP
         yMw+mJ5C9BPRDkbGEFeiCPYwXEAeSdOziN9FbyZC5PwGuwQZZZ6LnWPUiE5nQBlFLKD0
         NpubAvqSvRmwJLgllsAzH7lrdXu6rNh5PphTJ6RB8B/zljcOUHAEulCQXBu/CppJBEzt
         F5IvfL4hUz6+OFwDNnGP7sJTjGyiajm4/lyKNsFRaw+GX1MJ5t+PGrjQepPa+ljK9TKz
         xZLcnn7+RjS1WkQKdaLLAgsAaA1acVIKOcbEzNSfIBpTkp6nOXuYtXQcg9TGKEw8leGX
         oReg==
X-Gm-Message-State: AC+VfDyoNuqdJAIBproMu9pKEWK2SAkOSu+yeDA0wynkuVt48nhyuCeh
        r0CeH0/8/AbFP8pYW+RLVTlALw==
X-Google-Smtp-Source: ACHHUZ4wHEFcdjzPyulmOIHzpvd1zFWEJSswBnhAwGXK1zWk1HEEmYbkPLIJGMwRtpu+8lIxD1zvqA==
X-Received: by 2002:a19:5f07:0:b0:4dd:9f86:859d with SMTP id t7-20020a195f07000000b004dd9f86859dmr17063106lfb.13.1687852068882;
        Tue, 27 Jun 2023 00:47:48 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id u26-20020ac2519a000000b004f4b42e2d7dsm1413087lfi.230.2023.06.27.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:47:48 -0700 (PDT)
Date:   Tue, 27 Jun 2023 09:47:47 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drivers/thermal/rcar_gen3_thermal: Convert to
 devm_platform_ioremap_resource()
Message-ID: <ZJqUI1hL29o-OBei@oden.dyn.berto.se>
References: <20230626124334.15100-1-frank.li@vivo.com>
 <20230626124334.15100-4-frank.li@vivo.com>
 <ZJm8p4GnTG-vtb0Q@oden.dyn.berto.se>
 <2f33ff1e-ec4e-e060-a84d-ee38ed17c9f7@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f33ff1e-ec4e-e060-a84d-ee38ed17c9f7@vivo.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yangtao,

On 2023-06-27 10:58:16 +0800, Yangtao Li wrote:
> Hi Niklas,
> 
> On 2023/6/27 0:28, Niklas Söderlund wrote:
> 
> > Hi Yangtao,
> > 
> > Thanks for your work.
> > 
> > On 2023-06-26 20:43:31 +0800, Yangtao Li wrote:
> > > Use devm_platform_ioremap_resource() to simplify code.
> > > 
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > This do indeed simplify the code, but it also breaks the driver :-)
> 
> How about the patch below? Can the following rcar driver also take a similar
> approach?

Maybe it could, I would need to test it and I'm traveling this week with 
no access to hardware. But I don't like the change you propose, as it 
makes the code more complex without any other goal then to 
s/platform_get_resource/devm_platform_ioremap_resource/.

If you have a reason, like trying to remove platform_get_resource() from 
the kernel or such I will consider the change. But if you only want to 
change things *because* I think the current code do the right thing in a 
clear way, look for resource, if found map it else use what resources 
have been found already. Adding special case based on return code is 
IMHO more complex, again if you need to go that route please add a 
comment describing the special case.

> 
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c
> b/drivers/thermal/rcar_gen3_thermal.c
> index 9029d01e029b..0cd9a030eb9e 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -481,7 +481,6 @@ static int rcar_gen3_thermal_probe(struct
> platform_device *pdev)
>  {
>         struct rcar_gen3_thermal_priv *priv;
>         struct device *dev = &pdev->dev;
> -       struct resource *res;
>         struct thermal_zone_device *zone;
>         unsigned int i;
>         int ret;
> @@ -503,22 +502,23 @@ static int rcar_gen3_thermal_probe(struct
> platform_device *pdev)
> 
>         for (i = 0; i < TSC_MAX_NUM; i++) {
>                 struct rcar_gen3_thermal_tsc *tsc;
> +               void __iomem *base;
> 
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> -               if (!res)
> -                       break;
> +               base = devm_platform_ioremap_resource(pdev, i);
> +               if (IS_ERR(base)) {
> +                       if (PTR_ERR(base) == -EINVAL)
> +                               break;
> 
> -               tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
> -               if (!tsc) {
> -                       ret = -ENOMEM;
> +                       ret = PTR_ERR(base);
>                         goto error_unregister;
>                 }
> 
> -               tsc->base = devm_ioremap_resource(dev, res);
> -               if (IS_ERR(tsc->base)) {
> -                       ret = PTR_ERR(tsc->base);
> +               tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
> +               if (!tsc) {
> +                       ret = -ENOMEM;
>                         goto error_unregister;
>                 }
> +               tsc->base = base;
> 
>                 priv->tscs[i] = tsc;
>         }
> 
> 
> > Before the change, failing to find a resource at position "i", breaks
> > the probe loop, and probing continues and the number of resource
> > described are the number of TSC find are used.
> > 
> > After the change failing to find all possible TCS will fail the whole
> > probe process, even if some TCS where described. And not describing max
> > number of TCS on each system is perfectly fine.
> > 
> > Nacked-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > 
> > > ---
> > >   drivers/thermal/rcar_gen3_thermal.c | 7 +------
> > >   1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> > > index 9029d01e029b..5c623f13d9ec 100644
> > > --- a/drivers/thermal/rcar_gen3_thermal.c
> > > +++ b/drivers/thermal/rcar_gen3_thermal.c
> > > @@ -481,7 +481,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
> > >   {
> > >   	struct rcar_gen3_thermal_priv *priv;
> > >   	struct device *dev = &pdev->dev;
> > > -	struct resource *res;
> > >   	struct thermal_zone_device *zone;
> > >   	unsigned int i;
> > >   	int ret;
> > > @@ -504,17 +503,13 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
> > >   	for (i = 0; i < TSC_MAX_NUM; i++) {
> > >   		struct rcar_gen3_thermal_tsc *tsc;
> > > -		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> > > -		if (!res)
> > > -			break;
> > > -
> > >   		tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
> > >   		if (!tsc) {
> > >   			ret = -ENOMEM;
> > >   			goto error_unregister;
> > >   		}
> > > -		tsc->base = devm_ioremap_resource(dev, res);
> > > +		tsc->base = devm_platform_ioremap_resource(pdev, i);
> > >   		if (IS_ERR(tsc->base)) {
> > >   			ret = PTR_ERR(tsc->base);
> > >   			goto error_unregister;
> > > -- 
> > > 2.39.0
> > > 

-- 
Kind Regards,
Niklas Söderlund
