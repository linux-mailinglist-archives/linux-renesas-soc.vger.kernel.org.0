Return-Path: <linux-renesas-soc+bounces-12788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6CAA23CE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 12:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCDA8188755A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5D21C4A02;
	Fri, 31 Jan 2025 11:25:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E281C1F19;
	Fri, 31 Jan 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322712; cv=none; b=gOIejY+AgaEO3b5f2kOqV9RR0k3093KSbkbfPYxRDeoohTe/zymAyyAHADmAd2tVGhblTaeICBe3HFFNS2QcCbP0bNwaq6zEhrKvyXXfRqUVH6+1Vf5uLyaBNSWMmz1lwmn4TlmaTUqvO1M8fjAZE4Hwfb8p7f9pSQFtWcau7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322712; c=relaxed/simple;
	bh=m8dgM0drA2fKaM8x3CJoi9rAqOs/Y6NSCRe34oOoMhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0TxyEomIUCTm2AJnpebi6jBL+B6GgiTRCc+cYmP8PDw2FXy8EEEPuEussZOS2kNuY10tfRQ0vIh8aDW9y+JIC6WTSNwsi0qKT5vklKJqdjeq0RiF6ElLsBIX1T4ovoOPSCYbuGeYrmmVP7zyM4ytM004KXOv71R7vti959xho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 4VEXfEKTTlWknYvp2kEqfg==
X-CSE-MsgGUID: i5StwDapRMCt1mzOLs0VFA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2025 20:25:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 09B9D4018228;
	Fri, 31 Jan 2025 20:24:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
Date: Fri, 31 Jan 2025 11:24:23 +0000
Message-ID: <20250131112429.119882-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable SDHI1 on the RZ/G3E SMARC EVK platform using gpio regulator for
voltage switching.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced the regulator usd_vdd_3p3v->reg_3p3v.
 * Renamed the gpio-hog node sd1-pwr-en->sd1-pwr-en-hog.
 * Sorted sd1 pin ctrl nodes.
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 45 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 18 ++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index fe67bce26d75..5d7983812c70 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define SW_SD0_DEV_SEL		0
+#define SW_SDIO_M2E		0
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
@@ -20,6 +21,16 @@ / {
 	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
 		     "renesas,r9a09g047e57", "renesas,r9a09g047";
+
+	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD1_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
 };
 
 &pinctrl {
@@ -27,9 +38,43 @@ scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
 	};
+
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3E_GPIO(1, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1-cd {
+			pinmux = <RZG3E_PORT_PINMUX(1, 4, 8)>; /* SD1CD */
+		};
+
+		sd1-ctrl {
+			pinmux = <RZG3E_PORT_PINMUX(G, 0, 1)>, /* SD1CLK */
+				 <RZG3E_PORT_PINMUX(G, 1, 1)>; /* SD1CMD */
+		};
+
+		sd1-data {
+			pinmux = <RZG3E_PORT_PINMUX(G, 2, 1)>, /* SD1DAT0 */
+				 <RZG3E_PORT_PINMUX(G, 3, 1)>, /* SD1DAT1 */
+				 <RZG3E_PORT_PINMUX(G, 4, 1)>, /* SD1DAT2 */
+				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
+		};
+	};
 };
 
 &scif0 {
 	pinctrl-0 = <&scif_pins>;
 	pinctrl-names = "default";
 };
+
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd1_pvdd>;
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index e378d55e6e9b..fd82df8adc1e 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -5,6 +5,15 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+/*
+ * Please set the switch position SW_OPT_MUX.1 on the carrier board and the
+ * corresponding macro SW_SDIO_M2E on the board DTS:
+ *
+ * SW_SDIO_M2E:
+ *     0 - SMARC SDIO signal is connected to uSD1
+ *     1 - SMARC SDIO signal is connected to M.2 Key E connector
+ */
+
 / {
 	model = "Renesas RZ SMARC Carrier-II Board";
 	compatible = "renesas,smarc2-evk";
@@ -16,9 +25,18 @@ chosen {
 
 	aliases {
 		serial3 = &scif0;
+		mmc1 = &sdhi1;
 	};
 };
 
 &scif0 {
 	status = "okay";
 };
+
+&sdhi1 {
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+
+	status = "okay";
+};
-- 
2.43.0


