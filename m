Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65A110F896
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 08:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfLCHRG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 02:17:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57122 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfLCHRF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 02:17:05 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71191309;
        Tue,  3 Dec 2019 08:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575357423;
        bh=2sS2BNdYv6fX1ZVYfHwfsift774drFxDzzXfy61j3mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPWhZrNrgOWtYf8bWSO9OXFRAzb0KzASqB+zcaGgwB8egLfVpmjpHb99ocat/HVZ2
         KXP6LctrJxUyHcBA8x+LtERl6X5lfcld+a+pF6yK2NbTsQYBNyZReQFnyJF+++NUfS
         WDvTL4PNlJKHLKW1i522QTbrUwCqyUerScR5JFEU=
Date:   Tue, 3 Dec 2019 09:16:56 +0200
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
Subject: Re: [PATCH v1 25/26] drm/panel: tpo-td028ttec1: use drm_panel
 backlight support
Message-ID: <20191203071656.GJ4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-26-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-26-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:29PM +0100, Sam Ravnborg wrote:
> Use the backlight support in drm_panel to simplify the driver
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index 37252590b541..cf29405a2dbe 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -17,7 +17,6 @@
>   * H. Nikolaus Schaller <hns@goldelico.com>
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/spi/spi.h>
> @@ -83,7 +82,6 @@ struct td028ttec1_panel {
>  	struct drm_panel panel;
>  
>  	struct spi_device *spi;
> -	struct backlight_device *backlight;
>  };
>  
>  #define to_td028ttec1_device(p) container_of(p, struct td028ttec1_panel, panel)
> @@ -243,8 +241,6 @@ static int td028ttec1_enable(struct drm_panel *panel)
>  	if (ret)
>  		return ret;
>  
> -	backlight_enable(lcd->backlight);
> -
>  	return 0;
>  }
>  
> @@ -252,8 +248,6 @@ static int td028ttec1_disable(struct drm_panel *panel)
>  {
>  	struct td028ttec1_panel *lcd = to_td028ttec1_device(panel);
>  
> -	backlight_disable(lcd->backlight);
> -
>  	jbt_ret_write_0(lcd, JBT_REG_DISPLAY_OFF, NULL);
>  
>  	return 0;
> @@ -334,10 +328,6 @@ static int td028ttec1_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, lcd);
>  	lcd->spi = spi;
>  
> -	lcd->backlight = devm_of_find_backlight(&spi->dev);
> -	if (IS_ERR(lcd->backlight))
> -		return PTR_ERR(lcd->backlight);
> -
>  	spi->mode = SPI_MODE_3;
>  	spi->bits_per_word = 9;
>  
> @@ -350,6 +340,10 @@ static int td028ttec1_probe(struct spi_device *spi)
>  	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td028ttec1_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> +	ret = drm_panel_of_backlight(&lcd->panel);
> +	if (ret)
> +		return ret;
> +
>  	return drm_panel_add(&lcd->panel);
>  }
>  

-- 
Regards,

Laurent Pinchart
