Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB215BD072
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 17:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiISPSu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 11:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiISPSM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 11:18:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDC137197
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 08:17:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 432C7D41;
        Mon, 19 Sep 2022 17:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663600653;
        bh=2puiBfBSuvOfOS88b2J3PNyfkl8M51lmUO5IZtT9CSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWixYfOitoFmLXo3HiiDzKGlFGdhUPWziffk09Hwwjm1J3sTCwF2xceFdZvqwWrvl
         AzeZB1q9xbsuNrfAjdnx2g+eV5PEBCkzfra9a5U+vgWkO2vw3P3H2ZC6ZESh0O0j7x
         dCLG7tBJgrFzP0vE1wxqgxZWZvN+KA+gJGEmospE=
Date:   Mon, 19 Sep 2022 18:17:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benson Leung <bleung@chromium.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        chrome-platform@lists.linux.dev,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v1 01/12] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YyiH/3eeHvPPbuHk@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-2-sam@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch, and sorry for the review delay. The series only
recently jumped to the top of my inbox.

On Sun, Jul 17, 2022 at 07:44:43PM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
> 
> The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
> drm_bridge_chain_post_disable - convert these to the atomic variants.
> 
> v2:
>   - Init state operations in drm_bridge_funcs (Laurent)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Philip Chen <philipchen@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 31e88cb39f8a..bb8076fb8625 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -15,6 +15,7 @@
>  
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
> @@ -409,7 +410,8 @@ static const struct dev_pm_ops ps8640_pm_ops = {
>  				pm_runtime_force_resume)
>  };
>  
> -static void ps8640_pre_enable(struct drm_bridge *bridge)
> +static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> @@ -443,7 +445,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  	ps_bridge->pre_enabled = true;
>  }
>  
> -static void ps8640_post_disable(struct drm_bridge *bridge)
> +static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  
> @@ -521,7 +524,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * EDID, for this chip, we need to do a full poweron, otherwise it will
>  	 * fail.
>  	 */
> -	drm_bridge_chain_pre_enable(bridge);
> +	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
>  
>  	edid = drm_get_edid(connector,
>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> @@ -531,7 +534,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * before, return the chip to its original power state.
>  	 */
>  	if (poweroff)
> -		drm_bridge_chain_post_disable(bridge);
> +		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>  
>  	return edid;
>  }
> @@ -546,8 +549,11 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>  	.attach = ps8640_bridge_attach,
>  	.detach = ps8640_bridge_detach,
>  	.get_edid = ps8640_bridge_get_edid,
> -	.post_disable = ps8640_post_disable,
> -	.pre_enable = ps8640_pre_enable,
> +	.atomic_post_disable = ps8640_atomic_post_disable,
> +	.atomic_pre_enable = ps8640_atomic_pre_enable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps_bridge)

-- 
Regards,

Laurent Pinchart
