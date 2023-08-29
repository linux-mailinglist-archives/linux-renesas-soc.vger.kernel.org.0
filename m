Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A52B78C8AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 17:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbjH2Pf4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 11:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237299AbjH2Pfa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 11:35:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43293CC1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 08:35:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A64A0223;
        Tue, 29 Aug 2023 17:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693323242;
        bh=hGe07mofMCgZWs9JdCBD6I0EJgkpXoCVAhOaZESwbXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHhYda/1SA+2HwEvCiJUMRkYZbv+VpVCWIKlz2uZXS8KOCofX11RCfGdkzF9kgyTr
         N5b2SxtrOP243diFYkgdDE80o/nng2ghGuwnr0fzkk+LmBBmEfRPeKAh3qfCb39ZyQ
         Ba6Ai+LTzaHIuJBEl3BDxpMajYJ+ifxB410JFIFQ=
Date:   Tue, 29 Aug 2023 18:35:33 +0300
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
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Message-ID: <20230829153533.GF4698@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-6-biju.das.jz@bp.renesas.com>
 <20230829073031.GA2302@pendragon.ideasonboard.com>
 <OS0PR01MB59227849D7EAA27F0DC6AB7986E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59227849D7EAA27F0DC6AB7986E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Aug 29, 2023 at 02:19:02PM +0000, Biju Das wrote:
> Subject: Re: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct adv7511_chip_info
> > On Sun, Aug 13, 2023 at 07:05:10PM +0100, Biju Das wrote:
> > > The ADV7533 and ADV7535 have DSI support. Add a feature bit has_dsi to
> > > struct adv7511_chip_info for handling configuration related to DSI.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
> > >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20
> > > +++++++++++---------
> > >  2 files changed, 12 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > index b29d11cae932..2a017bb31a14 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > @@ -339,6 +339,7 @@ struct adv7511_chip_info {
> > >  	unsigned long max_lane_freq;
> > >  	const char * const *supply_names;
> > >  	unsigned int num_supplies;
> > > +	unsigned has_dsi:1;
> > 
> > As you're not short of space here, I'd make this a bool.
> 
> OK, will use bool here.
> 
> > >  };
> > >
> > >  struct adv7511 {
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index f6f15c1b0882..66b3f8fcf67d 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
> > >  	 */
> > >  	regcache_sync(adv7511->regmap);
> > >
> > > -	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
> > > +	if (adv7511->info->has_dsi)
> > >  		adv7533_dsi_power_on(adv7511);
> > >  	adv7511->powered = true;
> > >  }
> > > @@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511
> > > *adv7511)  static void adv7511_power_off(struct adv7511 *adv7511)  {
> > >  	__adv7511_power_off(adv7511);
> > > -	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
> > > +	if (adv7511->info->has_dsi)
> > >  		adv7533_dsi_power_off(adv7511);
> > >  	adv7511->powered = false;
> > >  }
> > > @@ -786,7 +786,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
> > >  	else
> > >  		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
> > >
> > > -	if (adv7511->info->type == ADV7511)
> > > +	if (!adv7511->info->has_dsi)
> > 
> > While this is functionally equivalent, is the register below really related
> > to DSI ? If not, I'd rather not check the has_dsi field here but keep
> > checking the type.
> 
> What creating a packed value for this hardware difference
> as driver data?
> 
>  { 0xfb, 0x6, 0x1} and { 0x4a, 0xc, 2) packed as unsigned int
> driver data low_refresh_data and we can get rid of this
> if statement and depack it here.

As we're not in a hot path, I think the most important criteria to
consider are maintainability and readability. Making it easy to add
support for a new chip without creating a mess of spaghetti code falls
into those criteria, but as far as I'm aware there's no indication that
we will suddenly see several new compatible devices.

When it comes to readability, code such as

	if (has_dsi)
		init_dsi();

is great, but code such as

	if (has_dsi)
		init_cec();

because only the DSI-enabled version happens to also support CEC is not
good. Similarly, I don't think packing the refresh rate register
addresses and value in the info structure would increase readability, or
help in any real way. I'm tempted to leave it as-is.

What would help readability, if you feel inclined to keep working on
this driver, is to replace the register addresses with named macros :-)

> > >  		regmap_update_bits(adv7511->regmap, 0xfb,
> > >  				   0x6, low_refresh_rate << 1);
> > >  	else
> > > @@ -921,7 +921,7 @@ static enum drm_mode_status
> > > adv7511_bridge_mode_valid(struct drm_bridge *bridge,  {
> > >  	struct adv7511 *adv = bridge_to_adv7511(bridge);
> > >
> > > -	if (adv->info->type == ADV7533 || adv->info->type == ADV7535)
> > > +	if (adv->info->has_dsi)
> > >  		return adv7533_mode_valid(adv, mode);
> > >  	else
> > >  		return adv7511_mode_valid(adv, mode);
> > > @@ -1086,7 +1086,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
> > >  		goto err;
> > >  	}
> > >
> > > -	if (adv->info->type == ADV7533 || adv->info->type == ADV7535) {
> > > +	if (adv->info->has_dsi) {
> > 
> > Same comment here, this doesn't seem logically right.
> 
> But this patching is applicable for DSI.

CEC is an HDMI feature. The ADV7511 may not have CEC support, but it's
not linked to DSI as such.

> > >  		ret = adv7533_patch_cec_registers(adv);
> > >  		if (ret)
> > >  			goto err;
> > > @@ -1245,7 +1245,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> > >  		goto uninit_regulators;
> > >  	dev_dbg(dev, "Rev. %d\n", val);
> > >
> > > -	if (info->type == ADV7511)
> > > +	if (!info->has_dsi)
> > 
> > And here too.
> 
> Will create another bool. info->has_dpi, is it ok??

Can't we leave type comparisons in the handful of cases where they are
simpler ? Is there a specific reason why you think the type enum really
has to go ?

> > >  		ret = regmap_register_patch(adv7511->regmap,
> > >  					    adv7511_fixed_registers,
> > >  					    ARRAY_SIZE(adv7511_fixed_registers));
> > > @@ -1316,7 +1316,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> > >
> > >  	adv7511_audio_init(dev, adv7511);
> > >
> > > -	if (info->type == ADV7533 || info->type == ADV7535) {
> > > +	if (info->has_dsi) {
> > >  		ret = adv7533_attach_dsi(adv7511);
> > >  		if (ret)
> > >  			goto err_unregister_audio;
> > > @@ -1370,7 +1370,8 @@ static const struct adv7511_chip_info
> > adv7533_chip_info = {
> > >  	.max_mode_clock = 80000,
> > >  	.max_lane_freq = 800000,
> > >  	.supply_names = adv7533_supply_names,
> > > -	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
> > > +	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
> > > +	.has_dsi = 1
> > >  };
> > >
> > >  static const struct adv7511_chip_info adv7535_chip_info = { @@
> > > -1378,7 +1379,8 @@ static const struct adv7511_chip_info
> > adv7535_chip_info = {
> > >  	.max_mode_clock = 148500,
> > >  	.max_lane_freq = 891000,
> > >  	.supply_names = adv7533_supply_names,
> > > -	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
> > > +	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
> > > +	.has_dsi = 1
> > >  };
> > >
> > >  static const struct i2c_device_id adv7511_i2c_ids[] = {

-- 
Regards,

Laurent Pinchart
