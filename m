Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3AC6116490
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 01:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfLIAu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Dec 2019 19:50:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49774 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbfLIAu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Dec 2019 19:50:28 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE90A52B;
        Mon,  9 Dec 2019 01:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575852625;
        bh=05qu6A8LjmvyF+V1mQN3igr/hkyti8yhAOb0TcMEjBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aPM7SCEVSQZJXE7EyZ2dRxMJ+M1xpN1dnPsbeDQZ7R6amo1/qxXroZt3KnEHlq8aF
         jp/X4dSfBpcS6P7eA+PLl37xwevqOUhRe3+jf+WOPqMAhk7GVf0kN7+T4oqhk3Konp
         TpKjRjJSuaJsGi2it/bEbmeLOBvSCx989iQjdPdY=
Date:   Mon, 9 Dec 2019 02:50:18 +0200
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 01/25] drm/drm_panel: no error when no callback
Message-ID: <20191209005018.GJ14311@pendragon.ideasonboard.com>
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191207140353.23967-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sat, Dec 07, 2019 at 03:03:29PM +0100, Sam Ravnborg wrote:
> The callbacks in drm_panel_funcs are optional, so do not
> return an error just because no callback is assigned.
> 
> v2:
> - Document what functions in drm_panel_funcs are optional (Laurent)
> - Return -EOPNOTSUPP if get_modes() is not assigned (Laurent)
>   (Sam: -EOPNOTSUPP seems to best error code in this situation)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 35 +++++++++++++++++++++++++----------
>  include/drm/drm_panel.h     | 18 ++++++++++++++++--
>  2 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index ed7985c0535a..4ab7229fb22b 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -151,10 +151,13 @@ EXPORT_SYMBOL(drm_panel_detach);
>   */
>  int drm_panel_prepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->prepare)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->prepare)
>  		return panel->funcs->prepare(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_prepare);
>  
> @@ -171,10 +174,13 @@ EXPORT_SYMBOL(drm_panel_prepare);
>   */
>  int drm_panel_unprepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->unprepare)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->unprepare)
>  		return panel->funcs->unprepare(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_unprepare);
>  
> @@ -190,10 +196,13 @@ EXPORT_SYMBOL(drm_panel_unprepare);
>   */
>  int drm_panel_enable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->enable)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->enable)
>  		return panel->funcs->enable(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_enable);
>  
> @@ -209,10 +218,13 @@ EXPORT_SYMBOL(drm_panel_enable);
>   */
>  int drm_panel_disable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->disable)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->disable)
>  		return panel->funcs->disable(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_disable);
>  
> @@ -228,10 +240,13 @@ EXPORT_SYMBOL(drm_panel_disable);
>   */
>  int drm_panel_get_modes(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->get_modes)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->get_modes)
>  		return panel->funcs->get_modes(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>  
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index ce8da64022b4..d71655b2634c 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -65,6 +65,8 @@ struct drm_panel_funcs {
>  	 * @prepare:
>  	 *
>  	 * Turn on panel and perform set up.
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*prepare)(struct drm_panel *panel);
>  
> @@ -72,6 +74,8 @@ struct drm_panel_funcs {
>  	 * @enable:
>  	 *
>  	 * Enable panel (turn on back light, etc.).
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*enable)(struct drm_panel *panel);
>  
> @@ -79,6 +83,8 @@ struct drm_panel_funcs {
>  	 * @disable:
>  	 *
>  	 * Disable panel (turn off back light, etc.).
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*disable)(struct drm_panel *panel);
>  
> @@ -86,14 +92,20 @@ struct drm_panel_funcs {
>  	 * @unprepare:
>  	 *
>  	 * Turn off panel.
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*unprepare)(struct drm_panel *panel);
>  
>  	/**
>  	 * @get_modes:
>  	 *
> -	 * Add modes to the connector that the panel is attached to and
> -	 * return the number of modes added.
> +	 * Add modes to the connector that the panel is attached to.
> +	 *
> +	 * This function is mandatory.
> +	 *
> +	 * Returns the number of modes added, -EOPNOTSUPP if callback
> +	 * is missing, -EINVAL if panel is NULL.

This applies to drm_panel_get_modes, not &drm_panel_funcs.get_modes.
Here you should just have

 	 *
 	 * Add modes to the connector that the panel is attached to and
 	 * return the number of modes added.
+	 *
+	 * This function is mandatory.
 	 */
 	int (*get_modes)(struct drm_panel *panel);
 
>  	 */
>  	int (*get_modes)(struct drm_panel *panel);
>  
> @@ -102,6 +114,8 @@ struct drm_panel_funcs {
>  	 *
>  	 * Copy display timings into the provided array and return
>  	 * the number of display timings available.
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
>  			   struct display_timing *timings);

-- 
Regards,

Laurent Pinchart
