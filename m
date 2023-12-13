Return-Path: <linux-renesas-soc+bounces-999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289781184A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C955C280C53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E51733CE8;
	Wed, 13 Dec 2023 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhKd+LL2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615E85345
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 15:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9F9C433C7;
	Wed, 13 Dec 2023 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482506;
	bh=IiEK6mZm9+yei8LOOrWsSQ4sAQqJti7dLx9mCC+/y+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhKd+LL24eJYD6b+ImYK35jInANM4LUdQlIUpnweZ5u+PMTm2LNF+RWm5Ncn+glhw
	 quZHq909KRaZsqMGaz69eCXw2b3rwPHMx0hrCZN8EUhNW2Begq5zPJlE5pPCd5Dj8g
	 wFMfqBOC/OzaX9M5CuRs/ra4UmULrdzjVeHe2R5NJDnzL8GfnBk8yCRKuK+vGoOvaD
	 gGyyx4GDXFXpzuV/gb65dnWup5KKrmYr/qk32p1YkQgf4/QF1Yk5+6CZ1qc06YxB9i
	 0JtqJJkRNiCgIQ+vnVAL0JN9JxF8Utyoze+2ujLYeIjPKvLBbOcXA9fXSWh75NDU7p
	 3nGf1RbnSbhog==
Date: Wed, 13 Dec 2023 16:48:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <43cy4z45rdlbyzkhbxmsrkd25gj5o4amncl7z7zdsfrgnjjv2s@qozjjjlqmoie>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7jpg6wlujyyr6g5h"
Content-Disposition: inline
In-Reply-To: <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>


--7jpg6wlujyyr6g5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 04:47:09PM +0100, Maxime Ripard wrote:
> On Tue, Nov 28, 2023 at 10:51:27AM +0000, Biju Das wrote:
> > +int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
> > +		      unsigned int crtcs)
> > +{
> > +	struct rzg2l_du_device *rcdu =3D vsp->dev;
> > +	struct platform_device *pdev;
> > +	unsigned int num_crtcs =3D hweight32(crtcs);
> > +	unsigned int num_planes =3D 2;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Find the VSP device and initialize it. */
> > +	pdev =3D of_find_device_by_node(np);
> > +	if (!pdev)
> > +		return -ENXIO;
> > +
> > +	vsp->vsp =3D &pdev->dev;
> > +
> > +	ret =3D drmm_add_action_or_reset(&rcdu->ddev, rzg2l_du_vsp_cleanup, v=
sp);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D vsp1_du_init(vsp->vsp);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	vsp->planes =3D kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
> > +	if (!vsp->planes)
> > +		return -ENOMEM;
>=20
> drmm_kcalloc or drmm_kmalloc_array

Also, it doesn't look like you're using that array anywhere once the
action is gone.

Maxime

--7jpg6wlujyyr6g5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXnSRwAKCRDj7w1vZxhR
xeK7AQCNmF/TJDNpCuyFp8zNTjnqyq4ZfH5Mit88jLs+qdPdKgD/SKFE7p38KOdh
vLsUscYrrD4UlPVGjg9fkWDyNqga5w0=
=YUcS
-----END PGP SIGNATURE-----

--7jpg6wlujyyr6g5h--

