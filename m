Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BA42DFFF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 19:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgLUShO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 13:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgLUShO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 13:37:14 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF8AC061285
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 10:36:33 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id n42so3750071ota.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3+MdQ2uV70E0/w5yDMsjfrNxO+jatM/HxQ1uAxOim2c=;
        b=ZbnNtJntzYLBL8C8AbpP27OAvHvap+Z/ek7uLsvYQygj8K4VjX9V/Wn0p1HzimIRlN
         l9uCqO8cvOyd82Fes78cyesSoNv0CXTsoA4hEObDZt8BrgVGyHmPpjzg/tz/0P16mVV9
         w1UAzYjyr+divmgZJpiVUtQy06D37L4tWIiC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3+MdQ2uV70E0/w5yDMsjfrNxO+jatM/HxQ1uAxOim2c=;
        b=r3JgKPpYNceVWCVIxnNGS+fnT9zFH/N0Tj1M5/uvSYKESFnjGYg4WNuNKjnvaKaxZr
         1kIjuU44082TfjNqQZErG23j0wMk6PBONU1MCsUrANKmgMEnCyErHUQQH9C7k1MPJ25T
         ozqB/cq9tXor+EwdNovBQKewivXynzAAoH4IvcIMc877Os2FVuHcZ+OAdMZP1Zhioij5
         YUeVPdox9ga7UlywGBkFZyvfwM+DMcENjidmzf1TvSRXXtET+LB5whox8g2CPJ0iPhfY
         9omFHCrqUzJmNFLkoJwYcGOKEjR4y0JtCge/1kQDZV166En+PXFkImvGXBb9H/f9f+lX
         otGQ==
X-Gm-Message-State: AOAM531G9bcivW95wO0fFHmLfgpYKej3w2SHj74PEpdjpQ14Wui1JifZ
        AttgBQKeyxZjhAlrMAE6gVgnC1m/eP1X4VCPkVJNeg==
X-Google-Smtp-Source: ABdhPJySMY8d5xlejCyHAhIKJ/NR/ivpsrRZLBogmjRTI9mgEjWB5QuaKI5D1iHt527SC6xeqYBr/rq39IkPwtgNCSk=
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr13007864otf.188.1608575793159;
 Mon, 21 Dec 2020 10:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com> <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 21 Dec 2020 19:36:22 +0100
Message-ID: <CAKMK7uG1dT5mZT48sv4XewvZer-qm=WwQOeVd=Y-Yq_kzjdG+g@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm: Extend color correction to support 3D-CLU
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 2:57 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the existing color management properties to support provision
> of a 3D cubic look up table, allowing for color specific adjustments.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Assuming this is meant for merging to upstream: Needs igt + open
userspace in a compositor that cares enough.
-Daniel

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
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index ba1507036f26..0f54897d3c8d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3558,6 +3558,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_c=
rtc *crtc,
>         replaced  =3D drm_property_replace_blob(&crtc_state->degamma_lut,=
 NULL);
>         replaced |=3D drm_property_replace_blob(&crtc_state->ctm, NULL);
>         replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut, b=
lob);
> +       replaced |=3D drm_property_replace_blob(&crtc_state->cubic_lut, N=
ULL);
>         crtc_state->color_mgmt_changed |=3D replaced;
>
>         ret =3D drm_atomic_commit(state);
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index ddcf5c2c8e6a..61c685b50677 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct =
drm_crtc *crtc,
>                 drm_property_blob_get(state->ctm);
>         if (state->gamma_lut)
>                 drm_property_blob_get(state->gamma_lut);
> +       if (state->cubic_lut)
> +               drm_property_blob_get(state->cubic_lut);
>         state->mode_changed =3D false;
>         state->active_changed =3D false;
>         state->planes_changed =3D false;
> @@ -213,6 +215,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct dr=
m_crtc_state *state)
>         drm_property_blob_put(state->degamma_lut);
>         drm_property_blob_put(state->ctm);
>         drm_property_blob_put(state->gamma_lut);
> +       drm_property_blob_put(state->cubic_lut);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 268bb69c2e2f..07229acab71c 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -471,6 +471,14 @@ static int drm_atomic_crtc_set_property(struct drm_c=
rtc *crtc,
>                                         &replaced);
>                 state->color_mgmt_changed |=3D replaced;
>                 return ret;
> +       } else if (property =3D=3D config->cubic_lut_property) {
> +               ret =3D drm_atomic_replace_property_blob_from_id(dev,
> +                                       &state->cubic_lut,
> +                                       val,
> +                                       -1, sizeof(struct drm_color_lut),
> +                                       &replaced);
> +               state->color_mgmt_changed |=3D replaced;
> +               return ret;
>         } else if (property =3D=3D config->prop_out_fence_ptr) {
>                 s32 __user *fence_ptr =3D u64_to_user_ptr(val);
>
> @@ -516,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>                 *val =3D (state->ctm) ? state->ctm->base.id : 0;
>         else if (property =3D=3D config->gamma_lut_property)
>                 *val =3D (state->gamma_lut) ? state->gamma_lut->base.id :=
 0;
> +       else if (property =3D=3D config->cubic_lut_property)
> +               *val =3D (state->cubic_lut) ? state->cubic_lut->base.id :=
 0;
>         else if (property =3D=3D config->prop_out_fence_ptr)
>                 *val =3D 0;
>         else if (property =3D=3D crtc->scaling_filter_property)
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color=
_mgmt.c
> index 3bcabc2f6e0e..85bbbc8ce8e5 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -33,7 +33,7 @@
>  /**
>   * DOC: overview
>   *
> - * Color management or color space adjustments is supported through a se=
t of 5
> + * Color management or color space adjustments is supported through a se=
t of 7
>   * properties on the &drm_crtc object. They are set up by calling
>   * drm_crtc_enable_color_mgmt().
>   *
> @@ -60,7 +60,7 @@
>   * =E2=80=9CCTM=E2=80=9D:
>   *     Blob property to set the current transformation matrix (CTM) appl=
y to
>   *     pixel data after the lookup through the degamma LUT and before th=
e
> - *     lookup through the gamma LUT. The data is interpreted as a struct
> + *     lookup through the cubic LUT. The data is interpreted as a struct
>   *     &drm_color_ctm.
>   *
>   *     Setting this to NULL (blob property value set to 0) means a
> @@ -68,13 +68,40 @@
>   *     boot-up state too. Drivers can access the blob for the color conv=
ersion
>   *     matrix through &drm_crtc_state.ctm.
>   *
> + * =E2=80=9DCUBIC_LUT=E2=80=9D:
> + *     Blob property to set the cubic (3D) lookup table performing color
> + *     mapping after the transformation matrix and before the lookup thr=
ough
> + *     the gamma LUT. Unlike the degamma and gamma LUTs that map color
> + *     components independently, the 3D LUT converts an input color to a=
n
> + *     output color by indexing into the 3D table using the color compon=
ents
> + *     as a 3D coordinate. The LUT is subsampled as 8-bit (or more) prec=
ision
> + *     would require too much storage space in the hardware, so the prec=
ision
> + *     of the color components is reduced before the look up, and the lo=
w
> + *     order bits may be used to interpolate between the nearest points =
in 3D
> + *     space.
> + *
> + *     The data is interpreted as an array of &struct drm_color_lut elem=
ents.
> + *     Hardware might choose not to use the full precision of the LUT
> + *     elements.
> + *
> + *     Setting this to NULL (blob property value set to 0) means the out=
put
> + *     color is identical to the input color. This is generally the driv=
er
> + *     boot-up state too. Drivers can access this blob through
> + *     &drm_crtc_state.cubic_lut.
> + *
> + * =E2=80=9DCUBIC_LUT_SIZE=E2=80=9D:
> + *     Unsigned range property to give the size of the lookup table to b=
e set
> + *     on the CUBIC_LUT property (the size depends on the underlying har=
dware).
> + *     If drivers support multiple LUT sizes then they should publish th=
e
> + *     largest size, and sub-sample smaller sized LUTs appropriately.
> + *
>   * =E2=80=9CGAMMA_LUT=E2=80=9D:
>   *     Blob property to set the gamma lookup table (LUT) mapping pixel d=
ata
> - *     after the transformation matrix to data sent to the connector. Th=
e
> - *     data is interpreted as an array of &struct drm_color_lut elements=
.
> - *     Hardware might choose not to use the full precision of the LUT el=
ements
> - *     nor use all the elements of the LUT (for example the hardware mig=
ht
> - *     choose to interpolate between LUT[0] and LUT[4]).
> + *     after the cubic LUT to data sent to the connector. The data is
> + *     interpreted as an array of &struct drm_color_lut elements. Hardwa=
re
> + *     might choose not to use the full precision of the LUT elements no=
r use
> + *     all the elements of the LUT (for example the hardware might choos=
e to
> + *     interpolate between LUT[0] and LUT[4]).
>   *
>   *     Setting this to NULL (blob property value set to 0) means a
>   *     linear/pass-thru gamma table should be used. This is generally th=
e
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index f1affc1bb679..6c3324f60e7d 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struc=
t drm_device *dev)
>                 return -ENOMEM;
>         dev->mode_config.gamma_lut_size_property =3D prop;
>
> +       prop =3D drm_property_create(dev,
> +                       DRM_MODE_PROP_BLOB,
> +                       "CUBIC_LUT", 0);
> +       if (!prop)
> +               return -ENOMEM;
> +       dev->mode_config.cubic_lut_property =3D prop;
> +
> +       prop =3D drm_property_create_range(dev,
> +                       DRM_MODE_PROP_IMMUTABLE,
> +                       "CUBIC_LUT_SIZE", 0, UINT_MAX);
> +       if (!prop)
> +               return -ENOMEM;
> +       dev->mode_config.cubic_lut_size_property =3D prop;
> +
>         prop =3D drm_property_create(dev,
>                                    DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PRO=
P_BLOB,
>                                    "IN_FORMATS", 0);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 5f43d64d2a07..df5cc2239adb 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -288,6 +288,15 @@ struct drm_crtc_state {
>          */
>         struct drm_property_blob *gamma_lut;
>
> +       /**
> +        * @cubic_lut:
> +        *
> +        * Cubic Lookup table for converting pixel data. See
> +        * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is a 3D a=
rray
> +        * of &struct drm_color_lut.
> +        */
> +       struct drm_property_blob *cubic_lut;
> +
>         /**
>          * @target_vblank:
>          *
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.=
h
> index ab424ddd7665..8edb0094e5a7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -800,6 +800,17 @@ struct drm_mode_config {
>          */
>         struct drm_property *gamma_lut_size_property;
>
> +       /**
> +        * @cubic_lut_property: Optional CRTC property to set the 3D LUT =
used to
> +        * convert color spaces.
> +        */
> +       struct drm_property *cubic_lut_property;
> +       /**
> +        * @cubic_lut_size_property: Optional CRTC property for the size =
of the
> +        * 3D LUT as supported by the driver (read-only).
> +        */
> +       struct drm_property *cubic_lut_size_property;
> +
>         /**
>          * @suggested_x_property: Optional connector property with a hint=
 for
>          * the position of the output on the host's screen.
> --
> Regards,
>
> Laurent Pinchart
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
