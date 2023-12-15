Return-Path: <linux-renesas-soc+bounces-1110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC19814464
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 10:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8371C22896
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 09:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB7A17986;
	Fri, 15 Dec 2023 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPZrNWMm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0C17981
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 09:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC988C433C7;
	Fri, 15 Dec 2023 09:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702632295;
	bh=r2S9GloCuwCq5TtfKELucnWGl5dY2YRS03AsY22KLmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPZrNWMmX40+TakkH5/eIFNycKEm0RDuGnjiT4wWGQ6AfoaeWsj8N8YH6cWDETr3z
	 Kik8Ck+3WqeHDFUbndt/U5w+qCC/ffx8ikGPSDM0KS74GMe7SqifnrifeiJT0Y/Hks
	 KcqVh/jdO+ZtY06fA6mHPN88PvyYczbuVffTcPHWc7kUMy1ZSm/q10xAVLUJAYQ/b8
	 AhEQh11+KnDrYlNOvqKE1fnxzJny1pH7XOQvqdb+tLboLyNVvfy0dIOc2rJ1l8WuBt
	 BTS5J1FT6Ip1jHCueMt0JYq8x/gDzqVLcU3+/gZutUtrNbXdkoO9ycDSehfn0UW+qb
	 KvN3BAN09Do9Q==
Date: Fri, 15 Dec 2023 10:24:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <jxjqwytay24p5g7rl23asjucbwswpjyw3znrbu6z7eigrvl7jy@5vxwqtgpg35g>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269E2263C8D2A14F94CE50F8693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clepi35wwz3yhheo"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269E2263C8D2A14F94CE50F8693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>


--clepi35wwz3yhheo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 07:47:07AM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: Thursday, December 14, 2023 8:50 PM
> > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > Hi Maxime Ripard,
> >=20
> >=20
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: Thursday, December 14, 2023 3:24 PM
> > > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > >
> > > >
> > > > > +
> > > > > +	for (i =3D 0; i < num_planes; ++i) {
> > > > > +		enum drm_plane_type type =3D i < num_crtcs
> > > > > +					 ? DRM_PLANE_TYPE_PRIMARY
> > > > > +					 : DRM_PLANE_TYPE_OVERLAY;
> > > > > +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> > > > > +
> > > > > +		plane->vsp =3D vsp;
> > > > > +		plane->index =3D i;
> > > > > +		ret =3D drm_universal_plane_init(&rcdu->ddev, &plane-
> > >plane,
> > > > > +					       crtcs,
> > &rzg2l_du_vsp_plane_funcs,
> > > > > +					       rzg2l_du_vsp_formats,
> > > > > +
> > ARRAY_SIZE(rzg2l_du_vsp_formats),
> > > > > +					       NULL, type, NULL);
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > >
> > > > you need to use drmm variant here too.
> > >
> > > I did rebased to latest drm_misc_next and I don't find the
> > > drmm_universal_plane_init()
> > >
> > > Can you please point me to the API?
> >=20
> > We cannot use drmm_universal_plane_alloc() in this architecture.
> >=20
> > rzg2l_du_vsps_init() stores the VSP pointer and pipe index from DT firs=
t.
> >=20
> > Then all the planes are created using rzg2l_du_vsp_init()
> >=20
> > CRTC uses VSP pointer and pipe_index to set the
> > plane(rzg2l_du_crtc_create()).
> >=20
> > CRTC->vsp->planes[rcrtc->vsp_pipe].plane
> >=20
>=20
> Thinking again, it is possible to use drmm_universal_plane_alloc() here
>=20
> Introduce a linked list [1] and use an API [2] to retrieve plane
> by matching vsp_pipe index against plane->index.
>=20
> With this we don't need drmm_kcalloc() any more.
>=20
> I will implement and test this and send v16, if there are no comments.
>=20
>=20
> [1]
> struct rzg2l_du_vsp_plane {
> 	struct drm_plane plane;
> 	struct rzg2l_du_vsp *vsp;
> 	unsigned int index;
> 	struct rzg2l_du_vsp_plane *next;
> };
>=20
> [2]
> struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
> 					 unsigned int pipe_index);

Why do you need a linked list for? There's one already: the DRM device
will store all the planes registered in the DRM device, and you can
already iterate over all the planes with drm_for_each_plane, or
drm_for_each_plane_mask if you want to reduce the scope of the iterator.

Maxime

--clepi35wwz3yhheo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXwbZAAKCRDj7w1vZxhR
xeF4AP9asN0hTJQMm4E7eb3OQ+nXmyN8YD4M8aGiZpj+7qWUxQD+OwEo9F5kpPn/
JHCtZEofrjcVYXA1kNdQo/1g73KZkAI=
=NFAJ
-----END PGP SIGNATURE-----

--clepi35wwz3yhheo--

