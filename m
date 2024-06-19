Return-Path: <linux-renesas-soc+bounces-6517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F51190F729
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 21:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06D311C2136C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 19:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7524B1D52B;
	Wed, 19 Jun 2024 19:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HHBhXbhp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE7524B4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826280; cv=none; b=XhZfycfeLeumCFUoGCRDMsIGuwM+tUjVKe9BeaSKbnvUKL16cN69pCURSGfe+cHSl2m/f7PCedEdmvlTXFnb3f+qmPrIk8xzmWM1BQWsmvOZw4Mwlfp9dHb7HaSqXlP83A4GcXiNlLQBCjk6xoOa1TiDNRxihep5bPIqHMq9Nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826280; c=relaxed/simple;
	bh=c+FuJ7wwR6oCAHXFNOnEXscsUct8Q1I5yk9CTggvPek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTS0fBD6gV2go560t+fGrs0T1nXcVhtwM0mSoCC2cSrcDRB8liuq+3PARNTz2xSJFi+WamKjGKzKzfgewOMGX9iBf0xrizhlUsSjwWVqQ/CA7lFPwWVh9M41or6ioRkiTKUF3RXcuv1ovdCK3UPA6GLQeL2svgjO3vvsT0QnRzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HHBhXbhp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4980718D;
	Wed, 19 Jun 2024 21:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718826258;
	bh=c+FuJ7wwR6oCAHXFNOnEXscsUct8Q1I5yk9CTggvPek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHBhXbhpzJDNW36dhIT2KPu4PgurwTzhfznXxpVYGvotlcGQMKR/u2p0kP+NQsBNo
	 yQT/nZIsqiZCBu/vNpib8tsARCiYZz+FplAqDzBqAmw85+mgMcoHlKOy/5pO7GHicK
	 nEIC7vj84GiEvAZVNHIsdP2FcJBdqAPSsv2h2P64=
Date: Wed, 19 Jun 2024 22:44:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
Message-ID: <20240619194414.GD31507@pendragon.ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240619102219.138927-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Jun 19, 2024 at 12:22:18PM +0200, Jacopo Mondi wrote:
> Add support for R-Car R8A779H0 V4M which has similar characteristics
> as the already supported R-Car V4H R8A779G0, but with a single output
> channel.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> ---
> BSP patch
> https://github.com/renesas-rcar/linux-bsp/commit/f2fc3314dab2052240653c1a31ba3d7c7190038e
> ---
> ---
>  .../bindings/display/renesas,du.yaml           |  1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c  | 18 ++++++++++++++++++
>  .../gpu/drm/renesas/rcar-du/rcar_du_group.c    | 17 ++++++++++++-----
>  3 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..d369953f16f7 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -41,6 +41,7 @@ properties:
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> +      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
>  
>    reg:
>      maxItems: 1

This should be split to a separate patch.

You need to add a conditional validation rule below to address the
clocks, interrupts, ports, ...

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index dee530e4c8b2..a1d174b0b00b 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -545,6 +545,23 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
> +	.gen = 4,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_NO_BLENDING,
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		/* R8A779H0 has a single MIPI DSI output. */
> +		[RCAR_DU_OUTPUT_DSI0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +	},
> +	.num_rpf = 5,
> +	.dsi_clk_mask = BIT(0),
> +};

This looks good.

> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> @@ -571,6 +588,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>  	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>  	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..361e1d01b817 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -111,6 +111,8 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  		/*
>  		 * On Gen3 dot clocks are setup through per-group registers,
>  		 * only available when the group has two channels.
> +		 *
> +		 * R-Car V4M (R8A779H0) has only one channel, index is == 0.

Is it relevant here ?

>  		 */
>  		rcrtc = &rcdu->crtcs[rgrp->index * 2];
>  		num_crtcs = rgrp->num_crtcs;
> @@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>  	rcar_du_group_write(rgrp, DORCR, dorcr);
>  
> -	/* Apply planes to CRTCs association. */
> -	mutex_lock(&rgrp->lock);
> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -			    rgrp->dptsr_planes);
> -	mutex_unlock(&rgrp->lock);
> +	/*
> +	 * Apply planes to CRTCs association, skip for V4M which has a single
> +	 * channel.

" and doesn't implement the DPTSR register."

I'm pretty sure writing it is still harmless, but...

> +	 */
> +	if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {
> +		mutex_lock(&rgrp->lock);
> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> +				    rgrp->dptsr_planes);
> +		mutex_unlock(&rgrp->lock);
> +	}
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

