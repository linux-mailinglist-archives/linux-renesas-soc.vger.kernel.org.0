Return-Path: <linux-renesas-soc+bounces-7028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FE925621
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 11:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4B8EB20FB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 09:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894613BAE5;
	Wed,  3 Jul 2024 09:08:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5412FB2D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719997727; cv=none; b=tyj8K1ta8jVrbMO7eARnWVp2qd492mEFuv7cra8IHivW0CPoOCA43sZKNPz5huMrrvOaV6Q/J5D7hEvh4C1hjGCEB9ML8k0XBQv64pV2Ef3RQcUJICF+U1mSUdYw3DyXT1cmhD6Huv8oiYWvBpTeVtSLc32DFgAF24VZe/CJM2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719997727; c=relaxed/simple;
	bh=5vvKZUq6NW5EcNM+G12bmCAAT4BgzLF5jSIp+823+qs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fb762ps52Pmcy8WpClVVhmDY9GRxa9eC+6N8HwO3CbbJlPy94wiGOj4il2ytMrx2DaoV/aJnCZOeBg3/4cWAWdIphRuiOT+HmT8bYT+l5INSGV53he/yoSQpO0Eq7vBwBDnCTfqln4nuWz7AeKQnkRDrc6GgooCYcDPdLMPxIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sOvyc-0000LM-Ui; Wed, 03 Jul 2024 11:08:34 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sOvyc-006oeT-ED; Wed, 03 Jul 2024 11:08:34 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sOvyc-0004Il-1C;
	Wed, 03 Jul 2024 11:08:34 +0200
Message-ID: <c551445782f327205c5cdb59717e2879e0982d80.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
Date: Wed, 03 Jul 2024 11:08:34 +0200
In-Reply-To: <TY3PR01MB11346C77668002325FD916DBD86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
	 <20240702180032.207275-5-biju.das.jz@bp.renesas.com>
	 <CAMuHMdUmvWPPBVqhtpu2dovwQg7YA7TVZBRnATUiY+1QRy0B1w@mail.gmail.com>
	 <TY3PR01MB11346C77668002325FD916DBD86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

On Mi, 2024-07-03 at 08:56 +0000, Biju Das wrote:
> Hi Geert,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Wednesday, July 3, 2024 9:36 AM
> > Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixe=
d regulator for USB VBUS
> >=20
> > Hi Biju,
> >=20
> > On Tue, Jul 2, 2024 at 8:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > > Replace the fixed regulator for USB VBUS and use the proper one that
> > > controls regulator based on VBUS detection.
> > >=20
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v4->v5:
> > >  * Updated commit description.
> >=20
> > Thanks for the update!
> >=20
> > > --- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> > > @@ -54,14 +54,6 @@ codec_dai: simple-audio-card,codec {
> > >                 };
> > >         };
> > >=20
> > > -       usb0_vbus_otg: regulator-usb0-vbus-otg {
> > > -               compatible =3D "regulator-fixed";
> > > -
> > > -               regulator-name =3D "USB0_VBUS_OTG";
> > > -               regulator-min-microvolt =3D <5000000>;
> > > -               regulator-max-microvolt =3D <5000000>;
> > > -       };
> > > -
> > >         vccq_sdhi1: regulator-vccq-sdhi1 {
> > >                 compatible =3D "regulator-gpio";
> > >                 regulator-name =3D "SDHI1 VccQ"; @@ -139,6 +131,9 @@
> > > &ohci1 {
> > >=20
> > >  &phyrst {
> > >         status =3D "okay";
> > > +       usb0_vbus_otg: regulator-vbus {
> >=20
> > The label is not really needed, is it?
>=20
> The label is used in usb2_phy0 node.
>=20
> vbus-supply =3D <&usb0_vbus_otg>;
>=20
> >=20
> > > +               regulator-name =3D "vbus";
> > > +       };
> >=20
> > Also, as the regulator-vbus subnode is required, perhaps it should be m=
oved to the SoC-
> > specific .dtsi? Or do you keep it here for board-specific control of th=
e regulator name, i.e. to
> > avoid conflicts?
>=20
> Yes, just to avoid conflicts. Later I can move to individual SoC specific=
 dtsi's

Alright, thanks! Applied to reset/next.

[1/4] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document USB VBUS regu=
lator
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Df64f2d6fdda4
[2/4] reset: renesas: Add USB VBUS regulator device as child
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D4068f22e4b47
[3/4] phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D24843404efe4
[4/4] arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dc1267e1afae6

regards
Philipp


