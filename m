Return-Path: <linux-renesas-soc+bounces-10464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F29C4FF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 08:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567011F22054
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 07:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD6620B214;
	Tue, 12 Nov 2024 07:49:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E220B801
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397773; cv=none; b=nvolAGn1M0y7N6/QrX//obm4aevjWGdPK5nuEg2PIkMlk8oOhEJ5r0H1QLviQKsabh8SEzaS21xFA9y/A7AS4K7rGjWtRdJDFGFdtHy9+wZX2SDEc9Oo9+b5Zn5kLWA/J5ml6qAE5eZ9jr8g6YnaPUTl/HMvqg8KLpOJE9MrQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397773; c=relaxed/simple;
	bh=ioQKK4dXSmQBeOnpnLIlwoF5ZBUimKGiicmxIH+Y1dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvBN8Mo3dW/ZNIccLITTpHpDBlkTOKwXrVGliJJ7sY/UUCJfnKu/ZAV2ptokt6CucUsqp5weW2K0B0CyRIIheoRA2BOSLq2JVIR61pQZBrGhmUex/GPMoZ9L3PINCl1q4slri+wGDDKgmvnE+t0BKXl1MUDnxMeWxTMKGSptiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tAldo-0006wT-TJ; Tue, 12 Nov 2024 08:48:48 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tAldk-000NF1-2N;
	Tue, 12 Nov 2024 08:48:44 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4663C37128A;
	Tue, 12 Nov 2024 07:48:44 +0000 (UTC)
Date: Tue, 12 Nov 2024 08:48:43 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, 
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Vladimir Oltean <olteanv@gmail.com>, Chris Snook <chris.snook@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	"maintainer:MICROCHIP LAN966X ETHERNET DRIVER" <UNGLinuxDriver@microchip.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, "open list:MCAN MMIO DEVICE DRIVER" <linux-can@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv2 net-next] net: modernize ioremap in probe
Message-ID: <20241112-snobbish-cocky-hyena-d0834a-mkl@pengutronix.de>
References: <20241111200212.5907-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yivnidfints257kn"
Content-Disposition: inline
In-Reply-To: <20241111200212.5907-1-rosenp@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--yivnidfints257kn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2 net-next] net: modernize ioremap in probe
MIME-Version: 1.0

On 11.11.2024 12:02:12, Rosen Penev wrote:
> I changed resource acquisition to be performed in a single step. Possible
> because devm is used here.

You should describe in an imperative way your changes. Something like:

Resource acquisition can be performed in a single step.

Replace platform_get_resource_byname() + devm_ioremap() by
devm_platform_ioremap_resource_byname().

=2E..and list the other changes, too.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: fixed compilation errors on PPC and reworded commit message
>  drivers/net/can/m_can/m_can_platform.c        | 13 +++-------
>  drivers/net/can/sja1000/sja1000_platform.c    | 15 +++--------

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de> # for CAN

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--yivnidfints257kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmczCFkACgkQKDiiPnot
vG/ajAf+I2q6yukaCiZ8l35kZU1eukgdk9t6XyKDMtT9KqDmbw1cU0QNEJTWp/Ht
sMGGbP6LGX62Rjs+iGYfgsgvKFxDTwcQMYKW/sLL7hHmRkvcmgq1HQA113R+2bz5
7NAZ526PH/esweR172ghpzpnkrjh1YI7fjAJcxfj2GE/91O7hlCyosUaeapCrPzh
WvZkmbUXlt/ZY795yGCG8zlgjN0S4iAYMGezFVVdJ8foE1TRUFm/L4IBCHBzMEmL
4k7Vx9yxtM+OFHZjjZeE2f3ZQUGU5+ouEmr3TddeIPLAGa2i4xiftttYKphFxlnT
z+VY8lNrteObfdHws6wEr1bnVc36qA==
=8JOR
-----END PGP SIGNATURE-----

--yivnidfints257kn--

