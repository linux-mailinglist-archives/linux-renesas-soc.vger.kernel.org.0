Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0977B2E0244
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 23:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgLUWAC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 17:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgLUWAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 17:00:02 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFB8C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 13:59:21 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id x22so281272wmc.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 13:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JsYeT92Qa7qgMIANJuTqCUKwRFmtaYgEx+dUjz2/0A4=;
        b=MJ5I9nWITyMGnDO7ocXRdXONNPwWucIDetJX0LrfZWpJocSDMZF8EhpEI/t/6rbllc
         BF2v0kFQahQdzw9Zo4v+edJY3odJyN8ONRELD1iLDLVdxxAqGn0170FWlL0EIEOUujwD
         df3X1T4TGqiylaJR4lh9y15vw01aWdoibj7Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JsYeT92Qa7qgMIANJuTqCUKwRFmtaYgEx+dUjz2/0A4=;
        b=L/9Gkic3RJjKKtV3pJzeWECCgXqpo7ANBB8p39Mx6X/CrPHpHjbOJ/YmHdX5f7eCvk
         8gR7OQt+asME6Duwc7w40YJgyLohe1bsX1QUR8FR0ryWMU69iEAf69us1gRXVQlDGkXN
         39n0pqACiPbC6YprOJ1zY/330l9rABkLFLH3rwjLPRvaMm3iUKqfHCHcc8Zzp4xryI/w
         /ozDbIIpkcAvLGBukhk5MW9IX/TC//VPF7R9x8a/7/b26wN2CdDMes/vFECaWW4mJXVt
         ne0Z2YKFyVBbmLMy2Z6+/yXwrG7sFnGO1t+bcUDtbYkJydyWMkGT+O7SbuQJBDrpezEj
         nxCQ==
X-Gm-Message-State: AOAM531/Ar+UrWsPIOpR4nOP6i1uRTVs66Dpe9qi/8xXnQNJWX4d/IX0
        /x2EiW+JKQW7KH4Q0o4rAGjchg==
X-Google-Smtp-Source: ABdhPJw/h4DzRfSZd9EbInj31j6yeg5rnClBWwFepgmSb3a87s2bT3p8MYDn7o/+J03Oe7hKzKNxZA==
X-Received: by 2002:a1c:9ccd:: with SMTP id f196mr18898170wme.82.1608587959948;
        Mon, 21 Dec 2020 13:59:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h5sm29674698wrp.56.2020.12.21.13.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 13:59:19 -0800 (PST)
Date:   Mon, 21 Dec 2020 22:59:17 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm: Extend color correction to support 3D-CLU
Message-ID: <X+Eatc4sHsApLIEO@phenom.ffwll.local>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAKMK7uG1dT5mZT48sv4XewvZer-qm=WwQOeVd=Y-Yq_kzjdG+g@mail.gmail.com>
 <X+DrtHjekUhwjgbV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X+DrtHjekUhwjgbV@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 08:38:44PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Mon, Dec 21, 2020 at 07:36:22PM +0100, Daniel Vetter wrote:
> > On Mon, Dec 21, 2020 at 2:57 AM Laurent Pinchart wrote:
> > >
> > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > Extend the existing color management properties to support provision
> > > of a 3D cubic look up table, allowing for color specific adjustments.
> > >
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Assuming this is meant for merging to upstream: Needs igt + open
> > userspace in a compositor that cares enough.
> 
> Please see the cover letter :-) Feedback on what an appropriate
> userspace would be would be appreciated.

Oops sorry.

Wrt userspace CrOS was the one originally used to merge this, they do the
full ICC color correction for their panels with degamm + ctm + lut. So if
you somewhat care about that (or can make google care about 3d/cube luts)
then that might be simplest.

The Kodi people also care quite a lot about color correction stuff, and
iirc some of the per-plane color management is being prototyped with code
(so that the movie and the UI both have their correct colors).

Otherwise I guess weston is the closest with real color management, but
nothing merged yet.
-Daniel

> 
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c       |  1 +
> > >  drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
> > >  drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++
> > >  drivers/gpu/drm/drm_color_mgmt.c          | 41 +++++++++++++++++++----
> > >  drivers/gpu/drm/drm_mode_config.c         | 14 ++++++++
> > >  include/drm/drm_crtc.h                    |  9 +++++
> > >  include/drm/drm_mode_config.h             | 11 ++++++
> > >  7 files changed, 82 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index ba1507036f26..0f54897d3c8d 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -3558,6 +3558,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> > >         replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> > >         replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> > >         replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> > > +       replaced |= drm_property_replace_blob(&crtc_state->cubic_lut, NULL);
> > >         crtc_state->color_mgmt_changed |= replaced;
> > >
> > >         ret = drm_atomic_commit(state);
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index ddcf5c2c8e6a..61c685b50677 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> > >                 drm_property_blob_get(state->ctm);
> > >         if (state->gamma_lut)
> > >                 drm_property_blob_get(state->gamma_lut);
> > > +       if (state->cubic_lut)
> > > +               drm_property_blob_get(state->cubic_lut);
> > >         state->mode_changed = false;
> > >         state->active_changed = false;
> > >         state->planes_changed = false;
> > > @@ -213,6 +215,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
> > >         drm_property_blob_put(state->degamma_lut);
> > >         drm_property_blob_put(state->ctm);
> > >         drm_property_blob_put(state->gamma_lut);
> > > +       drm_property_blob_put(state->cubic_lut);
> > >  }
> > >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index 268bb69c2e2f..07229acab71c 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -471,6 +471,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
> > >                                         &replaced);
> > >                 state->color_mgmt_changed |= replaced;
> > >                 return ret;
> > > +       } else if (property == config->cubic_lut_property) {
> > > +               ret = drm_atomic_replace_property_blob_from_id(dev,
> > > +                                       &state->cubic_lut,
> > > +                                       val,
> > > +                                       -1, sizeof(struct drm_color_lut),
> > > +                                       &replaced);
> > > +               state->color_mgmt_changed |= replaced;
> > > +               return ret;
> > >         } else if (property == config->prop_out_fence_ptr) {
> > >                 s32 __user *fence_ptr = u64_to_user_ptr(val);
> > >
> > > @@ -516,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
> > >                 *val = (state->ctm) ? state->ctm->base.id : 0;
> > >         else if (property == config->gamma_lut_property)
> > >                 *val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> > > +       else if (property == config->cubic_lut_property)
> > > +               *val = (state->cubic_lut) ? state->cubic_lut->base.id : 0;
> > >         else if (property == config->prop_out_fence_ptr)
> > >                 *val = 0;
> > >         else if (property == crtc->scaling_filter_property)
> > > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > > index 3bcabc2f6e0e..85bbbc8ce8e5 100644
> > > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > > @@ -33,7 +33,7 @@
> > >  /**
> > >   * DOC: overview
> > >   *
> > > - * Color management or color space adjustments is supported through a set of 5
> > > + * Color management or color space adjustments is supported through a set of 7
> > >   * properties on the &drm_crtc object. They are set up by calling
> > >   * drm_crtc_enable_color_mgmt().
> > >   *
> > > @@ -60,7 +60,7 @@
> > >   * “CTM”:
> > >   *     Blob property to set the current transformation matrix (CTM) apply to
> > >   *     pixel data after the lookup through the degamma LUT and before the
> > > - *     lookup through the gamma LUT. The data is interpreted as a struct
> > > + *     lookup through the cubic LUT. The data is interpreted as a struct
> > >   *     &drm_color_ctm.
> > >   *
> > >   *     Setting this to NULL (blob property value set to 0) means a
> > > @@ -68,13 +68,40 @@
> > >   *     boot-up state too. Drivers can access the blob for the color conversion
> > >   *     matrix through &drm_crtc_state.ctm.
> > >   *
> > > + * ”CUBIC_LUT”:
> > > + *     Blob property to set the cubic (3D) lookup table performing color
> > > + *     mapping after the transformation matrix and before the lookup through
> > > + *     the gamma LUT. Unlike the degamma and gamma LUTs that map color
> > > + *     components independently, the 3D LUT converts an input color to an
> > > + *     output color by indexing into the 3D table using the color components
> > > + *     as a 3D coordinate. The LUT is subsampled as 8-bit (or more) precision
> > > + *     would require too much storage space in the hardware, so the precision
> > > + *     of the color components is reduced before the look up, and the low
> > > + *     order bits may be used to interpolate between the nearest points in 3D
> > > + *     space.
> > > + *
> > > + *     The data is interpreted as an array of &struct drm_color_lut elements.
> > > + *     Hardware might choose not to use the full precision of the LUT
> > > + *     elements.
> > > + *
> > > + *     Setting this to NULL (blob property value set to 0) means the output
> > > + *     color is identical to the input color. This is generally the driver
> > > + *     boot-up state too. Drivers can access this blob through
> > > + *     &drm_crtc_state.cubic_lut.
> > > + *
> > > + * ”CUBIC_LUT_SIZE”:
> > > + *     Unsigned range property to give the size of the lookup table to be set
> > > + *     on the CUBIC_LUT property (the size depends on the underlying hardware).
> > > + *     If drivers support multiple LUT sizes then they should publish the
> > > + *     largest size, and sub-sample smaller sized LUTs appropriately.
> > > + *
> > >   * “GAMMA_LUT”:
> > >   *     Blob property to set the gamma lookup table (LUT) mapping pixel data
> > > - *     after the transformation matrix to data sent to the connector. The
> > > - *     data is interpreted as an array of &struct drm_color_lut elements.
> > > - *     Hardware might choose not to use the full precision of the LUT elements
> > > - *     nor use all the elements of the LUT (for example the hardware might
> > > - *     choose to interpolate between LUT[0] and LUT[4]).
> > > + *     after the cubic LUT to data sent to the connector. The data is
> > > + *     interpreted as an array of &struct drm_color_lut elements. Hardware
> > > + *     might choose not to use the full precision of the LUT elements nor use
> > > + *     all the elements of the LUT (for example the hardware might choose to
> > > + *     interpolate between LUT[0] and LUT[4]).
> > >   *
> > >   *     Setting this to NULL (blob property value set to 0) means a
> > >   *     linear/pass-thru gamma table should be used. This is generally the
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > index f1affc1bb679..6c3324f60e7d 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> > >                 return -ENOMEM;
> > >         dev->mode_config.gamma_lut_size_property = prop;
> > >
> > > +       prop = drm_property_create(dev,
> > > +                       DRM_MODE_PROP_BLOB,
> > > +                       "CUBIC_LUT", 0);
> > > +       if (!prop)
> > > +               return -ENOMEM;
> > > +       dev->mode_config.cubic_lut_property = prop;
> > > +
> > > +       prop = drm_property_create_range(dev,
> > > +                       DRM_MODE_PROP_IMMUTABLE,
> > > +                       "CUBIC_LUT_SIZE", 0, UINT_MAX);
> > > +       if (!prop)
> > > +               return -ENOMEM;
> > > +       dev->mode_config.cubic_lut_size_property = prop;
> > > +
> > >         prop = drm_property_create(dev,
> > >                                    DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > >                                    "IN_FORMATS", 0);
> > > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > > index 5f43d64d2a07..df5cc2239adb 100644
> > > --- a/include/drm/drm_crtc.h
> > > +++ b/include/drm/drm_crtc.h
> > > @@ -288,6 +288,15 @@ struct drm_crtc_state {
> > >          */
> > >         struct drm_property_blob *gamma_lut;
> > >
> > > +       /**
> > > +        * @cubic_lut:
> > > +        *
> > > +        * Cubic Lookup table for converting pixel data. See
> > > +        * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is a 3D array
> > > +        * of &struct drm_color_lut.
> > > +        */
> > > +       struct drm_property_blob *cubic_lut;
> > > +
> > >         /**
> > >          * @target_vblank:
> > >          *
> > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > > index ab424ddd7665..8edb0094e5a7 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -800,6 +800,17 @@ struct drm_mode_config {
> > >          */
> > >         struct drm_property *gamma_lut_size_property;
> > >
> > > +       /**
> > > +        * @cubic_lut_property: Optional CRTC property to set the 3D LUT used to
> > > +        * convert color spaces.
> > > +        */
> > > +       struct drm_property *cubic_lut_property;
> > > +       /**
> > > +        * @cubic_lut_size_property: Optional CRTC property for the size of the
> > > +        * 3D LUT as supported by the driver (read-only).
> > > +        */
> > > +       struct drm_property *cubic_lut_size_property;
> > > +
> > >         /**
> > >          * @suggested_x_property: Optional connector property with a hint for
> > >          * the position of the output on the host's screen.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
