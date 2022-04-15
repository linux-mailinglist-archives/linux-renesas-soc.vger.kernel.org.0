Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD82502D41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 17:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbiDOPsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 11:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355678AbiDOPri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 11:47:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29533982E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Apr 2022 08:45:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-64-137-nat.elisa-mobile.fi [85.76.64.137])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D0FC5D;
        Fri, 15 Apr 2022 17:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650037507;
        bh=K9/7+Vgse6vfIFDE0jrNo45Gq9WbH8BvS7rnqTERmmo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XEnnDz5YvwalX8Ky3xCWh3Ure4d4Hp2j9b2tiJeVOBTBbZaUkPOGIid3HpyZc+PoN
         4yeDRnrepWC/NYbefS88YWunhnU0B9y7lTZl5xM9CqGITERhz9nbAc3g91AhGQQlVf
         Qn8W0Oyo3mlfj2gW03ySKFmHF8RCoxEU44VfBu1w=
Date:   Fri, 15 Apr 2022 18:45:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 5/7] drm: rcar-du: Factorise
 rcar_du_{atomic_check,modeset_init}
Message-ID: <YlmTAMAbbik20EKv@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-6-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Mar 16, 2022 at 01:10:58PM +0000, Biju Das wrote:
> RZ/G2L SoC's does not have group/plane registers compared to RCar, hence it
> needs a different CRTC implementation. Factorise rcar_du_{atomic_check,
> modeset_init} by adding struct rcar_du_crtc_helper_funcs to struct
> rcar_du_device_info, so that it can support RZ/G2L SoC without any code
> changes.

I'd like to go the other way around. Instead of adding a layer of
indirection in the DU driver, could you create a new DRM driver, and
share common code with the DU driver ?

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Changed crtc_helper_funcs->rcar_crtc_helper_funcs
> RFC->v1:
>  * New patch
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h | 16 ++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c |  6 +++---
>  3 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index f6e234dafb72..0df1430b9664 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -34,6 +34,12 @@
>   * Device Information
>   */
>  
> +static struct rcar_du_crtc_helper_funcs rcar_crtc_helper_funcs = {
> +	.du_planes_init = rcar_du_planes_init,
> +	.du_crtc_create = rcar_du_crtc_create,
> +	.du_atomic_check_planes = rcar_du_atomic_check_planes,
> +};
> +
>  static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ
> @@ -58,6 +64,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
> @@ -83,6 +90,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
> @@ -113,6 +121,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
> @@ -146,6 +155,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
> @@ -179,6 +189,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
> @@ -209,6 +220,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
> @@ -242,6 +254,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
> @@ -265,6 +278,7 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>  	},
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7790_info = {
> @@ -298,6 +312,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
> @@ -326,6 +341,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7792_info = {
> @@ -349,6 +365,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7794_info = {
> @@ -375,6 +392,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
>  	.num_rpf = 4,
>  	.max_width = 4095,
>  	.max_height = 2047,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7795_info = {
> @@ -412,6 +430,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dpll_mask =  BIT(2) | BIT(1),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7796_info = {
> @@ -445,6 +464,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a77965_info = {
> @@ -478,6 +498,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a77970_info = {
> @@ -506,6 +527,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  	.num_rpf = 5,
>  	.max_width = 8190,
>  	.max_height = 8190,
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> @@ -537,6 +559,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
> @@ -559,6 +582,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>  	.max_width = 8190,
>  	.max_height = 8190,
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
> +	.fns = &rcar_crtc_helper_funcs,
>  };
>  
>  static const struct of_device_id rcar_du_of_table[] = {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index b0553b43363b..164cd9854aaf 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -61,6 +61,20 @@ struct rcar_du_output_routing {
>  	unsigned int port;
>  };
>  
> +/*
> + * struct rcar_du_crtc_helper_funcs - CRTC helper functions
> + * @du_planes_init: pointer to du_plane_init function
> + * @du_crtc_create: pointer to du_crtc_create function
> + * @du_atomic_check_planes: pointer to du_atomic_check_planes function
> + */
> +struct rcar_du_crtc_helper_funcs {
> +	int (*du_planes_init)(struct rcar_du_group *rgrp);
> +	int (*du_crtc_create)(struct rcar_du_group *rgrp, unsigned int swindex,
> +			      unsigned int hwindex);
> +	int (*du_atomic_check_planes)(struct drm_device *dev,
> +				      struct drm_atomic_state *state);
> +};
> +
>  /*
>   * struct rcar_du_device_info - DU model-specific information
>   * @gen: device generation (2 or 3)
> @@ -75,6 +89,7 @@ struct rcar_du_output_routing {
>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
>   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
> + * @fns: SoC specific CRTC helper functions
>   */
>  struct rcar_du_device_info {
>  	unsigned int gen;
> @@ -89,6 +104,7 @@ struct rcar_du_device_info {
>  	unsigned int dpll_mask;
>  	unsigned int dsi_clk_mask;
>  	unsigned int lvds_clk_mask;
> +	struct rcar_du_crtc_helper_funcs *fns;
>  };
>  
>  #define RCAR_DU_MAX_CRTCS		4
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 5857705aac20..a74417510894 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -478,7 +478,7 @@ static int rcar_du_atomic_check(struct drm_device *dev,
>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		return 0;
>  
> -	return rcar_du_atomic_check_planes(dev, state);
> +	return rcdu->info->fns->du_atomic_check_planes(dev, state);
>  }
>  
>  static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> @@ -882,7 +882,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  				   : 0;
>  
>  		if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
> -			ret = rcar_du_planes_init(rgrp);
> +			ret = rcdu->info->fns->du_planes_init(rgrp);
>  			if (ret < 0)
>  				return ret;
>  		}
> @@ -910,7 +910,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  		rgrp = &rcdu->groups[hwindex / 2];
>  
> -		ret = rcar_du_crtc_create(rgrp, swindex++, hwindex);
> +		ret = rcdu->info->fns->du_crtc_create(rgrp, swindex++, hwindex);
>  		if (ret < 0)
>  			return ret;
>  	}

-- 
Regards,

Laurent Pinchart
