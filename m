Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FFD10F7E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 07:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfLCGjt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 01:39:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfLCGjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 01:39:49 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70227309;
        Tue,  3 Dec 2019 07:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575355186;
        bh=NKJAGVwnbEA5vcxRJnNw/eHXqWVE7J8TQMaQ6WQ1rME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D14DfDQGqmcPI/cWzbaSwFmIu2oGRWeQ94ouc59CDImFZ8t3SX6+BbiXsn2fRsOZk
         Tnv6M49uf5jSzTHOa93zxLqOpHWEUA/ltoic1as76ib31vB5+Oo8hU9R8nUV2Cj5eu
         z/3+mXvqwo0HuNNUiRzpAUwj6s6qiSBMTuin2TnY=
Date:   Tue, 3 Dec 2019 08:39:40 +0200
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
Subject: Re: [PATCH v1 03/26] drm/panel: simple: use drm_panel backlight
 support
Message-ID: <20191203063940.GC4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:07PM +0100, Sam Ravnborg wrote:
> Use drm_panel infrastructure for backlight.
> Replace direct calls with drm_panel_*() calls
> to utilize the drm_panel support.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 50 ++++++----------------------
>  1 file changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 72f69709f349..a5df6d6dd455 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -21,7 +21,6 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -105,7 +104,6 @@ struct panel_simple {
>  
>  	const struct panel_desc *desc;
>  
> -	struct backlight_device *backlight;
>  	struct regulator *supply;
>  	struct i2c_adapter *ddc;
>  
> @@ -236,12 +234,6 @@ static int panel_simple_disable(struct drm_panel *panel)
>  	if (!p->enabled)
>  		return 0;
>  
> -	if (p->backlight) {
> -		p->backlight->props.power = FB_BLANK_POWERDOWN;
> -		p->backlight->props.state |= BL_CORE_FBBLANK;
> -		backlight_update_status(p->backlight);
> -	}
> -
>  	if (p->desc->delay.disable)
>  		msleep(p->desc->delay.disable);
>  
> @@ -307,12 +299,6 @@ static int panel_simple_enable(struct drm_panel *panel)
>  	if (p->desc->delay.enable)
>  		msleep(p->desc->delay.enable);
>  
> -	if (p->backlight) {
> -		p->backlight->props.state &= ~BL_CORE_FBBLANK;
> -		p->backlight->props.power = FB_BLANK_UNBLANK;
> -		backlight_update_status(p->backlight);
> -	}
> -
>  	p->enabled = true;
>  
>  	return 0;
> @@ -414,9 +400,9 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
>  
>  static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  {
> -	struct device_node *backlight, *ddc;
>  	struct panel_simple *panel;
>  	struct display_timing dt;
> +	struct device_node *ddc;
>  	int err;
>  
>  	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> @@ -442,24 +428,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		return err;
>  	}
>  
> -	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
> -	if (backlight) {
> -		panel->backlight = of_find_backlight_by_node(backlight);
> -		of_node_put(backlight);
> -
> -		if (!panel->backlight)
> -			return -EPROBE_DEFER;
> -	}
> -
>  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>  	if (ddc) {
>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>  		of_node_put(ddc);
>  
> -		if (!panel->ddc) {
> -			err = -EPROBE_DEFER;
> -			goto free_backlight;
> -		}
> +		if (!panel->ddc)
> +			return -EPROBE_DEFER;
>  	}
>  
>  	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> @@ -468,6 +443,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
>  		       desc->connector_type);
>  
> +	err = drm_panel_of_backlight(&panel->base);
> +	if (err)
> +		goto free_ddc;
> +
>  	err = drm_panel_add(&panel->base);
>  	if (err < 0)
>  		goto free_ddc;
> @@ -479,9 +458,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  free_ddc:
>  	if (panel->ddc)
>  		put_device(&panel->ddc->dev);
> -free_backlight:
> -	if (panel->backlight)
> -		put_device(&panel->backlight->dev);
>  
>  	return err;
>  }
> @@ -491,16 +467,12 @@ static int panel_simple_remove(struct device *dev)
>  	struct panel_simple *panel = dev_get_drvdata(dev);
>  
>  	drm_panel_remove(&panel->base);
> -
> -	panel_simple_disable(&panel->base);
> -	panel_simple_unprepare(&panel->base);
> +	drm_panel_disable(&panel->base);
> +	drm_panel_unprepare(&panel->base);
>  
>  	if (panel->ddc)
>  		put_device(&panel->ddc->dev);
>  
> -	if (panel->backlight)
> -		put_device(&panel->backlight->dev);
> -
>  	return 0;
>  }
>  
> @@ -508,8 +480,8 @@ static void panel_simple_shutdown(struct device *dev)
>  {
>  	struct panel_simple *panel = dev_get_drvdata(dev);
>  
> -	panel_simple_disable(&panel->base);
> -	panel_simple_unprepare(&panel->base);
> +	drm_panel_disable(&panel->base);
> +	drm_panel_unprepare(&panel->base);

Without your panel double-disable protection series, you risk disabling
the backlight twice. I think backlight_disable() will work fine, but you
may want to double-check.

With this checked (and possibly addressed if needed),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {

-- 
Regards,

Laurent Pinchart
