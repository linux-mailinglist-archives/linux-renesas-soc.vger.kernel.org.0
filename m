Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F139F1164A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 01:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfLIA4E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Dec 2019 19:56:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49858 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfLIA4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Dec 2019 19:56:03 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E011752B;
        Mon,  9 Dec 2019 01:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575852961;
        bh=J6yIt17nBqwPKwVZXRtdxjHrhpUgI8Kou5WpdOIZ5YE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T5cbUBsZJFEm8iBpxpsDzOaQbbEBdWh0bc55kfLncjhrFA90srpzIJTF5ep242mQO
         b5t70DxIKO2bWncxDKMv8rEKTqbMGB6Wc4rf0t1JrZ0hGjCETsQDuEAh6St3IsX09H
         Vk/pTQgLD1qS5KsBNhE3mVt1u8/X3js4Qn7p822U=
Date:   Mon, 9 Dec 2019 02:55:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 02/25] drm/panel: add backlight support
Message-ID: <20191209005554.GK14311@pendragon.ideasonboard.com>
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191207140353.23967-3-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sat, Dec 07, 2019 at 03:03:30PM +0100, Sam Ravnborg wrote:
> Panels often supports backlight as specified in a device tree.

s/supports/support/

> Update the drm_panel infrastructure to support this to
> simplify the drivers.
> 
> With this the panel driver just needs to add the following to the
> probe() function:
> 
>     err = drm_panel_of_backlight(panel);
>     if (err)
>             return err;
> 
> Then drm_panel will handle all the rest.
> 
> There is one caveat with the backlight support.
> If drm_panel_(enable|disable) are called multiple times
> in row then backlight_(enable|disable) will be called multiple times.

s/in row/in a row/

> The above will happen when a panel drivers unconditionally
> calls drm_panel_disable() in their shutdown() function,
> whan the panel is already disabled and then shutdown() is called.
> 
> Reading the backlight code it seems safe to call
> the backlight_(enable|disable) several times.
> 
> v3:
> - Improve comments, fix grammar (Laurent)
> - Do not fail in drm_panel_of_backlight() if no DT support (Laurent)
> - Log if backlight_(enable|disable) fails (Laurent)
> - Improve drm_panel_of_backlight() docs
> - Updated changelog with backlight analysis (triggered by Laurent)
> 
> v2:
> - Drop test of CONFIG_DRM_PANEL in header-file (Laurent)
> - do not enable backlight if ->enable() returns an error
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 58 ++++++++++++++++++++++++++++++++++++-
>  include/drm/drm_panel.h     | 25 ++++++++++++++++
>  2 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 4ab7229fb22b..c312d5eb214d 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -21,11 +21,13 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/backlight.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
>  
>  static DEFINE_MUTEX(panel_lock);
>  static LIST_HEAD(panel_list);
> @@ -196,11 +198,20 @@ EXPORT_SYMBOL(drm_panel_unprepare);
>   */
>  int drm_panel_enable(struct drm_panel *panel)
>  {
> +	int ret = 0;
> +
>  	if (!panel)
>  		return -EINVAL;
>  
>  	if (panel->funcs && panel->funcs->enable)
> -		return panel->funcs->enable(panel);
> +		ret = panel->funcs->enable(panel);
> +
> +	if (ret < 0)
> +		return ret;

You can move this within the above if () block and avoid initializing
ret to 0:

	if (panel->funcs && panel->funcs->enable) {
		ret = panel->funcs->enable(panel);
		if (ret < 0)
			return ret;
	}

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	ret = backlight_enable(panel->backlight);
> +	if (ret < 0)
> +		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n", ret);
>  
>  	return 0;
>  }
> @@ -218,9 +229,15 @@ EXPORT_SYMBOL(drm_panel_enable);
>   */
>  int drm_panel_disable(struct drm_panel *panel)
>  {
> +	int ret;
> +
>  	if (!panel)
>  		return -EINVAL;
>  
> +	ret = backlight_disable(panel->backlight);
> +	if (ret < 0)
> +		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n", ret);
> +
>  	if (panel->funcs && panel->funcs->disable)
>  		return panel->funcs->disable(panel);
>  
> @@ -289,6 +306,45 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_panel);
>  #endif
>  
> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> +/**
> + * drm_panel_of_backlight - use backlight device node for backlight
> + * @panel: DRM panel
> + *
> + * Use this function to enable backlight handling if your panel
> + * uses device tree and has a backlight phandle.
> + *
> + * When the panel is enabled backlight will be enabled after a
> + * successfull call to &drm_panel_funcs.enable()
> + *
> + * When the panel is disabled backlight will be disabled before the
> + * call to &drm_panel_funcs.disable().
> + *
> + * A typical implementation for a panel driver supporting device tree
> + * will call this function at probe time. Backlight will then be handled
> + * transparently without requiring any intervention from the driver.
> + * drm_panel_of_backlight() must be called after the call to drm_panel_init().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_of_backlight(struct drm_panel *panel)
> +{
> +	struct backlight_device *backlight;
> +
> +	if (!panel || !panel->dev)
> +		return -EINVAL;
> +
> +	backlight = devm_of_find_backlight(panel->dev);
> +
> +	if (IS_ERR(backlight))
> +                return PTR_ERR(backlight);
> +
> +	panel->backlight = backlight;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_panel_of_backlight);
> +#endif
> +
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("DRM panel infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index d71655b2634c..c751c9b17df0 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -28,6 +28,7 @@
>  #include <linux/errno.h>
>  #include <linux/list.h>
>  
> +struct backlight_device;
>  struct device_node;
>  struct drm_connector;
>  struct drm_device;
> @@ -59,6 +60,10 @@ struct display_timing;
>   *
>   * To save power when no video data is transmitted, a driver can power down
>   * the panel. This is the job of the .unprepare() function.
> + *
> + * Backlight can be handled automatically if configured using
> + * drm_panel_of_backlight(). Then the driver does not need to implement the
> + * functionality to enable/disable backlight.
>   */
>  struct drm_panel_funcs {
>  	/**
> @@ -146,6 +151,17 @@ struct drm_panel {
>  	 */
>  	struct device *dev;
>  
> +	/**
> +	 * @backlight:
> +	 *
> +	 * Backlight device, used to turn on backlight after the call
> +	 * to enable(), and to turn off backlight before the call to
> +	 * disable().
> +	 * backlight is set by drm_panel_of_backlight() and drivers
> +	 * shall not assign it.
> +	 */
> +	struct backlight_device *backlight;
> +
>  	/**
>  	 * @funcs:
>  	 *
> @@ -197,4 +213,13 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +int drm_panel_of_backlight(struct drm_panel *panel);
> +#else
> +static inline int drm_panel_of_backlight(struct drm_panel *panel)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #endif

-- 
Regards,

Laurent Pinchart
