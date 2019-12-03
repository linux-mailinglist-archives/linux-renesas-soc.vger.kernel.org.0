Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 203A510F841
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 08:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfLCHDA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 02:03:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56844 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfLCHDA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 02:03:00 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCEFE309;
        Tue,  3 Dec 2019 08:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575356577;
        bh=BHGcClPJ8faRIFKK7GdcaZ3ZNqYB59soqjub02MQB1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E3kueX+7poUsLlLNHNb8tDRtAIJFMNynguFfEhRjHD8V/rg8SOIyTvGI64Sm/v7sW
         kRat1924btOO2rZxPhXW1Fv6jz6Q2UvxV3F3RAYHjBZjx27fOnvFuVje9e9COANAEw
         Z4e9gqTJkCwCprwCs08uymK0XroFud5phDqLqJFY=
Date:   Tue, 3 Dec 2019 09:02:49 +0200
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
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191203070249.GG4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-8-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:11PM +0100, Sam Ravnborg wrote:
> There was no users - so remove it.
> The callback was implemented in two drivers - deleted.

This looks good to me, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but I'll let Thierry decide if he prefers keeping it.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
>  drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
>  include/drm/drm_panel.h                     |  9 ---------
>  3 files changed, 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> index b878930b17e4..3bcba64235c4 100644
> --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> @@ -217,30 +217,12 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
>  	return seiko_panel_get_fixed_modes(p, connector);
>  }
>  
> -static int seiko_panel_get_timings(struct drm_panel *panel,
> -				    unsigned int num_timings,
> -				    struct display_timing *timings)
> -{
> -	struct seiko_panel *p = to_seiko_panel(panel);
> -	unsigned int i;
> -
> -	if (p->desc->num_timings < num_timings)
> -		num_timings = p->desc->num_timings;
> -
> -	if (timings)
> -		for (i = 0; i < num_timings; i++)
> -			timings[i] = p->desc->timings[i];
> -
> -	return p->desc->num_timings;
> -}
> -
>  static const struct drm_panel_funcs seiko_panel_funcs = {
>  	.disable = seiko_panel_disable,
>  	.unprepare = seiko_panel_unprepare,
>  	.prepare = seiko_panel_prepare,
>  	.enable = seiko_panel_enable,
>  	.get_modes = seiko_panel_get_modes,
> -	.get_timings = seiko_panel_get_timings,
>  };
>  
>  static int seiko_panel_probe(struct device *dev,
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d6299fe6d276..e225791a6fb2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -326,30 +326,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>  	return num;
>  }
>  
> -static int panel_simple_get_timings(struct drm_panel *panel,
> -				    unsigned int num_timings,
> -				    struct display_timing *timings)
> -{
> -	struct panel_simple *p = to_panel_simple(panel);
> -	unsigned int i;
> -
> -	if (p->desc->num_timings < num_timings)
> -		num_timings = p->desc->num_timings;
> -
> -	if (timings)
> -		for (i = 0; i < num_timings; i++)
> -			timings[i] = p->desc->timings[i];
> -
> -	return p->desc->num_timings;
> -}
> -
>  static const struct drm_panel_funcs panel_simple_funcs = {
>  	.disable = panel_simple_disable,
>  	.unprepare = panel_simple_unprepare,
>  	.prepare = panel_simple_prepare,
>  	.enable = panel_simple_enable,
>  	.get_modes = panel_simple_get_modes,
> -	.get_timings = panel_simple_get_timings,
>  };
>  
>  #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 4fd61cb9eb93..c4e82b9ce586 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -102,15 +102,6 @@ struct drm_panel_funcs {
>  	 */
>  	int (*get_modes)(struct drm_panel *panel,
>  			 struct drm_connector *connector);
> -
> -	/**
> -	 * @get_timings:
> -	 *
> -	 * Copy display timings into the provided array and return
> -	 * the number of display timings available.
> -	 */
> -	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
> -			   struct display_timing *timings);
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
