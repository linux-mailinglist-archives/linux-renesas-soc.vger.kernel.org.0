Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACD74AD95F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 14:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240110AbiBHNPe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 08:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349522AbiBHMQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 07:16:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A24EC03FEC0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 04:16:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30151A04;
        Tue,  8 Feb 2022 13:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644322563;
        bh=/GjjOJT4Zd/yjR14F3vzx2OEgv5DVvS++eiwwIpsgp8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YHcLbg2g9OgWFlm4ZhjhS1A+Ossx/2xqFz2PV6wKWq42D8pMK2doeq4NniO88aIOf
         rePI9uum4QzGdRmApy4oCNCKIYhvKajFZExspZuCsD/oNfr43F00mviLwt3D8DDyl9
         2ADY6LdwbGUrkCGd34Up29KYNbTJ2WROrvPfxals=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220207163515.1038648-17-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech> <20220207163515.1038648-17-maxime@cerno.tech>
Subject: Re: [PATCH 16/23] drm/rcar: plane: Remove redundant zpos initialisation
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 08 Feb 2022 12:16:00 +0000
Message-ID: <164432256019.2921404.17702222253648308632@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Maxime Ripard (2022-02-07 16:35:08)
> The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
>=20
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.

Sounds helpful ;-)

> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_plane.c
> index 862197be1e01..9dda5e06457d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -696,7 +696,6 @@ static void rcar_du_plane_reset(struct drm_plane *pla=
ne)
>         state->hwindex =3D -1;
>         state->source =3D RCAR_DU_PLANE_MEMORY;
>         state->colorkey =3D RCAR_DU_COLORKEY_NONE;
> -       state->state.zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY ?=
 0 : 1;
>  }
> =20
>  static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar=
-du/rcar_du_vsp.c
> index b7fc5b069cbc..719c60034952 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -362,7 +362,6 @@ static void rcar_du_vsp_plane_reset(struct drm_plane =
*plane)
>                 return;
> =20
>         __drm_atomic_helper_plane_reset(plane, &state->state);
> -       state->state.zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY ?=
 0 : 1;
>  }
> =20
>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs =3D {
> --=20
> 2.34.1
>
