Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F727380CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 13:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbjFUKgk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 06:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjFUKgP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 06:36:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9A01FCF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 03:33:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f86d8a8fd4so5141445e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687343615; x=1689935615;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfgox7DjqCgOODZiUus9R296tpfM4SHoLpMKmpo7PZc=;
        b=sqEzfQQt8Z1/ncRb725HjB/HGo0PmZ0deiAF1S72l4WbFl/BZNNjLiQ6RWjG1wKYrX
         4HNLB4RtO6GAz1R7/1b+GM28Xaqrj9w/tvGouIojau42K7XLX0467OH+nx/AVgaTWJ/q
         7WLThSWjbslGD+ZIqVL9ufxxiGOSEY1t8Ij/irD5g/5zL/Khj1/5+T/+75Z6o3IwFAVv
         VR28VYgj782NEmz7u54QpdjqHYyP+3Qz2+MCRLLxQqfZNKcSMcM3R2MWYgGX12mhJaQd
         hB7BKstTm4FbjN37W3+KeOJ/7Cj8IjH9R0JXln+iVpaOfmVC1LiqTD1QxEgJ2PZStmpk
         2oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687343615; x=1689935615;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfgox7DjqCgOODZiUus9R296tpfM4SHoLpMKmpo7PZc=;
        b=ZHyMFPfFmpH/R4yh7Y6VGb37FW+xTApRQ+KQUDoLIEr+5kR3gklN4U6bKbWuLhkoIX
         zgDgIucu3x5alckRBcrFpIWXYhJfHKLYR7TLMbmXyxKK7ahizVrN8ZvD1jdzJU4ntNus
         Z2M2tnmceo+cgFIlXQ5nlKZSRGa4SYDIzHMUimTu48w9ZCadN9nZ2id6CdqwvyXwG0PO
         +aqEBI3UqULYBD6J3Xue83l1Tgshl7ONxTy3/PxswETFzwPO1jMpf8VrbHprAOKkn8NF
         miKLr5LP9iYjmLtbEJcwnzUY2GGP1peOYCmv9bQID1/urkB02z5R58ZS7FkvFdvSxkvd
         1APw==
X-Gm-Message-State: AC+VfDys+HRDFwEYFlGwx+ShvAelNSA/hwdRNzTICAz3FxlB385tJwlK
        5dy8pc5lzTYKbykJvVyTR/c=
X-Google-Smtp-Source: ACHHUZ4tOvzHgGjDN2bgk1ZHXh+FyGxbppt5b9Yo+JBNsr8KddNaMOaxR8K46x42pniMmUxxt5b0nw==
X-Received: by 2002:ac2:5b0c:0:b0:4f8:666b:9de8 with SMTP id v12-20020ac25b0c000000b004f8666b9de8mr7317814lfn.13.1687343614713;
        Wed, 21 Jun 2023 03:33:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id q4-20020ac25144000000b004f8427f8716sm720493lfd.262.2023.06.21.03.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:33:34 -0700 (PDT)
Date:   Wed, 21 Jun 2023 13:33:30 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Ser <contact@emersion.fr>,
        Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
        xaver.hugl@gmail.com, Melissa Wen <mwen@igalia.com>,
        wayland-devel <wayland-devel@lists.freedesktop.org>,
        mdaenzer@redhat.com, Uma Shankar <uma.shankar@intel.com>,
        Victoria Brekenfeld <victoria@system76.com>, aleixpol@kde.org,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Joshua Ashton <joshua@froggi.es>, airlied@gmail.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        daniel@ffwll.ch, harry.wentland@amd.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, tzimmermann@suse.de,
        Xinhui.Pan@amd.com,
        DRI Development <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 0/9] drm: rcar-du: cmm: Enable 3D LUT support
Message-ID: <20230621133330.3d09d47a@eldfell>
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2023 10:10:22 +0200
Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hello, this series is based on the RFC sent by Melssa Wen:
> "[RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface"
> https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.co=
m/
> that introduces CRTC properties to control 3D LUT operations.
>=20
> The R-Car DU peripheral has a post-blending color management pipeline (CM=
M)
> composed by (in order of processing) a 3D LUT a 1D LUT and a Color conver=
sion
> unit.
>=20
> The CMM driver already supported operating the 1D LUT, this series add su=
pport
> for the cubic LUT (named CLU).
>=20
> I've been made aware by Melissa and Pekka that the focus of upstream for
> color management properties is now on the definition of the "Plane color
> pipeline" properties
> https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAc=
cFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=3D@eme=
rsion.fr/
>=20
> Unfortunately the model there proposed doesn't match the R-Car DU hardwar=
e which
> has color management at the post-blending level and not per plane (I've c=
c-ed
> all the receivers of that series, just in case).

Hi,

what are the actual use cases for post-blending color pipelines?

The pre-blending per-plane color pipelines are important for future
Wayland compositors, and post-blending is probably mostly about just
encoding for the sink (applying some inverse EOTF), so I've been
wondering why the post-blending color hardware seems to be so prevalent
and well-developed compared to pre-blending.

Is the idea that composition happens in a standard fixed color space,
and the post-blending color pipeline converts that to sink-native color
space?

If so, how do systems get their input content into the composition
space first?

Or is all this just a side-effect of caring about color on a single
plane, and not care at all how other planes with other kinds of content
will look? (e.g. TV broadcast vs. sub-titles, program guide, OSD)


Thanks,
pq

> The user-space interface has been validated with dedicated unit tests for
> the R-Car DU test suite (kms-test) which are available at:
> https://git.sr.ht/~jmondi_/kms-test
>=20
> The series validates the usage of the HW interface in the hope of re-star=
ting
> discussions and interests in the definition of CRTC color management
> properties.
>=20
> Thanks
>    j
>=20
> Alex Hung (1):
>   drm: Add 3D LUT mode and its attributes
>=20
> Jacopo Mondi (1):
>   drm: rcar-du: crtc: Enable 3D LUT
>=20
> Kieran Bingham (2):
>   drm: rcar-du: cmm: Provide 3D-CLU support
>   drm: rcar-du: kms: Configure the CLU
>=20
> Laurent Pinchart (1):
>   drm: rcar-du: cmm: Refactor LUT configuration
>=20
> Melissa Wen (4):
>   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
>   drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
>   drm/drm_color_mgmt: add function to create 3D LUT modes supported
>   drm/drm_color_mgmt: add function to attach 3D LUT props
>=20
>  drivers/gpu/drm/drm_atomic_state_helper.c |   7 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  24 ++++
>  drivers/gpu/drm/drm_color_mgmt.c          | 113 +++++++++++++++++++
>  drivers/gpu/drm/drm_fb_helper.c           |   5 +
>  drivers/gpu/drm/drm_mode_config.c         |  21 ++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.c        | 127 ++++++++++++++++------
>  drivers/gpu/drm/rcar-du/rcar_cmm.h        |  36 +++++-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  68 +++++++++---
>  include/drm/drm_color_mgmt.h              |   7 ++
>  include/drm/drm_crtc.h                    |  32 +++++-
>  include/drm/drm_mode_config.h             |  25 +++++
>  include/drm/drm_mode_object.h             |   2 +-
>  include/uapi/drm/drm_mode.h               |  17 +++
>  13 files changed, 428 insertions(+), 56 deletions(-)
>=20
> --
> 2.40.1
>=20


--Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSS0foACgkQI1/ltBGq
qqfjKg//SqaRQZPhOcU1s7eAHUHUDW0xyDuO6myOzWM/ltjB3/wmU2Q268RDspXh
rXqhgNAY5UnwqwxG0+O5sNB6gNV/ZZxE3Im+bRHnLTLkN1oigY/saElTSltgaali
bklvi7vi4trRnd6+g5Jm+6ahtJEeyYXvwDCycM2s1h7lYYzL6SK64CmHohOjsNUK
2TJQpk6bsCHIta6bF0Npyq/pYWzjFQZ2fb3HghXouwHXPwgKb3jxQ4p1zp99L6mx
7cJ+IBq654Cuf6xlMAUsyPqZUyeSgNEcXs5/NI0Dw4FFaLxk3fdS8d60TjAT2Wlw
lDWU1tQOJ9ir4WSh/uRGLIyg7gSYslCWEbeSxSh+ngv31lzyoVmUfd6TurNCuAHF
xJZGqPLdfTE1xsasj9+o62BL/EaMzsD63NBk9Vvalp+Lq+xcEaYmnrwLEAxbuNPd
CvKOMfKiYBGp6plbSfu7htOYRK4dm8wOpLtfmmwC1vqNZX23m6su8qlQAOOJFLSr
gdj2o5HckXzQ0xPTV1LWgrcY1E8q4Ye7/WJKtO9D8bdEEIa6DyOgKSrbNh2UH47k
GH+Cl0TmIkFDshve9/vEt/g+tJ0JUheYZs/8opa7MHX0gxp4nw0UwID3q5HPrwxf
AvDA8tYO3d9XFYkjOa6bLEKzcAagLz9fTFzwCY10vACsiDs6M6A=
=ZmE/
-----END PGP SIGNATURE-----

--Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7--
