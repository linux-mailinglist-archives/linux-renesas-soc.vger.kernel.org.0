Return-Path: <linux-renesas-soc+bounces-20586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3876CB29237
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 10:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B54A2485924
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 08:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2052721883E;
	Sun, 17 Aug 2025 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="sGBDKhxp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CA214A6A;
	Sun, 17 Aug 2025 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755418859; cv=none; b=q4QzsMboSV567Pqsg5immlxzZwsS0kdkTmWhjDlzYWwnZTespTJRi2UKPJ4Thb9z8e4LVDqjeR5aAuPEqtl/nym6sW0W1+9gV8N/Ck3xJxrojMXfGa5s5UGxJ4f2cDWvVZiY45sY387XS6O6JxNiOMRNQmpVF5Nw9preWba5l6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755418859; c=relaxed/simple;
	bh=qO3087Kw7AH7NhQ4CUue3Mj+7/sgkaTGQF1lSP/DNBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYG4PINfrqCb6QakdBf1IODcMiPbILNns2DP7YVyKeaTgRKIcDTpNzY2hx8kGSEmthbQse0ePAnfjx/hMDwTM3F2BvJ9At/D/rwL1UXD8EsjS6q4wmIGFgbS39wHLM/hxujhShzJ/UyBTECmSDpK+GuxPlEMUgP+BFIF1cC+tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=sGBDKhxp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755418848;
	bh=yZcf1st+GShOcHZFzlGYJ1XFZluuV+4iseSsh8FCDMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGBDKhxpzOgJgh0RHff9n1sJLtjmme2+udZ2F2h+vo/TUzA6oumBSvyn9WT6XdDWX
	 iOTYMm65/vWBU0ptHyFAJl7Ix2L+y1uUT6BsdXgOuAGlfNt5JpNDDO/Ew3sLqDfbjI
	 HvG+g0W46QjI7yM2oU0DgFh/lR1OG+rySJauEgiQ9CVR9UdFuIAftVxlQ6q/CWU8zJ
	 gVteCqFuBEr4sfb2B4gmD1ezrhSJ/IRfPsyC91gHVQlvgQQWR/cC+7/OguNSshxMQO
	 iYlQfd/T3wuhu7rwHUFjn57An7NSMSVZa971enLgfv1l4tI0t/i3zrp52NgGfkyRcI
	 ocFCV2ODaySRw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c4TLm0x1Rz4x4w; Sun, 17 Aug 2025 18:20:48 +1000 (AEST)
Date: Sun, 17 Aug 2025 18:19:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] checks: Remove check for graph child addresses
Message-ID: <aKGQohIuFcK20AxL@zatzit>
References: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
 <aKANBt7QzzMWhIaJ@zatzit>
 <20250817064259.GA487241@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+0mlQLpYAcNE0GuG"
Content-Disposition: inline
In-Reply-To: <20250817064259.GA487241@ragnatech.se>


--+0mlQLpYAcNE0GuG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 08:42:59AM +0200, Niklas S=F6derlund wrote:
> Hi David,
>=20
> Thanks for your feedback.
>=20
> On 2025-08-16 14:45:58 +1000, David Gibson wrote:
> > On Tue, Aug 12, 2025 at 06:51:22PM +0200, Niklas S=F6derlund wrote:
> > > The dtc graph_child_address check can't distinguish between bindings
> > > where there can only be a single endpoint, and cases where there can =
be
> > > multiple endpoints.
> > >=20
> > > In cases where the bindings allow for multiple endpoints but only one=
 is
> > > described false warnings about unnecessary #address-cells/#size-cells
> > > can be generated, but only if the endpoint described have an address =
of
> > > 0 (A), for single endpoints with a non-zero address (B) no warnings a=
re
> > > generated.
> > >=20
> > > A)
> > >     ports {
> > > 	#address-cells =3D <1>;
> > > 	#size-cells =3D <0>;
> > >=20
> > > 	port@0 {
> > > 	    #address-cells =3D <1>;
> > > 	    #size-cells =3D <0>;
> > >=20
> > > 	    sourceA: endpoint@0 {
> > > 		reg =3D <0>
> > > 	    };
> > > 	};
> > >     };
> > >=20
> > > B)
> > >     ports {
> > > 	#address-cells =3D <1>;
> > > 	#size-cells =3D <0>;
> > >=20
> > > 	port@0 {
> > > 	    #address-cells =3D <1>;
> > > 	    #size-cells =3D <0>;
> > >=20
> > > 	    sourceB: endpoint@1 {
> > > 		reg =3D <1>
> > > 	    };
> > > 	};
> > >     };
> > >=20
> > > Remove the check as it is somewhat redundant now that we can use sche=
mas
> > > to validate the full node.
> > >=20
> > > Signed-off-by: Niklas S=F6derlund
> > > <niklas.soderlund+renesas@ragnatech.se>
> >=20
> > This causes test suite failures.  You'll need to also remove the
> > explicit graph_child_address test from the testsuite.
>=20
> Thanks for pointing this out. I'm no expert on DTC, this is the=20
> references to it in tests/run_tests.sh? Is there any more locations I=20
> should check?

No, that's it.  "make check" should run the full suite for you; good
practice before sending patches.  If you want you can use the github
MR mechanism which will also run the tests as part of its CI.
Old-school patches on the mailing list are fine too, though.

> > Note that this patch does technically cause an incompatible change:
> > when I suggested removing this I hadn't realised this was a single
> > check, rather than a piece of a larger check.  That means that anyone
> > configuring this test in their scripts will be broken by removing it.
> > This is probably an obscure enough case that I'm prepared to accept
> > it, though.
> >=20
> > > ---
> > > Changes since v2
> > > - Rebase after 6.17-rc1 merge window closed.
> > > ---
> > >  checks.c | 27 +--------------------------
> > >  1 file changed, 1 insertion(+), 26 deletions(-)
> > >=20
> > > diff --git a/checks.c b/checks.c
> > > index 7e3fed5005b3..2072e1ea82dc 100644
> > > --- a/checks.c
> > > +++ b/checks.c
> > > @@ -1894,31 +1894,6 @@ static void check_graph_endpoint(struct check =
*c, struct dt_info *dti,
> > >  }
> > >  WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
> > > =20
> > > -static void check_graph_child_address(struct check *c, struct dt_inf=
o *dti,
> > > -				      struct node *node)
> > > -{
> > > -	int cnt =3D 0;
> > > -	struct node *child;
> > > -
> > > -	if (node->bus !=3D &graph_ports_bus && node->bus !=3D &graph_port_b=
us)
> > > -		return;
> > > -
> > > -	for_each_child(node, child) {
> > > -		struct property *prop =3D get_property(child, "reg");
> > > -
> > > -		/* No error if we have any non-zero unit address */
> > > -                if (prop && propval_cell(prop) !=3D 0 )
> > > -			return;
> > > -
> > > -		cnt++;
> > > -	}
> > > -
> > > -	if (cnt =3D=3D 1 && node->addr_cells !=3D -1)
> > > -		FAIL(c, dti, node, "graph node has single child node '%s', #addres=
s-cells/#size-cells are not necessary",
> > > -		     node->children->name);
> > > -}
> > > -WARNING(graph_child_address, check_graph_child_address, NULL, &graph=
_nodes, &graph_port, &graph_endpoint);
> > > -
> > >  static struct check *check_table[] =3D {
> > >  	&duplicate_node_names, &duplicate_property_names,
> > >  	&node_name_chars, &node_name_format, &property_name_chars,
> > > @@ -2005,7 +1980,7 @@ static struct check *check_table[] =3D {
> > > =20
> > >  	&alias_paths,
> > > =20
> > > -	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
> > > +	&graph_nodes, &graph_port, &graph_endpoint,
> > > =20
> > >  	&always_fail,
> > >  };
> >=20
>=20
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+0mlQLpYAcNE0GuG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmihkJ4ACgkQzQJF27ox
2GcZmw//cwScFxuizGVPeFIwJRDFMKp/b+GA4anO79Wa7NZ5YmvjH//KsKPl3aJe
y7czk+70BytEUeHfECfCoTffZD/W4kfH8SyChz+4T7F9bpLGJpzBg7rciUG8QVXp
xmgEZYGxtIY08Qbh9buDg4PL2Ms71bgaER+PUADxL4pkGVYds1VgCohn0+edAl5a
tHqBYjevRULM/7p8i4ed7UR18gsovv3s9/fK8WsmlCoPw39kBZYdz5sw/Eby1EaJ
YM2vSb5oDZmbZPZKJz87OYDUa3T26q93ibyurQVXzPjBWVH/uiT6GIorkF49xqPq
BkLjzfpbhCMwbmTS6U6FWi2g4wjTpZ9d18vf5WJSqVWKODtyJy32TJ9u2EupL3FG
IWCo1p9R70qiWZ+lWpOedHE0D/tGfmEYTW5Sig/Oh5qDZexsWMR5p0loQ84raArt
VGCfxzwdjBfewkZurTd6XRO5TgCO9I1DB7Eq4B1C5nGOmvqC7FyDkMEHnHnml/Se
jQWl4KvybzGvEhIPcwI+TbtmQpThCkRxvKoDcqupQfvUMMpO14diFrZMZ63I35/d
tjzErSy15zMH5oHeMriYS1cYY80+/7jidlpHdTNFHzAsn/9i5j7cd0N3ywWO5HTB
v3XEkuviibOB9TkuiD7xtZlBZrkCJKZzQ9R3CPnqBP4cqmiVRD8=
=ZRj/
-----END PGP SIGNATURE-----

--+0mlQLpYAcNE0GuG--

