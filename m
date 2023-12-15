Return-Path: <linux-renesas-soc+bounces-1109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28D814461
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 10:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D0F284877
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 09:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221F417986;
	Fri, 15 Dec 2023 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5aTBQHc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881817981
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 09:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3331FC433C7;
	Fri, 15 Dec 2023 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702632155;
	bh=dMct7Gan8ipZWYDYBZiekov7SrVCLfapPu8Lg6d0L/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5aTBQHcFdacgxStHnNyHY7dizq8ZyJVLUfd7u8rlXufq6K8k115tF4arrY9/WHZr
	 HqkyJcCLpCt7boYGFfOKa3KGRbnUKYNBeps4iOsNkdRD0Kqvrke3viBleftQUqiOOz
	 d3KQpggtpGHuZTEDgD4Kqu20P6FtNCRWsBNJo38iqLWYE6AO7BuJdoSWfWNiHnvHt/
	 boBztlRPbvpqFGPMzk891osiCsqKDfOukKeuUU4SlkXLx10A2tjeNkDmzknP5FgKLI
	 gQTLRbqNptWEVUI1jCgPe8QRqf0hfNllC7a7bdBS5gfiNxzrGa2AZy+iPq+Vav95iT
	 HK6YJrIiAL3tg==
Date: Fri, 15 Dec 2023 10:22:31 +0100
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
Message-ID: <jchvhcyzcmjn5jsa2qaaeq7qx56fk3zlde5b6od4jvzipl3fhq@p32jbz2hut4s>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7u3zlgzbcel6zykx"
Content-Disposition: inline
In-Reply-To: <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>


--7u3zlgzbcel6zykx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 08:50:14PM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: Thursday, December 14, 2023 3:24 PM
> > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > >
> > > > +
> > > > +	for (i =3D 0; i < num_planes; ++i) {
> > > > +		enum drm_plane_type type =3D i < num_crtcs
> > > > +					 ? DRM_PLANE_TYPE_PRIMARY
> > > > +					 : DRM_PLANE_TYPE_OVERLAY;
> > > > +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> > > > +
> > > > +		plane->vsp =3D vsp;
> > > > +		plane->index =3D i;
> > > > +		ret =3D drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> > > > +					       crtcs, &rzg2l_du_vsp_plane_funcs,
> > > > +					       rzg2l_du_vsp_formats,
> > > > +					       ARRAY_SIZE(rzg2l_du_vsp_formats),
> > > > +					       NULL, type, NULL);
> > > > +		if (ret < 0)
> > > > +			return ret;
> > >
> > > you need to use drmm variant here too.
> >=20
> > I did rebased to latest drm_misc_next and I don't find the
> > drmm_universal_plane_init()
> >=20
> > Can you please point me to the API?
>=20
> We cannot use drmm_universal_plane_alloc() in this architecture.
>=20
> rzg2l_du_vsps_init() stores the VSP pointer and pipe index from DT first.
>=20
> Then all the planes are created using rzg2l_du_vsp_init()
>=20
> CRTC uses VSP pointer and pipe_index to set the plane(rzg2l_du_crtc_creat=
e()).
>=20
> CRTC->vsp->planes[rcrtc->vsp_pipe].plane

Actually, I don't think you need vsp->planes at all. The only real use
you have for it is to find the primary plane in rzg2l_du_crtc_create()
and you could just pass it as an argument to the function, and make
rzg2l_du_vsps_init return it for example (or fill a pointer on success,
or something).

And I also don't think you need to store the crtcs either, you can
probably just get away with storing the vsp pointer in the crtc when you
allocate it.

Maxime

--7u3zlgzbcel6zykx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXwa1wAKCRDj7w1vZxhR
xTmqAQDlptxcabjM6lYA180CTAK3h5fQExxKiLt211Y6bt0osQD+PzypHjrg4xXf
mILXhWGwIDBaNCZJ6c81w8NB8kxBzwo=
=TcmY
-----END PGP SIGNATURE-----

--7u3zlgzbcel6zykx--

