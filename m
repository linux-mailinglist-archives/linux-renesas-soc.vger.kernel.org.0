Return-Path: <linux-renesas-soc+bounces-12912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A3A2AA36
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0674D188260B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800F41EA7FD;
	Thu,  6 Feb 2025 13:41:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B541EA7E6;
	Thu,  6 Feb 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849284; cv=none; b=qXYJsI5ywEkUDvfwKERiUHUr5y5LO+mhZhiV3hvFEYs0Na8tiAahlOsywlHgxyWvzD6MjPVDvlF1JHCNd2hOUfwDl8B3lgEGlauh9FWeM6m3hfAKFJpRtxjxWGMGl954JpcxSUbkuyxCzDsCI9X4KkmjO37rbXNouh2pP0WNEOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849284; c=relaxed/simple;
	bh=3kz+7Vs0zqj/PvRtFzztlBaYM3X6IkOs6QTrXY46dZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0u1BQOLRcz5QUE62uXUa7dX3iVskKq/GNECxXRdQmYc/3weDxAa6vkvJ60k0YEFyarsYpJyOVQSdVoYq2jnTDJmU4U3A7/cdWby9jCz1yRimJ6vxvVvycWbSuR1IIaLPmfVHmKArvl+NbV4gm99XJpbMe86sPcGUJAeQT4tt6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: EhVsAoveQMOtfsAIDaVbag==
X-CSE-MsgGUID: 8cfiY52QS/mKy0B8YQ7X9g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2025 22:41:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 63AAA4019C60;
	Thu,  6 Feb 2025 22:41:19 +0900 (JST)
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
Subject: [PATCH v3 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
Date: Thu,  6 Feb 2025 13:40:32 +0000
Message-ID: <20250206134047.67866-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Added header file gpio.h.
v1->v2:
 * Replaced the regulator usd_vdd_3p3v->reg_3p3v.
 * Renamed the gpio-hog node sd1-pwr-en->sd1-pwr-en-hog.
 * Sorted sd1 pin ctrl nodes.
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 46 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 18 ++++++++
 2 files changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 152a00aa354b..5d7983812c70 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -9,7 +9,9 @@
 
 /* Switch selection settings */
 #define SW_SD0_DEV_SEL		0
+#define SW_SDIO_M2E		0
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
 #include "rzg3e-smarc-som.dtsi"
@@ -19,6 +21,16 @@ / {
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
@@ -26,9 +38,43 @@ scif_pins: scif {
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


