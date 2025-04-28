Return-Path: <linux-renesas-soc+bounces-16422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F9A9F626
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 18:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14853B40A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 16:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A996027F730;
	Mon, 28 Apr 2025 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kpGURY3u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F88280A5E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858878; cv=none; b=k1VVof6lTFRQCmy823PmkfsT3rlwGGLq1jMi3b6cyzsARZiID6EeBnu0kX8yZNeUCO4zcHKx6pRV+gY6346+fAh5gRFANCmFznmYKM9BLzKbbZscFhBd5oOC4+EmQhFkVcsFCZxfqGacZXQczOolq7WT2A3yOGNPTyg0Ulhd1EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858878; c=relaxed/simple;
	bh=Vvmi+6NqUwT6UVM+IiKBQH4cBijiUNMG4llFcTbvbEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jfhn61y86pk34I/ae4ALRwk86NKO9cjpO6cJ9xk4scXHOP9Uy7pxzZU9PXC2QASI7JSen3HoJm7MiSXuRZoxzTFit7O7AuV3K+tv4XFhMZQIytKetMMwD7SIZTQK4myXmvfcqDSIG6APwXg5aKgWEJAAhM3NiA4xXkgaJzA2xFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kpGURY3u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Vvmi
	+6NqUwT6UVM+IiKBQH4cBijiUNMG4llFcTbvbEc=; b=kpGURY3uzif6VuK+kyRm
	89QaCGaS6K8yCm3Tqrvx/ts53OGgWWMpg5iwVgbnMFFq6XRjCK2FLDj+TF15UpjB
	26tfd0+lnqCH2PljnH54tFEzHl1ZbOymetrPJTAg4nn4e3XrhBo8eimTnQwx2JKD
	jrOwDoAGhIdY12BUik87X4r/0OEzYNBBGIqF81oLwDh9bl6iLwf69q+tunTkJNF9
	ThRuD8p09MFf8hIN94ODLEEWkHVZ48l3WddJaEcsslCUsTPHz/UR+N+Jx3MyV9DM
	XrBVA0Xv1R+nj6FDAn5W1ArwAOF34ht+g5wTRYAFgsbb5JuuNS3ucNtBFVKZb2O0
	XQ==
Received: (qmail 655409 invoked from network); 28 Apr 2025 18:47:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Apr 2025 18:47:42 +0200
X-UD-Smtp-Session: l3s3148p1@lN5GcdkzvKMujnsd
Date: Mon, 28 Apr 2025 18:47:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dt: imx95: Add TQMa95xxSA
Message-ID: <aA-xLX_O94O_U5Mt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
 <20250428135915.520432-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZeKDCrC752Annmk"
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-2-alexander.stein@ew.tq-group.com>


--GZeKDCrC752Annmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Add initial support for TQMa95xxSA module compatible to SMARC-2.
> There is a common device tree for all variants with e.g. reduced CPU count.
> It supports LPUART7 for console, CAN, PCIe I2C, SPI, USB3.0, USB2.0, Audio,
> SDHC1/2 and QSPI as storage.

Dunno why renesas-soc was CCed but since you are here... ;) do these
boards support I3C, too? I know that imx95 has I3C cores. Just out of
interest, not relevant for this series, of course.


--GZeKDCrC752Annmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgPsS0ACgkQFA3kzBSg
KbYByQ/9E21JI/F6xpffslO17ZJxZuqDRJvwSI1lSeogANMjya+V231kLEgsll19
hASbEbCsBckqC14BKUOlrCXjD0L9JUPLBOGTfIzmF4u1fUgimZ4i1vvEU7Q6WKLN
Q6GCiHsu0ES+1W/2fTR2dlrIvGwBjhtvxqN8m1l/OlishK0gh2s/SQWE29CQnPUd
vaTO5XSgzaQzZBXUXRYq32iog1HJsAzS8aS7e+aPCTiE3iHCMNIDY/596SwEVWW8
TP2FcuLfR9XwZLvwywOE0vIC9dRiKWSWlNmeBGvKbFXEdd1N/qnyKAvZPWn8PDC2
sSlwUVm4BBtgCuRcQ5pNs5ijQIx9wE+f867O4CzGKeaJHP5Y4oI3pB+UqcZNAgT7
DTPkD1NUV4t9FgLBD++mrM1M/5DKbofxDq1nz8gxBHQyN4nfo3AmpH0miFul5wuu
Dn5+rv9VlcAm79Y9agZmIZwh2TNyQw003dnQKnH4SqGMnZlP/3Cp1Glz1zZwrvie
6uRWvR3ipVKbYxFtU13SORJuPD3WVVGIlW6DXpBAq20zXJVfGfT/QGhitVX5foza
U0ApCs2qrCUPaggr9ffNy/CcP9h5l02YjBoMF8B6SdQQEceQ5KTy4fKkvjkbb2ND
27BFUL1oeadruvaPA8+RuB/wScC++9kEjrV3IPitJ/8irQDgnGA=
=lP6D
-----END PGP SIGNATURE-----

--GZeKDCrC752Annmk--

