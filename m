Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C58A31A8FA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 20:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfEKSKq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 14:10:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56824 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfEKSKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:10:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D08DD5;
        Sat, 11 May 2019 20:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557598243;
        bh=tXXsMV8MngFD+RJ6/ms5P8JhrsgEl9NfaJiIFm15bNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=leS0t5LR4NFKUPSJ3CJ/GQxdUiFRxSJWwajrGk3DLth+gSbLUhAOPD4PcG8nD6HWS
         EPHoyiMnOulErCx0kzyQ0QmlHsK9NFhW9q9Nbvk7V6RcqaDxXXREkdQ3TX30kxF8yD
         TpS4o+xG+MFQEORRFzIsWGi8k+zjqQnl+lvaj03Q=
Date:   Sat, 11 May 2019 21:10:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Esaki Tomohito <etom@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
Message-ID: <20190511181027.GC13043@pendragon.ideasonboard.com>
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Esaki-san,

On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
> Hi Laurent-san
> 
> > What's the purpose of this, as it adds no new functionality to the
> > driver ? Why is this change needed ?
> 
> Weston compositor (v5.0.0 or later) uses the DRM API to get the
> supported modifiers and determines if the sprite plane can be used by
> comparing the modifiers with the client specified modifier.
> In currently driver, since the weston doesn't know supported modifiers,
> that cannot determine if the received dmabuf can be passed through to
> sprite plane.
> Since there are R-Car GPU which support linear modifier, the sprite
> plane cannot be used in a compositor similar to the weston if client
> specify linear modifier.

I don't think the right solution is to expose the linear modifier from
all drivers that don't otherwise support modifiers. We should instead
fix it either in Weston, and treat drivers that don't support the
modifiers API as supporting the linear modifier only, or in the DRM/KMS
core by reporting the linear modifier for drivers that don't explicitly
support modifiers.

> On 2019/05/09 16:14, Laurent Pinchart wrote:
> > On Thu, May 09, 2019 at 02:45:18PM +0900, Tomohito Esaki wrote:
> >> Add support for the linear modifier. Since the rcar-du device supports
> >> only linear modifier, this driver doesn't support other modifiers.
> > 
> > What's the purpose of this, as it adds no new functionality to the
> > driver ? Why is this change needed ?
> > 
> >> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 11 +++++++++++
> >>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 15 ++++++++++++++-
> >>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 15 ++++++++++++++-
> >>  3 files changed, 39 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> index 3b7d50a8fb9b..9c5e15a5ab1c 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> @@ -214,6 +214,16 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >>  		return ERR_PTR(-EINVAL);
> >>  	}
> >>  
> >> +	/*
> >> +	 * Support only LINEAR modifier.
> >> +	 */
> >> +	if ((mode_cmd->flags & DRM_MODE_FB_MODIFIERS) &&
> >> +	    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR) {
> >> +		dev_dbg(dev->dev, "unsupported fb modifier 0x%llx\n",
> >> +			mode_cmd->modifier[0]);
> >> +		return ERR_PTR(-EINVAL);
> >> +	}
> >> +
> >>  	if (rcdu->info->gen < 3) {
> >>  		/*
> >>  		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
> >> @@ -529,6 +539,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> >>  	dev->mode_config.min_width = 0;
> >>  	dev->mode_config.min_height = 0;
> >>  	dev->mode_config.normalize_zpos = true;
> >> +	dev->mode_config.allow_fb_modifiers = true;
> >>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
> >>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
> >>  
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> >> index c6430027169f..32135ad387fa 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> >> @@ -726,6 +726,13 @@ static int rcar_du_plane_atomic_get_property(struct drm_plane *plane,
> >>  	return 0;
> >>  }
> >>  
> >> +static bool rcar_du_plane_format_mod_supported(struct drm_plane *plane,
> >> +					       uint32_t format,
> >> +					       uint64_t modifier)
> >> +{
> >> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> >> +}
> >> +
> >>  static const struct drm_plane_funcs rcar_du_plane_funcs = {
> >>  	.update_plane = drm_atomic_helper_update_plane,
> >>  	.disable_plane = drm_atomic_helper_disable_plane,
> >> @@ -735,6 +742,7 @@ static const struct drm_plane_funcs rcar_du_plane_funcs = {
> >>  	.atomic_destroy_state = rcar_du_plane_atomic_destroy_state,
> >>  	.atomic_set_property = rcar_du_plane_atomic_set_property,
> >>  	.atomic_get_property = rcar_du_plane_atomic_get_property,
> >> +	.format_mod_supported = rcar_du_plane_format_mod_supported,
> >>  };
> >>  
> >>  static const uint32_t formats[] = {
> >> @@ -750,6 +758,11 @@ static const uint32_t formats[] = {
> >>  	DRM_FORMAT_NV16,
> >>  };
> >>  
> >> +static const uint64_t modifiers[] = {
> >> +	DRM_FORMAT_MOD_LINEAR,
> >> +	DRM_FORMAT_MOD_INVALID,
> >> +};
> >> +
> >>  int rcar_du_planes_init(struct rcar_du_group *rgrp)
> >>  {
> >>  	struct rcar_du_device *rcdu = rgrp->dev;
> >> @@ -776,7 +789,7 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
> >>  		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
> >>  					       &rcar_du_plane_funcs, formats,
> >>  					       ARRAY_SIZE(formats),
> >> -					       NULL, type, NULL);
> >> +					       modifiers, type, NULL);
> >>  		if (ret < 0)
> >>  			return ret;
> >>  
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >> index 0878accbd134..9d1382b02717 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >> @@ -139,6 +139,11 @@ static const u32 formats_kms[] = {
> >>  	DRM_FORMAT_YVU444,
> >>  };
> >>  
> >> +static const uint64_t modifiers_kms[] = {
> >> +	DRM_FORMAT_MOD_LINEAR,
> >> +	DRM_FORMAT_MOD_INVALID,
> >> +};
> >> +
> >>  static const u32 formats_v4l2[] = {
> >>  	V4L2_PIX_FMT_RGB332,
> >>  	V4L2_PIX_FMT_ARGB444,
> >> @@ -344,6 +349,13 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
> >>  	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
> >>  }
> >>  
> >> +static bool rcar_du_vsp_plane_format_mod_supported(struct drm_plane *plane,
> >> +						   uint32_t format,
> >> +						   uint64_t modifier)
> >> +{
> >> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> >> +}
> >> +
> >>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
> >>  	.update_plane = drm_atomic_helper_update_plane,
> >>  	.disable_plane = drm_atomic_helper_disable_plane,
> >> @@ -351,6 +363,7 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
> >>  	.destroy = drm_plane_cleanup,
> >>  	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
> >>  	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
> >> +	.format_mod_supported = rcar_du_vsp_plane_format_mod_supported,
> >>  };
> >>  
> >>  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >> @@ -397,7 +410,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >>  					       &rcar_du_vsp_plane_funcs,
> >>  					       formats_kms,
> >>  					       ARRAY_SIZE(formats_kms),
> >> -					       NULL, type, NULL);
> >> +					       modifiers_kms, type, NULL);
> >>  		if (ret < 0)
> >>  			return ret;
> >>  

-- 
Regards,

Laurent Pinchart
