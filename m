Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBFF242CF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 18:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgHLQN3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 12:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgHLQN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 12:13:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519C0C061383;
        Wed, 12 Aug 2020 09:13:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 921E99E7;
        Wed, 12 Aug 2020 18:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597248804;
        bh=paGdrqoDcCHXfS3iQFE0pq46zYjXCMhjb+Pvocaz4b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kt13Y3o2D7/GhQ6D08ue5MU0mouuTvGpTTVhj8joYxKTywftFebRHAb0CCf8GAGhh
         YuaEdQDII7JpKms3nDMbBlg7hJZ5UWrFF6UDRlxVEQMCbQyn259m1PDCzPr3dHet/H
         is16VljXQqkqf4CPG05UAQpCX0iOoC9shsmSv3+Y=
Date:   Wed, 12 Aug 2020 19:13:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH 2/9] drm: rcar-du: Add support for R8A774E1 SoC
Message-ID: <20200812161310.GL6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Wed, Aug 12, 2020 at 03:02:10PM +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Hookup RZ/G2H (R8A774E1) to DU driver. R8A774E1 has one RGB output,
> one LVDS output and one HDMI output.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 30 +++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e67cf70f040..398c180b8731 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -186,6 +186,35 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_INTERLACED
> +		  | RCAR_DU_FEATURE_TVM_SYNC,
> +	.channels_mask = BIT(3) | BIT(1) | BIT(0),
> +	.routes = {
> +		/*
> +		 * R8A774E1 has one RGB output, one LVDS output and one HDMI
> +		 * output.
> +		 */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(2),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_HDMI0] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 1,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 2,
> +		},
> +	},
> +	.num_lvds = 1,
> +	.dpll_mask =  BIT(1),
> +};
> +
>  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>  	.gen = 1,
>  	.features = RCAR_DU_FEATURE_INTERLACED
> @@ -450,6 +479,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a774a1", .data = &rcar_du_r8a774a1_info },
>  	{ .compatible = "renesas,du-r8a774b1", .data = &rcar_du_r8a774b1_info },
>  	{ .compatible = "renesas,du-r8a774c0", .data = &rcar_du_r8a774c0_info },
> +	{ .compatible = "renesas,du-r8a774e1", .data = &rcar_du_r8a774e1_info },
>  	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
>  	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },

-- 
Regards,

Laurent Pinchart
