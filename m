Return-Path: <linux-renesas-soc+bounces-12522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3221DA1C82A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 14:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C21018866D0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 13:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48154137930;
	Sun, 26 Jan 2025 13:46:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E7982890;
	Sun, 26 Jan 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899218; cv=none; b=QhHKuXVgFiuTJxkvkWf1fXaM8jlH08sqJVNNpK+LFQpchat3zCXaXwl5k+QPGAqYZWw6exi1VoirqIrQKKH/BOuOHcKPk+0TWTtmj2lKe8WONBAQnCxT6Ulr0zqixe7t0V5Dv6LKrl2q+OwTisT9HZVIPSMExE97D8CfSDTWPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899218; c=relaxed/simple;
	bh=41ZvPXMutPJZy2Ek+qRW35BmRCxzZqFEDxVk+LDm+Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENmpVyD0Ybxqv1RTDEN+f2GwoWq6Sh7ZR6Ie27NwJFRlnKi7GQKKib/361CV1vmIRsIB2AUdbZe1SmyxBkrLe5oyKeG3HhCt6pMFuNj5wX1fNpOzKhtFgCe8SYKLJqm9RA47UKrFm7yawRwnVb3QgLRjC9X9oCOso+8Hmn+aSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dyylZR/XSSOhK6FKYpOJIg==
X-CSE-MsgGUID: 6lr62ZCSSQ2UogcVKhi17Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2025 22:46:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 24B2540061A7;
	Sun, 26 Jan 2025 22:46:43 +0900 (JST)
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
Subject: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
Date: Sun, 26 Jan 2025 13:46:09 +0000
Message-ID: <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
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
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 65 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  9 +++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index c063d47e2952..0e3d4ff31285 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -12,10 +12,40 @@
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * To enable uSD card on SDIO_USD:
+ *
+ * Switch bank - SW_OPT_MUX-1 (SW_SDIO_M2E):
+ *	0 - SMARC SDIO signal is connected to uSD1
+ *	1 - SMARC SDIO signal is connected to M.2 Key E connector
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
 		     "renesas,r9a09g047e57", "renesas,r9a09g047";
+
+	usd_vdd_3p3v: regulator-usd-vdd-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vqmmc_sdhi1_ext: regulator-vqmmc-sdhi1-ext {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&pinctrl RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;
+
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
 };
 
 &pinctrl {
@@ -23,9 +53,44 @@ scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
 	};
+
+	sd1-pwr-en {
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
+		sd1-data {
+			pinmux = <RZG3E_PORT_PINMUX(G, 2, 1)>, /* SD1DAT0 */
+				 <RZG3E_PORT_PINMUX(G, 3, 1)>, /* SD1DAT1 */
+				 <RZG3E_PORT_PINMUX(G, 4, 1)>, /* SD1DAT2 */
+				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
+		};
+
+		sd1-ctrl {
+			pinmux = <RZG3E_PORT_PINMUX(G, 0, 1)>, /* SD1CLK */
+				 <RZG3E_PORT_PINMUX(G, 1, 1)>; /* SD1CMD */
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
+	vmmc-supply = <&usd_vdd_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi1_ext>;
+	/delete-node/ vqmmc_regulator;
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index e378d55e6e9b..ec79452393b0 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -16,9 +16,18 @@ chosen {
 
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


