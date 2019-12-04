Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B49112AE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 13:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfLDMEV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 07:04:21 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:55708 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727445AbfLDMEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 07:04:21 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 0BFEDFB04;
        Wed,  4 Dec 2019 13:04:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1P6AeK0vdY6H; Wed,  4 Dec 2019 13:04:16 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 4AAF84964C; Wed,  4 Dec 2019 13:04:16 +0100 (CET)
Date:   Wed, 4 Dec 2019 13:04:16 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [PATCH v1 18/26] drm/panel: rocktech-jh057n00900: use drm_panel
 backlight support
Message-ID: <20191204120416.GA18094@bogon.m.sigxcpu.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-19-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191202193230.21310-19-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,
On Mon, Dec 02, 2019 at 08:32:22PM +0100, Sam Ravnborg wrote:
> Use the backlight support in drm_panel to simplify the driver.
> While touching the include files sort them
> and divide them up in blocks.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Guido Günther" <agx@sigxcpu.org>
> Cc: Purism Kernel Team <kernel@puri.sm>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../drm/panel/panel-rocktech-jh057n00900.c    | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> index 3a4f1c0fce86..38ff742bc120 100644
> --- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> @@ -5,20 +5,22 @@
>   * Copyright (C) Purism SPC 2019
>   */
>  
> -#include <drm/drm_mipi_dsi.h>
> -#include <drm/drm_modes.h>
> -#include <drm/drm_panel.h>
> -#include <drm/drm_print.h>
> -#include <linux/backlight.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
> +
>  #include <video/display_timing.h>
>  #include <video/mipi_display.h>
>  
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
>  #define DRV_NAME "panel-rocktech-jh057n00900"
>  
>  /* Manufacturer specific Commands send via DSI */
> @@ -47,7 +49,6 @@ struct jh057n {
>  	struct device *dev;
>  	struct drm_panel panel;
>  	struct gpio_desc *reset_gpio;
> -	struct backlight_device *backlight;
>  	struct regulator *vcc;
>  	struct regulator *iovcc;
>  	bool prepared;
> @@ -152,7 +153,7 @@ static int jh057n_enable(struct drm_panel *panel)
>  		return ret;
>  	}
>  
> -	return backlight_enable(ctx->backlight);
> +	return 0;
>  }
>  
>  static int jh057n_disable(struct drm_panel *panel)
> @@ -160,7 +161,6 @@ static int jh057n_disable(struct drm_panel *panel)
>  	struct jh057n *ctx = panel_to_jh057n(panel);
>  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>  
> -	backlight_disable(ctx->backlight);
>  	return mipi_dsi_dcs_set_display_off(dsi);
>  }
>  
> @@ -321,10 +321,6 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>  		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
>  
> -	ctx->backlight = devm_of_find_backlight(dev);
> -	if (IS_ERR(ctx->backlight))
> -		return PTR_ERR(ctx->backlight);
> -
>  	ctx->vcc = devm_regulator_get(dev, "vcc");
>  	if (IS_ERR(ctx->vcc)) {
>  		ret = PTR_ERR(ctx->vcc);
> @@ -347,6 +343,10 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
>  	drm_panel_init(&ctx->panel, dev, &jh057n_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
>  	drm_panel_add(&ctx->panel);
>  
>  	ret = mipi_dsi_attach(dsi);

Reviewed-by: Guido Günther <agx@sigxcpu.org> 

> -- 
> 2.20.1
> 
