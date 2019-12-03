Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BDA10F7FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 07:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbfLCGoY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 01:44:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56520 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfLCGoY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 01:44:24 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C443309;
        Tue,  3 Dec 2019 07:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575355461;
        bh=g/3jjUGzt/ZPk4oebHW3YfmYOgHqwdzbZQuepaZXnZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v2/pr/F9edrxg9ZBPVTOYa8P9ikzqJhOu4ROsO8ftPE8VHwx4EgD78nZi+ZYlO0mB
         5H3mAZICncryXfGSu8OoTEKCEe2GYcFlMRt+09pOXdmEMFp0scnGdQG6U2hkbu/HCd
         s+eKKGxEAQHDPgJZtE9suYSiN0MVpAb6R2OBuXY4=
Date:   Tue, 3 Dec 2019 08:44:14 +0200
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
Message-ID: <20191203064414.GD4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:08PM +0100, Sam Ravnborg wrote:
> The drm_connector created by drm_panel_bridge was accessed
> via drm_panel.connector.
> Avoid the detour around drm_panel by providing a simple get method.
> This avoids direct access to the connector field in drm_panel in
> the two users.

You may want to add that this is needed to prepare for removal of
drm_panel.connector.

> Update pl111 and tve200 to use the new helper.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/bridge/panel.c      | 16 ++++++++++++++++
>  drivers/gpu/drm/pl111/pl111_drv.c   |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c |  2 +-
>  include/drm/drm_bridge.h            |  1 +
>  4 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index f4e293e7cf64..c5e27b81588a 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -289,3 +289,19 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
> +
> +/**
> + * drm_panel_bridge_connector - return pointer to connector

Maybe "return the connector for the panel bridge" ?

> + *
> + * drm_panel_bridge creates the connector.
> + * This function gives external access to the connector.
> + *
> + * Returns: Pointer to drm_conneector

s/drm_conneector/drm_connector/

> + */
> +struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
> +{
> +	struct panel_bridge * panel_bridge;

s/\* panel_bridge/*panel_bridge/

There's also a missing blank line, didn't checkpatch warn about this ?

With those small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +
> +	return &panel_bridge->connector;
> +}
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 63dfcda04147..aa8aa8d9e405 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -166,7 +166,7 @@ static int pl111_modeset_init(struct drm_device *dev)
>  	priv->bridge = bridge;
>  	if (panel) {
>  		priv->panel = panel;
> -		priv->connector = panel->connector;
> +		priv->connector = drm_panel_bridge_connector(bridge);
>  	}
>  
>  	ret = pl111_display_init(dev);
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
> index 954b09c948eb..00ba9e5ce130 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -110,7 +110,7 @@ static int tve200_modeset_init(struct drm_device *dev)
>  	}
>  
>  	priv->panel = panel;
> -	priv->connector = panel->connector;
> +	priv->connector = drm_panel_bridge_connector(bridge);
>  	priv->bridge = bridge;
>  
>  	dev_info(dev->dev, "attached to panel %s\n",
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c0a2286a81e9..9a4902accfe5 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -438,6 +438,7 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  						   struct drm_panel *panel,
>  						   u32 connector_type);
> +struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
>  #endif
>  
>  #endif

-- 
Regards,

Laurent Pinchart
