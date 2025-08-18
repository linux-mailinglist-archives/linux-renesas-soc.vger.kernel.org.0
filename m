Return-Path: <linux-renesas-soc+bounces-20659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA63B2B4CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 01:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 586634E5F08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 23:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563C42472BB;
	Mon, 18 Aug 2025 23:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="rPNEKBDJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30181223DDF;
	Mon, 18 Aug 2025 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560310; cv=none; b=VrCmaadPp0nSHcG9jtlZ6JHvyPM1YRtQijOVigFjl5vDL/UYucKCnOuvX49HdjS8R4e3naq6yy+GAsHPjWiU4w0FXftCSaPfNMkPbAS2c/aWqfsGG8J3EM5CuBxRX49NIn/0SLBoMI+xe+644OYhYXbUpTHn6n0D/NCnYE/GXBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560310; c=relaxed/simple;
	bh=pN+fLPza9d8xFeOxfGYsUufaKwLGKDo5wINX8+GMicg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSK/gks8BaUdw1DI7itOKgtLRHYKoJm6E8hjZIJHLoFyiKpZuARePpzHWVcfRTNwtJy2Qwp9HM0B+tkc6Kv1D+EvlmohNrGuj1bYHqt/8D9Vkh0cpQw8U2YfxUkenmRHVpWrAF82uzsp00SAyhXEqPXmmcv+LtvXlkS9xp7V2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=rPNEKBDJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755560304;
	bh=J0ur2pZPqr81hykQJpaJMU2DsQ4hgxYdQUQzFXA9KjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPNEKBDJSm2246OiCZW6dcxGGh5KZIAEqwGLlBMdkObhYvRSM5pprHcqKRP3SUNwF
	 /5mnkVNBWWpvjWSPR9DJ8xMwu02RcwR0S0SEnjT+rkTOaB2uVWYMcQNebMQvoB5HV9
	 RurPtab2ahAcQk1qY0ckHRHTIJcuwotbon+4qw/cFcdus2e44ykvy8+0UMOd1SuJUQ
	 yG9EpeupchxzZft+O6h2uQ0lg6sJ46rZOASX6ZfRbeYs9ES/caOJ1yrjH3zw+dpf0/
	 uqEXnixgBvWbz2PzycG8EGd5hwToJ4kcwjoxnjUOhqhWLxCcZqUQzKZXWM6sixvo64
	 7r4i2kcE74bPg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c5Tg42bzgz4wcg; Tue, 19 Aug 2025 09:38:24 +1000 (AEST)
Date: Tue, 19 Aug 2025 09:37:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] checks: Remove check for graph child addresses
Message-ID: <aKO5RosG6zeIjZKu@zatzit>
References: <20250817133733.3483922-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SzjeGNDuY6Ct0wUP"
Content-Disposition: inline
In-Reply-To: <20250817133733.3483922-1-niklas.soderlund+renesas@ragnatech.se>


--SzjeGNDuY6Ct0wUP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 03:37:33PM +0200, Niklas S=F6derlund wrote:
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
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--SzjeGNDuY6Ct0wUP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmijuUUACgkQzQJF27ox
2GcWdQ/8Cbv3KIEeAoJVRKSPZ6SgNZu/WXxQ1kkIdJhhu9ygvOrJKmGaGIF0R++5
/rXUpgpdmUwQpr+NiQFtHpZOKYXt3VjEWYx0FrC8NCWmY2aZKLsxE5P7kf+2L6em
zvrZ3VNFHipvKGxTXM3juCST34AuQ5tU+Gbey/yBx71Fg18BQMdFEWAELkn7l5g6
6ekZs++Il+LQT8x6iXIsKtEIJMGeJ4q8djSz2/nbRKXu9AnBiJTRpfoMNsnF7KUB
Dak4eTpivLmcdYVW47O2b8Z54rHELu5ZhWT1AjskgZqfO47AgtRtvo1ysuxcOfgG
z9BQCMJ4SAGmAjSOpqUKiGoF2njXtFo0dq3os2+0UnqhLFTEvkpgQR77hSHLPpTL
WJFsuktOmJ+phhs0FvHhXsG8vnUgpLk4nWJ55IQrSzIVkFS8IoLpyXV7ZC3WFXhQ
OqP39opqSqKQiNmLKFxC+EzRrheTezg6W4EkX4r5wpReO2h/Bxq67sOYPo+tG1w9
AATwmN5hAYe7KInq5W5eu/+Hiz20G4P87T0b7vkvgI34grsH43CbWzHjRzMWqn2+
LTnZPdibgIDylyXK4ET/uDZ2uwxI3MY4k4fSKzIodJsUDnDdFA5meQwLa6wwYUeN
ARBPh7nUh/IlpbxG6WlKTHhIjT4zRKYpXCOePSrc0RFbB/+CAM0=
=xcNO
-----END PGP SIGNATURE-----

--SzjeGNDuY6Ct0wUP--

