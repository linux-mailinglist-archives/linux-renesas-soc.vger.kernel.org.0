Return-Path: <linux-renesas-soc+bounces-14798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5229A704C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FF416E8CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 15:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF81A2030A;
	Tue, 25 Mar 2025 15:13:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09D25BAD7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915595; cv=none; b=W4yRiUUf4mPiBROv+rmSKTigS97EGBT2K1r9vI4DnfWqWn31w728Dh7Ou9XtnrzK1DrIwoNX/LaVQX82gR13rlYGcHAPsRRksVIwc4Tq0ELf/0x1l5JIIfgEIygR8aclC/q6MH7ovbXtIsqU1NtCZxQ7RPPw4/345Ggo5ZKdzb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915595; c=relaxed/simple;
	bh=Ymu8QmlYmsqTZ8/JVwzi+YS7QigP6MRwnkGHOEYR8+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NjMp4YUt1qMV0OfvRHAW53gzL9lZq/mHhzIsRlvdnon06NkULEHiknEnC5TOuAoy32/P5Jk11LS3DZu+A1XCHmkJRztLr5LzrOJj+2GhJ3ECpQgJOYPPQtORyBTM9TuyuwzZFAw+6aY+hMPOga/MDM4fKW3Y197pvwllUTVZAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx5xd-0000BM-Rt; Tue, 25 Mar 2025 16:13:01 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx5xc-001bMt-1Q;
	Tue, 25 Mar 2025 16:13:00 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx5xc-000AEJ-2W;
	Tue, 25 Mar 2025 16:13:00 +0100
Message-ID: <ce3426b50a2593c23052b83848e95db8e49fdb8a.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar
 <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Magnus Damm <magnus.damm@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,  Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chris Paterson
 <Chris.Paterson2@renesas.com>
Date: Tue, 25 Mar 2025 16:13:00 +0100
In-Reply-To: <TYCPR01MB12093DB963348A8FD58409E5AC2DE2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: 
	<20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <30b6841b3ce199488698ab272f103a0364adb000.camel@pengutronix.de>
	 <TY3PR01MB12089B78E1DE163B740A51134C2D32@TY3PR01MB12089.jpnprd01.prod.outlook.com>
	 <c27ab4ca4563d20a73ffc8a577f960fe59ffa88f.camel@pengutronix.de>
	 <TYCPR01MB12093DB963348A8FD58409E5AC2DE2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Fabrizio, Prabhakar,

On Di, 2025-03-18 at 12:31 +0000, Fabrizio Castro wrote:
> Hi Philipp,
>=20
> Thanks for your feedback!
>=20
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> > Sent: 13 March 2025 13:06
> > Subject: Re: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renes=
as RZ/V2H(P)
> >=20
> > Hi Fabrizio,
> >=20
> > On Do, 2025-03-13 at 10:14 +0000, Fabrizio Castro wrote:
> > > Hi Philipp,
> > >=20
> > > Thanks for your feedback!
> > >=20
> > > > From: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Sent: 13 March 2025 08:37
> > > > Subject: Re: [PATCH v2 2/2] reset: Add USB2PHY control driver for R=
enesas RZ/V2H(P)
> > > >=20
> > > > On Mi, 2025-03-05 at 12:39 +0000, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >=20
> > > > > Add support for the USB2PHY control driver on the Renesas RZ/V2H(=
P) SoC.
> > > > > Make the driver handle reset and power-down operations for the US=
B2PHY.
> > > > >=20
> > > > > Pass OF data to support future SoCs with similar USB2PHY hardware=
 but
> > > > > different register configurations. Define device-specific initial=
ization
> > > > > values and control register settings in OF data to ensure flexibi=
lity
> > > > > for upcoming SoCs.
> > > > >=20
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > ---
> > > > >  drivers/reset/Kconfig                    |   7 +
> > > > >  drivers/reset/Makefile                   |   1 +
> > > > >  drivers/reset/reset-rzv2h-usb2phy-ctrl.c | 223 +++++++++++++++++=
++++++
> > > > >  3 files changed, 231 insertions(+)
> > > > >  create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c
> > > > >=20
> > [...]
> > > > > diff --git a/drivers/reset/reset-rzv2h-usb2phy-ctrl.c b/drivers/r=
eset/reset-rzv2h-usb2phy-ctrl.c
> > > > > new file mode 100644
> > > > > index 000000000000..a6daeaf37e1c
> > > > > --- /dev/null
> > > > > +++ b/drivers/reset/reset-rzv2h-usb2phy-ctrl.c
> > > > > @@ -0,0 +1,223 @@
> > [...]
> > > > > +static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] =3D {
> > > > > +	{ .reg =3D 0xc10, .val =3D 0x67c },
> > > > > +	{ .reg =3D 0xc14, .val =3D 0x1f },
> > > > > +	{ .reg =3D 0x600, .val =3D 0x909 },
> > > >=20
> > > > What are these registers and what are those values doing?
> > >=20
> > > Unfortunately, there are some licensing restrictions on this IP, this=
 is
> > > the best that we can do, as per the license agreement.
> >=20
> > How am I expected to review this?
> >=20
> > For now, I'll assume that these registers are not related to reset
> > functionality at all, and that this driver should be a phy controller
> > driver instead of a reset controller driver.
> >=20
> > Can you convince me otherwise without breaking license agreements?
>=20
> Sorry about the delay, as you may have figured out, we had to double chec=
k with
> the LSI team before making any statement.
>=20
> We can confirm that `rzv2h_init_vals` contains the registers and correspo=
nding
> initialization values required to prepare the PHY to receive assert and d=
eassert
> requests. This is a one time only thing, done at probe.

Thank you. Please document this in a comment next to the
rzv2h_init_vals[] table.

> After looking into things again, I have noticed that the probe function i=
s missing
> calling into the assert sequence, and the status of the reset is undefine=
d, so
> that's something to fix for v3 to make it initialize in asserted state.
>=20
> The assert, deassert, and status operations are only touching reset relat=
ed registers.
> Nothing else.
>
> Therefore we believe this should be a port reset driver.
>
> Thanks for your patience so far, and sorry for being cryptic.

Let's go ahead with this driver. I'd be happy about a MAINTAINERS entry
for it.

regards
Philipp

