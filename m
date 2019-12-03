Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D63BD10F7C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 07:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfLCGZK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 01:25:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56278 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfLCGZK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 01:25:10 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED8F8309;
        Tue,  3 Dec 2019 07:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575354306;
        bh=xMhIy5HaiSKkNSrpN5V89DDzQfYcJU5ugOWimrHaPOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h6qBeI/WhmgWblAgjLQFXmZpvICtdJ7ang5ZAu5QF/RWsHFhxgfKLrUQgLiN0ZySP
         te8cQY0l0xw5SKujiIaFAPliBjJuQRSuy8VjWqLPVlmREWdKpCygHfjb38yR1iYlaQ
         x2aoQRv36caeBrjXBdi/fF336MdBMzwTFlpaN1nk=
Date:   Tue, 3 Dec 2019 08:24:59 +0200
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
Subject: Re: [PATCH v1 01/26] drm/drm_panel: no error when no callback
Message-ID: <20191203062459.GA4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:05PM +0100, Sam Ravnborg wrote:
> The callbacks in drm_panel_funcs are optional, so do not
> return an error just because no callback is assigned.

Unless I'm mistaken the callbacks are not documented as optional. Should
this be fixed too ?

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index ed7985c0535a..2d59cdd05e50 100644
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

Should get_modes() be optional ? As far as I can tell all the panel
drivers in drivers/gpu/drm/panel/ implement it, and I'm not sure to see
how a panel could be usable if it can't return its mode.

On the other hand you return 0 if the callback isn't implemented, which
doesn't mean success here, so I suppose that's fine, but I don't think
we should document .get_modes() as being optional.

With these issues addressed (if they need to be),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>  

-- 
Regards,

Laurent Pinchart
