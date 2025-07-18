Return-Path: <linux-renesas-soc+bounces-19586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E2B09B79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 08:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BB63ACD9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 06:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CCF1DDC37;
	Fri, 18 Jul 2025 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="WCf1MxAn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5385A19E97C;
	Fri, 18 Jul 2025 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752820622; cv=none; b=bWwHuxjQb2xVp8xfpA1I1acgsOFoxrjbvXnBw4+nsJ9dDQMVkkUCpV15N2EmrTbpEdfBh6W1jlHERLWwe9Xph1xJEZm8UxClJbwVDISgkOJ+lqKlTigIqLWi881iD+nTYl9YDh3rXxhKLPSTKh0iquHwA7NVt+k4hITpJWFQyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752820622; c=relaxed/simple;
	bh=Yn5tixgNMWy0CjflvNrCiohZhufdpcEZmS2MuHtaHGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq6ORU3m4Nj4zkdJyFPBfeOEFMYcLj1I/5hdwJYIfThTk0k6o6HZYaKyhKpCLCCOzFHfqj9gh32x684x9IKj12LwbFtLX/Jh9eQ3LeX0gludGbEi8d8IXkq7B58hli+cPMCnULEr/Vd1+D2BcpQPwNpfFDk2IHndNjPjwy4wLwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=WCf1MxAn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202506; t=1752820486;
	bh=dT8zZRNm7rJs02CRQuSasEk+DScWKOaxZQII4d8zdmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCf1MxAnZDZHFc4G30kRAzUcxXmDwutQTMLfr00LSwbyLRScpHjgrhzjHBK3fgodM
	 g8ATG9i1CNAiZPnXg7slRkqlFf9CZ2GZOZJwCq6BHXh70R+boU6HhbPXGKNC5Mjef/
	 CduSiPNbS5Ul4qlVOXo/MR1ibiG7Npj2PPUz8SPlekFbmG11HXrFxwkhkT04cE9LJf
	 sP/giTpTLpnTCcarAzlWG9dqBQNyRL1X53BFLHbQ+cMsqpDFweJsfV0MLONq1+EREH
	 MHswqTXD77gOQnXuFdJ2EzyIxXPJictk8prnxPnz9MYpDYqm0P+FB6ptHwrh96ZF6m
	 Xx7OzTFKF6NIw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bk0QF74Sqz4xcZ; Fri, 18 Jul 2025 16:34:45 +1000 (AEST)
Date: Fri, 18 Jul 2025 16:35:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] checks: Document possible false warning for graph child
 addresses
Message-ID: <aHnrTCiDdQ9wq_lA@zatzit>
References: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>
 <aGyLYBoJ0c0UcN-8@zatzit>
 <20250708075155.GA1430987@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UdmWpyYxUIH9ED/S"
Content-Disposition: inline
In-Reply-To: <20250708075155.GA1430987@ragnatech.se>


--UdmWpyYxUIH9ED/S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025 at 09:51:55AM +0200, Niklas S=F6derlund wrote:
> Hi David,
>=20
> Thanks for your comments.
>=20
> On 2025-07-08 13:07:12 +1000, David Gibson wrote:
> > On Sun, Jul 06, 2025 at 02:26:38PM +0200, Niklas S=F6derlund wrote:
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
> > > Add a comment in the check to document this.
> >=20
> > Hm.  I don't know the graph bindings at all well, so I'll take your
> > word for it on what's happening here.  But simply documenting this
> > within the code doesn't seem particularly useful.  Someone running dtc
> > will still see the bogus error, and they'd have a pretty long way to
> > go to find this explanation.
>=20
> It would have been useful for me, I spent a lot of time questioning=20
> myself on why my dts files produced warnings and where incorrect. I even=
=20
> submitted patches to try and work around this issue before learning=20
> these where false positives. A comment here would have saved me that=20
> work :-)

Well, true, but you obviously had the wherewithal to track this to the
source in the first place, putting you well ahead of most people, I
think

> I think if the check stays the comment bring some value.

True, but I think we can do better.

> > Probably better to simply remove the check (and maybe comment that it
> > would be nice to check further, but we can't adequately it from a
> > valid case).
>=20
> I'm OK with removing the check too. This comment was first posted=20
> together with a change to demote this check to W=3D2 (instead of W=3D1) t=
hat=20
> have now been posted separately [1]. I will wait for feedback on that=20
> and let smarter people then me pick the best way forward.
>=20
> 1.
> https://lore.kernel.org/all/20250706123243.1050718-1-niklas.soderlund%2Br=
enesas@ragnatech.se/

Right, that's more useful from the point of view of someone building
the kernel.  But the underlying fact here is that the check is Just
Plain Wrong - it's giving a warning on a perfectly valid situation.
It should go.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--UdmWpyYxUIH9ED/S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmh56zkACgkQzQJF27ox
2GfoaQ//XXwEQX3NdjTMeWxtiCJ/uKxpkiD5nZ0eQP39UazBr1bcvfK+Iv0+k++O
Bzc0vo7Wfaq0ZlxQ/epP5iRo1W5bcRxY5zoxPmXlZH2dff4/zzjbGoKZCzxJgSZg
PENCb8Lpl3MMAnsRJ3OZ9ep0WV2npP96ks1DUE30btHPAq08rlYzvDbWhLWvN7q0
Ckn38wqGVpafy2hGqBdOoUpNh5hD2srB2Uw1AKn+90aE1jpaDLp/YPb42TWKURF+
/FhLezGtx5ZUNTtm2Mc3Hz6tNPUlq5tL4Nbhr9x4f42aN6unlQT7uEHI/pEjF50a
CQXW9q0oZNnsybBfV/3Gnjdo1nrvSylZutaxOdP/3W+5ujeXwVWvCZBsWWqAo/Uj
o1inFc4XzXyHirkTvlj/xd+p+jk/gb+mqW/eWWHmU7VB/vo8ttM8vPLXdz4wW/4l
mB+FoNQg1J6QBjyRDYa49DET1n9uz6VippGliaB5wtPurCttWDmfUro8pe0S0NCV
wzNKGmefaD+JQgELbSIQF8ty7NyvN28Y2uuQo1FXRD1D7iGUS6JN6L2T1UryPqso
rjBn76t4jqGgPuXnfJ3schACQod8Zz+/W9dIYZ237tcUQc+TKva9qS9+R/caF3wC
fjxB07eNIrlh9NuYsG0kPwvHYdfBNUS/2lx81sVFsbJI6iH4UdM=
=H116
-----END PGP SIGNATURE-----

--UdmWpyYxUIH9ED/S--

