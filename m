Return-Path: <linux-renesas-soc+bounces-13829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA323A4A505
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 22:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A4E164A63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA4B1D61BC;
	Fri, 28 Feb 2025 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ejm8N4sG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892531C54B2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 21:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740777881; cv=none; b=YRxaHIVNIvkq3s7ur6SO+6Hi0+pOWaowJK/xfbkrSLZ8IS/EfR1D0DFca3Xg7y28p9a+SNxpsKQluS5ukDcBLbFOlHT4BP7maeSFJilmJebaaqxZ4rvkhOjJ75aVubA7b0yiDz/YCnAeEayptnt63AnMLpDMkZeW+LoxTP5pjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740777881; c=relaxed/simple;
	bh=PiF/znA9TOsmY+GaP/x14C+DjIvsVa121M6lAVA+eG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpatZjG9nlQY+7LbXAru4qSq1yXYYk96zX2IbG5B2Cp1zcZQfV+jykZPvimBvo8veiqpqdCK7+444oIt0b7PEpuoVtyZaNhOavfRUOJT0gdL24jF5iU9k7CLLUfOi72j4hETLcf5QY/Io5EOQ0cRjZlEnlrnQsFFy0Ia0KkFmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ejm8N4sG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ccid
	/zde0a5V/EEv0mlYZdra3MrMn1pD7LcMo0wtoDE=; b=ejm8N4sGwogAqf5DexAp
	El0tKeGiONwMv96u8Es9zsHlkMdGP+uAxJgFpMZBoIXCSuZbfCfIZjmFHbYxck9D
	8mKf3HjPZaAMWI3iEG3jrTHFLIuoGEO2ZhxKJLj9oSKrtGMTdJyKPxKxkVsaGSD7
	wFqw/kPih6BGbSCYs0hkLyIS7qEW1Xy/SyVU4p+CSgS9uFI+ihLtfD/1UwKqdvEP
	26R4wZcPqyMdOIvJKVhfeLulCfD7mPZPOY8eNoX+732UeYh3WKRBTIRaTMZQE/D7
	pzEd4f+G7/i9Vj9HKK0iyBToLL+PUSSisr7uHNC0jF5D6absaHQOviloIxVXTBr6
	8A==
Received: (qmail 1428424 invoked from network); 28 Feb 2025 22:24:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 22:24:34 +0100
X-UD-Smtp-Session: l3s3148p1@XIzVbjovQs0gAQnoAE04AOw9xELqAtuS
Date: Fri, 28 Feb 2025 22:24:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Message-ID: <Z8Ipkqod7SdGlDak@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
 <20250228124713.153979-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6kxq6E+o9ifeNcAS"
Content-Disposition: inline
In-Reply-To: <20250228124713.153979-3-biju.das.jz@bp.renesas.com>


--6kxq6E+o9ifeNcAS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static struct regulator_desc renesas_sdhi_vqmmc_regulator = {
> +	.of_match	= of_match_ptr("vqmmc-regulator"),
> +	.owner		= THIS_MODULE,
> +	.type		= REGULATOR_VOLTAGE,
> +	.ops		= &renesas_sdhi_regulator_voltage_ops,
> +	.volt_table	= renesas_sdhi_vqmmc_voltages,
> +	.n_voltages	= ARRAY_SIZE(renesas_sdhi_vqmmc_voltages),
> +};

...

> +		renesas_sdhi_vqmmc_regulator.name = "sdhi-vqmmc-regulator";
> +		renesas_sdhi_vqmmc_regulator.of_match = of_match_ptr("vqmmc-regulator");
> +		renesas_sdhi_vqmmc_regulator.type = REGULATOR_VOLTAGE;
> +		renesas_sdhi_vqmmc_regulator.owner = THIS_MODULE;

?

Also, one space only before '=' in the struct initializer.


--6kxq6E+o9ifeNcAS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfCKY4ACgkQFA3kzBSg
KbZJ/Q//VT3N9uuN7+BBtVLyOChsO3sNaXNHHqrGiieTtsHArU8ye1N8nuWToO1W
geLMm/7wn0SCjSdLkwspqJ8O/sEzf6kS0eBSDLWOg6OARzsD97odu3yjhFYlaYs0
mLH01trGg0EVI0phYyZZvXOABHIt6buR5nRJk0QBGA1agb/bkcrN0NWuR8/TtETm
GJzUIjVjtyg+q8uI30e/5YoNFI+/T7Y+nJwTvAqtB7up1Dpy+bxMi3YNIpYajGPZ
6zgVQg+lZ91DuI2z2OM+XawY0ipIICMr4evehlfOe8h0J5QtZg66UvDKBstb398U
iKKKm2tKN1CNr045y8sKejhjeSGqf03OkvUPsZSP7d7UBi31Jtull078hXKkT8WS
ZKVxsBM/8vl4LUXV3kNbqPWOOSEI840gQIrQm/aRGT5HaaARC5X7pYgWxj+HlcZp
hW79MW+07PUs+YVh028ijurRUshjGKQmjOoK5BcHthPZtdGuRRA0TI3fShr/KK20
7x7Idq/tuZwb7gY98LF4QQdy0LkHiYPGq93hCljMAnMVqOhLO/pwvt7Cl5/ucy5g
4WlbuaFRxm2OzfIXe3GgVCv3eLTRoTXELM2Of2NrU0IwgO3zVH8IvSlBsQX36ee/
UWwVZYVi+PKNQteQm2CMkeqF2B6d8GyTpDW57wcfCviQkB00LsM=
=Zl/L
-----END PGP SIGNATURE-----

--6kxq6E+o9ifeNcAS--

