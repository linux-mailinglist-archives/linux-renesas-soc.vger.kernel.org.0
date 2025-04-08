Return-Path: <linux-renesas-soc+bounces-15536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54369A7F4E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 08:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 022EC7A6E31
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 06:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BAE22A4DB;
	Tue,  8 Apr 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YzGd/NAe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E11218EB0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093424; cv=none; b=a4Un6gaoLjuEosKsG6imMY7X+/Ac++xBtjgYmcd55k0zUTA3EO+8RcWYBI02ziuEwAgAY1KrOs60+sfKXvVO03wd5hXvPl7wWna7/0GmNu8XgeU/D8Uh4b3SoPWqYHQ7OhAnCsixUI2t69W1G8sSguIQlh3MKciIJTGdS5sTaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093424; c=relaxed/simple;
	bh=gQwgHMK+g5MP4cnX6961bnkS2wSa/8ntMGORd4vyZ1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2rfLQatQFqh2axWZFm2iqkvEEoUTDD6dxtp6ALQxPtRp4M/KmLd06uXv725Hkl/3ykG4SHe1A53gn0tGXQcEVXN4uVHhtdbe+Hsy9O7oe8d7C4FebF6hU4pS1+psUvg9gd9XocsbJZGl/+a+vNMBxvYl85Op1LSJbceL7AeNmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YzGd/NAe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gQwg
	HMK+g5MP4cnX6961bnkS2wSa/8ntMGORd4vyZ1I=; b=YzGd/NAe/8LUbXa9Mgha
	8ooVPcpS4xEJHgXxaxw37j/0FAhN8oHEC0vMx95lfXCD+swYASZHsXpSodIgonoV
	/OgBaB4bCbREHGTK7d6Q6Pky3DOHQFP/ecSmnywEcRgTrbc3a0roK7wUytd40F5u
	zIh1ldeit7Pq7NJPwhveNWtet2ofobG38knUSlfQ1gFweUgwiljI9kX/pqnp9M3Q
	mZLtrjbo9MJ/4IQHBinQWJ+/AdzDB5jZKVSFtVKDJeGD1T+m9fS+NMBduI83K3r9
	UdpPm1BSA7PTkzauc2uj+CGXfQNmxZNSU3NPvw7hylXQV/q+biZgQKg7bDq0leEX
	aA==
Received: (qmail 4069015 invoked from network); 8 Apr 2025 08:23:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 08:23:31 +0200
X-UD-Smtp-Session: l3s3148p1@rEQ9ZD4y0LkgAwDPXyfYALbiJ46yNPq3
Date: Tue, 8 Apr 2025 08:23:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z_TA46i0KfFq89ch@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
 <D8IEWP78KVOE.1SD29H0S51FZM@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9lPWgJKryjainis/"
Content-Disposition: inline
In-Reply-To: <D8IEWP78KVOE.1SD29H0S51FZM@bootlin.com>


--9lPWgJKryjainis/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll send a v4 soon.

Please do with the minor review comments addressed. I have some patches
depending on it. Which means that I am using this DTS regularly now and
it works great.


--9lPWgJKryjainis/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf0wN8ACgkQFA3kzBSg
KbZrfhAAluEQLV+tfzv7xuGV7MUBYyc/AO3qenfaU6TtbMNnU+S4EOuVT2ZHFfpo
07HoNPprmpKFGJ6BP9o0ZyOzjn8BvA7iRaWH8a4g8+OBBOzqRgthwcrmiuDhkDHz
Q5CtFfeVW++uDIrrhL5J5BDuCI/CpTOc1CC1zWPpA9DOdh2hxOqxOfisf0SDXrre
VaLgjKZSVqEgvRXKvdQjD/gzByW8E3oes7ZhDz9sQc6Hp1SXHX1+0/M73lELU7o5
c2FKMe/ePrb+3ldxdvvzu8H8xUIWLbkajv8G+aV4G3608uEPXCkLFiJGdJsF8YJI
8yXz5BcF9CWh+0an6tfCkeGDLQ22pcVf3urQI+VKXXjDcIZfLtBohZ9r0LX+e5ON
o9oZudSSH8pl3MZzoW7T4Y/f3eNnQb3MRQ4+7LVaGcNLUoXz6eN65/89Bq+0077K
ZB+zNMWIwkKYf0VazsXhmxAsmFcfMCVSH2s35uAVq0nELRG1GeczK5eBorS+/3to
EUTi+KHFwaNL3/wIFPrIyBXvd+LpjGS+54sHM0PhRVmLX6153gwN4wsWXCvOy+Xe
ZVeGhQp9cvx7+Yd12yTQy+dA70MoDaQxKoKNE3NcaCQVQUEdLd45qAhtZcoD952a
o2LnIwEYFnX+88i065V5DN9P/o7ZhpK6+7oXPko2gBzn1/vgOIo=
=HfnY
-----END PGP SIGNATURE-----

--9lPWgJKryjainis/--

