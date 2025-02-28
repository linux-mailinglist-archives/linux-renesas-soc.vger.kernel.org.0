Return-Path: <linux-renesas-soc+bounces-13832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2DAA4A51E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 22:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E274173588
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC8223F38A;
	Fri, 28 Feb 2025 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AHZM/KW2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495F1AB52D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778375; cv=none; b=HXRYPwbRqrpFBgvho4hFjfVnSvNpDnBYXiF+vl7du7Ti9XUdd03o2jLNG3Ba1UODj6AYR5Q/7/ekSAuhPArodX+ScxFxKyjqbjiyAhbHhAP5sHcaLnYVF0UJvuXqFPhoOsvYv0Cbv6bENRc75t5kbCrEpQFZXNY8EABYuktSK54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778375; c=relaxed/simple;
	bh=0bn7nOO12Db1/cprnEbj+LcZrOhAAVUZyUCa/CQIcms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1HVDklkoOm25TchShlw67bm1MopnkdS1zluzUOUD82oiZ4grzB2VbE3WxhoPBtJ7/a3YNsaHGAFWzSx2eNi8tBDhFEdIWZ70qsa3BXjxqo7ZIUe6raMbvUZjWJ4J3VgY/VZ8i3eSSSt5CW1jbhLJADSJYbFjFzlvaCbkR3Y3Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AHZM/KW2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0bn7
	nOO12Db1/cprnEbj+LcZrOhAAVUZyUCa/CQIcms=; b=AHZM/KW2y8OvzP1SS/HP
	f7rcyKf89+xVxVRx7NB+4z0c7wS3TDWUx77Lm/9+vodtjNTlHUGst9gH9gKcCLxI
	A2AyUrF2+jUL+pXYHjFngBb2eexb04WV35TbUu85TrvRxLpzACreOY+QzwqsnjgN
	rgHwepI/n/Crk9jZ3kxdI+8B43ZY1bVAyacHmBza2TJYI9VESXbeB+GC4OooLyrE
	kxQ4ocvWVsX2tw0xTQln5KKksGEMbH9CCc1hN0Ug1xobUW0DiNZcHno8qMyD4LS5
	bnHK8OVBCZGs8A+jGLQ2aGsaIUc6UqHBDzU8f6Z9Hi1GbmWrDiE/i6Ee9WI+m+74
	ZQ==
Received: (qmail 1430828 invoked from network); 28 Feb 2025 22:32:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 22:32:51 +0100
X-UD-Smtp-Session: l3s3148p1@rzFwjDovNs0gAQnoAE04AOw9xELqAtuS
Date: Fri, 28 Feb 2025 22:32:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Message-ID: <Z8IrgjMTrYtGGAqL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
References: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
 <20250228124713.153979-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZyYpMZHhkxk/PH7b"
Content-Disposition: inline
In-Reply-To: <20250228124713.153979-2-biju.das.jz@bp.renesas.com>


--ZyYpMZHhkxk/PH7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 12:47:08PM +0000, Biju Das wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator), for non-fixed voltage (SD) MMC interface. However, it is
> optional for fixed voltage MMC interface (eMMC).
>=20
> For SD1 and SD2 channels, we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
>=20
> Document RZ/G3E SDHI IP support with optional internal regulator for
> both RZ/G3E and RZ/V2H SoC.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

=46rom what I know about bindings, this looks good to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ZyYpMZHhkxk/PH7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfCK4IACgkQFA3kzBSg
KbYKnA//WpqYQBwjBnawRmKX3WoZzOW2NI8INuSlmCtOQ4hslf4eRRF+apnQWZ93
KxvoFcq4M+CCreOn6JCSRIO0huhgMzb2IYfOa2XgeSUh8q3NkEwg8tyuezewGcJy
B3zyaCJokDPHUOUGQxvX43nE7+DzbxUTsavGrDVDa0LKpYjIJvIf+k0+ID3GncO5
qkoNP4KLHdcurSjtXrDlZoi2NSXGY4F5+P/1bL4gfxUZuSsM2waljrcbV7VqpVjI
Wzv+Eei++WpTP9KPvXdhq9c9l36ebBABWSyTl6VQniYOoeWl3rL5hlZ9P0N6r6P5
fKBvV67P+fEtvjxoGcK6rVHMdw7P0cSC8mKjrhIGLeAzRNcG2WqURX+J0FqjKAb3
I2VSU8iXH6/h0eWWccJVQXDLX4NhCMpeRqiaCb0WKRjKl+gQ5vJS0YBYRWGW12WM
DFHv8+4eDGb+oVHCcBr8ubmL8e/3ZYD3DoFfcGiSQKn/0ZAxf60lhkINGv8M4Lym
lKhn46DUx0GexEkVjtbD6XL4D1bcgrWaYPsE/Wc+sJB++KmGhkjFS8wgzX36OIUA
5yrd72NAyB56WdHESA/lOEMJ595y1JNnOscYfjV8J23C+SLzA4KHmnDDoHVAF6Xp
8Ldg2rQhEmDmLjTsyWTwaa2vvz13/0+Bg2uLcE9doPUXMSqb0Gc=
=uSff
-----END PGP SIGNATURE-----

--ZyYpMZHhkxk/PH7b--

