Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77FE65BD0E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 17:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiISP3N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 11:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiISP3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 11:29:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF0B2A429
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 08:29:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84C7B499;
        Mon, 19 Sep 2022 17:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663601347;
        bh=NuzkgiGGksLT/z4/1KJ+JyeCIKwowmxW3Wn0E+L0u/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5dwTvrDBt4EtkMgI5YVhD2O473i9JyzN0gFCbTOKHVa7IENvSBo4myUeJY1kjJlC
         zj+pDA5tURnUMXYWEnVSB9kB58M7BR5UPyII8wR/YisOyQJItwqQJl6Ig+5lhVhQRt
         sWnkqussNC4kxpIJk+NLjlh2SgWkYqSlFQZjpThg=
Date:   Mon, 19 Sep 2022 18:28:54 +0300
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 06/12] drm/bridge: cros-ec-anx7688: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiKthfh3I5rp99e@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-7-sam@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Jul 17, 2022 at 07:44:48PM +0200, Sam Ravnborg wrote:
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> 
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: chrome-platform@lists.linux.dev

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c | 28 +++++++++++++++---------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> index 0f6d907432e3..fc19ea87926f 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -5,6 +5,7 @@
>   * Copyright 2020 Google LLC
>   */
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_print.h>
>  #include <linux/i2c.h>
> @@ -45,9 +46,10 @@ bridge_to_cros_ec_anx7688(struct drm_bridge *bridge)
>  	return container_of(bridge, struct cros_ec_anx7688, bridge);
>  }
>  
> -static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> -					      const struct drm_display_mode *mode,
> -					      struct drm_display_mode *adjusted_mode)
> +static int cros_ec_anx7688_bridge_atomic_check(struct drm_bridge *bridge,
> +					       struct drm_bridge_state *bridge_state,
> +					       struct drm_crtc_state *crtc_state,
> +					       struct drm_connector_state *conn_state)
>  {
>  	struct cros_ec_anx7688 *anx = bridge_to_cros_ec_anx7688(bridge);
>  	int totalbw, requiredbw;
> @@ -56,13 +58,13 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>  	int ret;
>  
>  	if (!anx->filter)
> -		return true;
> +		return 0;
>  
>  	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
>  	ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to read bandwidth/lane count\n");
> -		return false;
> +		return ret;
>  	}
>  	dpbw = regs[0];
>  	lanecount = regs[1];
> @@ -71,28 +73,34 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>  	if (dpbw > 0x19 || lanecount > 2) {
>  		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
>  			  lanecount);
> -		return false;
> +		return -EINVAL;
>  	}
>  
>  	/* Compute available bandwidth (kHz) */
>  	totalbw = dpbw * lanecount * 270000 * 8 / 10;
>  
>  	/* Required bandwidth (8 bpc, kHz) */
> -	requiredbw = mode->clock * 8 * 3;
> +	requiredbw = crtc_state->mode.clock * 8 * 3;
>  
>  	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
>  		      totalbw, dpbw, lanecount, requiredbw);
>  
>  	if (totalbw == 0) {
>  		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
> -		return true;
> +		return 0;
>  	}
>  
> -	return totalbw >= requiredbw;
> +	if (totalbw < requiredbw)
> +		return -EINVAL;
> +
> +	return 0;
>  }
>  
>  static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
> -	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
> +	.atomic_check = cros_ec_anx7688_bridge_atomic_check,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
