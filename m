Return-Path: <linux-renesas-soc+bounces-10181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363A9B33E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 15:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 915DBB2145C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 14:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196481DDC3C;
	Mon, 28 Oct 2024 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6LNTRWx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA01DDC12;
	Mon, 28 Oct 2024 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126597; cv=none; b=VqPGVsiAlmf2Uqdki+XzRzbPz+6QhY/PpcE4ZI1NbJt2Q8Pk/PWyJzQH1UUaess/KCIFkjIg1nMeBFDDeYuDvzD162MTpn2HL+NGJZmm4zAHO2qxSpQ0t4cEEwNAfEyhAYHglMk3KceKrwZXLAFVsu26RnnrINS3cWQpgV4YL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126597; c=relaxed/simple;
	bh=QUNHU5uQJYIxQem1qQpwT+6frWU/tJvtaIRQDx8k1Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqXX6OM/N03do4CsVa5IKo0cOUx0KIg8X2CzYYNSTpQEYPMFxEwPOBiAa9GsHlTHI+NyMV/JfFhpd9RPK343InupRRDtU2AvjENPceQNAlXcllXFmAVNvUvUsVeiLYDxjgUdV1lBNJHWa9WOfsSQI7RxvvePZ3g4w+A85vX2m8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6LNTRWx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58341C4CECD;
	Mon, 28 Oct 2024 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730126596;
	bh=QUNHU5uQJYIxQem1qQpwT+6frWU/tJvtaIRQDx8k1Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6LNTRWx53KAmrZ01RbBWMPL2z37zNzNDADhBZuSUCT83/64RZOLACafwvHwnqWKK
	 gdqugtVqdVPeMst0UyJz2Iw0L5XCSB1UU6rcUNSxHU1TMoSaVXaPqw59/b3szEG33p
	 I81XLabRtia8leXGzpj3NHlX0mdEjhnqlcD3ldQ7cb4ZeHx8tjm+gmYgkaM9jpQnSZ
	 agUxEsLJ39eUBcOyg/m/clstkDU2ttqZ0WBfgSb6j7J2R+7PS9KFJdrcH2U3gQRwZ8
	 1ZyfU75GOGL5WH6qnkA3WtdZOm44HuvvoOti7yf01lrAIeEi0/daR+lRBDZz1Mtal0
	 Lesm2H/24wmkg==
Date: Mon, 28 Oct 2024 14:43:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 4/5] MAINTAINERS: Add entry for Renesas R-Car and FSI
 ASoC drivers
Message-ID: <e2d8c84c-aef7-4864-a98c-01dc1041915e@sirena.org.uk>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241025150511.722040-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TET4juRx1f5CM+Z7"
Content-Disposition: inline
In-Reply-To: <20241025150511.722040-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Remember the... the... uhh.....


--TET4juRx1f5CM+Z7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 04:05:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a new entry to the MAINTAINERS file for Renesas R-CAR and FSI ASoC
> drivers.

> +RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
> +M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +L:	linux-sound@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org

Morimoto-san, I guess this is OK for you?

--TET4juRx1f5CM+Z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcfov4ACgkQJNaLcl1U
h9CwtAf/bBXKaB3WSIVpUHHM14tBw0c6TAT5xy2qyNEn6s9oCxaG+TSgYO1hb437
2LunpEaVofrjQegDoZhfSmtH71Q+c4GdORaM/jdXnHoYtj8IycvNbmAKvVVO58Yk
Mlht+HEG3/crEu7bLMN5uKRSrSH70cBvUyIy3wN98ck4m8oPirenJqyO9I+FFacu
rWcQasl+jL1GDVt188ei5ZJL90EgvtUvlqgxfwo4mDzTBpsQgIbxAXRJakHKwG3O
DVDeoQzrVrYBIAavd5H9QNrzdWkH5G1nxSwucG+M539ltuIUvn5aDMTTMfGw/0Yq
Dfc80L4FbCmA1U40fgGrErNgrHFhsQ==
=PDWx
-----END PGP SIGNATURE-----

--TET4juRx1f5CM+Z7--

