Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B2B672AE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 22:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjARVya (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 16:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjARVya (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 16:54:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349C310DB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 13:54:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1F541056;
        Wed, 18 Jan 2023 22:54:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674078867;
        bh=aIIUHwcD4BLSNMwq2dFNZ7gglRY0j6NCozUCZRgHvsw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ur5fAdJeS0B1xVAUdIwbnhsXsKCmsDhq4Ji9tmbGXq5kuNSD1kumrUMxJaaRDVRJr
         VdUq39E7LuVFNdxAAJsE3MWB+RZr+O7j3LUa7KKSDd4hCqU4kpT66wvWY6Jh2v1hnJ
         y7uCQ/Aqy+4ohtMeTjcVt1QoEpdOJPFixCNJMgus=
Date:   Wed, 18 Jan 2023 23:54:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/6] drm: rcar-du: Stop accessing non-existant registers
 on gen4
Message-ID: <Y8hqka17Sz8lK/Yq@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-7-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-7-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:54PM +0200, Tomi Valkeinen wrote:
> The following registers do not exist on gen4, so we should not write
> them: DEF6Rm, DEF8Rm, ESCRn, OTARn.

I think DEF7Rm should also be skipped. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 8 +++++---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 6 ++++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 8d660a6141bf..56b23333993c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -289,10 +289,12 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		escr = params.escr;
>  	}
>  
> -	dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
> +	if (rcdu->info->gen < 4) {
> +		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
>  
> -	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
> -	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
> +		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
> +		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
> +	}
>  
>  	/* Signal polarities */
>  	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 6da01760ede5..c236e2aa8a01 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -148,7 +148,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  	}
>  	rcar_du_group_write(rgrp, DEFR5, DEFR5_CODE | DEFR5_DEFE5);
>  
> -	rcar_du_group_setup_pins(rgrp);
> +	if (rcdu->info->gen < 4)
> +		rcar_du_group_setup_pins(rgrp);
>  
>  	/*
>  	 * TODO: Handle routing of the DU output to CMM dynamically, as we
> @@ -160,7 +161,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  	rcar_du_group_write(rgrp, DEFR7, defr7);
>  
>  	if (rcdu->info->gen >= 2) {
> -		rcar_du_group_setup_defr8(rgrp);
> +		if (rcdu->info->gen < 4)
> +			rcar_du_group_setup_defr8(rgrp);
>  		rcar_du_group_setup_didsr(rgrp);
>  	}
>  

-- 
Regards,

Laurent Pinchart
