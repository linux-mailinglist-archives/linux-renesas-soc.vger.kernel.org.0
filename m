Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BA83D33B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 06:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbhGWDrB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jul 2021 23:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbhGWDrB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jul 2021 23:47:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753B4C061575
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jul 2021 21:27:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDE67255;
        Fri, 23 Jul 2021 06:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627014452;
        bh=cIwic+eh4JDZqZlXGIA4RovSotmth8rVtxDucucRjVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mo6WfHrUnHGDxrfpmJlARIxXowTf0dCRYam8FHW3HLcwTpqmspoU7a9BKPqod2ZzJ
         bQNrpRMmQRtt26YWR80JxG7nEcr75NM+Z0ar4AG0dKtf9qFGFfMYSFNFr9rUX+hGTV
         UeXp5juQ7hz0oaAyAeXd5IY665aI5qp+clcidZD0=
Date:   Fri, 23 Jul 2021 07:27:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, sam@ravnborg.org, geert@linux-m68k.org,
        sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/shmobile: Convert to Linux IRQ interfaces
Message-ID: <YPpFM5FIzZWtjL0i@pendragon.ideasonboard.com>
References: <20210720080941.23646-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210720080941.23646-1-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Tue, Jul 20, 2021 at 10:09:41AM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> v3:
> 	* return error if (ret < 0) (Geert)
> 	* remove duplicate error message (Geert)
> v2:
> 	* handle errors in platform_get_irq() (Geert, Sergei)
> 	* store IRQ number in struct shmob_drm_device (Laurent)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 14 +++++++++-----
>  drivers/gpu/drm/shmobile/shmob_drm_drv.h |  1 +
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 0a02b7092c04..7db01904d18d 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -18,7 +18,6 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -130,7 +129,6 @@ DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
>  
>  static const struct drm_driver shmob_drm_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
> -	.irq_handler		= shmob_drm_irq,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  	.fops			= &shmob_drm_fops,
>  	.name			= "shmob-drm",
> @@ -183,7 +181,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  
>  	drm_dev_unregister(ddev);
>  	drm_kms_helper_poll_fini(ddev);
> -	drm_irq_uninstall(ddev);
> +	free_irq(sdev->irq, ddev);
>  	drm_dev_put(ddev);
>  
>  	return 0;
> @@ -258,7 +256,13 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  		goto err_modeset_cleanup;
>  	}
>  
> -	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto err_modeset_cleanup;
> +	sdev->irq = ret;
> +
> +	ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
> +			  ddev);

We could pass sdev to this function instead of ddev (and same for
free_irq()), and update shmob_drm_irq() accordingly. This could however
be made on top, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to install IRQ handler\n");
>  		goto err_modeset_cleanup;
> @@ -275,7 +279,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_irq_uninstall:
> -	drm_irq_uninstall(ddev);
> +	free_irq(sdev->irq, ddev);
>  err_modeset_cleanup:
>  	drm_kms_helper_poll_fini(ddev);
>  err_free_drm_dev:
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
> index 80dc4b1020aa..4964ddd5ab74 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
> @@ -29,6 +29,7 @@ struct shmob_drm_device {
>  	u32 lddckr;
>  	u32 ldmt1r;
>  
> +	unsigned int irq;
>  	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
>  
>  	struct drm_device *ddev;
> 

-- 
Regards,

Laurent Pinchart
