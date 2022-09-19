Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC305BD110
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 17:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiISPcP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 11:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiISPbx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 11:31:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8A239BBA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 08:31:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4867D499;
        Mon, 19 Sep 2022 17:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663601503;
        bh=xj+FXHZun7Tq2dFujf6besSXQvCHP1Rn25a1rvSb5ck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kbgwRAU2yAb5P6lfEc4xG6kfAJyc+96nTqzByEhr8ACzvuioMONQQ0p9+sLB9lcKg
         n86vQt8oXnNUst7jy1xSUN4Uq1gnJYpTzE6o35wFzWEc4z+ELb+iIxWGKBRWDxZiSu
         bdtZB8khxJkL/kFnzjH8V2IkgPMgsnzhsYqpnjjU=
Date:   Mon, 19 Sep 2022 18:31:30 +0300
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
Subject: Re: [PATCH v1 09/12] drm/rcar-du: lvds: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiLUg4KSEizU4EE@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717175801.78668-2-sam@ravnborg.org>
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

On Sun, Jul 17, 2022 at 07:57:58PM +0200, Sam Ravnborg wrote:
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> The driver implements the state operations, so no other changes
> are required for the replacement.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I assume you'll merge this through drm-misc with the rest of the series,
so I won't take it in my tree unless you ask me so.

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 830aac0a2cb4..c4adbcede090 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  	clk_disable_unprepare(lvds->clocks.mod);
>  }
>  
> -static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode)
> +static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
>  {
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  	int min_freq;
>  
> @@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
>  	min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
>  	adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
>  
> -	return true;
> +	return 0;
>  }
>  
>  static int rcar_lvds_attach(struct drm_bridge *bridge,
> @@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.atomic_enable = rcar_lvds_atomic_enable,
>  	.atomic_disable = rcar_lvds_atomic_disable,
> -	.mode_fixup = rcar_lvds_mode_fixup,
> +	.atomic_check = rcar_lvds_atomic_check,
>  };
>  
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart
