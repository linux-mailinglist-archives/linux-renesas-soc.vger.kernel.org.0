Return-Path: <linux-renesas-soc+bounces-20509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB4B264FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 14:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774F62A387C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505992FC89C;
	Thu, 14 Aug 2025 12:08:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646552FC890
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Aug 2025 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173292; cv=none; b=VWGPSkD1HLIP9vDb0hd/aU3lqmV3OTbiTHVJUdzH4/zCu5qcxKEtYiD7NfV5ATGFkCkHKSQ44//9sFa4YSLUUOQVQsDTDsY56nE8IZsCwNsvyy3QyZEDiz/bHG1D4EoF7Cdi8XTVLz+fg90XjjFmhhnC3d7imlrLJi24pDtN5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173292; c=relaxed/simple;
	bh=uJbiL98Hxq2sC5en0r88AqX/6V4gvyvxAt/f7nCrEZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThUJ2Wm90IypGlVfcERhFo3frk3OPD/gfV2Ipn+b36entol3jzy+e3bNLfj5KYJtM1ZasnMQ7xUBspIbjzT6RiLXM1Gv0vbGxo8eBtZQO6IU74Q+BTfzzGT9qmwKs8e6Rtk8bLMbj1YdkX7rbPK8uOd3OyV3SbaGQDxrgxAmdcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1umWkW-0000al-6f; Thu, 14 Aug 2025 14:08:04 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1umWkV-000FUo-2A;
	Thu, 14 Aug 2025 14:08:03 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D024A4576A5;
	Thu, 14 Aug 2025 11:39:07 +0000 (UTC)
Date: Thu, 14 Aug 2025 13:39:05 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] can: rcar_can: Fix s2ram with PSCI
Message-ID: <20250814-gray-yak-of-happiness-829267-mkl@pengutronix.de>
References: <699b2f7fcb60b31b6f976a37f08ce99c5ffccb31.1755165227.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vve3lkmbgajkfkqq"
Content-Disposition: inline
In-Reply-To: <699b2f7fcb60b31b6f976a37f08ce99c5ffccb31.1755165227.git.geert+renesas@glider.be>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--vve3lkmbgajkfkqq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] can: rcar_can: Fix s2ram with PSCI
MIME-Version: 1.0

On 14.08.2025 13:26:37, Geert Uytterhoeven wrote:
> On R-Car Gen3 using PSCI, s2ram powers down the SoC.  After resume, the
> CAN interface no longer works, until it is brought down and up again.
>=20
> Fix this by calling rcar_can_start() from the PM resume callback, to
> fully initialize the controller instead of just restarting it.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Can you add a fixes tag?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vve3lkmbgajkfkqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmidytYACgkQDHRl3/mQ
kZyIbAf6A0kvS9nKrd7W2DBUD9M4S1WpAVL4dAvMeRnsPC7E7WcD4mHLRuDpIU50
7PK8qMevUJSn4VrlVBXt4TEQygpvEhEdIYDeublyBL5PCS9SvxWmsWCWzSTLpzVW
n1LF46Or7MFVbfEMo+TAGWzwXRG4FgwxRrdcXJ6k+B7s58lBAuZDqvyK4O7O1/1F
qIcyyKlxsgisrDn/1S1tGlnaCBUkUFs39WxeGsyPcj9Dvm61LDTYmJO1hddUUGGv
xQSR2r2/gEzvGpmY2/s7aJX/54eolYyGnecafwvb0mjYLdBGhZDeWwwe/ExsgCPE
zu+lwc5uzeUVAmiYA6aaFs2Dzgxqlw==
=ZoR1
-----END PGP SIGNATURE-----

--vve3lkmbgajkfkqq--

