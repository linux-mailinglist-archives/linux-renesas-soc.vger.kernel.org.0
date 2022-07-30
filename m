Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D23585C88
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 00:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbiG3WiL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Jul 2022 18:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiG3WiK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Jul 2022 18:38:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B5713DD9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Jul 2022 15:38:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67BEE415;
        Sun, 31 Jul 2022 00:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659220688;
        bh=pfiUyJvM9XSoSgviKhMbHdJty7bENCmRlGyTUmdd2PQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3asPXcU4eGXDifoM3JxNYOjN3OP1r3FMkR/N1zCFqpLXjOkvhcBwrVe3PckhL1LW
         pVRzrvCRsz6MlEaLfUNPmz0/Rf4WUggtBWwqCAcPFfBp15OSp7f3gZnByO0F2NIVlv
         YSzOVTF2zlQxvPuQfCTiFNEPk+fOjq9d5giCApA4=
Date:   Sun, 31 Jul 2022 01:38:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 3/3] drm: rcar-du: Add DRM blend mode support
Message-ID: <YuWyzTixSHGDTcjb@pendragon.ideasonboard.com>
References: <20220704025231.3911138-1-taki@igel.co.jp>
 <20220704025231.3911138-4-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704025231.3911138-4-taki@igel.co.jp>
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

On Mon, Jul 04, 2022 at 11:52:31AM +0900, Takanari Hayama wrote:
> R-Car DU supports different blend modes via VSP1. Add DRM blend mode
> supports to make it configurable.
> 
> As drm_plane_create_blend_mode_property() creates the blend mode
> property with the default value of DRM_MODE_BLEND_PREMULTI, it changes
> the default blending behavior on R-Car DU. The rcar-du's blend mode was
> same as DRM_MODE_BLEND_COVERAGE, i.e., pixel color values have not been
> pre-multitplied.

If that's what KMS userspace requires I'm fine with it.

> Signed-off-by: Takanari Hayama <taki@igel.co.jp>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but I expect this patch to change based on my suggestions for 2/3.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 8eb9b2b097ae..283327046aa5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -170,6 +170,18 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  	format = rcar_du_format_info(state->format->fourcc);
>  	cfg.pixelformat = format->v4l2;
>  
> +	switch (state->state.pixel_blend_mode) {
> +	case DRM_MODE_BLEND_PREMULTI:
> +		cfg.blend_mode = VSP1_DU_BLEND_MODE_PREMULTI;
> +		break;
> +	case DRM_MODE_BLEND_COVERAGE:
> +		cfg.blend_mode = VSP1_DU_BLEND_MODE_COVERAGE;
> +		break;
> +	case DRM_MODE_BLEND_PIXEL_NONE:
> +		cfg.blend_mode = VSP1_DU_BLEND_MODE_PIXEL_NONE;
> +		break;
> +	}
> +
>  	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
>  			      plane->index, &cfg);
>  }
> @@ -444,6 +456,11 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  						       num_planes - 1);
>  		}
>  
> +		drm_plane_create_blend_mode_property(&plane->plane,
> +					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					BIT(DRM_MODE_BLEND_PREMULTI) |
> +					BIT(DRM_MODE_BLEND_COVERAGE));
> +
>  		vsp->num_planes++;
>  	}
>  

-- 
Regards,

Laurent Pinchart
