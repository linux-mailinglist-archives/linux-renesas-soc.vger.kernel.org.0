Return-Path: <linux-renesas-soc+bounces-19366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B4AFC124
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 05:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0865F3B6FC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 03:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9551FBE9B;
	Tue,  8 Jul 2025 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="B3CpGznH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7969A19005E;
	Tue,  8 Jul 2025 03:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751944044; cv=none; b=MwU2OjSNMo3oizcA4WbzYvVMIqdpGBJJ1X21qoWM0Y8cowcT79COFAzBrz2U+nf3EivRXyOl8U1qcNp71/tC+lhmIVivvPq/hXs85b/HxbT7CBaPpzHEyQDUs4CuPVw6YF9AGmJb4F0hsZooOJdzRsaw8WWurl9nJLe3Nk3Vq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751944044; c=relaxed/simple;
	bh=rMbqKakFi/+xhU3Rj6kPXO+HS24cMlilfRTp5oDO+CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHgELrNr2PkEtI6n7Oc/JKLK+6n4eT7Xv1Clnoq4YuANQtJA6BMs/msGpyYDgKupOyAskEQh8rEIPcikxOFFFq7nxXpnD130alHBy49ZC/3uXrB3AXz/bXSmZc/fDSTO7JbYwe3/5rlU/390T0DuR2ZppViISFcaX66RSJxsN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=B3CpGznH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202506; t=1751943978;
	bh=fsi1GjFyUUdQ0uiXj5hjqPOXToWH6CrE18MFTYBTWnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3CpGznHUjsl3Kye/eYpzJO3Mp91NQbMMiSs0PQHIQ5DBIWezKcpP5kfYTiJoshrh
	 nk+MYZJwCsTyfyFM7DUAvpAkE3ATFspvdxPJuXZEARW/Gt/CWu3jePJuRjH3XA5+Hs
	 t9re0otpfTSLx/3DLU0RZVoIC8kvwoT8YKMUAM2iB9d0AuS5YQV1ihI8Lpn5C4Kfny
	 Pc8HZ2SOtAIlvXMOm9KW15+Jx11rXJR3M7aixe1KEeWvlOyar4k0SpjI5yBBc1DAs0
	 rvLViwkaT9CJJKSx/josJ07wLtE3AJH6DOqIv2CJvXF6ugtzdjoHl9nDx32BBaX4tw
	 1a3K0SHGsjX6Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bbmGL0myyz4wxh; Tue,  8 Jul 2025 13:06:18 +1000 (AEST)
Date: Tue, 8 Jul 2025 13:07:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] checks: Document possible false warning for graph child
 addresses
Message-ID: <aGyLYBoJ0c0UcN-8@zatzit>
References: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T/dgtULPfiNkkQRZ"
Content-Disposition: inline
In-Reply-To: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>


--T/dgtULPfiNkkQRZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 06, 2025 at 02:26:38PM +0200, Niklas S=F6derlund wrote:
> The dtc graph_child_address check can't distinguish between bindings
> where there can only be a single endpoint, and cases where there can be
> multiple endpoints.
>=20
> In cases where the bindings allow for multiple endpoints but only one is
> described false warnings about unnecessary #address-cells/#size-cells
> can be generated, but only if the endpoint described have an address of
> 0 (A), for single endpoints with a non-zero address (B) no warnings are
> generated.
>=20
> A)
>     ports {
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
>=20
> 	port@0 {
> 	    #address-cells =3D <1>;
> 	    #size-cells =3D <0>;
>=20
> 	    sourceA: endpoint@0 {
> 		reg =3D <0>
> 	    };
> 	};
>     };
>=20
> B)
>     ports {
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
>=20
> 	port@0 {
> 	    #address-cells =3D <1>;
> 	    #size-cells =3D <0>;
>=20
> 	    sourceB: endpoint@1 {
> 		reg =3D <1>
> 	    };
> 	};
>     };
>=20
> Add a comment in the check to document this.

Hm.  I don't know the graph bindings at all well, so I'll take your
word for it on what's happening here.  But simply documenting this
within the code doesn't seem particularly useful.  Someone running dtc
will still see the bogus error, and they'd have a pretty long way to
go to find this explanation.

Probably better to simply remove the check (and maybe comment that it
would be nice to check further, but we can't adequately it from a
valid case).

>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hello,
>=20
> This was previously part of a patch posted to devicetree@vger.kernel.org
> [1], but as Rob's points out in that thread it should have been posted
> separately to devicetree-compiler@vger.kernel.org. Sorry for not
> realising that dtc changes go to thru a separate tree.
>=20
> 1.  https://lore.kernel.org/all/20250702085008.689727-1-niklas.soderlund%=
2Brenesas@ragnatech.se/
> ---
>  checks.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 123f2eb425f4..52d09fcf8d3a 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1913,6 +1913,11 @@ static void check_graph_child_address(struct check=
 *c, struct dt_info *dti,
>  		cnt++;
>  	}
> =20
> +	/*
> +	 * This check can produce false warnings if the bindings allow for more
> +	 * then one endpoint in the node but only one is present and it has a
> +	 * unit address of zero.
> +	 */
>  	if (cnt =3D=3D 1 && node->addr_cells !=3D -1)
>  		FAIL(c, dti, node, "graph node has single child node '%s', #address-ce=
lls/#size-cells are not necessary",
>  		     node->children->name);

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--T/dgtULPfiNkkQRZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhsi1QACgkQzQJF27ox
2GcC9xAAhAvHNofV7GzkBH/OdnfKkBr5UmcMuWko3CnBpJE0+mbbpVaAMrcYoI8N
eGp+UvqYt72c49VdGnkzShK4IEyjtMxtytt7j62/GJa6+N0MI+Iqa3JcrmVwkJu0
R2e+gq/V+MNpvGFJqqwoXuNRxWi7DoV/o9sEAVHnz4kDM2iFKxcJIi1wkZ1LDO6z
AsDR5LFZiGECZM8Ua/uQ0BHFdTKXNGLnoptDM1ABZmHSKicDMRuR5Za4Zk+EfIOY
nJcBK0IFJJHf2n/t6PEKJmQcauDY0hxeHDzyT5/GI7Ao+g0PPiVJ99RezmMtymHu
OaK+D025fUcvveYVf8CWdK3AzaLSakE4qNzTrhfgPIF+Y2SJy3dD7AdWpTTdv44g
4Gu+Ygd0ioDbUWBqyRuynml8bggCT2Ace7D/aUF+hV84a3w386uxKxh/5c/hkQzR
fSB1lDLUnhYlgfmr+0NG14T5LhhhOmPUbgI2WzahVGEsMHql0VMMbGDjjyNOZbH7
DZYc41/c59FZIEJCbYp2UfCUc3r55hfyLW7gQlA9TATIqipwKlcbvp3EkarPxbLs
oV50CQGPwSyNEmgDrC3aEd+pTgHq51dYR9jmFE98A57i58Q2wWvTrFIGQcYzc03Q
NG2bwRJjnVWX9w7ZkwfZ+JeY2yvJGAavZ2162kq18tMoW9Ar7e4=
=l1ny
-----END PGP SIGNATURE-----

--T/dgtULPfiNkkQRZ--

