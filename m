Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E9C2D96AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 11:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731656AbgLNK4O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 05:56:14 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59759 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731623AbgLNK4I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 05:56:08 -0500
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it [95.245.192.76])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BBEAF1C0003;
        Mon, 14 Dec 2020 10:55:18 +0000 (UTC)
Date:   Mon, 14 Dec 2020 11:55:28 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 6/9] drm: rcar-du: Embed drm_device in rcar_du_device
Message-ID: <20201214105528.mzypto7lgebh2nrx@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-7-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sat, Dec 05, 2020 at 12:01:36AM +0200, Laurent Pinchart wrote:
> Embedding drm_device in rcar_du_device allows usage of the DRM managed
> API to allocate both structures in one go, simplifying error handling.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Looks good to me (re-sorting the headers rcar_du_drv without
mentioning it too).

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>


> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c      |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c       | 33 +++++++++------------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h       |  5 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c   |  4 +--
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c       |  4 +--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  6 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c       |  6 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c |  2 +-
>  8 files changed, 29 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index e23b9c7b4afe..9a099c0fe1d4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1251,7 +1251,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	else
>  		primary = &rgrp->planes[swindex % 2].plane;
>
> -	ret = drm_crtc_init_with_planes(rcdu->ddev, crtc, primary, NULL,
> +	ret = drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
>  					rcdu->info->gen <= 2 ?
>  					&crtc_funcs_gen2 : &crtc_funcs_gen3,
>  					NULL);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 1490ec182646..4ab99ac49891 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -18,10 +18,11 @@
>  #include <linux/wait.h>
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
> -#include <drm/drm_drv.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>
>  #include "rcar_du_drv.h"
> @@ -529,14 +530,14 @@ static int rcar_du_pm_suspend(struct device *dev)
>  {
>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
>
> -	return drm_mode_config_helper_suspend(rcdu->ddev);
> +	return drm_mode_config_helper_suspend(&rcdu->ddev);
>  }
>
>  static int rcar_du_pm_resume(struct device *dev)
>  {
>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
>
> -	return drm_mode_config_helper_resume(rcdu->ddev);
> +	return drm_mode_config_helper_resume(&rcdu->ddev);
>  }
>  #endif
>
> @@ -551,7 +552,7 @@ static const struct dev_pm_ops rcar_du_pm_ops = {
>  static int rcar_du_remove(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
> -	struct drm_device *ddev = rcdu->ddev;
> +	struct drm_device *ddev = &rcdu->ddev;
>
>  	drm_dev_unregister(ddev);
>
> @@ -565,14 +566,14 @@ static int rcar_du_remove(struct platform_device *pdev)
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu;
> -	struct drm_device *ddev;
>  	struct resource *mem;
>  	int ret;
>
>  	/* Allocate and initialize the R-Car device structure. */
> -	rcdu = devm_kzalloc(&pdev->dev, sizeof(*rcdu), GFP_KERNEL);
> -	if (rcdu == NULL)
> -		return -ENOMEM;
> +	rcdu = devm_drm_dev_alloc(&pdev->dev, &rcar_du_driver,
> +				  struct rcar_du_device, ddev);
> +	if (IS_ERR(rcdu))
> +		return PTR_ERR(rcdu);
>
>  	rcdu->dev = &pdev->dev;
>  	rcdu->info = of_device_get_match_data(rcdu->dev);
> @@ -586,12 +587,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  		return PTR_ERR(rcdu->mmio);
>
>  	/* DRM/KMS objects */
> -	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
> -	if (IS_ERR(ddev))
> -		return PTR_ERR(ddev);
> -
> -	rcdu->ddev = ddev;
> -	ddev->dev_private = rcdu;
> +	rcdu->ddev.dev_private = rcdu;
>
>  	ret = rcar_du_modeset_init(rcdu);
>  	if (ret < 0) {
> @@ -601,25 +597,24 @@ static int rcar_du_probe(struct platform_device *pdev)
>  		goto error;
>  	}
>
> -	ddev->irq_enabled = 1;
> +	rcdu->ddev.irq_enabled = 1;
>
>  	/*
>  	 * Register the DRM device with the core and the connectors with
>  	 * sysfs.
>  	 */
> -	ret = drm_dev_register(ddev, 0);
> +	ret = drm_dev_register(&rcdu->ddev, 0);
>  	if (ret)
>  		goto error;
>
>  	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
>
> -	drm_fbdev_generic_setup(ddev, 32);
> +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
>
>  	return 0;
>
>  error:
> -	rcar_du_remove(pdev);
> -
> +	drm_kms_helper_poll_fini(&rcdu->ddev);
>  	return ret;
>  }
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 71732fc5df8f..e5b6f456357e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -13,6 +13,8 @@
>  #include <linux/kernel.h>
>  #include <linux/wait.h>
>
> +#include <drm/drm_device.h>
> +
>  #include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_group.h"
> @@ -21,7 +23,6 @@
>  struct clk;
>  struct device;
>  struct drm_bridge;
> -struct drm_device;
>  struct drm_property;
>  struct rcar_du_device;
>  struct rcar_du_encoder;
> @@ -80,7 +81,7 @@ struct rcar_du_device {
>
>  	void __iomem *mmio;
>
> -	struct drm_device *ddev;
> +	struct drm_device ddev;
>
>  	struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
>  	unsigned int num_crtcs;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 7c491ff72cd2..e4f35a88d00f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -120,12 +120,12 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  		}
>  	}
>
> -	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> +	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
>  		goto error;
>
> -	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
> +	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
>  				       renc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 72dda446355f..57bb0dc22807 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -583,7 +583,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
>  	 * or enable source color keying (1).
>  	 */
>  	rcdu->props.colorkey =
> -		drm_property_create_range(rcdu->ddev, 0, "colorkey",
> +		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
>  					  0, 0x01ffffff);
>  	if (rcdu->props.colorkey == NULL)
>  		return -ENOMEM;
> @@ -752,7 +752,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  		DU0_REG_OFFSET, DU2_REG_OFFSET
>  	};
>
> -	struct drm_device *dev = rcdu->ddev;
> +	struct drm_device *dev = &rcdu->ddev;
>  	struct drm_encoder *encoder;
>  	unsigned int dpad0_sources;
>  	unsigned int num_encoders;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index a0021fc25b27..5f69ff4502c1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -773,9 +773,9 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>
>  		plane->group = rgrp;
>
> -		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
> -					       &rcar_du_plane_funcs, formats,
> -					       ARRAY_SIZE(formats),
> +		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> +					       crtcs, &rcar_du_plane_funcs,
> +					       formats, ARRAY_SIZE(formats),
>  					       NULL, type, NULL);
>  		if (ret < 0)
>  			return ret;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 78a886651d9f..53221d8473c1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -375,7 +375,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>
>  	vsp->vsp = &pdev->dev;
>
> -	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
> +	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
>  	if (ret < 0)
>  		return ret;
>
> @@ -402,8 +402,8 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		plane->vsp = vsp;
>  		plane->index = i;
>
> -		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
> -					       &rcar_du_vsp_plane_funcs,
> +		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> +					       crtcs, &rcar_du_vsp_plane_funcs,
>  					       rcar_du_vsp_formats,
>  					       ARRAY_SIZE(rcar_du_vsp_formats),
>  					       NULL, type, NULL);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index 04efa78d70b6..c79d1259e49b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -204,7 +204,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  	drm_connector_helper_add(&wb_conn->base,
>  				 &rcar_du_wb_conn_helper_funcs);
>
> -	return drm_writeback_connector_init(rcdu->ddev, wb_conn,
> +	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
>  					    &rcar_du_wb_conn_funcs,
>  					    &rcar_du_wb_enc_helper_funcs,
>  					    writeback_formats,
> --
> Regards,
>
> Laurent Pinchart
>
