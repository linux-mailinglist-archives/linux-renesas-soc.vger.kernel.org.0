Return-Path: <linux-renesas-soc+bounces-14449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905CEA64647
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 975457A2A86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502EC21CC79;
	Mon, 17 Mar 2025 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hOsgpE75"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028EB1B412B;
	Mon, 17 Mar 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201566; cv=none; b=WrqFJRPQKbyxEj3r4PqnAxykve+y2st5cNa0npqGx2jFJV5K7eAyFzHWEa/2EV4HCM7RQdqaMCo8TGvePZj2jMUCGwBd7V1MRXndDo3aVn0lCdnoV89cYxjux5Pg9i/bSrOouwZHJ5z8cm9P4/LPcDZnvtuk0EGNFLdTVOdYQwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201566; c=relaxed/simple;
	bh=+B5JwbBFivWYCY+UmnrfWnqmPZMn4eiW/HdEXryOz38=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YPciVA3ZSROELY/3zrgNrqcHK3xxupdbn2HXF7sjSKnBtBoxXmnMi2tgTHFvJTPDBiC/Ko63BYnV1INufnSGmCDGM9RsSie8Dm/RyANbqLhwtMp6CV/sP0W/J3OUYjr7FuA5G1nBkQWIjA+D20qSJ0AgP03jg8HUzxe8FOTWDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hOsgpE75; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08C3943277;
	Mon, 17 Mar 2025 08:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742201555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1BOiXY0pQXsR3DKRb00y3Ktnt4JnMEzNfaWSPKCrJ0=;
	b=hOsgpE75dFTLaSfPDI/FmtVR8cTYAMKR0TtQSV+ggmI+xHu964BaVmSPMTp/yb9S9Otd+0
	+lpM7TgSYig1wUepQAEnp316THuGM9IjJjWrR6rzt/YHex+4QYYJld0lrInpZW2kOEc+2e
	IaqLYKtho9k3+/CD3E0kRudVrd2yjuMSqonD8vSRaUIHiBUxrGI9l37j2sLBfmO5czRla3
	YY+cScKl/ey/WQzGojqd8PSSI8BlA3lHmdL1tsqayOLfgWe2rS+Xbo6zy0Ct+iXK1QlYGB
	TkI3JfJMS24H8ii7edgNJJNC0zv0fqMLQgViB3UQ/CmClAZW/7NB10A41p7AKA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 09:52:34 +0100
Message-Id: <D8IEWP78KVOE.1SD29H0S51FZM@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
From: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
In-Reply-To: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeltdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcuuehonhhnvghfihhllhgvfdcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeelfefftdelleeuvefgleelieeftdfhveduledvhfffveejkefftdegffduheenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughts
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com

Hello,
Erratum, there are some trailing whitespaces hiding in this file, it
seems like I had some checkpatch problems.
I'll send a v4 soon.

On Fri Mar 14, 2025 at 7:56 PM CET, Thomas Bonnefille wrote:
> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>
> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since thi=
s
> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
> It adds support for the 2 additional switch ports (port C and D) that are
> available on that board.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>
> [Thomas moved the dts to the renesas directory and declared the leds in
> each phy]
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> This short series adds support for the RZ/N1 Expansion Board. This board
> is a carrier board on which a daughter board (either RZ/N1D or RZ/N1S)
> can be plugged. The device-tree that is added by this series enables the
> use to the 2 external switch ports that are present on this board.
> ---
> V3:
>  - Drop bindings commit as it was applied to master
>  - Move Makefile modification to arch/arm/boot/dts/renesas/Makefile
>  - Declare LEDs in PHY.
>  - Use the driver default LED configuration as there was no reason to
>    use a different one.
>
> V2:
>  - Add "renesas,rzn1d400-db" in list of compatibles for EB board
>  - Replace '_' with '-' in eth pins node name
>  - Split some long lines in dts
> ---
>  arch/arm/boot/dts/renesas/Makefile                 |   1 +
>  .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 120 +++++++++++++++=
++++++
>  2 files changed, 121 insertions(+)
>
> diff --git a/arch/arm/boot/dts/renesas/Makefile b/arch/arm/boot/dts/renes=
as/Makefile
> index 833a02447ecf7a02bd2efe70fae15213ede9a6de..947c7fe0280337a3aa6e9a025=
7f406694892239c 100644
> --- a/arch/arm/boot/dts/renesas/Makefile
> +++ b/arch/arm/boot/dts/renesas/Makefile
> @@ -30,4 +30,5 @@ dtb-$(CONFIG_ARCH_RENESAS) +=3D \
>  	r8a7794-alt.dtb \
>  	r8a7794-silk.dtb \
>  	r9a06g032-rzn1d400-db.dtb \
> +	r9a06g032-rzn1d400-eb.dtb \
>  	sh73a0-kzm9g.dtb
> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/a=
rm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..20478941170bade197afb5cc9=
b3d694bd9a30951
> --- /dev/null
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZN1D-EB Board
> + *
> + * Copyright (C) 2023 Schneider-Electric
> + *
> + */
> +
> +#include "r9a06g032-rzn1d400-db.dts"
> +
> +/ {
> +	model =3D "RZN1D-EB Board";
> +	compatible =3D "renesas,rzn1d400-eb", "renesas,rzn1d400-db",
> +		     "renesas,r9a06g032";
> +};
> +
> +&mii_conv2 {
> +	renesas,miic-input =3D <MIIC_SWITCH_PORTD>;
> +	status =3D "okay";
> +};
> +
> +&mii_conv3 {
> +	renesas,miic-input =3D <MIIC_SWITCH_PORTC>;
> +	status =3D "okay";
> +};
> +
> +&pinctrl{
> +	pins_eth1: pins-eth1 {
> +		pinmux =3D <RZN1_PINMUX(12, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(13, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(14, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(15, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(16, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(17, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(18, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(19, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(20, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(21, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(22, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(23, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>;
> +		drive-strength =3D <6>;
> +		bias-disable;
> +	};
> +
> +	pins_eth2: pins-eth2 {
> +		pinmux =3D <RZN1_PINMUX(24, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(25, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(26, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(27, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(28, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(29, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(30, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(31, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(32, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(33, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(34, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
> +			 <RZN1_PINMUX(35, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>;
> +		drive-strength =3D <6>;
> +		bias-disable;
> +	};
> +};
> +
> +&switch {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
> +		    <&pins_mdio1>;
> +
> +	mdio {
> +		/* CN15 and CN16 switches must be configured in MDIO2 mode */
> +		switch0phy1: ethernet-phy@1 {
> +			reg =3D <1>;
> +			leds {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				led@0 {
> +					reg =3D <0>;
> +				};
> +				led@1 {
> +					reg =3D <1>;
> +				};
> +				led@2 {
> +					reg =3D <2>;
> +				};
> +			};=09
> +		};
> +
> +		switch0phy10: ethernet-phy@10 {
> +			reg =3D <10>;
> +			leds {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				led@0 {
> +					reg =3D <0>;
> +				};
> +				led@1 {
> +					reg =3D <1>;
> +				};
> +				led@2 {
> +					reg =3D <2>;
> +				};
> +			};=09
> +		};
> +	};
> +};
> +
> +&switch_port2 {
> +	label =3D "lan2";
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&switch0phy10>;
> +	status =3D "okay";
> +};
> +
> +&switch_port3 {
> +	label =3D "lan3";
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&switch0phy1>;
> +	status =3D "okay";
> +};
>
> ---
> base-commit: 9c5968db9e625019a0ee5226c7eebef5519d366a
> change-id: 20250127-rzn1d400-eb-3fc1479a13e6
>
> Best regards,


