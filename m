Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A666A78BF46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 09:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjH2He4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 03:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbjH2Hee (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 03:34:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBE41A3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 00:34:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49C1F814;
        Tue, 29 Aug 2023 09:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693294388;
        bh=RWOvCJbAtiK8Yjrk/eerI8p08wVQAWJkYDh4q5odlQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S2QBYjk6WXGgwBjWkHPJVUsNEJSUxW2NwMNCSN1g72gzsqNybC6hg4TUO1G4Sj8F1
         ESEMfZraAtzz7koqivKjc/yTBW2iLu7/EqbGjx7mRZYqhRqmmKWAFWBfHAuvR1KvL6
         ZuycC8JdxHLfKyyoT35QbJBp1legbxfLFdiND+e4=
Date:   Tue, 29 Aug 2023 10:34:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] drm: adv7511: Add link_config feature bit to struct
 adv7511_chip_info
Message-ID: <20230829073439.GB2302@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-7-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Sun, Aug 13, 2023 at 07:05:11PM +0100, Biju Das wrote:
> The ADV7511 needs link configuration whereas ADV75{33,35} does not need
> it. Add a feature bit link_config to struct adv7511_chip_info to handle
> this difference.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 2a017bb31a14..627531f48f84 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -340,6 +340,7 @@ struct adv7511_chip_info {
>  	const char * const *supply_names;
>  	unsigned int num_supplies;
>  	unsigned has_dsi:1;
> +	unsigned link_config:1;

I would use a bool here too.

I'm not entirely sure about this particular patch, it seems that testing
the chip type would be better. I'm not totally against it though, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 66b3f8fcf67d..6974c267b1d5 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1208,7 +1208,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	memset(&link_config, 0, sizeof(link_config));
>  
> -	if (adv7511->info->type == ADV7511)
> +	if (info->link_config)
>  		ret = adv7511_parse_dt(dev->of_node, &link_config);
>  	else
>  		ret = adv7533_parse_dt(dev->of_node, adv7511);
> @@ -1297,7 +1297,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	i2c_set_clientdata(i2c, adv7511);
>  
> -	if (info->type == ADV7511)
> +	if (info->link_config)
>  		adv7511_set_link_config(adv7511, &link_config);
>  
>  	ret = adv7511_cec_init(dev, adv7511);
> @@ -1362,7 +1362,8 @@ static void adv7511_remove(struct i2c_client *i2c)
>  static const struct adv7511_chip_info adv7511_chip_info = {
>  	.type = ADV7511,
>  	.supply_names = adv7511_supply_names,
> -	.num_supplies = ARRAY_SIZE(adv7511_supply_names)
> +	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
> +	.link_config = 1
>  };
>  
>  static const struct adv7511_chip_info adv7533_chip_info = {

-- 
Regards,

Laurent Pinchart
