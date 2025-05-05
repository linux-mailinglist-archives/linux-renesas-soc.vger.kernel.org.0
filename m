Return-Path: <linux-renesas-soc+bounces-16696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EFBAA9D1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 22:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875113B8E19
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 20:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400CB25C81A;
	Mon,  5 May 2025 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UIN2p2jr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592981B07AE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 May 2025 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746476843; cv=none; b=Z0dm+3y4u3YQvdX+qG1Gl9SwCu8RzPqbQzxYQFpWd0lPTLDw8BvxxvcqA6AxHoPkryXl167XVBo8DurID0jqlO3q8tnYJOFsSdgV3/SJWGW4hs8giZPlMu9EaadMpcVBLJtHvT4pD42ojhzYfiT7c/1gsiKf11JX+rM4CQqjx0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746476843; c=relaxed/simple;
	bh=Gv4IZdvwFAlcynuNtzzAfil15jVh/pjcFz9j3dEcv1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLhU0xJAvP9fLn/MS/FpOiMebFWoJbywcrl5don98GHx9yzIA9ApWh9/NTUCqLMXNwnGq4JfNvYSEW7AWkrnCcdGAZwk9QzcjrlxJI6Mlb1lIAYN1KZIpzicD2YdszVB4uNOJWM2PN4QrG8Btg7Z17s1BlmRAtf/JY4QxjsNeEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UIN2p2jr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hEm5
	1459XoFERFFsEF7nofrhCzEKQ7WoDM7uXL5EKf8=; b=UIN2p2jr7X21tWZy0iyV
	P8GuLMLZAeH/xpEBIJRl2J037jd6xC6mh9IPPBCG0BL6BOZATMTIWo389nI9zSgz
	UZqCq3uCK5PxM9DnX2ca0v8h2Uxi5nE/DgaHD0xr624o8PI+HryTvxYP8NAgccql
	GiSGs8yJDXGlA38x5rirA7o+oFE1ZFYxnhhaBl7ltFy/J44GsEBU+BuBHhGnq7rp
	t38CGAHDmfuGP2Wp6LQMXczez/OV+QN/0GdDK2jUzMD9fAKlIT+CYxdZwilV0NVZ
	FeClO+OSjwKwwE1klkdFMnBWflPhZo4y4m/0rhQdrWEPkjU31DzqXzrCX4R+hHfR
	6w==
Received: (qmail 2656059 invoked from network); 5 May 2025 22:27:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2025 22:27:10 +0200
X-UD-Smtp-Session: l3s3148p1@ZPgXU2k0+NYujnup
Date: Mon, 5 May 2025 22:27:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB
 host port
Message-ID: <aBkfHudni5WoJLtt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250425100129.11942-4-wsa+renesas@sang-engineering.com>
 <20250425100129.11942-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdW2NHeatmSr4ePj6fPcbT5XNZJr967L3NJ_i6xYwgxaBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IYBwt3Y2mERE+mYx"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW2NHeatmSr4ePj6fPcbT5XNZJr967L3NJ_i6xYwgxaBA@mail.gmail.com>


--IYBwt3Y2mERE+mYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> According to Sections 10.6.5.1 (1) ("Meanings of USB_OCI and USB_PPON
> Signals") and Table 10.131 ("OCI and PPON") of the RZ/N1D System Control
> and Peripheral Manual, USB_PPON2 and USB_OC2 are only used when both
> ports are configured for host mode.  When port 1 is configured for
> function mode, port 2 uses USB_PPON1 and USB_OC1 instead, so you
> shouldn't need pin control for USB_PPON2 and USB_OC2.
> However, that does not match the schematics, which show that USB_PPON2
> and USB_OC2 are wired to port 2's power switch.
> Can you enlighten me?

Both pins I enabled here are routed to the Config CPLD (check the DB
datasheet, page 9). This handles the configuration and routes whatever
is selected to the EB then. The pins on the EB are always named PPON2
and OC2. Because these pins are always routed to the CPLD, I think it
makes sense to have them described like this always. I didn't see
another way to use them anyhow. It could be argued, though, that these
pinmux properties belong to the DB, then. Maybe this makes more sense?


--IYBwt3Y2mERE+mYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgZHxoACgkQFA3kzBSg
KbZY6xAAiXI2SnEAFk0HxPbwMl/d30Z+/XHF1s45giYOOIj3FI9cPvLnsX/QWhMl
iRvC10JorpiF1Ry2NkUj9g8znexK4KpeWasVgL3bBeuGx4BTbl2KJ6e9tXajVYYY
so5/iykN0TrnzOy46DO/khJkSxHzxTl56/T4SOhzTgBOVerWsHsHi25vUYS9bVUl
ZCLBhzHDtnfYA4QfA59N/57XkA1ESvLcWThcboxjpPF+RaY2GwhrRyA/qVr0v0MF
qtjYtat4t/XxqY8vuZ0CkKNtZKzoQwkZbiBHaX6ZUfSdHCBC/npqD6/V1l8C4Bcy
X89iR6uL5KecEE23HOjI2uub5G3ap+ApDUzm9QZK1h1OvZlyvDhTvDYSBLYrazrx
i4tFyzEYOLVRAZkaD/5N78ORFgSgw7KTCNXfcbvJwCuy4jNjDdsfogEa/lGqkLZ6
R+hMvmKznywBmiXCvYufSu40qCwpFUEga2fm0JMVAtVrZn/TVz79LVYMchuHAZlA
+Dw6+FQG8kyvDnPf9U4U+qS9WniWl9vIfSDSahyQGyCGVpT8uWsutf5AKOR5fweC
vZW/tWSdJXqqxbVHtQFCwiNoq+RVA5H3kADNMsmMk5jn7mHJjIRNP8zNtER7AIdx
xsBy0kNd4Zwp2cqjBinFKS/U7TjXqpUP7obzjZJXYdiUox4QHkI=
=DPoK
-----END PGP SIGNATURE-----

--IYBwt3Y2mERE+mYx--

