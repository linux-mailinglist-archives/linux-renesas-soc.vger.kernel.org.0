Return-Path: <linux-renesas-soc+bounces-16439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD52AA0392
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 08:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64ACA3A9515
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 06:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEFE274FF0;
	Tue, 29 Apr 2025 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KEf2JZLC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E895121A449
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908837; cv=none; b=qidkuMpuTXwKIu+X3tfxdX8OZv7zfKmP4h7ZiEfTXQ3Gq7R1BFuTgfF/rY/NsK2oW5Do4eydlPSu0RBumU09Xq51fBKBUyJu3qzvLgbcnFyGTr3/fpEkT7FoiIQ3cmF9VDskRldYVxHPoTexxLooMeBD/wx2s8JlQeFtbKPO4xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908837; c=relaxed/simple;
	bh=OK1LxpKQWLrpOtdb/yXNbzjFAGR06bSEVt8hgnhnoAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8GQsc6vuJv3M0oFaqU7KOqBHa14rCap+rJUEBEHFBiw5pRBZ37F0jsficn20GfJyIG1sJrtBLBA9dimLvgosz7WSbmzsDiLfMCEP9wmloVGjJP9fwwiEMWnGIPzcK1VB8mBNiMD/J5qZCUzf1RE4SRHVWSUulf2Wdfjpm9ET/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KEf2JZLC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OK1L
	xpKQWLrpOtdb/yXNbzjFAGR06bSEVt8hgnhnoAE=; b=KEf2JZLCj2HuGJOe7M5U
	+nd0UyMPy20wl06TeFlmDBpyRjaYg88CnXHYMr63y6rCt+wX269jJ+ktaCF73br2
	tRS3aYI6m9TuDQ19TtgXng53SJzPYY8R1Lt8gtI1ZWY/RCPPpVr7E9cjFRYNH31a
	WDiyik3WPN2afr6LH+/Jn/Edf3nbepR16yaW5kOgfpSDwm3XY69xWdjDqt50K916
	apFD+q1JF44miGVk4d7z/OiDk+gEPuXholpGzN8uI/gaaF44xRj1eV2Cs+MQh1FK
	AgCziqQ5roPzs8MpA9brPsNoeHZyg8XId+8/C4WSiwphzieLAcgkpzUdr+LKYRHF
	mQ==
Received: (qmail 144601 invoked from network); 29 Apr 2025 08:40:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Apr 2025 08:40:33 +0200
X-UD-Smtp-Session: l3s3148p1@HYXUE+Uz+KIgAwDPXxyAAIlRla1HkD11
Date: Tue, 29 Apr 2025 08:40:33 +0200
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
Message-ID: <aBB0Ydxwn2CM_uu5@shikoro>
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
 <aA-xLX_O94O_U5Mt@shikoro>
 <2436245.ElGaqSPkdT@steina-w>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fp/22maYXv0G6Ljr"
Content-Disposition: inline
In-Reply-To: <2436245.ElGaqSPkdT@steina-w>


--fp/22maYXv0G6Ljr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> renesas-soc gets triggered ;-) I'll pay attention for further patches.

No need from my side. I just wondered and can live with what
get_maintainers provides or I would fix MAINTAINERS myself.

> This is a SMARC-2 module, but there is no i3c interface in this standard.

I have a SMARC2 module where the I3C connector is placed on the SoC
board. I guess SMARC2-AFB could be used as an alternative, too? Anyhow,
I was just interested in other easily accessible I3C controllers, so
thanks for your heads up, even if no cigar here.


--fp/22maYXv0G6Ljr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgQdF0ACgkQFA3kzBSg
KbYQVBAAgqruN/Q2VapjP1qtFf8cwIZaSwJLRL0JPe6iDMa22OdQbli0Py4Fuawj
HY+W12EgDozfyGlKV0iiSfHIzKdd/mirLaYbaQdBuDe/NF39E98X62r0hXS+g8jZ
wPkCR9qefuD5VkblOKXdRRgTfDDQfz/u89fFlRr1Vo3UmPNi5LjmYh+E8WWHyXuO
JYsSRN7CiuLz0aDapOAXSrx0oqI9Z8AAY2veQVe3DW5HyOFFelk/jyddnc5n2xIX
x7wSSSbg8O7Ijj42Sf9EyqyBuzqMkWA0NeEHif10czDH/OBXT0YxVXYnXNpkHIlU
GKf3y771W1MnBP48VxTkC0zaceBKfdTzwCwygGV7YdAUGnB6IViRn6HSqEmDM1jn
EdfCYwDNQaGk4PQEM6WrfEI8H7EG38rDPweT40Kt7s8NfSM2jri4xe7k7Vvksh1G
UmRcjTO0W5i0fuxOpKnNm0ken2g9QKHziXvgWjZoqFZqrif4RlA7pgkqdFRL3sTx
gPl03UUysBRgCo6NQFp263fNX9cDyKGEs5WFCQLbPrPgYtANPnGnbdQI+j1uTCgu
YAlIGyzpKljLcljexmnRByBzH9P1Vt7tSCZysEXyS/rR3rd+sYXfGgoYkQCOmX3N
7CTz6ANde89aX624v06mT8/HUfZb8SnvVL4LQWPinntb0RZZ+O8=
=msAp
-----END PGP SIGNATURE-----

--fp/22maYXv0G6Ljr--

