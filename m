Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D453C36C8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jul 2021 22:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhGJUgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Jul 2021 16:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhGJUgn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Jul 2021 16:36:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF185C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jul 2021 13:33:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4CE8255;
        Sat, 10 Jul 2021 22:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625949234;
        bh=KzxnRCT+yTeFgUaeZcbeB9coOGgyQre0UkZzYddV/cM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H+ghCZs39FweltRh+q04oBmzMsDctQ/QXbW8nWAvouRYb3WuESHq1EJoJqyIJh5wA
         oq+Sj2N03MZtS2DjuaRWvo8HVdneM+/CFACYtPophjGYjEf6xKsjN9qLstoK576Ag/
         P0rn+vJQeUykPJMpbDRTJtm5pG94JWb5UtitK7HQ=
Date:   Sat, 10 Jul 2021 23:33:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/shmobile: Convert to Linux IRQ interfaces
Message-ID: <YOoEBGvcqmpP5A1n@pendragon.ideasonboard.com>
References: <20210706074900.8928-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210706074900.8928-1-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Tue, Jul 06, 2021 at 09:49:00AM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 0a02b7092c04..032a2fff5efd 100644
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
> +	free_irq(platform_get_irq(pdev, 0), ddev);
>  	drm_dev_put(ddev);
>  
>  	return 0;
> @@ -258,7 +256,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  		goto err_modeset_cleanup;
>  	}
>  
> -	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	ret = request_irq(platform_get_irq(pdev, 0), shmob_drm_irq, 0, ddev->driver->name, ddev);

Could you store the irq number in a local variable, and wrap this line
at 80 columns ? You can then use the local variable in the free_irq()
call below. With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to install IRQ handler\n");
>  		goto err_modeset_cleanup;
> @@ -275,7 +273,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_irq_uninstall:
> -	drm_irq_uninstall(ddev);
> +	free_irq(platform_get_irq(pdev, 0), ddev);
>  err_modeset_cleanup:
>  	drm_kms_helper_poll_fini(ddev);
>  err_free_drm_dev:

-- 
Regards,

Laurent Pinchart
