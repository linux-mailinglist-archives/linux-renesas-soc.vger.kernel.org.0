Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD42878BF2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 09:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjH2HZn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 03:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbjH2HZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 03:25:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D990F106
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 00:25:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92E1B814;
        Tue, 29 Aug 2023 09:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693293828;
        bh=S2Eu+NvsyILHT7/I/hCZW90XOSU6bDJ27Wb01VKB8Is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bEdLiOB7BcszVJ+BjJ/gjXvq+Jih+lDSd/xI0xE383mys2aQxq542hOFY27eI0rYg
         xggmzJLOmd2leuIfTB1a5YSzSOQtDSNC1uxo6y3rqhYMZO9y4iTD+wcek/8XRjeqzB
         dBPWVkEgy++V/pXGi1znIPlrZbmwxI0dPDpnWHDA=
Date:   Tue, 29 Aug 2023 10:25:19 +0300
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
Subject: Re: [PATCH 3/7] drm: adv7511: Add max_lane_freq variable to struct
 adv7511_chip_info
Message-ID: <20230829072519.GM17083@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-4-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 13, 2023 at 07:05:08PM +0100, Biju Das wrote:
> The ADV7533 supports a maximum lane clock of 800MHz whereas it is 891MHz
> for ADV7535.  Add max_lane_freq variable to struct adv7511_chip_info to
> handle this difference.
> 
> While at it, drop the unused local variable max_lane_freq.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index f8190442ffca..0e2c721a856f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -336,6 +336,7 @@ enum adv7511_type {
>  struct adv7511_chip_info {
>  	enum adv7511_type type;
>  	unsigned long max_mode_clock;
> +	unsigned long max_lane_freq;

Same comment as for patch 2/7, you could name the field
max_lane_freq_khz. An unsigned int may be enough too if the calculation
below doesn't overflow.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  };
>  
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 193b2d5bc7e6..29e087e6d721 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1372,12 +1372,14 @@ static const struct adv7511_chip_info adv7511_chip_info = {
>  
>  static const struct adv7511_chip_info adv7533_chip_info = {
>  	.type = ADV7533,
> -	.max_mode_clock = 80000
> +	.max_mode_clock = 80000,
> +	.max_lane_freq = 800000,
>  };
>  
>  static const struct adv7511_chip_info adv7535_chip_info = {
>  	.type = ADV7535,
> -	.max_mode_clock = 148500
> +	.max_mode_clock = 148500,
> +	.max_lane_freq = 891000,
>  };
>  
>  static const struct i2c_device_id adv7511_i2c_ids[] = {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index e92b27e0afd1..c1e744d4f2b1 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -103,7 +103,6 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>  enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  					const struct drm_display_mode *mode)
>  {
> -	unsigned long max_lane_freq;
>  	struct mipi_dsi_device *dsi = adv->dsi;
>  	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>  
> @@ -112,9 +111,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  		return MODE_CLOCK_HIGH;
>  
>  	/* Check max clock for each lane */
> -	max_lane_freq = (adv->info->type == ADV7533 ? 800000 : 891000);
> -
> -	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> +	if (mode->clock * bpp > adv->info->max_lane_freq * adv->num_dsi_lanes)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;

-- 
Regards,

Laurent Pinchart
