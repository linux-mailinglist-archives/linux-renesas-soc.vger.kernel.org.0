Return-Path: <linux-renesas-soc+bounces-12541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FCA1D2E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37936162B6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 09:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28E71FCD13;
	Mon, 27 Jan 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QU/CaeTv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF71D540;
	Mon, 27 Jan 2025 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968558; cv=none; b=Dl/Yksf+hsGnUEBPfxFAM7FCSBgVjAy2WmoTUI/yO5qtRPIHE7EZ4E72W09B8SqfMORnTRly47J4k/tIrBSF+WdQ9lEDonHQHRQMsEU5mu46fVuqdkgxJDyxEj5+1v0je2s2wSm16V3hsj80lZeLCzb69s8V2TOCozPy89SLiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968558; c=relaxed/simple;
	bh=P2OE12cHjVATmdg8U4KqRlXwWtiUq06LrUmXyTwOmPg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LWvBLCkKHWCemMEbsRXZZeZuuA/qNaLM+HPUNl3bErdSRCENmg4S45LLnMJ4+J0D9P+Z1LS2QZ8IS0o0bpRB5NYCgM+jKpY7pw7WoNeRNa+Xg9AT79asJAKKRv5aGqDYirXbs80Y7R/zXKcEY4A7GZ4l6UEcH4kgRzsUK/+MnCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QU/CaeTv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737968554;
	bh=P2OE12cHjVATmdg8U4KqRlXwWtiUq06LrUmXyTwOmPg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QU/CaeTv2U2AhBY0eOywxsLM74P/MZ2vYHAfHLhsviqWK9f5EbLT7aS1yMRx9PNAl
	 H3EkN1u3jVKOBYDlOhk/gESS6Ul09rVgS6pR33ORdTYWdzh0KMjtfFnhevZRx2jpKn
	 icAPzfVyhlbdcZZV4zP81lbC9iXdpp3ybYIf8FX2jBMIRCIJ8plb1ALciBbbFdLpTt
	 F7drSAwCVB9NnZnmtopywsJg2uv6vAJmh5H7DFviCAk07zMoGO6+g1RIqCwXFiKQ3/
	 jNIGtvzmmqGPRC8zXpaTclnzdZ3/YILk8B1zI8YLZrYi7JiOG7p+71pQyJ2JnMtQbV
	 O5nwoTgROzsPA==
Received: from apertis-1.home (2a01cb088CcA73006086F5F072C6A07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E83AF17E0E8D;
	Mon, 27 Jan 2025 10:02:33 +0100 (CET)
Message-ID: <2193a979bddbba5a9adc3c8fe998d23c71012dbe.camel@collabora.com>
Subject: Re: [PATCH 2/2] arm64: renesas: add initial support for MYIR Remi Pi
From: Julien Massot <julien.massot@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 27 Jan 2025 10:02:33 +0100
In-Reply-To: <93377e21-ec42-4e67-a650-86809d04b350@kernel.org>
References: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
	 <20250122-myir-remi-pi-v1-2-0e44e1cb8a90@collabora.com>
	 <93377e21-ec42-4e67-a650-86809d04b350@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Thanks for the review,

On Wed, 2025-01-22 at 14:01 +0100, Krzysztof Kozlowski wrote:
> On 22/01/2025 13:56, Julien Massot wrote:
> > Add basic support for the MyIR Remi Pi (based on r9a07g044l2):
> > =C2=A0- UART
> > =C2=A0- i2c
> > =C2=A0- emmc
> > =C2=A0- USB host
> > =C2=A0- HDMI output
> > =C2=A0- Ethernet
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/renesas/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0.../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 420 ++++++++=
+++++++++++++
> > =C2=A02 files changed, 421 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts=
/renesas/Makefile
> > index 97228a3cb99c163d299b508ee7653aafea3d1a3a..0b69bcfa405b69c26e8072d=
9b62be98dc621f89a 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -130,6 +130,7 @@ dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc=
.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-cru-csi-ov564=
5.dtbo
> > =C2=A0r9a07g044l2-smarc-cru-csi-ov5645-dtbs :=3D r9a07g044l2-smarc.dtb =
r9a07g044l2-smarc-cru-csi-
> > ov5645.dtbo
> > =C2=A0dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-cru-csi-ov564=
5.dtb
> > +dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-remi-pi.dtb
>=20
> Why not keeping the order? Or is there no order at all?
>=20
>=20
> My mistake there is an order and I will fix it in the V2.
>=20
>=20
> > =C2=A0
> > =C2=A0dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-smarc.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-smarc-cru-csi-ov564=
5.dtbo
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> > b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e6e00afc5f5b2347f139ec4=
dc145fac6fd39e75d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> > @@ -0,0 +1,420 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the MYiR Remi Pi
> > + *
> > + * Copyright (C) 2022 MYiR Electronics Corp.
> > + * Copyright (C) 2025 Collabora Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > +
> > +#include "r9a07g044l2.dtsi"
> > +
> > +/ {
> > +	model =3D "MYIR Tech Limited Remi Pi MYB-YG2LX-REMI";
> > +	compatible =3D "myir,remi-pi", "renesas,r9a07g044l2", "renesas,r9a07g=
044";
> > +
> > +	aliases {
> > +		ethernet0 =3D &eth0;
> > +		ethernet1 =3D &eth1;
> > +
> > +		serial0 =3D &scif0;
> > +		serial1 =3D &scif1;
> > +		serial2 =3D &scif2;
> > +		serial3 =3D &scif3;
> > +
> > +		i2c0 =3D &i2c0;
> > +		i2c1 =3D &i2c1;
> > +		i2c2 =3D &i2c2;
> > +		i2c3 =3D &i2c3;
> > +
> > +		mmc0 =3D &sdhi0;
> > +		mmc1 =3D &sdhi1;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	memory@48000000 {
> > +		device_type =3D "memory";
> > +		/* first 128MB is reserved for secure area. */
> > +		reg =3D <0x0 0x48000000 0x0 0x38000000>;
> > +	};
> > +
> > +	reg_5p0v: regulator-reg_5p0v {
>=20
> No underscores in node names.
Ok.

>=20
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "fixed-5.0V";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +	};
> > +
>=20
>=20
> ...
>=20
> > +
> > +&eth0 {
> > +	pinctrl-0 =3D <&eth0_pins>;
> > +	pinctrl-names =3D "default";
> > +	phy-handle =3D <&phy0>;
> > +	phy-mode =3D "rgmii-id";
> > +	status =3D "okay";
> > +
> > +	phy0: ethernet-phy@4 {
> > +		compatible =3D "ethernet-phy-id0022.1640",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <4>;
> > +		interrupts-extended =3D <&pinctrl RZG2L_GPIO(44, 2) IRQ_TYPE_LEVEL_L=
OW>;
> > +		rxc-skew-psec =3D <2400>;
> > +		txc-skew-psec =3D <2400>;
> > +		rxdv-skew-psec =3D <0>;
> > +		txdv-skew-psec =3D <0>;
> > +		rxd0-skew-psec =3D <0>;
> > +		rxd1-skew-psec =3D <0>;
> > +		rxd2-skew-psec =3D <0>;
> > +		rxd3-skew-psec =3D <0>;
> > +		txd0-skew-psec =3D <0>;
> > +		txd1-skew-psec =3D <0>;
> > +		txd2-skew-psec =3D <0>;
> > +		txd3-skew-psec =3D <0>;
> > +	};
> > +};
> > +
> > +&eth1 {
> > +	pinctrl-0 =3D <&eth1_pins>;
> > +	pinctrl-names =3D "default";
> > +	phy-handle =3D <&phy1>;
> > +	phy-mode =3D "rgmii-id";
> > +	status =3D "okay";
> > +
> > +	phy1: ethernet-phy@6 {
> > +		compatible =3D "ethernet-phy-id0022.1640",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <6>;
> > +		interrupts-extended =3D <&pinctrl RZG2L_GPIO(43, 2) IRQ_TYPE_LEVEL_L=
OW>;
> > +		rxc-skew-psec =3D <2400>;
> > +		txc-skew-psec =3D <2400>;
> > +		rxdv-skew-psec =3D <0>;
> > +		txdv-skew-psec =3D <0>;
> > +		rxd0-skew-psec =3D <0>;
> > +		rxd1-skew-psec =3D <0>;
> > +		rxd2-skew-psec =3D <0>;
> > +		rxd3-skew-psec =3D <0>;
> > +		txd0-skew-psec =3D <0>;
> > +		txd1-skew-psec =3D <0>;
> > +		txd2-skew-psec =3D <0>;
> > +		txd3-skew-psec =3D <0>;
>=20
>=20
> At least some properties above do not exist. You cannot use them.
And, there is something wrong with the compatible here. I have a Motorcomm =
phy
that correctly reports the PHY ID, so I will drop the ethernet-phy-id prope=
rty.

>=20
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
I will make sure to have no warnings in V2 with up to date yamllint and dts=
chema with=C2=A0
$ make CHECK_DTBS=3Dy renesas/r9a07g044l2-remi-pi.dtb W=3D1

Best regards,
Julien

