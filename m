Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E8F4ACBD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 23:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbiBGWG3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 17:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiBGWG3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 17:06:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF8BC061355
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 14:06:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76DCF499;
        Mon,  7 Feb 2022 23:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644271583;
        bh=Clwp51CH0IHZXB2aOgZ5eSr/0soriHZwgobPgYX8lig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rnGcND/pzbgGiLbE3sB/uQkTy0TuIi1084zvlw65nldf7vI573qdX1DhgNn0/XAle
         H+PlHy936zr5QefWfubEQX68QwFWUGX5FHRMjllxuvmKewxwX5ADpDSlGEn8Semkc1
         Thzoj9khvMMgMl1pPUDV4Isu4t9T0MDf0sj0JEd8=
Date:   Tue, 8 Feb 2022 00:06:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 16/23] drm/rcar: plane: Remove redundant zpos
 initialisation
Message-ID: <YgGX3TB/8s4+ny7Z@pendragon.ideasonboard.com>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-17-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207163515.1038648-17-maxime@cerno.tech>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Maxime,

Thank you for the patch.

On Mon, Feb 07, 2022 at 05:35:08PM +0100, Maxime Ripard wrote:
> The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 862197be1e01..9dda5e06457d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -696,7 +696,6 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
>  	state->hwindex = -1;
>  	state->source = RCAR_DU_PLANE_MEMORY;
>  	state->colorkey = RCAR_DU_COLORKEY_NONE;
> -	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
>  }
>  
>  static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index b7fc5b069cbc..719c60034952 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -362,7 +362,6 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
>  		return;
>  
>  	__drm_atomic_helper_plane_reset(plane, &state->state);
> -	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
>  }
>  
>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {

-- 
Regards,

Laurent Pinchart
