Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7DB73BD2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 18:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbjFWQvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 12:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjFWQvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 12:51:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CE2294B;
        Fri, 23 Jun 2023 09:50:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C31FD5F;
        Fri, 23 Jun 2023 18:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687539003;
        bh=Dr1MULLggfcKWm01QouiXfbVzOt1DlbchHiVKjYWYJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=evVRfDyHLmyTSDtajZP/lrPjpmQV9IaxC28lyVun1f4aPhR+ksStg6bG+GdzWieRb
         dkXp8ue2BO7qNwuvA3P2axG9EqLSmVhORX3/LtJnKAgM6/9ZP7qMhz/G/uF8w5IVSS
         x3NG0KcuMX+18yLay5l1LCqBAnZSVJli7iDvCQFI=
Date:   Fri, 23 Jun 2023 19:50:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/39] drm: renesas: shmobile: Unify plane allocation
Message-ID: <20230623165038.GB2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <95c2af42a89c65ca603126e56c0423407dfc873f.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <95c2af42a89c65ca603126e56c0423407dfc873f.1687423204.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:36AM +0200, Geert Uytterhoeven wrote:
> Unify primary and overlay plane allocation:
>   - Enhance shmob_drm_plane_create() so it can be used to create the
>     primary plane, too,
>   - Move overlay plane creation next to primary plane creation.
> 
> As overlay plane index zero now means the primary plane, this requires
> shifting all overlay plane indices by one.

Do you use index zero to identify the primary plane just for
shmob_drm_plane_create(), or somewhere else too ? If it's just to create
the plane, you could instead pass the plane type to the function.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Perhaps it would be better to not use dynamic allocation, but store
> "struct drm_plane primary" and "struct shmob_drm_plane planes[5]" in
> struct drm_shmob_device instead, like is done for the crtc and encoder?
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 39 ++------
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  9 --
>  .../drm/renesas/shmobile/shmob_drm_plane.c    | 96 +++++++++++--------
>  .../drm/renesas/shmobile/shmob_drm_plane.h    |  3 +-
>  4 files changed, 70 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 28a70536693f7788..3f6af12f45988124 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -19,7 +19,6 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> -#include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -501,47 +500,29 @@ static const struct drm_crtc_funcs crtc_funcs = {
>  	.disable_vblank = shmob_drm_disable_vblank,
>  };
>  
> -static const uint32_t modeset_formats[] = {
> -	DRM_FORMAT_RGB565,
> -	DRM_FORMAT_RGB888,
> -	DRM_FORMAT_ARGB8888,
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_NV21,
> -	DRM_FORMAT_NV16,
> -	DRM_FORMAT_NV61,
> -	DRM_FORMAT_NV24,
> -	DRM_FORMAT_NV42,
> -};
> -
> -static const struct drm_plane_funcs primary_plane_funcs = {
> -	DRM_PLANE_NON_ATOMIC_FUNCS,
> -};
> -
>  int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  {
>  	struct drm_crtc *crtc = &sdev->crtc.crtc;
> -	struct drm_plane *primary;
> +	struct drm_plane *primary, *plane;
> +	unsigned int i;
>  	int ret;
>  
>  	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
>  
> -	primary = __drm_universal_plane_alloc(&sdev->ddev, sizeof(*primary), 0,
> -					      0, &primary_plane_funcs,
> -					      modeset_formats,
> -					      ARRAY_SIZE(modeset_formats),
> -					      NULL, DRM_PLANE_TYPE_PRIMARY,
> -					      NULL);
> +	primary = shmob_drm_plane_create(sdev, 0);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> +	for (i = 1; i < 5; ++i) {
> +		plane = shmob_drm_plane_create(sdev, i);
> +		if (IS_ERR(plane))
> +			return PTR_ERR(plane);
> +	}
> +
>  	ret = drm_crtc_init_with_planes(&sdev->ddev, crtc, primary, NULL,
>  					&crtc_funcs, NULL);
> -	if (ret < 0) {
> -		drm_plane_cleanup(primary);
> -		kfree(primary);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index c15ebbe74cac501f..c98e2bdd888c3274 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -154,7 +154,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
>  	struct shmob_drm_device *sdev;
>  	struct drm_device *ddev;
> -	unsigned int i;
>  	int ret;
>  
>  	if (pdata == NULL) {
> @@ -195,14 +194,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "failed to initialize mode setting\n");
>  
> -	for (i = 0; i < 4; ++i) {
> -		ret = shmob_drm_plane_create(sdev, i);
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "failed to create plane %u\n", i);
> -			goto err_modeset_cleanup;
> -		}
> -	}
> -
>  	ret = drm_vblank_init(ddev, 1);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to initialize vblank\n");
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index c58b9dca34736342..63886015baaebfc0 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_plane_helper.h>
>  
>  #include "shmob_drm_drv.h"
>  #include "shmob_drm_kms.h"
> @@ -64,57 +65,58 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  				    struct drm_framebuffer *fb)
>  {
>  	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
> +	unsigned int ovl_idx = splane->index - 1;
>  	u32 format;
>  
>  	/* TODO: Support ROP3 mode */
>  	format = LDBBSIFR_EN | (splane->alpha << LDBBSIFR_LAY_SHIFT) |
>  		 splane->format->ldbbsifr;
>  
> -#define plane_reg_dump(sdev, splane, reg) \
> +#define plane_reg_dump(sdev, ovl_idx, reg) \
>  	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
> -		splane->index, #reg, \
> -		lcdc_read(sdev, reg(splane->index)), \
> -		lcdc_read(sdev, reg(splane->index) + LCDC_SIDE_B_OFFSET))
> -
> -	plane_reg_dump(sdev, splane, LDBnBSIFR);
> -	plane_reg_dump(sdev, splane, LDBnBSSZR);
> -	plane_reg_dump(sdev, splane, LDBnBLOCR);
> -	plane_reg_dump(sdev, splane, LDBnBSMWR);
> -	plane_reg_dump(sdev, splane, LDBnBSAYR);
> -	plane_reg_dump(sdev, splane, LDBnBSACR);
> -
> -	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
> -	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
> +		ovl_idx, #reg, \
> +		lcdc_read(sdev, reg(ovl_idx)), \
> +		lcdc_read(sdev, reg(ovl_idx) + LCDC_SIDE_B_OFFSET))
> +
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSIFR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSSZR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBLOCR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSMWR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSAYR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSACR);
> +
> +	lcdc_write(sdev, LDBCR, LDBCR_UPC(ovl_idx));
> +	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, ovl_idx,
>  		"LDBCR", lcdc_read(sdev, LDBCR));
>  
> -	lcdc_write(sdev, LDBnBSIFR(splane->index), format);
> +	lcdc_write(sdev, LDBnBSIFR(ovl_idx), format);
>  
> -	lcdc_write(sdev, LDBnBSSZR(splane->index),
> +	lcdc_write(sdev, LDBnBSSZR(ovl_idx),
>  		   (splane->crtc_h << LDBBSSZR_BVSS_SHIFT) |
>  		   (splane->crtc_w << LDBBSSZR_BHSS_SHIFT));
> -	lcdc_write(sdev, LDBnBLOCR(splane->index),
> +	lcdc_write(sdev, LDBnBLOCR(ovl_idx),
>  		   (splane->crtc_y << LDBBLOCR_CVLC_SHIFT) |
>  		   (splane->crtc_x << LDBBLOCR_CHLC_SHIFT));
> -	lcdc_write(sdev, LDBnBSMWR(splane->index),
> +	lcdc_write(sdev, LDBnBSMWR(ovl_idx),
>  		   fb->pitches[0] << LDBBSMWR_BSMW_SHIFT);
>  
>  	shmob_drm_plane_compute_base(splane, fb, splane->src_x, splane->src_y);
>  
> -	lcdc_write(sdev, LDBnBSAYR(splane->index), splane->dma[0]);
> +	lcdc_write(sdev, LDBnBSAYR(ovl_idx), splane->dma[0]);
>  	if (shmob_drm_format_is_yuv(splane->format))
> -		lcdc_write(sdev, LDBnBSACR(splane->index), splane->dma[1]);
> +		lcdc_write(sdev, LDBnBSACR(ovl_idx), splane->dma[1]);
>  
>  	lcdc_write(sdev, LDBCR,
> -		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
> -	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
> +		   LDBCR_UPF(ovl_idx) | LDBCR_UPD(ovl_idx));
> +	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, ovl_idx,
>  		"LDBCR", lcdc_read(sdev, LDBCR));
>  
> -	plane_reg_dump(sdev, splane, LDBnBSIFR);
> -	plane_reg_dump(sdev, splane, LDBnBSSZR);
> -	plane_reg_dump(sdev, splane, LDBnBLOCR);
> -	plane_reg_dump(sdev, splane, LDBnBSMWR);
> -	plane_reg_dump(sdev, splane, LDBnBSAYR);
> -	plane_reg_dump(sdev, splane, LDBnBSACR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSIFR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSSZR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBLOCR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSMWR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSAYR);
> +	plane_reg_dump(sdev, ovl_idx, LDBnBSACR);
>  }
>  
>  void shmob_drm_plane_setup(struct drm_plane *plane)
> @@ -169,16 +171,22 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
>  {
>  	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
>  	struct shmob_drm_plane *splane = to_shmob_plane(plane);
> +	unsigned int ovl_idx = splane->index - 1;
>  
>  	splane->format = NULL;
>  
> -	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
> -	lcdc_write(sdev, LDBnBSIFR(splane->index), 0);
> +	lcdc_write(sdev, LDBCR, LDBCR_UPC(ovl_idx));
> +	lcdc_write(sdev, LDBnBSIFR(ovl_idx), 0);
>  	lcdc_write(sdev, LDBCR,
> -		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
> +		   LDBCR_UPF(ovl_idx) | LDBCR_UPD(ovl_idx));
>  	return 0;
>  }
>  
> +static const struct drm_plane_funcs primary_plane_funcs = {

While at it, you can name this shmob_primary_plane_funcs to avoid
namespace clashes.

> +	.update_plane = drm_plane_helper_update_primary,
> +	.disable_plane = drm_plane_helper_disable_primary,
> +};
> +
>  static const struct drm_plane_funcs shmob_drm_plane_funcs = {

And shmob_overlay_plane_funcs for consistency.

>  	.update_plane = shmob_drm_plane_update,
>  	.disable_plane = shmob_drm_plane_disable,
> @@ -197,19 +205,31 @@ static const uint32_t formats[] = {
>  	DRM_FORMAT_NV42,
>  };
>  
> -int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
> +struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> +					 unsigned int index)
>  {
> +	const struct drm_plane_funcs *funcs;
>  	struct shmob_drm_plane *splane;
> +	enum drm_plane_type type;
> +
> +	if (!index) {
> +		type = DRM_PLANE_TYPE_PRIMARY;
> +		funcs = &primary_plane_funcs;
> +	} else {
> +		type = DRM_PLANE_TYPE_OVERLAY;
> +		funcs = &shmob_drm_plane_funcs;
> +	}
>  
> -	splane = drmm_universal_plane_alloc(&sdev->ddev, struct shmob_drm_plane,
> -					    plane, 1, &shmob_drm_plane_funcs,
> -					    formats, ARRAY_SIZE(formats), NULL,
> -					    DRM_PLANE_TYPE_OVERLAY, NULL);
> +	splane = drmm_universal_plane_alloc(&sdev->ddev,
> +					    struct shmob_drm_plane, plane, 1,
> +					    funcs, formats,
> +					    ARRAY_SIZE(formats),  NULL, type,
> +					    NULL);
>  	if (IS_ERR(splane))
> -		return PTR_ERR(splane);
> +		return ERR_CAST(splane);
>  
>  	splane->index = index;
>  	splane->alpha = 255;
>  
> -	return 0;
> +	return &splane->plane;
>  }
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
> index e72b21a4288fc23f..29cf6732d479a509 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
> @@ -13,7 +13,8 @@
>  struct drm_plane;
>  struct shmob_drm_device;
>  
> -int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index);
> +struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> +					 unsigned int index);
>  void shmob_drm_plane_setup(struct drm_plane *plane);
>  
>  #endif /* __SHMOB_DRM_PLANE_H__ */

-- 
Regards,

Laurent Pinchart
