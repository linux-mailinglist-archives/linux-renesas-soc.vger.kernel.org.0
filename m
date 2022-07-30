Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5FC585C86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 00:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiG3Wgr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Jul 2022 18:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiG3Wgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Jul 2022 18:36:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5227D13DD9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Jul 2022 15:36:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AA69415;
        Sun, 31 Jul 2022 00:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659220603;
        bh=14Tzs1PO+Qt1tNZVsm22hOzJ4ymMQ1fyMrdYUuh37Uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=loZyF05QD4JpJWUBuUWIn8M5asGlPEy6V0U3zYwLNxVMcfRUNLoEct0bMk6j1T4+R
         5559wv/Pz1BQwklMpeully0WLBDe6RH174DwpspVE1mxZMHI2u8azt0vGNYp1HkRgh
         DAtNQ+hKEkR6mqX0J6gZzN7FF3TogFpRdOHLBt9U=
Date:   Sun, 31 Jul 2022 01:36:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/3] media: vsp1: add blend mode support
Message-ID: <YuWyd2YGLx1J5vPW@pendragon.ideasonboard.com>
References: <20220704025231.3911138-1-taki@igel.co.jp>
 <20220704025231.3911138-3-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704025231.3911138-3-taki@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hayama-san,

Thank you for the patch.

On Mon, Jul 04, 2022 at 11:52:30AM +0900, Takanari Hayama wrote:
> To support DRM blend mode in R-Car DU driver, we must add blend mode
> support in VSP1. Although VSP1 hardware is capable to support all blend
> mode defined in DRM, the current R-Car DU driver implicitly supports
> DRM_MODE_BLEND_COVERAGE only.
> 
> We add a new property to vsp1_du_atomic_config, so that R-Car DU driver
> can pass the desired blend mode.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 11 +++++++++++
>  include/media/vsp1.h                           | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 9ec3ac835987..ed0cf552fce2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -861,6 +861,17 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
>  	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
>  	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
>  
> +	switch (cfg->blend_mode) {
> +	case VSP1_DU_BLEND_MODE_PREMULTI:
> +		rpf->format.flags = V4L2_PIX_FMT_FLAG_PREMUL_ALPHA;
> +		break;
> +	case VSP1_DU_BLEND_MODE_PIXEL_NONE:
> +		rpf->pixel_alpha = false;
> +		fallthrough;
> +	case VSP1_DU_BLEND_MODE_COVERAGE:
> +		rpf->format.flags = 0;
> +	}

This should work, but wouldn't it be simpler to override the format
passed in cfg->pixelformat in rcar_du_vsp_plane_setup() with the
non-alpha variant when state->state.pixel_blend_mode is set to
DRM_MODE_BLEND_PIXEL_NONE ? That way you could drop rpf->pixel_alpha,
turn cfg->blend_mode into a premult bool flag, and drop the
vsp1_du_blend_mode enum. There's only three formats with an alpha
channel that the rcar-du driver supports (DRM_FORMAT_ARGB4444,
DRM_FORMAT_ARGB1555 and DRM_FORMAT_ARGB8888), so the override could be
as simple as a switch (state->format->fourcc) when the blend mode is
NONE.

> +
>  	drm_pipe->pipe.inputs[rpf_index] = rpf;
>  
>  	return 0;
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index cc1b0d42ce95..1ba7459b7a06 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -42,6 +42,18 @@ struct vsp1_du_lif_config {
>  int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>  		      const struct vsp1_du_lif_config *cfg);
>  
> +/**
> + * enum vsp1_du_blend_mode - Pixel blend mode
> + * @VSP1_DU_BLEND_MODE_PREMULTI: Pixel alpha is pre-mutiplied
> + * @VSP1_DU_BLEND_MODE_COVERAGE: Pixel alpha is not pre-mutiplied
> + * @VSP1_DU_BLEND_MODE_PIXEL_NONE: Ignores the pixel alpha
> + */
> +enum vsp1_du_blend_mode {
> +	VSP1_DU_BLEND_MODE_PREMULTI,
> +	VSP1_DU_BLEND_MODE_COVERAGE,
> +	VSP1_DU_BLEND_MODE_PIXEL_NONE,
> +};
> +
>  /**
>   * struct vsp1_du_atomic_config - VSP atomic configuration parameters
>   * @pixelformat: plane pixel format (V4L2 4CC)
> @@ -51,6 +63,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>   * @dst: destination rectangle on the display (integer coordinates)
>   * @alpha: alpha value (0: fully transparent, 255: fully opaque)
>   * @zpos: Z position of the plane (from 0 to number of planes minus 1)
> + * @blend_mode: Pixel blend mode of the plane
>   */
>  struct vsp1_du_atomic_config {
>  	u32 pixelformat;
> @@ -60,6 +73,7 @@ struct vsp1_du_atomic_config {
>  	struct v4l2_rect dst;
>  	unsigned int alpha;
>  	unsigned int zpos;
> +	enum vsp1_du_blend_mode blend_mode;
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
