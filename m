Return-Path: <linux-renesas-soc+bounces-21006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37043B399D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5B71C80B04
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D5A30BB9F;
	Thu, 28 Aug 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hpK9J0nY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F130C618
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376736; cv=none; b=Zojcyubs2g+26PWAOMYoe3AlS5jWGEUB35051FIOGykrcrJ+BO2FILZV82XYIsF7zKIDdcf4Unj/0hhJfXz0xJPD5sBCLVCvcSicxXi1FHLdpYTHWh/R5eDqGTAxJe0bbD0QN4fiqyLNvp2n1Dc6F3c8bJl2X7vSHSCj7TWAyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376736; c=relaxed/simple;
	bh=Z+T380rxXBVzQd01qiKQ7kq8cxrxiFKqihbJyFxts8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7yqM5ffcNdoW2/AhNoJ2OmQVseQ+bPsow4tn+dTY08MPxYfzXy2lNIXxpkOB0FgSA5/hBuNIIhD4rsOuFBvdo4YE2Lzz3nQfP/FfusRi1qQ5A9CII61r6ZCsBbv8XyZzBrUYZUhtvwwRQMbJWqv7czMGxsFhBuSCVsXcj1AICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hpK9J0nY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Z+T3
	80rxXBVzQd01qiKQ7kq8cxrxiFKqihbJyFxts8A=; b=hpK9J0nYiOBbqgtzTA1N
	DERelRiBiS0MGZ4R5L54kr9n33S9HEn3fTZ22b0dtR8phK0YIByM+AwajWu5ojQW
	iSp3Lzh60YXJN6sDZ0zuOl3cELHj3uHdfskE4HMJCOytIGsu84IpjoiCPWAVHOlx
	2TuIzMseBDXmY8iwTS7ZHYqOn4WW6Go3u6JhDQb0402FE4Pk9lzC4ixIrdSMdGiL
	vz4QjXJtw2xCrPedX8Dw+UaVvzG6qdgBfTtk1iGGonHadyGWOzIQwrRHtxQkuhTL
	CxbZnAtLFX5YjSgTdjf2nOshZGXv2QVdz4WePAupd/jfAni12jYjdLWWD3eZYqfj
	RQ==
Received: (qmail 970981 invoked from network); 28 Aug 2025 12:25:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Aug 2025 12:25:29 +0200
X-UD-Smtp-Session: l3s3148p1@IDwIU2o9voMujns8
Date: Thu, 28 Aug 2025 12:25:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL
 register offset
Message-ID: <aLAumWuFtJrSi7Mv@ninjato>
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VlFHLacRClkP6okF"
Content-Disposition: inline
In-Reply-To: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--VlFHLacRClkP6okF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 06:09:13PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
> 0x8, not 0x20 as previously defined.
>=20
> Offset 0x20 actually maps to the Port Trigger Control Register (PTCTRL),
> which controls PTP_MODE[3:0] and RGMII_CLKSEL[4]. Using this incorrect
> definition prevented the driver from configuring the SW_MODE[4:0] bits
> in MODCTRL, which control the internal connection of Ethernet ports. As
> a result, the MIIC could not be switched into the correct mode, leading
> to link setup failures and non-functional Ethernet ports on affected
> systems.
>=20
> [0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn1l=
-group-users-manual-r-engine-and-ethernet-peripherals?r=3D1054571
>=20
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Cc: stable@kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I had a look now. Because the bootloader of my N1D board already set up
MODCTRL correctly, this write to the wrong register went unnoticed. I
verified that the now correctly written value (depending on DT config)
matches the value previously set by the bootloader. As a result,
everything keeps working. We were lucky. Or unlucky. Depending how you
look at it.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for this fix!


--VlFHLacRClkP6okF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiwLpUACgkQFA3kzBSg
Kbbo6g//eX5cQ/RzjatctnRELKLp+edYr/MQt1U7rF/Qf/kXCf55ONMOZdSk3NaP
6lYWUZrh+N3Uyv6PEQVv7jZu4GntdPjyUB1assB+AD1vAhHGdQcJp88/eaNhK4WA
t1sp9lQncN7EQpBRyrWuhefv6f5ZAacmai3lW15CWzYYl2d1ao329/IatI7JMTEU
NbgWlZbxfjwLi3qZyb0A7IBq6NzViaXpKxQz/3oV8dGVwGfTfQZFNBvXKHF04lZD
xXLLqjtf6qOcUV0KF+YoNwsxEQAxx7xrDGjdfebN6JvuNmBxgeuzlxN7a9gDWPE+
29j9y3BRbAqTwIb39QjEF3eIup39CakkhUkqZ3qXRQs6IkzYB7JwurRuV8jiP9vH
QeysqzSrxMOiHHkJRnWtDJNKWQTfwIHpGK3orJlau1UTJ9t5hEJp5p9zwMSx7UlT
o1YTufHtFmY4pQL6zLgv/9AegX9ITSM3jZqk/iEUBDshLvmzR10Z/blAZ7bIsM3f
sw5/rfMl3YLX7bq7wrVo61nArtHxhtvBjSBUws3KU6E8VW5QCkJe+Lx7kvODNAnH
xyXthB5C522X8XnFcX6NzjfaqyU6jGmzVVaQapWM4uVUorR1qvPd29SzUStWctqK
QFNcbJ9uLy0jy1ySY4Jnieu/WGclSkgR4xbK/CJJ9BKyi13VW5c=
=Gg1B
-----END PGP SIGNATURE-----

--VlFHLacRClkP6okF--

