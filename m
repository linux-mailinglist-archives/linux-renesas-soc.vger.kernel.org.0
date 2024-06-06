Return-Path: <linux-renesas-soc+bounces-5927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F065F8FEFCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 17:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DA4C1C22DD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B5519DF73;
	Thu,  6 Jun 2024 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDPRnO+p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E01EB3A;
	Thu,  6 Jun 2024 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684724; cv=none; b=TMc95ghLtNK1qNUkfjY7wxG9oWweYVasOfVDuZ/g1PT8QntyxdfSiPNblIVNK48w//iV/4ZXahDwWKwoza0oOvkc0pVXjE0M7IGrPZwvx0uqGCLuGDG+TFOBKdWlf7Z6EoYP3LwRCl64R+atFUlnrfIGsNsCymY0HfMevhst0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684724; c=relaxed/simple;
	bh=PRwLGYovMSOZLOdr9ird43QgRk/4eRVu/yuyjg0HH2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipy8vNiqtNoq4uvzz5jTdlucAiUaNMTMdhmI9l6g1BHZvxqD2NfFxNEkRVs+BtqbFkJP4R8iyIavwA8pdW8rabnIxS8ri+zD1ImUeQj4/Pn2KqdCEGE1Fmgj/frfQrAHUVnzL0YEpoO6O8b07swLAeFJ3rny5IuLl+0UKpay6J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDPRnO+p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45ADC2BD10;
	Thu,  6 Jun 2024 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717684724;
	bh=PRwLGYovMSOZLOdr9ird43QgRk/4eRVu/yuyjg0HH2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDPRnO+puB64OOwO9azNiTjt7xJDjsraLNB6eonI4q58Kxy+F39fyzG1QGlUKwlAL
	 jhR0iweie4sNriDWV6e4VDvtPuMoR6o+AytaUqPlJd37IesoRKtGu8AjmnuiUSZchU
	 t/Ph3tNieVMPPjw+Hr3Zytbz33npRrSUlNX4h8U8bOeZapr1hEf1UUujQSKg/mUsAj
	 4INvJHigvrIJ+SY0oCBcZideXGVF+pd/z+O2gm+pz0aFdnKVP8bKS7rz+GmOUBCJr9
	 WSz1f/GM3RNbEUQFJk7TXqhGdFwLOecChJyJNiolXxH6xo2lcQNJoTExs3vYV1lL7b
	 4qY5Tz7NJOzYQ==
Date: Thu, 6 Jun 2024 15:38:37 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH 1/4] regulator: core: Ensure the cached state matches
 the hardware state in regulator_set_voltage_unlocked()
Message-ID: <c7f4dc07-5a78-4cd4-8f3e-063dec5d0bc4@sirena.org.uk>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <22664e29-4c7a-4544-ad32-25c3d7e342e9@sirena.org.uk>
 <CA+V-a8vStea7RZWNXjJLbuibz+-53KT9=5g-P9N4fUrbqjj91A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k+c8wgxJKe7M4G9M"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vStea7RZWNXjJLbuibz+-53KT9=5g-P9N4fUrbqjj91A@mail.gmail.com>
X-Cookie: Simulated picture.


--k+c8wgxJKe7M4G9M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 03:12:42PM +0100, Lad, Prabhakar wrote:
> On Thu, Jun 6, 2024 at 1:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Wed, Jun 05, 2024 at 08:49:33AM +0100, Prabhakar wrote:

> > > Driver code flow:
> > > 1> set regulator to 1.8V (BIT0 =3D 1)
> > > 2> Regulator cached state now will be 1.8V
> > > 3> Now for some reason driver issues a reset to the IP block
> > >    which resets the registers to default value. In this process
> > >    the regulator is set to 3.3V (BIT0 =3D 0)
> > > 4> Now the driver requests the regulator core to set 1.8V

> > If something is resetting the regulator like this that's a problem in
> > general, we need to either have the driver notify the core when that
> > happens so it can reconfigure the regulator or have it reapply
> > configuration directly.  Obviously it's not great to have that happen at
> > all...

> Currently I am seeing this problem with SDHI driver. For the voltage
> switch operation the MMC core requests the driver to do the change and
> similarly the MMC core requests the reset operation.

> > Having the core driver notify the core when that happens so it can reco=
nfigure the regulator or have it reapply configuration directly.

> Again doing this would be a problem as MMC core also maintains the IOS
> states, reconfiguring the regulator would cause conflicts between the
> states.

If the device can't cope with the requested configuration being applied
why is this going through the regulator API at all?  This just seems
quite confused, putting a bodge in the core like this clearly isn't the
right solution.

--k+c8wgxJKe7M4G9M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZhye0ACgkQJNaLcl1U
h9BLqAf/UG65PeifE6tHyWrpslKd/R60qY5DdOnrVWie0kqlq5nDZHQH/T+YBOLN
ZnHdOfBmTHARgPc08z9ronRWn0YzjG3TwzclbJE6q7/sW793wynrKhhbSZCQRemS
aG1s81H6ARFCrIp1esBflxwaeVtsaYFYTKtLiF46dYQjRjiOgeFj5C9ECwe47Ndn
3zbm7Fn9MMWfjqyK3kOKLrnNoNxLjjeKtCvNhYNKRNogVxPBcFlz8JhY0fP8qhsa
aEftWbjuIUYATdQG6rvJqrvfYXdeZZN3SWm6UAuMLWwz2r0DnL9fw6RIfryfdhq1
EXlOvf1ya0E3D7poZG/K//OMoerQbA==
=AZYv
-----END PGP SIGNATURE-----

--k+c8wgxJKe7M4G9M--

