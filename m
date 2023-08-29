Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C1878BF33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 09:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjH2H0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 03:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbjH2H03 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 03:26:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1EC124
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 00:26:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA447DE2;
        Tue, 29 Aug 2023 09:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693293902;
        bh=gu3GLqskk3SrwKLCNI818E6d4F3T81RCmcagVyXcVwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VxTe8XUI/DpNm7Xayrqy1iGCofxzh3iAhpnjFjX0sn1tQoV+hnyRL1RiqRaE5Jxi9
         YGwBz8pJxqpXHgVXLtXxu4Vg5R5M8Dol08pdfr6f2tffeQokGYCUFa0eABGrhlQWw8
         L4RN2h8PYRaaiXAxSohk8wpnrdgLtgTWjzZSnpyk=
Date:   Tue, 29 Aug 2023 10:26:34 +0300
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
Subject: Re: [PATCH 4/7] drm: adv7511: Add supply_names and num_supplies
 variables to struct adv7511_chip_info
Message-ID: <20230829072634.GN17083@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-5-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 13, 2023 at 07:05:09PM +0100, Biju Das wrote:
> The ADV7511 has 5 power supplies compared to 7 that of ADV75{33,35}. Add
> supply_names and num_supplies variables to struct adv7511_chip_info to
> handle this difference.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 29 ++++++++++----------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 0e2c721a856f..b29d11cae932 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -337,6 +337,8 @@ struct adv7511_chip_info {
>  	enum adv7511_type type;
>  	unsigned long max_mode_clock;
>  	unsigned long max_lane_freq;
> +	const char * const *supply_names;
> +	unsigned int num_supplies;
>  };
>  
>  struct adv7511 {
> @@ -375,7 +377,6 @@ struct adv7511 {
>  	struct gpio_desc *gpio_pd;
>  
>  	struct regulator_bulk_data *supplies;
> -	unsigned int num_supplies;
>  
>  	/* ADV7533 DSI RX related params */
>  	struct device_node *host_node;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 29e087e6d721..f6f15c1b0882 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1004,37 +1004,30 @@ static const char * const adv7533_supply_names[] = {
>  
>  static int adv7511_init_regulators(struct adv7511 *adv)
>  {
> +	const char * const *supply_names = adv->info->supply_names;
> +	unsigned int num_supplies = adv->info->num_supplies;
>  	struct device *dev = &adv->i2c_main->dev;
> -	const char * const *supply_names;
>  	unsigned int i;
>  	int ret;
>  
> -	if (adv->info->type == ADV7511) {
> -		supply_names = adv7511_supply_names;
> -		adv->num_supplies = ARRAY_SIZE(adv7511_supply_names);
> -	} else {
> -		supply_names = adv7533_supply_names;
> -		adv->num_supplies = ARRAY_SIZE(adv7533_supply_names);
> -	}
> -
> -	adv->supplies = devm_kcalloc(dev, adv->num_supplies,
> +	adv->supplies = devm_kcalloc(dev, num_supplies,
>  				     sizeof(*adv->supplies), GFP_KERNEL);
>  	if (!adv->supplies)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < adv->num_supplies; i++)
> +	for (i = 0; i < num_supplies; i++)
>  		adv->supplies[i].supply = supply_names[i];
>  
> -	ret = devm_regulator_bulk_get(dev, adv->num_supplies, adv->supplies);
> +	ret = devm_regulator_bulk_get(dev, num_supplies, adv->supplies);
>  	if (ret)
>  		return ret;
>  
> -	return regulator_bulk_enable(adv->num_supplies, adv->supplies);
> +	return regulator_bulk_enable(num_supplies, adv->supplies);
>  }
>  
>  static void adv7511_uninit_regulators(struct adv7511 *adv)
>  {
> -	regulator_bulk_disable(adv->num_supplies, adv->supplies);
> +	regulator_bulk_disable(adv->info->num_supplies, adv->supplies);
>  }
>  
>  static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
> @@ -1367,19 +1360,25 @@ static void adv7511_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct adv7511_chip_info adv7511_chip_info = {
> -	.type = ADV7511
> +	.type = ADV7511,
> +	.supply_names = adv7511_supply_names,
> +	.num_supplies = ARRAY_SIZE(adv7511_supply_names)

Please add a comma at the end of the line. Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  };
>  
>  static const struct adv7511_chip_info adv7533_chip_info = {
>  	.type = ADV7533,
>  	.max_mode_clock = 80000,
>  	.max_lane_freq = 800000,
> +	.supply_names = adv7533_supply_names,
> +	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
>  };
>  
>  static const struct adv7511_chip_info adv7535_chip_info = {
>  	.type = ADV7535,
>  	.max_mode_clock = 148500,
>  	.max_lane_freq = 891000,
> +	.supply_names = adv7533_supply_names,
> +	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
>  };
>  
>  static const struct i2c_device_id adv7511_i2c_ids[] = {

-- 
Regards,

Laurent Pinchart
