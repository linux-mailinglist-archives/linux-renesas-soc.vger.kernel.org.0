Return-Path: <linux-renesas-soc+bounces-20639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61481B2ADB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61CEA3ACEB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23483375CB;
	Mon, 18 Aug 2025 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ln4dXllP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569132A3DF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532747; cv=none; b=CwdJPPPJIsYQ0SOU5Tc1k+8U9x+dUQggr9GfAmeZ1NREQk8o1lmS2nokjZjhw72rWzqdZ3BqI17thVrnQih1ATnH2Zggu3K+w6lXPkMPMVImmn5AIZw084+iOnEUhGIN2ef6jvWOZQ+tDT55k+saGpwJFNi7TFv+BMNjy4ztLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532747; c=relaxed/simple;
	bh=bDgAox1aA/1Z5TbMBFoy9PpahJa5ubn8NvBpzYB69Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnhhPJJiA9ZG79vaE0WjByrPAZIu3ux5rOdrqLjOGQ8Pi+L+OqE1jfTVT2hQifjmNjLQKdxacTIipKCgtuNkFoJtztOJBjl+ihjzWbx6NDMuPdbfZzxbTv/E/qinYnUxE2ikdNa4AivZBK7aylfzxif6AcpZeqbsUVk2FJ0i2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ln4dXllP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bDgA
	ox1aA/1Z5TbMBFoy9PpahJa5ubn8NvBpzYB69Ao=; b=ln4dXllPrbhpjdsx/FkG
	PIszRwleiAD32PKSsO93WhXBNd9on2tJq6omXM+cxVgqHQv2Sgd2kEZWOZ7fFs1h
	PhubR6Wx3Xp3Xkv91e3e5RRq428Sz5kd/VLDxeLTglXXoUrT8MI4eaj3ox13fIlz
	E5GN+CFNxB/4lQyLiHB6kAhugQ4LA/0IzBniSSQgk/c1gEWwyP8nB5otIeaNF8ma
	c6G9WAAjs2+Cy+ynyecygC89/o0DRx4JMx78Y6ev0LH3Dyb65spOjDc+9NyrV7dw
	xiURhTAHGwy1thcrb+C8XpmWE4hVhnWL64VFEzbUj2VWaDOFaFbLt5dFZ0OcSTcr
	lw==
Received: (qmail 2452409 invoked from network); 18 Aug 2025 17:58:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2025 17:58:54 +0200
X-UD-Smtp-Session: l3s3148p1@cy710KU8uNVtKDDl
Date: Mon, 18 Aug 2025 17:58:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: Re: [PATCH] net: pcs-rzn1-miic: Correct MODCTRL register offset
Message-ID: <aKNNvDwkehoit1eZ@shikoro>
References: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R6lb8l05OCNcTM8G"
Content-Disposition: inline
In-Reply-To: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--R6lb8l05OCNcTM8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 04:07:57PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
> 0x8, not 0x20 as previously defined.
>=20
> [0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn1l=
-group-users-manual-r-engine-and-ethernet-peripherals?r=3D1054571
>=20
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Cc: stable@kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I can also test it on my N1D board next week.


--R6lb8l05OCNcTM8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmijTbkACgkQFA3kzBSg
KbabzA//b7l0e50rYMI1vWkipFbHB2lmpOrjAxvOizvQg9Rz+wFtJReysJMiEXy4
/OiB6BdV7T9ES93ENGpSElIKpBXfcHxbGkda7n47Vhr8M+ptdEAUc85XJU+pSbys
6Upda18MS9x+o1Ov0lUYDMp+gBlphT3ZbADLb2Y5hjqw/KFUQwTknLMmO7MSzSR1
EgAI7f6zGKhloAigGpPvXtBpPrgGhSZX0Z21sderpHYlTeY3egnvy+4HlavnitwS
TSZhLfPsI3t6E2G8d5GMJBYYC4sv6kxb9mZ8GRKfhyRFbi0RZu08jLlrvknQyWky
drqpcCsZ+k0o6/1SCocjI5dglthTBq3vHa/y9JS7BxrEAWHN92Xcdk2XApCtUdUH
kR2E17RfCwm77JwYioqyT0GRwPNQnHUTN+OHrdf4HPdXcp/Pq0hI1GsSelsiAZ96
Xb/gI+rRskPeeJLRjeT3PpJO8Z7B4G/Rc4rlz6cvxuUyvAK53hl3iT2fkDVEW6KQ
TzrQsgWIsJkqI2zcsz/gz9VAedN+EO0bgGZXZ9/4gpi7etkk89kjS7sY+xrf1RKB
xdKg0syfcqNH+CGBDRAnOdsUDR90P9tilFqpl5Fmmyap8ySBsg6WbipSstuH+2Wq
dHTwAbap8aOnU0a9e2MRB7GiS1T2+v4mvJ8X10DZmTYNbolLGLw=
=v2w7
-----END PGP SIGNATURE-----

--R6lb8l05OCNcTM8G--

