Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E2759924A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 03:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241680AbiHSBKz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 21:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241054AbiHSBKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 21:10:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FB9DDB48
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2022 18:10:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAA458B;
        Fri, 19 Aug 2022 03:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660871449;
        bh=0b2kyE/fRaVXgmWF2t+Uk3td2ZJKodCbQx/4J53psFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BJBrSw5vMvKUGZ2YYpW9dsiiSsw0//sY2D4Ibzx7AYKbfIRUN2JEVTNdrdK2n7vWj
         PdCvrVigDRNB9U47Udl7Xeq2QDnynHoXwkGxWDzpSUzxfYtritht3eSfTKRzW2so7W
         o830LwALj0+ugeP2glldSqLCdGOnp/0IXE020iao=
Date:   Fri, 19 Aug 2022 04:10:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: Fix r8a779a0 color issue.
Message-ID: <Yv7jFSD5p7cY3zL1@pendragon.ideasonboard.com>
References: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
 <20220817132803.85373-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817132803.85373-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Aug 17, 2022 at 04:28:02PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The rcar DU driver on r8a779a0 has a bug causing some specific colors
> getting converted to transparent colors, which then (usually) show as
> black pixels on the screen.
> 
> The reason seems to be that the driver sets PnMR_SPIM_ALP bit in
> PnMR.SPIM field, which is an illegal setting on r8a779a0. The
> PnMR_SPIM_EOR bit also illegal.
> 
> Add a new feature flag for this (lack of a) feature and make sure the
> bits are zero on r8a779a0.

Good catch !

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   |  3 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 16 +++++++++++++---
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 541c202c993a..a2776f1d6f2c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -506,7 +506,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ
> -		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_NO_BLENDING,
>  	.channels_mask = BIT(1) | BIT(0),
>  	.routes = {
>  		/* R8A779A0 has two MIPI DSI outputs. */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index bfad7775d9a1..712389c7b3d0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -31,6 +31,7 @@ struct rcar_du_device;
>  #define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(2)	/* Has inputs from VSP1 */
>  #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
>  #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
> +#define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 9e1f0cbbf642..2103816807cc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -506,8 +506,19 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  					    unsigned int index,
>  					    const struct rcar_du_plane_state *state)
>  {
> -	rcar_du_plane_write(rgrp, index, PnMR,
> -			    PnMR_SPIM_TP_OFF | state->format->pnmr);
> +	struct rcar_du_device *rcdu = rgrp->dev;
> +	u32 pnmr;
> +
> +	pnmr = state->format->pnmr;
> +
> +	if (rcdu->info->features & RCAR_DU_FEATURE_NO_BLENDING) {
> +		/* No blending. ALP and EOR are not supported */
> +		pnmr &= ~(PnMR_SPIM_ALP | PnMR_SPIM_EOR);
> +	}
> +
> +	pnmr |= PnMR_SPIM_TP_OFF;

I'd combine this with the initial pnmr assignment. I can handle this
when applying, no need to resubmit.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	rcar_du_plane_write(rgrp, index, PnMR, pnmr);
>  
>  	rcar_du_plane_write(rgrp, index, PnDDCR4,
>  			    state->format->edf | PnDDCR4_CODE);
> @@ -521,7 +532,6 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  	 * register to 0 to avoid this.
>  	 */
>  
> -	/* TODO: Check if alpha-blending should be disabled in PnMR. */
>  	rcar_du_plane_write(rgrp, index, PnALPHAR, 0);
>  }

-- 
Regards,

Laurent Pinchart
