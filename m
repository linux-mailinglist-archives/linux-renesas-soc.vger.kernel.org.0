Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3372DFC8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 15:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgLUOJz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 09:09:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34408 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgLUOJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 09:09:55 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D86C2CF;
        Mon, 21 Dec 2020 15:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608559751;
        bh=dRGGYd+Su6x8xzVPIqGszvqYo58+IQyTrhgm2CJ0HX4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iCo9LjIvQhEDv1gY4yMOgwOlbH+PlIQSDK/91f4fP2JWQlKYRBLvQ2Lx9UM5DOv54
         5RcYRiSanpzPiAr1U1z9hbQqv4Khz0/nZxws4yl1X/iNBNh2w14FTEJbuOC+7l/WZO
         HJp5ph+gcjQMuxlyRTSgdpwKlfA2J0PDTxx74Rqg=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/4] drm: Extend color correction to support 3D-CLU
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <313e23d9-ef9e-794c-0be5-f92ec94c9139@ideasonboard.com>
Date:   Mon, 21 Dec 2020 14:09:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 21/12/2020 01:57, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Extend the existing color management properties to support provision
> of a 3D cubic look up table, allowing for color specific adjustments.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Again, for the updates since I created the patch:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

A bit of a question on clarifying the added documentation but I don't
think it's major.

> ---
>  drivers/gpu/drm/drm_atomic_helper.c       |  1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++
>  drivers/gpu/drm/drm_color_mgmt.c          | 41 +++++++++++++++++++----
>  drivers/gpu/drm/drm_mode_config.c         | 14 ++++++++
>  include/drm/drm_crtc.h                    |  9 +++++
>  include/drm/drm_mode_config.h             | 11 ++++++
>  7 files changed, 82 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ba1507036f26..0f54897d3c8d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3558,6 +3558,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
>  	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
>  	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> +	replaced |= drm_property_replace_blob(&crtc_state->cubic_lut, NULL);
>  	crtc_state->color_mgmt_changed |= replaced;
>  
>  	ret = drm_atomic_commit(state);
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index ddcf5c2c8e6a..61c685b50677 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
>  		drm_property_blob_get(state->ctm);
>  	if (state->gamma_lut)
>  		drm_property_blob_get(state->gamma_lut);
> +	if (state->cubic_lut)
> +		drm_property_blob_get(state->cubic_lut);
>  	state->mode_changed = false;
>  	state->active_changed = false;
>  	state->planes_changed = false;
> @@ -213,6 +215,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
>  	drm_property_blob_put(state->degamma_lut);
>  	drm_property_blob_put(state->ctm);
>  	drm_property_blob_put(state->gamma_lut);
> +	drm_property_blob_put(state->cubic_lut);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 268bb69c2e2f..07229acab71c 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -471,6 +471,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  					&replaced);
>  		state->color_mgmt_changed |= replaced;
>  		return ret;
> +	} else if (property == config->cubic_lut_property) {
> +		ret = drm_atomic_replace_property_blob_from_id(dev,
> +					&state->cubic_lut,
> +					val,
> +					-1, sizeof(struct drm_color_lut),
> +					&replaced);
> +		state->color_mgmt_changed |= replaced;
> +		return ret;
>  	} else if (property == config->prop_out_fence_ptr) {
>  		s32 __user *fence_ptr = u64_to_user_ptr(val);
>  
> @@ -516,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val = (state->ctm) ? state->ctm->base.id : 0;
>  	else if (property == config->gamma_lut_property)
>  		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> +	else if (property == config->cubic_lut_property)
> +		*val = (state->cubic_lut) ? state->cubic_lut->base.id : 0;
>  	else if (property == config->prop_out_fence_ptr)
>  		*val = 0;
>  	else if (property == crtc->scaling_filter_property)
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 3bcabc2f6e0e..85bbbc8ce8e5 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -33,7 +33,7 @@
>  /**
>   * DOC: overview
>   *
> - * Color management or color space adjustments is supported through a set of 5
> + * Color management or color space adjustments is supported through a set of 7
>   * properties on the &drm_crtc object. They are set up by calling
>   * drm_crtc_enable_color_mgmt().
>   *
> @@ -60,7 +60,7 @@
>   * “CTM”:
>   *	Blob property to set the current transformation matrix (CTM) apply to
>   *	pixel data after the lookup through the degamma LUT and before the
> - *	lookup through the gamma LUT. The data is interpreted as a struct
> + *	lookup through the cubic LUT. The data is interpreted as a struct
>   *	&drm_color_ctm.
>   *
>   *	Setting this to NULL (blob property value set to 0) means a
> @@ -68,13 +68,40 @@
>   *	boot-up state too. Drivers can access the blob for the color conversion
>   *	matrix through &drm_crtc_state.ctm.
>   *
> + * ”CUBIC_LUT”:
> + *	Blob property to set the cubic (3D) lookup table performing color
> + *	mapping after the transformation matrix and before the lookup through
> + *	the gamma LUT. Unlike the degamma and gamma LUTs that map color
> + *	components independently, the 3D LUT converts an input color to an
> + *	output color by indexing into the 3D table using the color components
> + *	as a 3D coordinate. The LUT is subsampled as 8-bit (or more) precision
> + *	would require too much storage space in the hardware, so the precision

This sentence is a bit confusing. What bit depth is actually used, is it
mandated to a specific subsampling? Or restricted to 8-bit....


> + *	of the color components is reduced before the look up, and the low
> + *	order bits may be used to interpolate between the nearest points in 3D
> + *	space.
> + *
> + *	The data is interpreted as an array of &struct drm_color_lut elements.
> + *	Hardware might choose not to use the full precision of the LUT
> + *	elements.

Is the table already reduced precision though ?


> + *
> + *	Setting this to NULL (blob property value set to 0) means the output
> + *	color is identical to the input color. This is generally the driver
> + *	boot-up state too. Drivers can access this blob through
> + *	&drm_crtc_state.cubic_lut.
> + *
> + * ”CUBIC_LUT_SIZE”:
> + *	Unsigned range property to give the size of the lookup table to be set
> + *	on the CUBIC_LUT property (the size depends on the underlying hardware).
> + *	If drivers support multiple LUT sizes then they should publish the
> + *	largest size, and sub-sample smaller sized LUTs appropriately.
> + *
>   * “GAMMA_LUT”:
>   *	Blob property to set the gamma lookup table (LUT) mapping pixel data
> - *	after the transformation matrix to data sent to the connector. The
> - *	data is interpreted as an array of &struct drm_color_lut elements.
> - *	Hardware might choose not to use the full precision of the LUT elements
> - *	nor use all the elements of the LUT (for example the hardware might
> - *	choose to interpolate between LUT[0] and LUT[4]).
> + *	after the cubic LUT to data sent to the connector. The data is
> + *	interpreted as an array of &struct drm_color_lut elements. Hardware
> + *	might choose not to use the full precision of the LUT elements nor use
> + *	all the elements of the LUT (for example the hardware might choose to
> + *	interpolate between LUT[0] and LUT[4]).
>   *
>   *	Setting this to NULL (blob property value set to 0) means a
>   *	linear/pass-thru gamma table should be used. This is generally the
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index f1affc1bb679..6c3324f60e7d 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.gamma_lut_size_property = prop;
>  
> +	prop = drm_property_create(dev,
> +			DRM_MODE_PROP_BLOB,
> +			"CUBIC_LUT", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.cubic_lut_property = prop;
> +
> +	prop = drm_property_create_range(dev,
> +			DRM_MODE_PROP_IMMUTABLE,
> +			"CUBIC_LUT_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.cubic_lut_size_property = prop;
> +
>  	prop = drm_property_create(dev,
>  				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
>  				   "IN_FORMATS", 0);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 5f43d64d2a07..df5cc2239adb 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -288,6 +288,15 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *gamma_lut;
>  
> +	/**
> +	 * @cubic_lut:
> +	 *
> +	 * Cubic Lookup table for converting pixel data. See
> +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is a 3D array
> +	 * of &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *cubic_lut;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab424ddd7665..8edb0094e5a7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -800,6 +800,17 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *gamma_lut_size_property;
>  
> +	/**
> +	 * @cubic_lut_property: Optional CRTC property to set the 3D LUT used to
> +	 * convert color spaces.
> +	 */
> +	struct drm_property *cubic_lut_property;
> +	/**
> +	 * @cubic_lut_size_property: Optional CRTC property for the size of the
> +	 * 3D LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *cubic_lut_size_property;
> +
>  	/**
>  	 * @suggested_x_property: Optional connector property with a hint for
>  	 * the position of the output on the host's screen.
> 

-- 
Regards
--
Kieran
