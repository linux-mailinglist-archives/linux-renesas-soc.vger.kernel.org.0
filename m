Return-Path: <linux-renesas-soc+bounces-25052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCBDC7FD45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82DA14E2718
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3675F263F44;
	Mon, 24 Nov 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsR79ZXx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFF1419A9;
	Mon, 24 Nov 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979488; cv=none; b=HkkdUTFejNFc8oOSPc29lhhJjUAPuyMP+FwvxammJULUvocvDT0JriZ3g+qwUsowdqflW39SCJjLtt4LyXS77XmzDbP7nO3T1qVSqspqG6BRF4KH+ZlfDyrkMuS/qf2qDeRCodUWYtTRztj86ln66BSfaoVTbGLAlY+Akhom9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979488; c=relaxed/simple;
	bh=ms6lyVzlvSmdq6eGFsE2aYtKvb9irgtFLrLqVW7j6N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT26y0N3d8CUZue/K5lav4ScBwczV48K3sl+0xCn6DYcyD32WCPz+/F/5Jp28KwpOcPpjeN76CuYbI66Yu4mfb5BtjwdrOSLurf9xm1EtSACG6FagZvwx16PeABdD1CAMN8OSqjEDKgCaQtUKRtTaWDLYg+GjhCmNQj5jy3zI6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsR79ZXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CB8C116D0;
	Mon, 24 Nov 2025 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763979487;
	bh=ms6lyVzlvSmdq6eGFsE2aYtKvb9irgtFLrLqVW7j6N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsR79ZXxXeZUvNlKq6JHx3U+Az0+PUuLS//VN7blMWL3GOhStsTAv1diPyOJlPIKa
	 cc2DnYeKOmhmMVfoifH9J4mOur+9IWQgpbXH2MSE6aD9zlLJ6IXAp4rhneny1z2Gnr
	 LzHMNS8+yCe7JO3hF+i7Lvl4HjnP3NE9NW3krdt4azD7ZFpmTxyW7qY69pAhpCaojC
	 KxrqQjkLOZvFVawKbi1VEYI7JbLnh6LLLRGNn2z4cQj0lhBlRjo9ROd+BBTdPxMKsj
	 f7BDNPAstmfe1oJiu4EbJFP9ag6PxUeMTdI0+10J8IXjQacJ5E5O0cQQVNNqocQzhK
	 +9JrLfsKHL02w==
Date: Mon, 24 Nov 2025 11:18:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
Message-ID: <x6uch6cyjgbwnmac7fyjxdbi56gnhmilezfjdhqpakbz5hogt3@q72fex3ssh6u>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com>
 <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hlwwko6623byri3x"
Content-Disposition: inline
In-Reply-To: <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>


--hlwwko6623byri3x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 02:28:41PM +0000, Louis Chauvet wrote:
> On 11/19/25 13:05, Luca Ceresoli wrote:
> > of_drm_find_bridge() does not increment the returned bridge
> > refcount. drm_of_find_bridge() is to be used as a replacement.
> >=20
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-=
0a18ad@houat/
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >   drivers/gpu/drm/drm_bridge.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index d98a7b4a83c0..6debbf20aaa8 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -299,7 +299,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> >    * @bridge: bridge control structure
> >    *
> >    * Add the given bridge to the global list of bridges, where they can=
 be
> > - * found by users via of_drm_find_bridge().
> > + * found by users via drm_of_find_bridge().
> >    *
> >    * The bridge to be added must have been allocated by
> >    * devm_drm_bridge_alloc().
> > @@ -360,7 +360,7 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
> >    * @bridge: bridge control structure
> >    *
> >    * Remove the given bridge from the global list of registered bridges=
, so
> > - * it won't be found by users via of_drm_find_bridge(), and add it to =
the
> > + * it won't be found by users via drm_of_find_bridge(), and add it to =
the
> >    * lingering bridge list, to keep track of it until its allocated mem=
ory is
> >    * eventually freed.
> >    */
> > @@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
> >    *
> >    * @np: device node
> >    *
> > + * This function is deprecated. Use drm_of_find_bridge() instead for p=
roper
> > + * refcounting.
> > + *
>=20
> I think it should be more explicit that the refcounting is not done by th=
is
> function, like:
>=20
> 	This function is deprecated. The returned bridge is not refcounted, you
> should not use drm_bridge_put(). Use drm_of_find_bridge() instead for pro=
per
> refcounting.

I'd rather say that the callers must take care of the refcounting by
themselves but that it's racy, or at least that it *must* not use
drm_bridge_put().

Maxime

--hlwwko6623byri3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQw3AAKCRAnX84Zoj2+
dr7aAYDmcUa4xmy8KtLxfsyLA8X28V6pQaVGDFFzSmrAPgK3LZuG27zJYoDUJd3n
lULG0bQBf3evX21S3dPs9NIlJAExmurhYA56+Qs0XQchA/WaC9CwUSx4gYiXXGL1
bd5Dvu4ekQ==
=T5pR
-----END PGP SIGNATURE-----

--hlwwko6623byri3x--

