Return-Path: <linux-renesas-soc+bounces-17766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2CACA9CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 09:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48660178F5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 07:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38280186295;
	Mon,  2 Jun 2025 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gKpj/VTD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10142AAF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jun 2025 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848597; cv=none; b=GdjqAmxu1a3i+0/tSw3oLYG98jlZmAMQ2WjGF9ttvdT3b0cBKR5W83F/B0oR5gnzopw4DQKjkzVTggeU0NrAAlqWsUPiuY+PnXx5eLwJFSQ7pCqbMlR1zGdKhXltFDIHNZMDELXIuV/AAcNxT7yJF0ZRCYAoUeFmGQfhvw0V5bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848597; c=relaxed/simple;
	bh=4ts3ILevWOPYqx+gXJKBFw80Ij8IEjysS1Tj+hCyd9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQPyMSlZnLG4jfc6hU4rc0D8Bpe56kOIgY0XRETBA81iyr1WEyrJuM3BQyzYKuR3ePtb5Nc/Kne9jwIrlTZE3l7uPnI1A9BGTUHnRUq1KTV3ZVQWPKfAijW0cIlVcHHmM1fFsDBt3PenmZT6MtK87GGmmt3jdP10QDWHQPv1djY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gKpj/VTD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4ts3
	ILevWOPYqx+gXJKBFw80Ij8IEjysS1Tj+hCyd9E=; b=gKpj/VTDWEUb0RdiAHS/
	ax63fKQeGg2XTYEIm1BeN1RwE1lI6Q587Mra4bC8y8vgIP/IRrQHmnaisEtkSqsl
	tS+S3VLIkjcYapmcmYRoMSM5UCNJhl3X89Vpk007lmHUTi5a2EKgeMTtoVPvq4Bx
	k4MjPWFpEVEzvySiQq7YSaTkHDtjs8Vib4HH0smMMYjYy6nRXA/uQC7LWzfEM5yH
	6oN+zq4kqL5nszFnTlJRPdK/K+oxHhswwyva8xLvMRHcZ9R76KsPjNYQ/tnRJwBM
	8cTyApmfsBvVlf6O3+SK4V0FTUabO+bo+0MdY1OtHp/IhHcypCeGlPE/K9EZ3f+h
	Gg==
Received: (qmail 3287185 invoked from network); 2 Jun 2025 09:16:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2025 09:16:24 +0200
X-UD-Smtp-Session: l3s3148p1@mkeYipE2bTltKPDF
Date: Mon, 2 Jun 2025 09:16:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
Message-ID: <aD1Px6zvXnan3rq6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZEsolx7UMbGHb56"
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>


--+ZEsolx7UMbGHb56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please provide your feedback.

Don't have bandwidth for a review, but I did test this series on my
G3S/SMARC with a x1 PCIe USB controller. Worked fine, I could access USB
devices with it.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--+ZEsolx7UMbGHb56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg9T8IACgkQFA3kzBSg
KbYrDw//fVqzg9qvc/j2in3DmuPNolbFXSgSdXbnHeaP64s7ZMvP1VjP7lm2xRXV
mnnKbzEvCpQqJusArmqUVao96p/Sr/PKfWLK5P+bVreIOp4JHL6B4/n3GGgWB4gY
W+pXg2OSSLXUUn84eIfR9q4ExE5NJ67LH0FucGCE2MLf69mR8JemaIOzsjcArKme
XWJwwlQ3O+VmBtOM3vbw8FPOOsh9lGyxS2Euc26Si36zsQGuKKNCAR+DumFKCTXm
cJa9heoLi/Tse5sUAXVSn1fxLkyLx5NFJNY8NtIzO8AvP3ZymGZdEH3fLVc7e0T5
CVGvrh39mKJFFWsTaEe2cazD910SmVIvHvAt7H9WOpkhxDk0Qn2Xx1KKyctO2Ktf
qwa4liCYjx7aE+Kf2zoZTc+XaAUad/rG47vIZSb7dNThe/x31LOCStVXcwbFX53i
zYGUGZ64uj4I8x7+Cv9Key/mPrwMOqtsKmc0p7jS72WrXzRpSIyMxFbYCthpEKBO
ueJFNcA/xDkCsjTW1tY2+VitZe0OL4Zi3IGunkNk2X3VL931ONqNvFe84uBcOQ2q
Ktm8IvF6zWCwBKGjuOe+DsrRA8DnSiScFvA3tlPOy0jkDFkNSL9aVrG0dH9+OLrK
oApyRKwdLFyMjCyoKyV1WOjwOv8IE5WzXCpIOrWBjj189aJMp+0=
=bmYM
-----END PGP SIGNATURE-----

--+ZEsolx7UMbGHb56--

