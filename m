Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA9210F88E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 08:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfLCHQR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 02:16:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfLCHQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 02:16:17 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D64A309;
        Tue,  3 Dec 2019 08:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575357374;
        bh=Usz0JCCqQIuQdvNt1yfGPlfXkflUIxoUH5/BVcfHsms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EiQraoXiOk0tFDXgQR8u+pBrTji0fGFm+sxcGtcEKKQdZrQTqo6FLDlJk24zPCmST
         dfFb87DQO6U1M0tkWieUqiQwF6+RLsI0lq/uHKz8XyBsGo5yPqNvJdG3DUQIkRT3o8
         jgqksOEqxV7ih0CGrpHhjUAg6ampkDU6jxHorZJs=
Date:   Tue, 3 Dec 2019 09:16:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 13/26] drm/panel: lvds: use drm_panel backlight support
Message-ID: <20191203071606.GI4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-14-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:17PM +0100, Sam Ravnborg wrote:
> Use the backlight support in drm_panel to simplify the driver
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 40 ++++--------------------------
>  1 file changed, 5 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 5e40b674bb15..5ce3f4a2b7a1 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -8,7 +8,6 @@
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> @@ -34,7 +33,6 @@ struct panel_lvds {
>  	unsigned int bus_format;
>  	bool data_mirror;
>  
> -	struct backlight_device *backlight;
>  	struct regulator *supply;
>  
>  	struct gpio_desc *enable_gpio;
> @@ -46,19 +44,6 @@ static inline struct panel_lvds *to_panel_lvds(struct drm_panel *panel)
>  	return container_of(panel, struct panel_lvds, panel);
>  }
>  
> -static int panel_lvds_disable(struct drm_panel *panel)
> -{
> -	struct panel_lvds *lvds = to_panel_lvds(panel);
> -
> -	if (lvds->backlight) {
> -		lvds->backlight->props.power = FB_BLANK_POWERDOWN;
> -		lvds->backlight->props.state |= BL_CORE_FBBLANK;
> -		backlight_update_status(lvds->backlight);
> -	}
> -
> -	return 0;
> -}
> -
>  static int panel_lvds_unprepare(struct drm_panel *panel)
>  {
>  	struct panel_lvds *lvds = to_panel_lvds(panel);
> @@ -93,19 +78,6 @@ static int panel_lvds_prepare(struct drm_panel *panel)
>  	return 0;
>  }
>  
> -static int panel_lvds_enable(struct drm_panel *panel)
> -{
> -	struct panel_lvds *lvds = to_panel_lvds(panel);
> -
> -	if (lvds->backlight) {
> -		lvds->backlight->props.state &= ~BL_CORE_FBBLANK;
> -		lvds->backlight->props.power = FB_BLANK_UNBLANK;
> -		backlight_update_status(lvds->backlight);
> -	}
> -
> -	return 0;
> -}
> -
>  static int panel_lvds_get_modes(struct drm_panel *panel,
>  				struct drm_connector *connector)
>  {
> @@ -132,10 +104,8 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>  }
>  
>  static const struct drm_panel_funcs panel_lvds_funcs = {
> -	.disable = panel_lvds_disable,
>  	.unprepare = panel_lvds_unprepare,
>  	.prepare = panel_lvds_prepare,
> -	.enable = panel_lvds_enable,
>  	.get_modes = panel_lvds_get_modes,
>  };
>  
> @@ -242,10 +212,6 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	lvds->backlight = devm_of_find_backlight(lvds->dev);
> -	if (IS_ERR(lvds->backlight))
> -		return PTR_ERR(lvds->backlight);
> -
>  	/*
>  	 * TODO: Handle all power supplies specified in the DT node in a generic
>  	 * way for panels that don't care about power supply ordering. LVDS
> @@ -257,6 +223,10 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
>  		       DRM_MODE_CONNECTOR_LVDS);
>  
> +	ret = drm_panel_of_backlight(&lvds->panel);
> +	if (ret)
> +		return ret;
> +
>  	ret = drm_panel_add(&lvds->panel);
>  	if (ret < 0)
>  		return ret;
> @@ -271,7 +241,7 @@ static int panel_lvds_remove(struct platform_device *pdev)
>  
>  	drm_panel_remove(&lvds->panel);
>  
> -	panel_lvds_disable(&lvds->panel);
> +	drm_panel_disable(&lvds->panel);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
