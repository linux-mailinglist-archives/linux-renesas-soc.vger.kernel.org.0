Return-Path: <linux-renesas-soc+bounces-1001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 402AC811853
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 318E61C20C4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF5C85367;
	Wed, 13 Dec 2023 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pz3NQVa7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D02B7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 07:50:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97DD8BD1;
	Wed, 13 Dec 2023 16:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702482596;
	bh=JtO/rPKqKpbxuHjqgc1fa/HQxv1i+GHSYeuvA2dOmtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz3NQVa7sxXVBhmu8HFU5Oem9jGyPbOGJLIfSLeWW2ZR/Bdvx4UpoioKHBfMVhgbZ
	 RiizCjh0A29z1QtahL9QcpfB3YHUBWszffpHEKxaJbFjfRELY59W/4+zuVRKuH9GrV
	 iPzY6vAjM4nN6bqUWz1ANvdr48aXxmD+mYLZl2aw=
Date: Wed, 13 Dec 2023 17:50:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <20231213155049.GH12450@pendragon.ideasonboard.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>

On Wed, Dec 13, 2023 at 04:47:09PM +0100, Maxime Ripard wrote:
> On Tue, Nov 28, 2023 at 10:51:27AM +0000, Biju Das wrote:
> > The LCD controller is composed of Frame Compression Processor (FCPVD),
> > Video Signal Processor (VSPD), and Display Unit (DU).
> > 
> > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > along with 2 RPFs to support the blending of two picture layers and
> > raster operations (ROPs).
> > 
> > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > alike SoCs.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> I'd still like a review from Geert or Laurent, I don't know the SoC.

I won't have time soon, and this driver has been blocked for way too
long due to that :-S

> > +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	int ret;
> > +
> > +	/*
> > +	 * Guard against double-get, as the function is called from both the
> > +	 * .atomic_enable() and .atomic_flush() handlers.
> > +	 */
> > +	if (rcrtc->initialized)
> > +		return 0;
> > +
> > +	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> > +	if (ret < 0)
> > +		goto error_bus_clock;
> > +
> > +	ret = reset_control_deassert(rcrtc->rstc);
> > +	if (ret < 0)
> > +		goto error_peri_clock;
> > +
> > +	rzg2l_du_crtc_setup(rcrtc);
> > +	rcrtc->initialized = true;
> > +
> > +	return 0;
> > +
> > +error_peri_clock:
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> > +error_bus_clock:
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> > +	return ret;
> > +}
> 
> [...]
> 
> > +static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > +				       struct drm_atomic_state *state)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > +	struct drm_device *dev = rcrtc->crtc.dev;
> > +	unsigned long flags;
> > +
> > +	WARN_ON(!crtc->state->enable);
> > +
> > +	/*
> > +	 * If a mode set is in progress we can be called with the CRTC disabled.
> > +	 * We thus need to first get and setup the CRTC in order to configure
> > +	 * planes. We must *not* put the CRTC, as it must be kept awake until
> > +	 * the .atomic_enable() call that will follow. The get operation in
> > +	 * .atomic_enable() will in that case be a no-op, and the CRTC will be
> > +	 * put later in .atomic_disable().
> > +	 */
> > +	rzg2l_du_crtc_get(rcrtc);
> 
> That's a bit suspicious. Have you looked at drm_atomic_helper_commit_tail_rpm() ?
> 
> > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > +
> > +	rcrtc->vblank_enable = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > +
> > +	rcrtc->vblank_enable = false;
> > +}
> 
> You should enable / disable your interrupts here
> 
> > +int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc = &rcdu->crtcs[0];
> > +	struct drm_crtc *crtc = &rcrtc->crtc;
> > +	struct drm_plane *primary;
> > +	int ret;
> > +
> > +	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
> > +	if (IS_ERR(rcrtc->rstc)) {
> > +		dev_err(rcdu->dev, "can't get cpg reset\n");
> > +		return PTR_ERR(rcrtc->rstc);
> > +	}
> > +
> > +	rcrtc->rzg2l_clocks.aclk = devm_clk_get(rcdu->dev, "aclk");
> > +	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
> > +		dev_err(rcdu->dev, "no axi clock for DU\n");
> > +		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
> > +	}
> > +
> > +	rcrtc->rzg2l_clocks.pclk = devm_clk_get(rcdu->dev, "pclk");
> > +	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
> > +		dev_err(rcdu->dev, "no peripheral clock for DU\n");
> > +		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
> > +	}
> > +
> > +	rcrtc->rzg2l_clocks.dclk = devm_clk_get(rcdu->dev, "vclk");
> > +	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
> > +		dev_err(rcdu->dev, "no video clock for DU\n");
> > +		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
> > +	}
> > +
> > +	init_waitqueue_head(&rcrtc->flip_wait);
> > +	rcrtc->dev = rcdu;
> > +
> > +	primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
> > +
> > +	ret = drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
> > +					&crtc_funcs_rz, NULL);
> > +	if (ret < 0)
> > +		return ret;
> 
> You should use the drmm variant here
> 
> > +static void rzg2l_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> > +{
> > +	struct drm_device *dev = old_state->dev;
> > +
> > +	/* Apply the atomic update. */
> > +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > +	drm_atomic_helper_commit_planes(dev, old_state,
> > +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_hw_done(old_state);
> > +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> > +
> > +	drm_atomic_helper_cleanup_planes(dev, old_state);
> > +}
> 
> AFAIK, there's no reason to roll your commit_tail implementation
> yourself here. You should at the very least document why you needed to
> do so.
> 
> > +int rzg2l_du_vsp_map_fb(struct rzg2l_du_vsp *vsp, struct drm_framebuffer *fb,
> > +			struct sg_table sg_tables[3])
> > +{
> > +	struct rzg2l_du_device *rcdu = vsp->dev;
> > +	unsigned int i, j;
> > +	int ret;
> > +
> > +	for (i = 0; i < fb->format->num_planes; ++i) {
> > +		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
> > +		struct sg_table *sgt = &sg_tables[i];
> > +
> > +		if (gem->sgt) {
> > +			struct scatterlist *src;
> > +			struct scatterlist *dst;
> > +
> > +			/*
> > +			 * If the GEM buffer has a scatter gather table, it has
> > +			 * been imported from a dma-buf and has no physical
> > +			 * address as it might not be physically contiguous.
> > +			 * Copy the original scatter gather table to map it to
> > +			 * the VSP.
> > +			 */
> > +			ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
> > +					     GFP_KERNEL);
> > +			if (ret)
> > +				goto fail;
> > +
> > +			src = gem->sgt->sgl;
> > +			dst = sgt->sgl;
> > +			for (j = 0; j < gem->sgt->orig_nents; ++j) {
> > +				sg_set_page(dst, sg_page(src), src->length,
> > +					    src->offset);
> > +				src = sg_next(src);
> > +				dst = sg_next(dst);
> > +			}
> > +		} else {
> > +			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
> > +					      gem->dma_addr, gem->base.size);
> > +			if (ret)
> > +				goto fail;
> > +		}
> > +
> > +		ret = vsp1_du_map_sg(vsp->vsp, sgt);
> > +		if (ret) {
> > +			sg_free_table(sgt);
> > +			goto fail;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +fail:
> > +	while (i--) {
> > +		struct sg_table *sgt = &sg_tables[i];
> > +
> > +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> > +		sg_free_table(sgt);
> > +	}
> > +
> > +	return ret;
> > +}
> 
> Ditto, you should at least document why you're not using the helpers.
> 
> > +static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)
> > +{
> > +	struct rzg2l_du_vsp *vsp = res;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < vsp->num_planes; ++i) {
> > +		struct rzg2l_du_vsp_plane *plane = &vsp->planes[i];
> > +
> > +		drm_plane_cleanup(&plane->plane);
> > +	}
> > +
> > +	kfree(vsp->planes);
> > +
> > +	put_device(vsp->vsp);
> > +}
> > +
> > +int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
> > +		      unsigned int crtcs)
> > +{
> > +	struct rzg2l_du_device *rcdu = vsp->dev;
> > +	struct platform_device *pdev;
> > +	unsigned int num_crtcs = hweight32(crtcs);
> > +	unsigned int num_planes = 2;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Find the VSP device and initialize it. */
> > +	pdev = of_find_device_by_node(np);
> > +	if (!pdev)
> > +		return -ENXIO;
> > +
> > +	vsp->vsp = &pdev->dev;
> > +
> > +	ret = drmm_add_action_or_reset(&rcdu->ddev, rzg2l_du_vsp_cleanup, vsp);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = vsp1_du_init(vsp->vsp);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
> > +	if (!vsp->planes)
> > +		return -ENOMEM;
> 
> drmm_kcalloc or drmm_kmalloc_array
> 
> > +
> > +	for (i = 0; i < num_planes; ++i) {
> > +		enum drm_plane_type type = i < num_crtcs
> > +					 ? DRM_PLANE_TYPE_PRIMARY
> > +					 : DRM_PLANE_TYPE_OVERLAY;
> > +		struct rzg2l_du_vsp_plane *plane = &vsp->planes[i];
> > +
> > +		plane->vsp = vsp;
> > +		plane->index = i;
> > +		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> > +					       crtcs, &rzg2l_du_vsp_plane_funcs,
> > +					       rzg2l_du_vsp_formats,
> > +					       ARRAY_SIZE(rzg2l_du_vsp_formats),
> > +					       NULL, type, NULL);
> > +		if (ret < 0)
> > +			return ret;
> 
> you need to use drmm variant here too.

-- 
Regards,

Laurent Pinchart

