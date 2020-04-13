Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B24B41A62C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 07:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgDMF6v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 01:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgDMF6u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 01:58:50 -0400
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EB8C008681
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2020 22:58:50 -0700 (PDT)
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id CE3748048A;
        Mon, 13 Apr 2020 07:58:47 +0200 (CEST)
Date:   Mon, 13 Apr 2020 07:58:46 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/4] drm: bridge: adv7511: Split connector creation to a
 separate function
Message-ID: <20200413055846.GD6324@ravnborg.org>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409004610.12346-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409004610.12346-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=h90TiP3DJ19r7i-q8SIA:9
        a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

On Thu, Apr 09, 2020 at 03:46:08AM +0300, Laurent Pinchart wrote:
> To prepare for making the connector creation optional, move the related
> code out of adv7511_bridge_attach() to a separate function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On nit below, but otherwise:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 62 +++++++++++++-------
>  1 file changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 58d02e92b6b9..e3b62ad95389 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -783,7 +783,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>  	adv7511->f_tmds = mode->clock;
>  }
>  
> -/* Connector funcs */
> +/* -----------------------------------------------------------------------------
> + * DRM Connector Operations
> + */
> +
>  static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
>  {
>  	return container_of(connector, struct adv7511, connector);
> @@ -827,7 +830,40 @@ static const struct drm_connector_funcs adv7511_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -/* Bridge funcs */
> +static int adv7511_connector_init(struct adv7511 *adv)
> +{
> +	struct drm_bridge *bridge = &adv->bridge;
> +	int ret;
> +
> +	if (!bridge->encoder) {
> +		DRM_ERROR("Parent encoder object not found");
> +		return -ENODEV;
> +	}
> +
> +	if (adv->i2c_main->irq)
> +		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +	else
> +		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> +				DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	ret = drm_connector_init(bridge->dev, &adv->connector,
> +				 &adv7511_connector_funcs,
> +				 DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret) {

Here we test for ret != 0

> +		DRM_ERROR("Failed to initialize connector with drm\n");
> +		return ret;
> +	}
> +	drm_connector_helper_add(&adv->connector,
> +				 &adv7511_connector_helper_funcs);
> +	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
> +
> +	return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * DRM Bridge Operations
> + */
> +
>  static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct adv7511, bridge);
> @@ -867,27 +903,9 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
> -	if (adv->i2c_main->irq)
> -		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
> -	else
> -		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> -				DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	ret = drm_connector_init(bridge->dev, &adv->connector,
> -				 &adv7511_connector_funcs,
> -				 DRM_MODE_CONNECTOR_HDMIA);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector with drm\n");
> +	ret = adv7511_connector_init(adv);
> +	if (ret < 0)
Here we test for ret < 0

The code works - but it is inconsistent.
drm_connector_init() is documented to:
"Zero on success, error code on failure."

>  		return ret;
> -	}
> -	drm_connector_helper_add(&adv->connector,
> -				 &adv7511_connector_helper_funcs);
> -	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
>  
>  	if (adv->type == ADV7533 || adv->type == ADV7535)
>  		ret = adv7533_attach_dsi(adv);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
