Return-Path: <linux-renesas-soc+bounces-21535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C8CB46C9D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Sep 2025 14:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276095A4D3C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Sep 2025 12:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B09D288C3B;
	Sat,  6 Sep 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F0ekrOJO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC72857DE
	for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Sep 2025 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757161190; cv=none; b=pQmnSjd/b5riThaw5RvPvS6FcnJeBAnLnntBYxYCxRYUxrAZ6c5IBtvWw2wMpxoWA61LO0S5Rh4VRkZo2w0m0v6vkGH59HAxP9MTgur0SWoyivMwji0KlJFMe5tKumGB5JelYU+3OE/Q0oceMYrHsHTw+owC2SWncob6gyPxomc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757161190; c=relaxed/simple;
	bh=XTxpXmyMJCAeish7/ie2ri87UPjko4Ruw1KFZ9eMNBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7lSP3uJbP3cJpdRRmPL0C6WlioZLlK5KE2o5vPIDvkuI7vP8Js/xFDNYUR91ejwaUshztR5clVbNPO8tjj195o17pjye5yEXIpYJ5A6hcrPvGziPHp/sQ7Jb7qsEF0RF1pXuF/Oi8xfy2O0yRduUiI4Q1UELrE/Kbsw72b0SEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F0ekrOJO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0oT5
	M/pLrYz64ZkEaGOmGt6gTqO8syJPz1VC0H2uTZg=; b=F0ekrOJOPhA0O0PXg2ET
	hhULEQixBnJpNCi/Eesi8ajJRN4Nvbob5H+DD5mo4IkXEgEGRL9RiXFnaLiY8vfM
	yAOvw/ku71UFcjUzq0Fcy3q3nKSEOA55VxexBKmWlbX1jwi6xKH/yTbdXSNL8H3q
	uMWAM6HN92ONbMTPSLbSsaBM104y/x2mqhtbXAlLzO2LoO1Ob7B8zqE1qtKTyxJR
	Iqa9+dLwadDWsEu/gbNzI7lqD5MiYb93vASVnKDy6KB0gsg9JT9i8UwUG15a0SL0
	SUnWr34Tc8yrdcdmdwYj8+uPK+Mg4Dm+DLS268LnsufBL/nGT5XUeyJqkFgWuoyV
	8A==
Received: (qmail 172328 invoked from network); 6 Sep 2025 14:19:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2025 14:19:37 +0200
X-UD-Smtp-Session: l3s3148p1@hvnK9yA+wqEujnsz
Date: Sat, 6 Sep 2025 14:19:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 0/9] Add PCS support for Renesas RZ/{T2H,N2H}
 SoCs
Message-ID: <aLwm2fbi3acKlIgH@ninjato>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tTkumfwPdoFCtLK9"
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--tTkumfwPdoFCtLK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H SoCs
> These SoCs include a MII converter (MIIC) that converts MII to RMII/RGMII
> or can be set in pass-through mode for MII similar to the RZ/N1 SoC. The
> MIIC is used in conjunction with the Ethernet switch (ETHSW) available on
> these SoCs.
>=20
> v1->v2:
> - Dropped regx in title and description in patch 1/9.
> - As done for other IPs used T2H compatible as a fallback for N2H.
> - Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
> - Added matrix table in the new header file.
> - Corrected the resets check for RZ/N1.
> - Updated the commit message in patch 1/9.
> - Dropped regx in config description in patch 9/9.
> - Dropped patch "net: pcs: rzn1-miic: Add PCS validate callback
>   for RZ/T2H MIIC" is this already taken care in commit 508df2de7b3e
>   as pointed by Russell King.

I plan to test this series on RZ/N1D next week, hopefully on Monday.


--tTkumfwPdoFCtLK9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi8JtUACgkQFA3kzBSg
Kbaa5g//ZK2Mks61O/bzWONbxucBL3fI+YH9HfA8ISgLaXy43lwLzu5lJqSzZqmj
dPtLUow4etR0F5mVJJ63d+fAVRbujns0A7SIrSYuXfCmHnjEuGHz6RivUakVex0/
nj7TtSNroLdfytUJ73Q9phD9IDTk9H1Xs1ItR0fPflpI3LXtGbLF+5Yp11FaRqJx
6yDsuDSXhNQtPN//y0TWmTVkgiw6LYgX4iniGRspll3QTFVmYqMwT41ZBLWJcB57
YzWyCZOh3Cm37pjUOnGqpte3sbjeRrgxrmVePIpJ27J833Lbi2nt2mCCTnGap2DY
1Cig4VEsWPFSeYCj30fJeU6ryw4isEL/kveFqzlMht/dfAbCgA6jV0q7D3uxrumQ
Bv/854D8WNnvCVxqD3JoY6pRfdXYLKyTYhk9pQni+u52RgAou9y2XXbK6i9YZQdX
x1Lj5TXDlCNjDw8IX8rzAWIq2FC+fvpr5pveyYBAugJCKQpzayody4IOYc31MOgk
redviQfHN9X5b2l+LF2bSqGeAgS4aXdQ4OYXWgEwIuecNX+e0apkXaR9AfmreEaa
hCaRV1OYoYnzjm4h/9ucJ7oWo+CBQ1TxLd/iQVrbH4iMcOI8ovsSNQTEQXoZ3R4c
rnhndGyxlo54wX1K6bksZiaczB0Bha8vsn3i1B50fHP7GmO/KtQ=
=k1qC
-----END PGP SIGNATURE-----

--tTkumfwPdoFCtLK9--

