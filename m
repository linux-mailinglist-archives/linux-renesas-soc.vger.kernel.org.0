Return-Path: <linux-renesas-soc+bounces-20573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568EB28A96
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 06:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03A88728D0C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 04:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8CE1DC9B5;
	Sat, 16 Aug 2025 04:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="uwuHC8yR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6883379EA;
	Sat, 16 Aug 2025 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755320091; cv=none; b=mf5eV5do79+uYU1Ndu5qgJG8tY9oN6WVGlCslEfp74p52bPqSE6vkxrqFhvzG82tofzHkmx8zpYZK2iGNgW3MoTF3Rdx3dGf7oQe3Thl0fbPn95bdSkSZNXm1Ru19rO5391Vruwe4q1wUiTi5c19A4Bk+X8/qcCCN1F/vtv3gHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755320091; c=relaxed/simple;
	bh=vL8iwBxTfU6WNY9aunw21eL/2ihfqisRuoU65aCYGeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcAhCGnSrqxHCYct5HUkVcIqiNQC404bwzausWL+BRPI52VBUJ12PQaUCfNBinT4h5O4rDe7aaCFanVPsQpiVY7JdUHl/bV2ODGO/a32jkZNw90bdDsepyJYT3eEkOzwDYZk0u/E0S70O1jHZj5bAD/+F0F3aSPIPIR4b/zxDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=uwuHC8yR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755320081;
	bh=fKKyN07Us7tLjivv7bQwpDstkfz/GlcUVjwFyzonJOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwuHC8yR6pPsChbESVirHDJa8pp4dtrXLzZRoDA9pkkuE7SdHK39vYGYFtN3S0ICW
	 jXfsq7jG+kcld9fVBh7pBcOSQzCwySVkrIaL2SXf+SO6kXODqUpN86TBPMlO354Ihr
	 ZZ1oP3C8OK++U6bbgUq7uS7v4Watx/5ZJuPprkW/RSGEeQvCOSGRoo1x63iI2BtR4C
	 xQbVnVIjSf3gNN8oUhVrezZwXgr9QJ6gas6yprAUm05Rtxt/3vjLecGQr9Qq3AqakS
	 xBxzW07gC1pEC9/jKRvGdvvt+aPAvs1CYXb9WYvbJqti/woRfC+HRrz8ueEvlHIpMJ
	 8PFz7htghfQqg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c3mqP0QrNz4xdW; Sat, 16 Aug 2025 14:54:41 +1000 (AEST)
Date: Sat, 16 Aug 2025 14:45:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] checks: Remove check for graph child addresses
Message-ID: <aKANBt7QzzMWhIaJ@zatzit>
References: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dRcwK7KI9kDaqcAz"
Content-Disposition: inline
In-Reply-To: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>


--dRcwK7KI9kDaqcAz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 06:51:22PM +0200, Niklas S=F6derlund wrote:
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
> Remove the check as it is somewhat redundant now that we can use schemas
> to validate the full node.
>=20
> Signed-off-by: Niklas S=F6derlund
> <niklas.soderlund+renesas@ragnatech.se>

This causes test suite failures.  You'll need to also remove the
explicit graph_child_address test from the testsuite.

Note that this patch does technically cause an incompatible change:
when I suggested removing this I hadn't realised this was a single
check, rather than a piece of a larger check.  That means that anyone
configuring this test in their scripts will be broken by removing it.
This is probably an obscure enough case that I'm prepared to accept
it, though.

> ---
> Changes since v2
> - Rebase after 6.17-rc1 merge window closed.
> ---
>  checks.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 7e3fed5005b3..2072e1ea82dc 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1894,31 +1894,6 @@ static void check_graph_endpoint(struct check *c, =
struct dt_info *dti,
>  }
>  WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
> =20
> -static void check_graph_child_address(struct check *c, struct dt_info *d=
ti,
> -				      struct node *node)
> -{
> -	int cnt =3D 0;
> -	struct node *child;
> -
> -	if (node->bus !=3D &graph_ports_bus && node->bus !=3D &graph_port_bus)
> -		return;
> -
> -	for_each_child(node, child) {
> -		struct property *prop =3D get_property(child, "reg");
> -
> -		/* No error if we have any non-zero unit address */
> -                if (prop && propval_cell(prop) !=3D 0 )
> -			return;
> -
> -		cnt++;
> -	}
> -
> -	if (cnt =3D=3D 1 && node->addr_cells !=3D -1)
> -		FAIL(c, dti, node, "graph node has single child node '%s', #address-ce=
lls/#size-cells are not necessary",
> -		     node->children->name);
> -}
> -WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nod=
es, &graph_port, &graph_endpoint);
> -
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -2005,7 +1980,7 @@ static struct check *check_table[] =3D {
> =20
>  	&alias_paths,
> =20
> -	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
> +	&graph_nodes, &graph_port, &graph_endpoint,
> =20
>  	&always_fail,
>  };

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--dRcwK7KI9kDaqcAz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmigDPsACgkQzQJF27ox
2GdY/A/+IdO9iesTEISDKregQbWkMOIm6GBpPffSazV7CH3PZe3X0yWDf7Cu1PAB
nMkn1QMtW0aaRteAC+L461ksw96FZouPG5milXvyxDh0B8O5W+xW6F/SnVRzu7At
fb3P8oyw+Iuh8H5kq7E9eyAnGD+EsfJPoPkYc3/SH/yIpkDwp2ojQ8N6J5VMbj/6
4p3RSQ4tVo+dRkGLV1Vx/aL+H3NsvE3quUoEJbsklUwRn7JKzjc8E87zceQsmwxX
cdFqLJzJGvSH9tTMsGQzkERe995AXYxfUPWW4YMcOhwZbD6f0QLe7ts5WfPDC0xm
MGQP/fNwvujuq+Bw11YJ+mkXYyOrYpFpqjj6qEn6V2d8Sx6auJbgpW5CesB/ZI90
nocg2Y7TtwmcRITlkdnFnHDCzy8q1DBshxntMlOcfQdKTy9vQz4R3uBaTD3LqtrE
9gTakxsmxyQlZtGnE+Ho17a/4C7lFYhcT2E+nlnXpJRz0PjNedHqGYvS+nM68ZMN
zFKjktuj2hu/uxW2lGIriP9ElUFzpNUfaVHPfcT3BLz9k4QQqU+9K9mESEqpPMJi
S9M/Mzh8KEjcd/12qer1SkLB83r59PXCuk1kTPhK4/8ITI7D+X7JXI9pi/jIhFaI
9WEVAibw6XlUTDLoHTqZWMg5Ko+GE1EXvQpixX9p5iG0gUZc68Y=
=iSUW
-----END PGP SIGNATURE-----

--dRcwK7KI9kDaqcAz--

