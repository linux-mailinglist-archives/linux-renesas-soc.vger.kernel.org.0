Return-Path: <linux-renesas-soc+bounces-5914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4AE8FE3CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 12:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18BDE287048
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 10:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15E318F2CD;
	Thu,  6 Jun 2024 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DjjLC/7K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC418C33B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Jun 2024 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717668496; cv=none; b=IrUDEfeqo+/OxnUHXAQljTbpgmcWnSI2f4fLykuwgigeDkhzmHg0VbF6xjyWbHhsWrghrmqtFtQoXl/D9niyv2mpfjB74s1f54fJs+gdngyCxIQNKiyzw73leSgrTZz1Xo8fmd+3sYDoZkXKSevgyIF0ZYCfrgdghKrNZ7mlPh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717668496; c=relaxed/simple;
	bh=kE2NyNQtVQLVkbR6xyVZdiXkGUHjIIus5Y90ecB5k/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZBjMJnMtT7Oy7izuNnDgqiJatnxPpgns4C8IrzhiKo0Tcn/2o8hqr6GIf09xhIeRt0rX9HjzaJYovchSAajRKkPOgsWTFNBvZUWp3jJk0jVmhx/sqNlHK/vCj27XRHs9HDgR3CgxUT2sN8iJU3Ad6442EOg1Y9KY/8Y/tzwoK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DjjLC/7K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kv1a
	MtLEznsb7d+x/dGO3ACtifhy610beU+a/4RhXxU=; b=DjjLC/7KrQm2ZjGy+CzS
	4n/VoKJj1CCkUs3xFoRU8NicWSW+xeyfZRUHPOsHTB9x0jEg1ztzn28a2SdLAbTP
	XzqQ/vIg0zGuHuRFYTq6gdLoLs9kEfVjLET3xnXwg/IPfzK+Dso1LqBNuYjRX1O4
	oWO/FD1HwQvEsgOV4iDkuLYcSWCEbBwt//tcLAdvXu0/Wm53/7gptbK7Zvg3JBSm
	RlpVZdQhVvv97XmlTLhXlq1gYPoOJ/w+OQJsJdWwDB1P6FhYo6pxzGCRM6Ksp8VA
	nxuJfxXU6Ht3AsU+2l2zwPJpvy4mEcL58bqJhxnfP6JEeuCl/AQHswG9fwQ1j5d1
	WA==
Received: (qmail 2956939 invoked from network); 6 Jun 2024 12:08:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jun 2024 12:08:10 +0200
X-UD-Smtp-Session: l3s3148p1@u2U43DUa3qZehhrL
Date: Thu, 6 Jun 2024 12:08:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Message-ID: <20240606100810.eskr7bd3oqpphaxh@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4wwgkhsymlp5fu6"
Content-Disposition: inline
In-Reply-To: <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>


--c4wwgkhsymlp5fu6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

thanks for this series!

On Wed, Jun 05, 2024 at 08:49:36AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
> similar to those found in R-Car Gen3. However, they are not identical,
> necessitating an SoC-specific compatible string for fine-tuning driver
> support.
>=20
> Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> - Voltage level control via the IOVS bit.
> - PWEN pin support via SD_STATUS register.
> - Lack of HS400 support.
> - Fixed address mode operation.
>=20
> sd_iovs and sd_pwen quirks are introduced for SoCs supporting this bit
> to handle voltage level control and power enable via SD_STATUS register.

Two high-level questions:

- can't we use .enable/.disable in regulator_ops for handling pwen?
  Then we could simply use regulator_en/disable in the code and be future
  proof when other SDHI instances have other kinds of regulators (unless
  I am mising something)

- what about not using regmap and use set/get_voltage and friends? My
  concern is that other "new" registers might appear in the future and
  it will be cumbersome to handle the scattered IO regions.

That said, having a regulator is not a quirk in my book. I'd think
'struct renesas_sdhi' is the proper place. Or?

Looking forward to your comments,

   Wolfram


--c4wwgkhsymlp5fu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZhioYACgkQFA3kzBSg
KbZKIw/8CeM4x7MUv2ZgIkGAEWZHXs2GyoBn8JtzcEX+6C23RHT5CK7aIZDFBFQG
t8QPol3bNqQhqAD8ObdCrTbuXR2bnCMdAM3vlacVLuv388kh7yHCSvQWdJYwNMVY
wJJ0h7pAfdsbl774qX5RXSsf4yDWr/2c2TA9ABS+nJmC2AMyzDwISUeKm6Ws4vqJ
WqDe2m7f6uE7SaB+uWqUZsesNZkeL2ZapUrtqvU4t17UJix/bmtXkhYCvWlcttAt
Felb9LHSBhd2mnSDYrTQi8EKanFxdrt0+Y8YqRyugIxn/HHs15l+shDjglv51zCe
0+c7V4onCYfsY8Cd+FN1P4VYiOJzKnGO5kT7HCpnMBHcJVl7wf3NC92tvOTrUpZh
6hjis3RLBviAZ7NdWfYeSDauvrTTJw5XCqfoMv6H+a4kwbgWRaXtI2n18viqG6ce
l2wEfGL6AiLdQefohdA9/WJXMoPxA2HtBi3KI/D4zj3r+e9NDxKAPiQctg0GWbe/
A9iIT01hyBRXThdSmAVsIPpv7ATwcWjnEAiHbvo4vvDuq8tRhnntKAMZpm/wl14z
K1xt777o7rcQe/T81SsT4eJNhubxz1hUhAiqv1rlLyS9XG6KqMpr+j4/LvAUfsHn
Uqgl283qj+tiMvA3mF+uxLCraFS5Uwfr4pkrNy6aK7W2Hf9Hqis=
=trg3
-----END PGP SIGNATURE-----

--c4wwgkhsymlp5fu6--

