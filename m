Return-Path: <linux-renesas-soc+bounces-14394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04102A619F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 19:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A00D4631EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 18:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5019320487E;
	Fri, 14 Mar 2025 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nwiO6ZXT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC92046BB;
	Fri, 14 Mar 2025 18:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741978628; cv=none; b=SGM426xfFu1eb212gKK1MhEc/AagHPbxzO3uWcnX9Io5nhVObYGL81bg8hXmXe8jZkHITIyuGjWf/MEF9pEV2c0MOqmg5Dsi7Gdx6VQdAwi1R1MwzgIGjXFSORmarrK4ueOeJVYFM5N9CMuVc6BJ1ByLleHyM8IV0xM2KpdH9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741978628; c=relaxed/simple;
	bh=oWMLKqlpdyMMgvnwsO9aH3FYTBJZlIyLFhVMWBKeawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bfsrYRu2ThB0Q9VN4I5FoqliJhYOuKx0/txFAfzwmdSDjrEyKc1cyBSF+o72z+ml24Le1dGuvfZwKz6MfUFFZBni5XeHOPGPFaTdS0UQLGKCMQnFo6FImnaAYckTsLFa971X0ErNze9cIh/aaYom82jgq97FecYaqGULMdUem9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nwiO6ZXT; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBFFE43205;
	Fri, 14 Mar 2025 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741978618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gRy+psuhrZFbfyIXjmCG9/DFj0+xk0amMMh76es7yh4=;
	b=nwiO6ZXTV6dtatZJVeAa/QlnW7NpY9+ty44O25qXbIa21txXvexVar236eu4vmlCF661bm
	80Ix5TNeckiWBBUvipvIfebk6Y6dxDWPPPGkdKYk070yNv6Ma0aJSpzlRFmTe8jSHldhoL
	b4zNdzNv/pDaf3osIbYDJw8ZnWXVRkeXDJ+WgoRNrkRsuW8Mly9kbqynaBrV6v1TVM84Np
	GRxanFpAHP+4yJqhXI71VhY0q8IDUFadhkLkTpjOONGYx44BSNNg234zP8l+i7YsFz5avb
	MQcTe16n9701XWedI7tei7awK0v4JlnRKbI5lsVyivtDJU4wiEmcQ+hWZRuIhw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 14 Mar 2025 19:56:29 +0100
Subject: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANx71GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyNz3aKqPMMUEwMD3dQkXeO0ZEMTc8tEQ+NUMyWgjoKi1LTMCrBp0bG
 1tQC+sFIIXQAAAA==
X-Change-ID: 20250127-rzn1d400-eb-3fc1479a13e6
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeduieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgfduudejgffgvdduteeuteejvdeuieegkedvkefgueekleeghfeuueefieeiieenucfkphepvdgrtddumegtsgduleemleehsgelmegrtgdttdemvggstdgtmegurggsfeemkeeiugelmeefudegvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelhegsleemrggttddtmegvsgdttgemuggrsgefmeekieguleemfedugegvpdhhvghloheplgduledvrdduieekrddurdduvdgnpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsq
 dhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.bonnefille@bootlin.com

From: Clément Léger <clement.leger@bootlin.com>

The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since this
configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
It adds support for the 2 additional switch ports (port C and D) that are
available on that board.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>

[Thomas moved the dts to the renesas directory and declared the leds in
each phy]

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
This short series adds support for the RZ/N1 Expansion Board. This board
is a carrier board on which a daughter board (either RZ/N1D or RZ/N1S)
can be plugged. The device-tree that is added by this series enables the
use to the 2 external switch ports that are present on this board.
---
V3:
 - Drop bindings commit as it was applied to master
 - Move Makefile modification to arch/arm/boot/dts/renesas/Makefile
 - Declare LEDs in PHY.
 - Use the driver default LED configuration as there was no reason to
   use a different one.

V2:
 - Add "renesas,rzn1d400-db" in list of compatibles for EB board
 - Replace '_' with '-' in eth pins node name
 - Split some long lines in dts
---
 arch/arm/boot/dts/renesas/Makefile                 |   1 +
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 120 +++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/Makefile b/arch/arm/boot/dts/renesas/Makefile
index 833a02447ecf7a02bd2efe70fae15213ede9a6de..947c7fe0280337a3aa6e9a0257f406694892239c 100644
--- a/arch/arm/boot/dts/renesas/Makefile
+++ b/arch/arm/boot/dts/renesas/Makefile
@@ -30,4 +30,5 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a7794-alt.dtb \
 	r8a7794-silk.dtb \
 	r9a06g032-rzn1d400-db.dtb \
+	r9a06g032-rzn1d400-eb.dtb \
 	sh73a0-kzm9g.dtb
diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
new file mode 100644
index 0000000000000000000000000000000000000000..20478941170bade197afb5cc9b3d694bd9a30951
--- /dev/null
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZN1D-EB Board
+ *
+ * Copyright (C) 2023 Schneider-Electric
+ *
+ */
+
+#include "r9a06g032-rzn1d400-db.dts"
+
+/ {
+	model = "RZN1D-EB Board";
+	compatible = "renesas,rzn1d400-eb", "renesas,rzn1d400-db",
+		     "renesas,r9a06g032";
+};
+
+&mii_conv2 {
+	renesas,miic-input = <MIIC_SWITCH_PORTD>;
+	status = "okay";
+};
+
+&mii_conv3 {
+	renesas,miic-input = <MIIC_SWITCH_PORTC>;
+	status = "okay";
+};
+
+&pinctrl{
+	pins_eth1: pins-eth1 {
+		pinmux = <RZN1_PINMUX(12, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(13, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(14, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(15, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(16, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(17, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(18, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(19, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(20, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(21, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(22, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(23, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>;
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	pins_eth2: pins-eth2 {
+		pinmux = <RZN1_PINMUX(24, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(25, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(26, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(27, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(28, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(29, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(30, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(31, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(32, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(33, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(34, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(35, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>;
+		drive-strength = <6>;
+		bias-disable;
+	};
+};
+
+&switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
+		    <&pins_mdio1>;
+
+	mdio {
+		/* CN15 and CN16 switches must be configured in MDIO2 mode */
+		switch0phy1: ethernet-phy@1 {
+			reg = <1>;
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+				};
+				led@1 {
+					reg = <1>;
+				};
+				led@2 {
+					reg = <2>;
+				};
+			};	
+		};
+
+		switch0phy10: ethernet-phy@10 {
+			reg = <10>;
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+				};
+				led@1 {
+					reg = <1>;
+				};
+				led@2 {
+					reg = <2>;
+				};
+			};	
+		};
+	};
+};
+
+&switch_port2 {
+	label = "lan2";
+	phy-mode = "rgmii-id";
+	phy-handle = <&switch0phy10>;
+	status = "okay";
+};
+
+&switch_port3 {
+	label = "lan3";
+	phy-mode = "rgmii-id";
+	phy-handle = <&switch0phy1>;
+	status = "okay";
+};

---
base-commit: 9c5968db9e625019a0ee5226c7eebef5519d366a
change-id: 20250127-rzn1d400-eb-3fc1479a13e6

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


