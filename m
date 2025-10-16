Return-Path: <linux-renesas-soc+bounces-23165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B3BE4CFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 19:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2B76A342B6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 17:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D2130F95C;
	Thu, 16 Oct 2025 17:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WV09bS6a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A93346AB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760635060; cv=none; b=eRS/tYgQ/CtkBuWBKC+CBq2elRdz4RIlahR44XNGtjPjjvSVBjZltjI5/MKtMIq0hi3O9MUnYSco0jArW2ZbXIZoRQ1A134YCVbCPIJvhTlYdT5HQoeau4pL2ADtq5bk0/cEiJPyyCnqNosZ0ZNH0gnPnGmO9UnYgSP8Ii3v5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760635060; c=relaxed/simple;
	bh=OvIzTILdLjt0ZWBrFxi644wKZ7X2l/q7hdn6E8pzNOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfz53yuZZOc/x9lCaeGLc7Hs4TmfxOcf2xPXvlRtWVvaNSancFZbWseZ9VU5YlumnoKk0cEOhKqpr9KrAbIAq1z8IDR8/PXOKcUOWr5fxR4TtWgMwreJHq6H/PduL17gVe1gKwvQYybTLeWgWACRq/dPO9YQvsSdevq3VZ7de/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WV09bS6a; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OX3P
	Eq2AA3O282TkfqGHD7Y5ojgHInOgKrAj3tdjeSQ=; b=WV09bS6ays1ysZQdJFcE
	3LqxiBhwr76RZrIGeq3P7bP9hzjRrtoU/V2Ytv32HpwL0PQ4palg8udvjrOYHBYi
	gjZXY1hyb+wlQFsuKvnoxXHuyu+562YQCeA2i25tYs/eqmIKpwuIP8gPSVkf+Y08
	A3crt7gax0p924xvd815jM/NGwh23ej9EufSQ1ebQfZW2CJm5XLVIfYZTSsjDCSd
	sBMdSmhaQzyFboEabtQ2umAW1NPdtqICoAXUZSsArkp/nRUNJe9QZZ/5pNaJrNA/
	a3CF0inqdBTYNBTFPdEEsrTfE93DrexxJJx7zW63bWuuBDypmHJFwbttjpnvyqjm
	Gw==
Received: (qmail 3896430 invoked from network); 16 Oct 2025 19:17:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2025 19:17:33 +0200
X-UD-Smtp-Session: l3s3148p1@E4nryklBcrcujnti
Date: Thu, 16 Oct 2025 19:17:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: Add the Renesas RZ/N1 ADC
Message-ID: <aPEoqkdatl4G82co@shikoro>
References: <20251015142816.1274605-1-herve.codina@bootlin.com>
 <20251015142816.1274605-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jv9t7icn7i4vlBOj"
Content-Disposition: inline
In-Reply-To: <20251015142816.1274605-2-herve.codina@bootlin.com>


--jv9t7icn7i4vlBOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +description:
> +  The Renesas RZ/N1 ADC controller available in the Renesas RZ/N1 SoCs family
> +  can use up to two internal ACD cores (ADC1 and ADC2) those internal cores are

ADC cores?

> +  handled through ADC controller virtual channels.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-adc   # RZ/N1D
> +      - const: renesas,rzn1-adc

Do you know of other SoCs with this IP core? If it is only RZ/N for now,
we could go with const for N1D. All other N1 variants cannot run Linux
because of no SDRAM controller.


--jv9t7icn7i4vlBOj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjxKKcACgkQFA3kzBSg
KbZBTg//XP1NxCTl2FOwgzhHQbgD3sYnBcvNepzdoiScf+9sZ1VZqzIHym2uQ8SO
xymT1EMucboG47Q32jH4jrUY4TZhhRgHO5EqXwYtXEtaaBzkZNmnYSeY7vBEFwC6
qJpam+NldppA2iCtBieIYPpFtsCOkNqazBVhr1X1FwNgWKOVaIIqaWvXV2Fk6aSz
/l0ADNZBjPt9t431KUiuPlmgybJnijDOmaCI+E47vTekhfDynWWuqYFyRujNSa1X
IYWFkdwUNvCntBxmtQwxYrbDaaFp+T1YvHQAwruyCFHPL1wQTtFPLeGgU83xFaNd
epAecZh6zk88veIU2Q+y5CdNuwb3idFueNu4i9KElBXpmjROLdqNmb+KMUGUHLxR
F15jkCEK+vqo0qZ/aqLCW3a5QW1OEM7EHaL1/ayE0PN3sAi/Galeig8we1ngWh0m
Z4C1jdPrS0IAgVjCqXZGMiJ/WO5o/tpcZaXipcy6ioElUQurOaOASfORrNKxAZWZ
6V//R6F+UV7TSnQSmePZhoJze6xgJpyLQdjgoqKgv61yVLzgYdLncJmoawPGISaW
Q5XzVTubp/6JVVLGhoJIQ5efW5AZ4PLiNHaWUiDa57uLDdMiuKjDIVTzid0cirM/
bUtTuwZgpf1VfPCcXYPCUKHj8CxqGY0p6sITy5M+UXvGG9eikAw=
=5LLJ
-----END PGP SIGNATURE-----

--jv9t7icn7i4vlBOj--

