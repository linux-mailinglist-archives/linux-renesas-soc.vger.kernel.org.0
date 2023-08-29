Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A0478BF22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 09:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjH2HWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 03:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjH2HW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 03:22:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC32CDA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 00:22:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EC06741;
        Tue, 29 Aug 2023 09:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693293652;
        bh=Ze1XZHi3dsUtbM9qgZ3Yff7GxQtqbKgv/3mc41mPtws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JBnA1ZgSX0dlRXeoNBfbzEHKNhlqtJuWHL/mvkAwZ2nX+4UKKamtq7+qcqd+ypXih
         U1JTKnaXyzTA68qTapTtVxMstCa9WN1kNDIazmLFYSBb7ytivZSVi1/NxPx4CNSO+V
         oRA2EVGfKCF9bz425doLo8Xi6EmdPQ+4kU7Qhl6Y=
Date:   Tue, 29 Aug 2023 10:22:23 +0300
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
Subject: Re: [PATCH 1/7] drm: adv7511: Add struct adv7511_chip_info and use
 i2c_get_match_data()
Message-ID: <20230829072223.GK17083@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-2-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 13, 2023 at 07:05:06PM +0100, Biju Das wrote:
> Add struct adv7511_chip_info to handle hw differences between various
> chips rather checking against the 'type' variable in various places.
> Replace 'adv->type'->'info->type' by moving variable 'type' from
> struct adv7511 to struct adv7511_chip_info.
> 
> Replace of_device_get_match_data() and ID lookup for retrieving match data
> with i2c_get_match_data() by adding adv7511_chip_info as device data for
> both OF and ID tables.

As commented in similar patches, please try to explain in the commit
message the reason *why* the change is good and/or needed. It's quite
straightforward for me to understand the change to i2c_get_match_data()
given the discussions we've had recently, but it would be more difficult
without that background information.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  6 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 68 +++++++++++---------
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     |  4 +-
>  3 files changed, 46 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 17445800248d..59e8ef10d72e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -333,6 +333,10 @@ enum adv7511_type {
>  
>  #define ADV7511_MAX_ADDRS 3
>  
> +struct adv7511_chip_info {
> +	enum adv7511_type type;
> +};
> +
>  struct adv7511 {
>  	struct i2c_client *i2c_main;
>  	struct i2c_client *i2c_edid;
> @@ -377,7 +381,7 @@ struct adv7511 {
>  	u8 num_dsi_lanes;
>  	bool use_timing_gen;
>  
> -	enum adv7511_type type;
> +	const struct adv7511_chip_info *info;
>  	struct platform_device *audio_pdev;
>  
>  	struct cec_adapter *cec_adap;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 2611afd2c1c1..013d8d640ef4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv7511)
>  	 * first few seconds after enabling the output. On the other hand
>  	 * adv7535 require to enable HPD Override bit for proper HPD.
>  	 */
> -	if (adv7511->type == ADV7535)
> +	if (adv7511->info->type == ADV7535)
>  		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>  				   ADV7535_REG_POWER2_HPD_OVERRIDE,
>  				   ADV7535_REG_POWER2_HPD_OVERRIDE);
> @@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  	 */
>  	regcache_sync(adv7511->regmap);
>  
> -	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> +	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
>  		adv7533_dsi_power_on(adv7511);
>  	adv7511->powered = true;
>  }
> @@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  static void __adv7511_power_off(struct adv7511 *adv7511)
>  {
>  	/* TODO: setup additional power down modes */
> -	if (adv7511->type == ADV7535)
> +	if (adv7511->info->type == ADV7535)
>  		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>  				   ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
>  
> @@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
>  static void adv7511_power_off(struct adv7511 *adv7511)
>  {
>  	__adv7511_power_off(adv7511);
> -	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> +	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
>  		adv7533_dsi_power_off(adv7511);
>  	adv7511->powered = false;
>  }
> @@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
>  			status = connector_status_disconnected;
>  	} else {
>  		/* Renable HPD sensing */
> -		if (adv7511->type == ADV7535)
> +		if (adv7511->info->type == ADV7535)
>  			regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>  					   ADV7535_REG_POWER2_HPD_OVERRIDE,
>  					   ADV7535_REG_POWER2_HPD_OVERRIDE);
> @@ -786,7 +786,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>  	else
>  		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
>  
> -	if (adv7511->type == ADV7511)
> +	if (adv7511->info->type == ADV7511)
>  		regmap_update_bits(adv7511->regmap, 0xfb,
>  				   0x6, low_refresh_rate << 1);
>  	else
> @@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
>  {
>  	struct adv7511 *adv = bridge_to_adv7511(bridge);
>  
> -	if (adv->type == ADV7533 || adv->type == ADV7535)
> +	if (adv->info->type == ADV7533 || adv->info->type == ADV7535)
>  		return adv7533_mode_valid(adv, mode);
>  	else
>  		return adv7511_mode_valid(adv, mode);
> @@ -1009,7 +1009,7 @@ static int adv7511_init_regulators(struct adv7511 *adv)
>  	unsigned int i;
>  	int ret;
>  
> -	if (adv->type == ADV7511) {
> +	if (adv->info->type == ADV7511) {
>  		supply_names = adv7511_supply_names;
>  		adv->num_supplies = ARRAY_SIZE(adv7511_supply_names);
>  	} else {
> @@ -1093,7 +1093,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>  		goto err;
>  	}
>  
> -	if (adv->type == ADV7533 || adv->type == ADV7535) {
> +	if (adv->info->type == ADV7533 || adv->info->type == ADV7535) {
>  		ret = adv7533_patch_cec_registers(adv);
>  		if (ret)
>  			goto err;
> @@ -1192,7 +1192,7 @@ static int adv7511_parse_dt(struct device_node *np,
>  
>  static int adv7511_probe(struct i2c_client *i2c)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
> +	static const struct adv7511_chip_info *info;
>  	struct adv7511_link_config link_config;
>  	struct adv7511 *adv7511;
>  	struct device *dev = &i2c->dev;
> @@ -1206,18 +1206,16 @@ static int adv7511_probe(struct i2c_client *i2c)
>  	if (!adv7511)
>  		return -ENOMEM;
>  
> +	info = i2c_get_match_data(i2c);
> +
>  	adv7511->i2c_main = i2c;
>  	adv7511->powered = false;
>  	adv7511->status = connector_status_disconnected;
> -
> -	if (dev->of_node)
> -		adv7511->type = (enum adv7511_type)of_device_get_match_data(dev);
> -	else
> -		adv7511->type = id->driver_data;
> +	adv7511->info = info;

You can drop the local info variable and write

	adv7511->info = i2c_get_match_data(i2c);

>  
>  	memset(&link_config, 0, sizeof(link_config));
>  
> -	if (adv7511->type == ADV7511)
> +	if (adv7511->info->type == ADV7511)
>  		ret = adv7511_parse_dt(dev->of_node, &link_config);
>  	else
>  		ret = adv7533_parse_dt(dev->of_node, adv7511);
> @@ -1254,7 +1252,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  		goto uninit_regulators;
>  	dev_dbg(dev, "Rev. %d\n", val);
>  
> -	if (adv7511->type == ADV7511)
> +	if (info->type == ADV7511)

And use adv7511->info->type here and below, the same way you use it
above.

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		ret = regmap_register_patch(adv7511->regmap,
>  					    adv7511_fixed_registers,
>  					    ARRAY_SIZE(adv7511_fixed_registers));
> @@ -1306,7 +1304,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	i2c_set_clientdata(i2c, adv7511);
>  
> -	if (adv7511->type == ADV7511)
> +	if (info->type == ADV7511)
>  		adv7511_set_link_config(adv7511, &link_config);
>  
>  	ret = adv7511_cec_init(dev, adv7511);
> @@ -1325,7 +1323,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	adv7511_audio_init(dev, adv7511);
>  
> -	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
> +	if (info->type == ADV7533 || info->type == ADV7535) {
>  		ret = adv7533_attach_dsi(adv7511);
>  		if (ret)
>  			goto err_unregister_audio;
> @@ -1368,22 +1366,34 @@ static void adv7511_remove(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  }
>  
> +static const struct adv7511_chip_info adv7511_chip_info = {
> +	.type = ADV7511
> +};
> +
> +static const struct adv7511_chip_info adv7533_chip_info = {
> +	.type = ADV7533
> +};
> +
> +static const struct adv7511_chip_info adv7535_chip_info = {
> +	.type = ADV7535
> +};
> +
>  static const struct i2c_device_id adv7511_i2c_ids[] = {
> -	{ "adv7511", ADV7511 },
> -	{ "adv7511w", ADV7511 },
> -	{ "adv7513", ADV7511 },
> -	{ "adv7533", ADV7533 },
> -	{ "adv7535", ADV7535 },
> +	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
> +	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
> +	{ "adv7513", (kernel_ulong_t)&adv7511_chip_info },
> +	{ "adv7533", (kernel_ulong_t)&adv7533_chip_info },
> +	{ "adv7535", (kernel_ulong_t)&adv7535_chip_info },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
>  
>  static const struct of_device_id adv7511_of_ids[] = {
> -	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
> -	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
> -	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
> -	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
> -	{ .compatible = "adi,adv7535", .data = (void *)ADV7535 },
> +	{ .compatible = "adi,adv7511", .data = &adv7511_chip_info },
> +	{ .compatible = "adi,adv7511w", .data = &adv7511_chip_info },
> +	{ .compatible = "adi,adv7513", .data = &adv7511_chip_info },
> +	{ .compatible = "adi,adv7533", .data = &adv7533_chip_info },
> +	{ .compatible = "adi,adv7535", .data = &adv7535_chip_info },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, adv7511_of_ids);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 7e3e56441aed..c452c4dc1c3f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,11 +108,11 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>  
>  	/* Check max clock for either 7533 or 7535 */
> -	if (mode->clock > (adv->type == ADV7533 ? 80000 : 148500))
> +	if (mode->clock > (adv->info->type == ADV7533 ? 80000 : 148500))
>  		return MODE_CLOCK_HIGH;
>  
>  	/* Check max clock for each lane */
> -	max_lane_freq = (adv->type == ADV7533 ? 800000 : 891000);
> +	max_lane_freq = (adv->info->type == ADV7533 ? 800000 : 891000);
>  
>  	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
>  		return MODE_CLOCK_HIGH;

-- 
Regards,

Laurent Pinchart
