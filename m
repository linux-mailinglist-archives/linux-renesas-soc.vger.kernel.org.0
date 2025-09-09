Return-Path: <linux-renesas-soc+bounces-21650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B907CB4FA17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24803B15A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3973932C319;
	Tue,  9 Sep 2025 12:14:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941B0334733
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Sep 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420059; cv=none; b=h+R8wbRett8+xRqQlvEYz71pSYUh6/dTk+7ArUJyYzO3e7o+SnQMvvbh/OexQJ8Oogf3Tb2cEV0x6etSyso2V7gtIe4RTfQGEv8MgW+pG8KxdEOV0EjWVfbJIZBTz2i65V8py/DYrwS2BUtor6lGJ3A8onxSlE4pb6HqPbQ/wzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420059; c=relaxed/simple;
	bh=dEHJUaGdqOj0wwxzcSq+sTrQBGkuclNcnirwe7VygyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmoqp2s2B0nRP3eLo1Ct+xgWH35dnubNqTlITMTGCDiCM0qWm3H40qCrvhTzFRgmqX+J7qx6pD/972yDoTBWnvo0RDJOThevvKXzp0baFyffH2X06/zEsWEcr1bgwo3FqgKN4knIeiDYBsyCNTTQ2x5NUS3bDFg/GqPQiUHzFjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uvxEi-0001QS-2C; Tue, 09 Sep 2025 14:14:12 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uvxEh-000Px1-1C;
	Tue, 09 Sep 2025 14:14:11 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 0A85B469EEB;
	Tue, 09 Sep 2025 12:14:11 +0000 (UTC)
Date: Tue, 9 Sep 2025 14:14:10 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] can: rcar_can: Fix s2ram with PSCI
Message-ID: <20250909-hissing-chihuahua-of-awe-401aed-mkl@pengutronix.de>
References: <699b2f7fcb60b31b6f976a37f08ce99c5ffccb31.1755165227.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r4buc7pw526xrp7m"
Content-Disposition: inline
In-Reply-To: <699b2f7fcb60b31b6f976a37f08ce99c5ffccb31.1755165227.git.geert+renesas@glider.be>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--r4buc7pw526xrp7m
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

Applied to linux-can. (w/o the Fixes tag)

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--r4buc7pw526xrp7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjAGg8ACgkQDHRl3/mQ
kZwpCgf+IxKllq3gU5imD0BKlb9kbcqOABHbEqE/HAW16J18mmePLY+CSRMcVKEl
ydLzK+7vJBFpmnRrPjCFEHPm3SpToI/m9mbK8vk6S+50YJg6r+s5eM80se0Zrq/t
TJH+R3j6DSejkb5n1A1N89tM/7ehL4QTgWuM8c1as04YFgnEmxt+0D4VH0CjZAcd
nxpCQB4RFWWFRkz56WGB3OjhxWgTPR2gtxI0m7wIGiZVZR5YCzJRk7jiE/lBvMD+
VFvvWaUd/PcTCvZdLmCfx62tC4JqPq/8Z50rfOXQzrcWuO3HGAAvi4l89O/AfDZS
yCUR4Xkl6BlgNj8MjyE+YPt/qWN5pQ==
=FvBo
-----END PGP SIGNATURE-----

--r4buc7pw526xrp7m--

