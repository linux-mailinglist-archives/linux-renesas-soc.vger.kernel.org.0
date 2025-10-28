Return-Path: <linux-renesas-soc+bounces-23738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F562C146ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B4764E5D8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9927030B51B;
	Tue, 28 Oct 2025 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bXa+4AGT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE1309DCB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651796; cv=none; b=Z9+ASZLruVYU0u6Icd/8LnBDQwKy7IX68sXucWKWF2SohEmi0KWUzvJxJ9s2oqdBPsiSOuCodbwJww23PuQ3sQ1hl6xDY57TOAHs6SMZKjPvhRnMFtqHm6Y+38eJfuvG3yz+pofvDF4+1EQPyKhjSklEyfYtikkwwKnvtvSIEzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651796; c=relaxed/simple;
	bh=g6eycUx/Kldax1vkMEGIC1VfdKOz5rCMwiztDBfI5Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOwXff2kJ0c39quJIaEtkdff9NOo9fLXqW09cpLL372jwx9b9dAo11Y7HROAV9vudCAomUIbrSjtsjZFDAi5HmsCGKf7QihF0Yy8ciyN/0TjggQHcXcPE3bWkFnfg4b9Cu/kYelL45O01QCnTIMROeE8qHqvR1XFyxUfFynaD1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bXa+4AGT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=g6ey
	cUx/Kldax1vkMEGIC1VfdKOz5rCMwiztDBfI5Ds=; b=bXa+4AGT6I4IXLabFciQ
	UlkGK7JxOfRY51p31BN19DvfZaNtkhia+lOK16C+zNOtaXeoNLgMl23iuqtQ2MGS
	27HNYEPGHXXNIHwUBIFNZ+taVwH+5qphknpBatICzaoa0wKHMx3vm1Un2wdFniPu
	AOMukJoYOYWagEPg1GHVGrNaoNidsBRFS+ZfSQPkBNfKda+lO3cjDI1HXxHrvPZz
	LB0uNKDbEBKDYxsWp6MRleEs8h3R5Ka8FAQtVT7uSp1hmgVKGJO3n20h36cJoDtY
	3xIEzFHaKTi82/FUgsDn8IFbHB7DploGbtgtiTb1686Brzw73QiaP0jxi2mrZboC
	Mw==
Received: (qmail 3998992 invoked from network); 28 Oct 2025 12:43:11 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 12:43:11 +0100
X-UD-Smtp-Session: l3s3148p1@8dM9hTZCnJAgAwDPXyjKAONDL9E53Fzy
Date: Tue, 28 Oct 2025 12:43:11 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
Message-ID: <aQCsT-UMBpDiEiPC@shikoro>
References: <20251001104312.40771-2-wsa+renesas@sang-engineering.com>
 <20251020103529.0f948c67@bootlin.com>
 <aQCIJrKKM34FH3C3@ninjato>
 <20251028124109.3fa9cb36@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5pT7LdaQ/QJ2T/k7"
Content-Disposition: inline
In-Reply-To: <20251028124109.3fa9cb36@bootlin.com>


--5pT7LdaQ/QJ2T/k7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > This v5 iteration should impact modification done in this RFC. =20
> >=20
> > What do you mean with "impact"? The patch works fine with your v6
> > series.
>=20
> Oups,
>=20
> s/should/should not/

:) Thanks for confirming.


--5pT7LdaQ/QJ2T/k7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkArE4ACgkQFA3kzBSg
KbbqPRAAti0tUW8XrvbwgV1juT7MtZluzAtk+/iiWoTq4AViK3FSlu/KythpKuWG
QbvJejwAvDt5paDnk/Sjcv5Zoheldj9Wi8WPKShBQsxpgADKBaKxn5ftm4z8L170
F1APao/39rsNC5LLr81pfKwPkLrfzZv+1wjrA6Uguq3Y+n6E018ZOCcO1rxACJtx
rXPnvuus6fZuCRywa1Fm9HG+ip4SB0fhjq/ZAluYheK8RQcO6NTs/f2Nxp+ZhG3j
ytJz6B23v9eX95wLpPPUZQu32wd7Z9NUfuLjkl06v+ZtpMHgzVqm2zWWjM8mGvMW
OXWjfVZL2M7wHkMR75O2pnEGsf/BVNBOT8G1VoFu7/FG011L/0uWxzs/5Dlwd5Jn
H4xXO0GERUDz11omwcdyrGqb6abb7NvyYm9GHsCH3Geh8QN10uqRPIDCFkqNJdab
Vx6ZKVTwHjnAYyW3wDSReeRxXrNwyBC1pCAUQNzihkY/xCKrkFnKRWSIHM0MEb8r
s6WvqJ9ph+GsZbF702FEb+zIwNu4/BZnDkhzBTQa3/jfKmVG/rkNifB8xbSRrUq3
WS+tdqZiIT/SmjaiZ1FEtLbY1aasEOyWli6AekLQV97+3QCk3E1rTstcR/i5Gyis
s3ENabdVTJJ1LW0IsJ0Noe/XvLQTMeVVllxvEoXfMFwa5lJMYLQ=
=RlR9
-----END PGP SIGNATURE-----

--5pT7LdaQ/QJ2T/k7--

