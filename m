Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BC72DABB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 12:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgLOLQZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 06:16:25 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43803 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbgLOLQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 06:16:06 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3F9E8FF803;
        Tue, 15 Dec 2020 11:15:17 +0000 (UTC)
Date:   Tue, 15 Dec 2020 12:15:28 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 5/9] drm: rcar-du: Use DRM-managed allocation for
 encoders
Message-ID: <20201215111528.3voeagyxmvcwhtz6@uno.localdomain>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201214205208.10248-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214205208.10248-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Dec 14, 2020 at 10:52:04PM +0200, Laurent Pinchart wrote:
> devm_kzalloc() is the wrong API to allocate encoders, as the lifetime of
> the encoders is tied to the DRM device, not the device to driver
> binding. drmm_kzalloc() isn't a good option either, as it would result
> in the encoder being freed before being unregistered during the managed
> cleanup of the DRM objects. Use a plain kzalloc(), and register a drmm
> action to cleanup the encoder.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 47 ++++++++++++++---------
>  1 file changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index e4bac47caf16..55a0ecf45ebb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -8,12 +8,13 @@
>   */
>
>  #include <linux/export.h>
> +#include <linux/slab.h>
>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
> -#include <drm/drm_simple_kms_helper.h>
>
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> @@ -44,6 +45,17 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
>  	return num_ports;
>  }
>
> +static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
> +};
> +
> +static void rcar_du_encoder_release(struct drm_device *dev, void *res)
> +{
> +	struct rcar_du_encoder *renc = res;
> +
> +	drm_encoder_cleanup(&renc->base);
> +	kfree(renc);
> +}
> +
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node)
> @@ -53,7 +65,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	struct drm_bridge *bridge;
>  	int ret;
>
> -	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
> +	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
>  	if (renc == NULL)
>  		return -ENOMEM;
>
> @@ -75,20 +87,20 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>
>  		if (IS_ERR(panel)) {
>  			ret = PTR_ERR(panel);
> -			goto done;
> +			goto error;
>  		}
>
>  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>  							 DRM_MODE_CONNECTOR_DPI);
>  		if (IS_ERR(bridge)) {
>  			ret = PTR_ERR(bridge);
> -			goto done;
> +			goto error;
>  		}
>  	} else {
>  		bridge = of_drm_find_bridge(enc_node);
>  		if (!bridge) {
>  			ret = -EPROBE_DEFER;
> -			goto done;
> +			goto error;
>  		}
>
>  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
> @@ -103,28 +115,27 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
>  		if (rcar_lvds_dual_link(bridge)) {
>  			ret = -ENOLINK;
> -			goto done;
> +			goto error;
>  		}
>  	}
>
> -	ret = drm_simple_encoder_init(rcdu->ddev, encoder,
> -				      DRM_MODE_ENCODER_NONE);
> +	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
> -		goto done;
> +		goto error;
> +
> +	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
> +				       renc);
> +	if (ret)
> +		return ret;
>
>  	/*
>  	 * Attach the bridge to the encoder. The bridge will create the
>  	 * connector.
>  	 */
> -	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> -	if (ret) {
> -		drm_encoder_cleanup(encoder);
> -		return ret;
> -	}
> -
> -done:
> -	if (ret < 0)
> -		devm_kfree(rcdu->dev, renc);
> +	return drm_bridge_attach(encoder, bridge, NULL, 0);
>
> +error:
> +	kfree(renc);
>  	return ret;
>  }
> --
> Regards,
>
> Laurent Pinchart
>
