Return-Path: <linux-renesas-soc+bounces-22873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264CBCC18F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 10:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABDA43B8F0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 08:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B29023C4E9;
	Fri, 10 Oct 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tw/aKEOF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CC256C91
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084395; cv=none; b=DG195kaDbDMrbxOEksp6YSPKJp8GVIFArqpBCD52lXL4W163kQeBIvrVEJMvr4eg03NZqPfDfUTbBOrIFHjBgwg7ie7uZ7YRaG5GsYvhcibC7rdxfTUnOGNAEnzDFYGCDSfUqZew9oJj7fx2So+MpsEf4dSAb4/LUosSPZtxrDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084395; c=relaxed/simple;
	bh=SnjZQPLxdOXsa48lEt5gzOZhrdGJoADrLSwnnLVOCw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyEAH/w5nc8e66mrCEukBhDdb7cAw+LuR6/ophWhNUnmtDLJRbXbBCsZOIrsM7LpxXUyGM+DHO2W5dKYazRDrAhOALt8GZHdb3KhL18diDTf28cLX8NADBHfhEmk47yahg1g9Nu8aTy5L/huxfeE5b13QXkHt+bhn2S214hGT88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tw/aKEOF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SnjZ
	QPLxdOXsa48lEt5gzOZhrdGJoADrLSwnnLVOCw8=; b=Tw/aKEOFe8g5TTsoPRu4
	c6CvJD/uLDDS/3lc5jVEtJJpw8vyE+I9nDoJLWjcAIluQofd6U63sPi/863rft5K
	ujupfdv7eC5igGq0ZCabPHgGWodIhAIsGyBwptt/gPw+8+P9JsNImLTsJwNrEa1o
	EvZqkIKGxGlNb4Z7xyKxb4reSdi8YAz06gGn/fthroucLWi/lt7GCW2ghJkNNmjz
	LweTwaPyxgv6Taa7PwlHmnD2tnbhPSrcfvCzDCyBcNKGIegBOPZcwiNJQVY+C0Zu
	9jBoWgU+iw4BaNRRBrYlK+sFsszlINpYmu71RYQXMF/m9ipgOGbZXBUHr6g5PCup
	6A==
Received: (qmail 1388560 invoked from network); 10 Oct 2025 10:19:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2025 10:19:51 +0200
X-UD-Smtp-Session: l3s3148p1@iOrplMlAYssgAwDPXwQHAL/S9V79e5yL
Date: Fri, 10 Oct 2025 10:19:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Message-ID: <aOjBp3bax6iJD_x4@shikoro>
References: <20251009181916.2431-2-wsa+renesas@sang-engineering.com>
 <08b7a21a-72f7-47e4-9dc9-37a7316f94d5@kernel.org>
 <aOi8pQuHfduf6-FX@shikoro>
 <6ae23e44-2263-4cbe-aae1-d056597cd543@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LWoOXpGGf7E/uV/P"
Content-Disposition: inline
In-Reply-To: <6ae23e44-2263-4cbe-aae1-d056597cd543@kernel.org>


--LWoOXpGGf7E/uV/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Adding this PMIC to trivial devices would be my fav solution, actually.
>=20
> I meant, that not being complete is not yet problem.

Ok, good.

> Heh? I said your numbering is wrong. RFC was v1, this is v2.
>=20
> Your broken numbering breaks tools. Try yourself:
>=20
> b4 diff '<20251009181916.2431-2-wsa+renesas@sang-engineering.com>'

I don't have b4, so I can't try. For 10+ years, I have been numbering
like this: RFC, RFC v2, ...

And once the patch leaves RFC status, switch to : PATCH, PATCH v2, ...

It still makes sense to me and noone complained so far IIRC. I can
switch to continous numbering if it makes other people happy.

> If you have it in DTS, then you need the binding. Just write it as much
> as complete as possible, mention incompleteness in binding description
> and provide reasons of incompleteness in commit msg.

Okay, that was my intention right away. So, I will do that, add
unevaluatedProperties and fix the spacing and we are good to go then?


--LWoOXpGGf7E/uV/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjowaYACgkQFA3kzBSg
KbZIhw//eJ1zzZj6d85/kzsbniaYlggkuvn+Z2ygBTA+zR+hyqWY5g3DqWbt5yAO
f/yNniS7N1Tag6/ERSQ/uMJhldB0p8uTAtYbZRr7Jd4uDqSDOKEh6Kf177CFfNKj
Dif/m1cYqSGj5ncN1iRicIuhVOK34GoR/xnPI2V1mnrSy4yzpRZCBScOOmID0PaS
anxdMy+1NpDPNLmcq0eDGJS/+eFoVYmKeptSNBLmtP77AgZwtAHTDZaPpoZ4zFE8
YvDnNZFnIOn3IHn3+xXI/5vHZC1vYgUUr0IaSm1/7ZceBfqdSIwycsE6rjZDjqUb
FNOuear6fTgagV1QA+0jArkWGLetuvP2q3emoSHKxjpblV0dhWLSiDmMfTcqp1Cs
kpMDoqyuuTd4bI3oK9PsCJYP7wdfPi1TwFEsZENY09DWtruSiqOVAM+qSG9Q/HpV
w0MfzTEMycwjYqrQ+E9oI1FZzhxGB8INuVl951cDO0M2/U9IyP0eJqMPXY+uDUSp
P6N/uTW1BUYXgbFda+Ty9QO7yctNHH038evY21C4NOEq2zlR481GpRyQPs76ksLy
1qFCNLyTEzlHmuaNqlIzSZU7OGEd6tCAz6kMVtxd9vGpuNml6NOx30Pj4ioAFsG1
sJ+eGnNZDoqKoYy2FHx39tKFJC+pc/nTnz1NUaRvP6Ogs1i9394=
=Loy2
-----END PGP SIGNATURE-----

--LWoOXpGGf7E/uV/P--

