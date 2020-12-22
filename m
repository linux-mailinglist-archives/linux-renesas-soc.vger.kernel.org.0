Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CE32E0703
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 09:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgLVIBe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 03:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVIBe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 03:01:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D594BC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 00:00:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 126CD9E6;
        Tue, 22 Dec 2020 09:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608624049;
        bh=f4p1sTgTeSn5RUZSdIdiOkY5TNMxG220XY3YDtPDBgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vETe9187zY4wCofRJJjRC6VGyLRwf5h1biR+3ngYzgsXlEsWAUUVwbHVcE3MWzqRU
         ThEZ5X8EnfYpcNLFlfOeBiOpgy/PHmfDrLiODJKFThixIoXGYZlWbNKcmOyYkvyLQk
         y1KZjN8l4QtF7VTwd5rmRgqnd6tUTKYZelekiIcs=
Date:   Tue, 22 Dec 2020 10:00:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm: Extend color correction to support 3D-CLU
Message-ID: <X+GnqZFEXFiBLoGM@pendragon.ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
 <313e23d9-ef9e-794c-0be5-f92ec94c9139@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <313e23d9-ef9e-794c-0be5-f92ec94c9139@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Dec 21, 2020 at 02:09:09PM +0000, Kieran Bingham wrote:
> On 21/12/2020 01:57, Laurent Pinchart wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Extend the existing color management properties to support provision
> > of a 3D cubic look up table, allowing for color specific adjustments.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Again, for the updates since I created the patch:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> A bit of a question on clarifying the added documentation but I don't
> think it's major.
> 
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c       |  1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
> >  drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++
> >  drivers/gpu/drm/drm_color_mgmt.c          | 41 +++++++++++++++++++----
> >  drivers/gpu/drm/drm_mode_config.c         | 14 ++++++++
> >  include/drm/drm_crtc.h                    |  9 +++++
> >  include/drm/drm_mode_config.h             | 11 ++++++
> >  7 files changed, 82 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index ba1507036f26..0f54897d3c8d 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -3558,6 +3558,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> >  	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> >  	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> >  	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> > +	replaced |= drm_property_replace_blob(&crtc_state->cubic_lut, NULL);
> >  	crtc_state->color_mgmt_changed |= replaced;
> >  
> >  	ret = drm_atomic_commit(state);
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index ddcf5c2c8e6a..61c685b50677 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> >  		drm_property_blob_get(state->ctm);
> >  	if (state->gamma_lut)
> >  		drm_property_blob_get(state->gamma_lut);
> > +	if (state->cubic_lut)
> > +		drm_property_blob_get(state->cubic_lut);
> >  	state->mode_changed = false;
> >  	state->active_changed = false;
> >  	state->planes_changed = false;
> > @@ -213,6 +215,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
> >  	drm_property_blob_put(state->degamma_lut);
> >  	drm_property_blob_put(state->ctm);
> >  	drm_property_blob_put(state->gamma_lut);
> > +	drm_property_blob_put(state->cubic_lut);
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
> >  
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 268bb69c2e2f..07229acab71c 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -471,6 +471,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
> >  					&replaced);
> >  		state->color_mgmt_changed |= replaced;
> >  		return ret;
> > +	} else if (property == config->cubic_lut_property) {
> > +		ret = drm_atomic_replace_property_blob_from_id(dev,
> > +					&state->cubic_lut,
> > +					val,
> > +					-1, sizeof(struct drm_color_lut),
> > +					&replaced);
> > +		state->color_mgmt_changed |= replaced;
> > +		return ret;
> >  	} else if (property == config->prop_out_fence_ptr) {
> >  		s32 __user *fence_ptr = u64_to_user_ptr(val);
> >  
> > @@ -516,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
> >  		*val = (state->ctm) ? state->ctm->base.id : 0;
> >  	else if (property == config->gamma_lut_property)
> >  		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> > +	else if (property == config->cubic_lut_property)
> > +		*val = (state->cubic_lut) ? state->cubic_lut->base.id : 0;
> >  	else if (property == config->prop_out_fence_ptr)
> >  		*val = 0;
> >  	else if (property == crtc->scaling_filter_property)
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index 3bcabc2f6e0e..85bbbc8ce8e5 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -33,7 +33,7 @@
> >  /**
> >   * DOC: overview
> >   *
> > - * Color management or color space adjustments is supported through a set of 5
> > + * Color management or color space adjustments is supported through a set of 7
> >   * properties on the &drm_crtc object. They are set up by calling
> >   * drm_crtc_enable_color_mgmt().
> >   *
> > @@ -60,7 +60,7 @@
> >   * “CTM”:
> >   *	Blob property to set the current transformation matrix (CTM) apply to
> >   *	pixel data after the lookup through the degamma LUT and before the
> > - *	lookup through the gamma LUT. The data is interpreted as a struct
> > + *	lookup through the cubic LUT. The data is interpreted as a struct
> >   *	&drm_color_ctm.
> >   *
> >   *	Setting this to NULL (blob property value set to 0) means a
> > @@ -68,13 +68,40 @@
> >   *	boot-up state too. Drivers can access the blob for the color conversion
> >   *	matrix through &drm_crtc_state.ctm.
> >   *
> > + * ”CUBIC_LUT”:
> > + *	Blob property to set the cubic (3D) lookup table performing color
> > + *	mapping after the transformation matrix and before the lookup through
> > + *	the gamma LUT. Unlike the degamma and gamma LUTs that map color
> > + *	components independently, the 3D LUT converts an input color to an
> > + *	output color by indexing into the 3D table using the color components
> > + *	as a 3D coordinate. The LUT is subsampled as 8-bit (or more) precision
> > + *	would require too much storage space in the hardware, so the precision
> 
> This sentence is a bit confusing. What bit depth is actually used, is it
> mandated to a specific subsampling? Or restricted to 8-bit....

We're both confused then, because I don't think I understand the
question :-)

> > + *	of the color components is reduced before the look up, and the low
> > + *	order bits may be used to interpolate between the nearest points in 3D
> > + *	space.
> > + *
> > + *	The data is interpreted as an array of &struct drm_color_lut elements.
> > + *	Hardware might choose not to use the full precision of the LUT
> > + *	elements.
> 
> Is the table already reduced precision though ?

drm_color_lut has 16-bit precision. The precision of the table on the
hardware side varies.

> > + *
> > + *	Setting this to NULL (blob property value set to 0) means the output
> > + *	color is identical to the input color. This is generally the driver
> > + *	boot-up state too. Drivers can access this blob through
> > + *	&drm_crtc_state.cubic_lut.
> > + *
> > + * ”CUBIC_LUT_SIZE”:
> > + *	Unsigned range property to give the size of the lookup table to be set
> > + *	on the CUBIC_LUT property (the size depends on the underlying hardware).
> > + *	If drivers support multiple LUT sizes then they should publish the
> > + *	largest size, and sub-sample smaller sized LUTs appropriately.
> > + *
> >   * “GAMMA_LUT”:
> >   *	Blob property to set the gamma lookup table (LUT) mapping pixel data
> > - *	after the transformation matrix to data sent to the connector. The
> > - *	data is interpreted as an array of &struct drm_color_lut elements.
> > - *	Hardware might choose not to use the full precision of the LUT elements
> > - *	nor use all the elements of the LUT (for example the hardware might
> > - *	choose to interpolate between LUT[0] and LUT[4]).
> > + *	after the cubic LUT to data sent to the connector. The data is
> > + *	interpreted as an array of &struct drm_color_lut elements. Hardware
> > + *	might choose not to use the full precision of the LUT elements nor use
> > + *	all the elements of the LUT (for example the hardware might choose to
> > + *	interpolate between LUT[0] and LUT[4]).
> >   *
> >   *	Setting this to NULL (blob property value set to 0) means a
> >   *	linear/pass-thru gamma table should be used. This is generally the
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index f1affc1bb679..6c3324f60e7d 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> >  		return -ENOMEM;
> >  	dev->mode_config.gamma_lut_size_property = prop;
> >  
> > +	prop = drm_property_create(dev,
> > +			DRM_MODE_PROP_BLOB,
> > +			"CUBIC_LUT", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.cubic_lut_property = prop;
> > +
> > +	prop = drm_property_create_range(dev,
> > +			DRM_MODE_PROP_IMMUTABLE,
> > +			"CUBIC_LUT_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.cubic_lut_size_property = prop;
> > +
> >  	prop = drm_property_create(dev,
> >  				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> >  				   "IN_FORMATS", 0);
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 5f43d64d2a07..df5cc2239adb 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -288,6 +288,15 @@ struct drm_crtc_state {
> >  	 */
> >  	struct drm_property_blob *gamma_lut;
> >  
> > +	/**
> > +	 * @cubic_lut:
> > +	 *
> > +	 * Cubic Lookup table for converting pixel data. See
> > +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is a 3D array
> > +	 * of &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *cubic_lut;
> > +
> >  	/**
> >  	 * @target_vblank:
> >  	 *
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > index ab424ddd7665..8edb0094e5a7 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -800,6 +800,17 @@ struct drm_mode_config {
> >  	 */
> >  	struct drm_property *gamma_lut_size_property;
> >  
> > +	/**
> > +	 * @cubic_lut_property: Optional CRTC property to set the 3D LUT used to
> > +	 * convert color spaces.
> > +	 */
> > +	struct drm_property *cubic_lut_property;
> > +	/**
> > +	 * @cubic_lut_size_property: Optional CRTC property for the size of the
> > +	 * 3D LUT as supported by the driver (read-only).
> > +	 */
> > +	struct drm_property *cubic_lut_size_property;
> > +
> >  	/**
> >  	 * @suggested_x_property: Optional connector property with a hint for
> >  	 * the position of the output on the host's screen.

-- 
Regards,

Laurent Pinchart
