Return-Path: <linux-renesas-soc+bounces-10624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC39D3694
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CC91F23F11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE6D199943;
	Wed, 20 Nov 2024 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gZg/oNrP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B28819C561
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093989; cv=none; b=MKO+U7H0O6q6KI5admFsXs14rQlybiT4ncoEzfAk+oVW5CX9VOhhNUQFUVaZWThEA9nrFfXl49e6ihVeNmTgtLEEM+NZrKaci7LikxM1atWv+maXctCtLoElk7kdG6UDVgZ3ZT9upDXs58hIV8Lsrue4H84bkNbGp9mH2XFrY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093989; c=relaxed/simple;
	bh=R8Ubub1j12s1dhe7s2W5vcgnwmYKVfNDdspRFk/jI78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGF2UwpitJSYxIwS6N2R16dd3RSSNcsBdammPR04KLjEVqgPBhW92Pv/QGo80iRt57AMLGHxS+eh88xRepJaz4aypQK4rmuBWv4dLP2sGjHdm+mCsuJPjg1RWDe0EHMRajKkxtQCLGivb7Hg8Q7J8sGW+8L8nWDEkuiKLJgHvao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gZg/oNrP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R8Ub
	ub1j12s1dhe7s2W5vcgnwmYKVfNDdspRFk/jI78=; b=gZg/oNrP/AoMiPDGFXQa
	mrclJ7vKsw+7Pqld2FGRelZZhYUDUT511qJi161bL3AjnzeN8SHxjO2kVIcmfRy6
	KbQxF0Orr02WFz2Is+/VnaNXpWbbzlVyfWO+sk7oLwk05EiOhbggSK0C3cZ1tmEY
	HhA4ZoBSWHazPKUpuOq0GptYYMEJSvr7Fbpn03mM++n+AC4G2x+guInkKxune+mu
	xxwmgU05JZO0Tb7LxOOKQ9KLYSVi0jStW/tflW7FgxAKOtUCsiyD61S0dRMK37ly
	l+vrQiWgDJ2Ni2xCnM9B0Puh0xN8AaxN6LMLvP/mvfbQlVObA+CxQl9fdbY4uaAh
	1g==
Received: (qmail 844402 invoked from network); 20 Nov 2024 10:13:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 10:13:05 +0100
X-UD-Smtp-Session: l3s3148p1@Zv+2jlQnTOEgAwDPXxznANR4Jedc6XSv
Date: Wed, 20 Nov 2024 10:13:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
Message-ID: <Zz2oIcGGmRouvZNK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sTpFBW7F+bKdsjaP"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--sTpFBW7F+bKdsjaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> How do we test this interface in linux? So far we use windows app to monitor the current.

It exposes values in sysfs. Check 'Documentation/hwmon/isl28022.rst'


--sTpFBW7F+bKdsjaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc9qB0ACgkQFA3kzBSg
KbaZGg/+Kj1qSFTLiKuuEimfluhwjb8/bltyXTYHrJe4XtoTgL52zdvCPZNCP/FL
dSp0Hr1foWXCm45VJCnBjTyAbU/g2IBDh9Z6ZkK++OJjNmkTc57pKk4928WSEZf5
Ri9b0xzTfR18HoGvVpbgSwwkgtqqUMdl6jFMKNN05Ss9/9ZIUxKem0+Ws76DmA4T
9BmE3pEIcoaaK3oGNsh8uDhkHX5lQCimWiWNDW8RvSbCBzbQEIBCaqBRwM4cXKNr
ZSP6h72/rinTZRiDR4wGET1mSTchQdEruK1UaICUQn+97F/mPJTIOTTKA2jCWceb
F94lTMUX1q75reCRht4v8zbe1kyapVOhnmvqt49TITsk2buB6FvNrHMxTA8GLLXj
psygfYsA4Kxer4NgGaCqUoSZ7jDWKhqCgNfMnsRVgZkCvOgqpPvM7YosYztO5jQd
va0PvN3ZFSMtfTV7hqvpIIjjBOn7f1kEZj9kB53Nov/TVek8mo0iI0HwrWVcZPVE
/fxenskByEC11HX7wk78E3b0+x/fec5gH9j46GUJXhqxxTK9Cvg9NbFqbYQWtkl+
ymhQ9SxoLg+6YZaRrMm+RSDfAou9OAEQYASODguMi/v51WrfyoXs1TTtkuD4A9lR
kCa9uNOqfrgGjqYCBfHOnjuuuFpn13SjB6i0HdWXJJyLqf2gfTA=
=ae60
-----END PGP SIGNATURE-----

--sTpFBW7F+bKdsjaP--

