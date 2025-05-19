Return-Path: <linux-renesas-soc+bounces-17218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9DABC471
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 18:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CBD73A3CA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 16:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C3286410;
	Mon, 19 May 2025 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K3EU6ruF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CE0283C9E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671966; cv=none; b=NdyjVZuhjEuF19UkLE2SlZBkcaAqg6MSd85TFPtE1T30+AfZYfcHTiRlqHI4PgQHkfTtmX648FihGQnW7LHkeqv+khXb+F1k3xdSoSxejMh/yusw1CZV/hTqDoZh58MhrQpoNZyFtLg8vZO3FDcdTwkyrQ1rplvoxfT5OWk14NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671966; c=relaxed/simple;
	bh=2CrWiXdAIPuhzM4jCU4TBe6zxzkcqYp/yT6qASAmbw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO7WM8xvWHQBBCNlMybMHIJ2Ht/akb1KKserV5UYimzgk0e/w9BySqwZRruh3BWt/Rdr9YEC0RdZ7TQl6Vu5/15OBeJMya8LcrrRWTVXIsZV4jS+iIXLhjTtxz6xT54k47ujtc7UmLbBnIThiD5+nfZuBO4JdTsRq/fa5+J3mOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K3EU6ruF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2CrW
	iXdAIPuhzM4jCU4TBe6zxzkcqYp/yT6qASAmbw8=; b=K3EU6ruFL/OpOWC/fUjh
	0gep71xq7UoPKETKLKH+dksyga+hRyN4tg4mGEPMVCz4Ty4WWbR4VP9QAGh2zXv2
	xWNyhBRF6VAlfEXo5hY6WAJ7i3iK08AZhey/jzjXA9GwsD8wShQlO3+zAUHTU6hW
	1oDYNIzCsvrmy6UTiIP1qdWPOO0/lYpePUvviM89KWaA3zX+m1BNBU9p0TIUoIwi
	R65ivy4C2HutHv6+GCqnCxi9EcAgXiAa5sBnVRbJATwxpz1l4jHnTqM2b/lj3WJv
	T/ZlbmSxuzcgPGsSwlzprt7PK08+SgjJDaZDbGlsQTIndntqOSMtLdiHPVlNB2W2
	vQ==
Received: (qmail 2560263 invoked from network); 19 May 2025 18:25:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 18:25:51 +0200
X-UD-Smtp-Session: l3s3148p1@RCBBlX81auZZz6uL
Date: Mon, 19 May 2025 18:25:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCtbg0_vD07g394k@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+a1bYfx2W27PjWcS"
Content-Disposition: inline
In-Reply-To: <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>


--+a1bYfx2W27PjWcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think either we use i2c-X or commit 57138f5b8c92 ("schemas: i2c: Avoid
> extra characters in i2c nodename pattern") from Herve was not correct
> and needs to be fixed.

I will look if I can fix dt-schema instead. Thanks for the pointer!


--+a1bYfx2W27PjWcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrW38ACgkQFA3kzBSg
KbZh0Q/8DbOiOYPUo59X0oBswFavthsQBOuU9J18hLuCfgXpPyrkdzst3DHS1JbA
WWXljzVNmqqrooJf430r+Zw/jYzEn2AvnspnZKcFsrwpIXETEsrWWg6dsObXCEIt
wwkryPMmaXV/KgNEmaQfc7ijeNRYk1ulnp2jC0cK4rbaqn/6MSMzudwl5iXxFH7D
11axYicOsttAD212QJK+Y2ElfUPGfhEiWryGmkCmDezabV90XB7+SfqtXJ9U2Dyg
zVdlvACzqS+zniyon08c1NmGXI5N4AymoFUOdjZXw4ckqkTaLaWLchm/9t4PWLwa
qZuoeUWXJ5tuoXCKPga0a+E8v4CWP497xyUbdHJjtgjymF+ZCgVcLFBbw2mfxHKJ
zpdjl7h1hYiTueI6W9QGuAfrtq4oWMALdmWIQZyf+XAVbdX+Bw/7R0p7cx7tXR/j
ojyDDJTpNkD8Qw0xb4gt5kypL0XSXG6N5NBwKUZcdHZF6ALI2q6IZ1INAbah2mq/
D4xaoTq4uE5/BPJOCP4NrUJymvBblbyUpulCbA25Lk4ZV8DWyDxCPBF4ME47dMXG
EA21znickLZsnqQod0J7UjJd+4TnAWuXa9y8kfK/dU/ftmS9VBULRPLz0vXLNAE1
7liA4wl/HGJ/Yyq/edPygXFuq0Uxi+0u5x+n+34ZaDKTMZfAQLM=
=gMRk
-----END PGP SIGNATURE-----

--+a1bYfx2W27PjWcS--

