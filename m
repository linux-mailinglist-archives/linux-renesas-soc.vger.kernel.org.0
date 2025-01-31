Return-Path: <linux-renesas-soc+bounces-12789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AA6A23CE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 12:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 017401692E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF9F1C5D59;
	Fri, 31 Jan 2025 11:25:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236501C3039;
	Fri, 31 Jan 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322713; cv=none; b=S9Sum1lnh724c63jGABRfM/mblCO5wrHaAHj1CjN/PHv+kns9FjC0yN3aJKGprR62QdHaM8iZxIAhtmmX+uT9/Qazpvgxcv3fJJDD8VSB0vIS6PAyWyYtdzF5IX5C5VlnD81qf8JRwmeRX5AAgMToqsgmwi06+9OvzFj43iAPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322713; c=relaxed/simple;
	bh=fU5DEK012uQVuv9eQeLiEuxNjAdKW5AlXAORYqPYyAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMmocyriJu+0zEa89PDWFHO/13t0AiPBn1IKkdEWfDZrBfMzfur1xpqI4xdr2HL4esZqw1flyRJpBx/pwQXYtrLXlSIAuRvMrr5QEtyx/T9XtcOYrFwI3wPmPUtT/GPJo9YPqZa6QY097mJMD/RixkwA7BM55Ii8nDz2TBCWvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: c/LMmQIhSkG/5DlGbpPUHA==
X-CSE-MsgGUID: V4MJuhdASFaafAU5TzdOKg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2025 20:25:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7DB224017BBB;
	Fri, 31 Jan 2025 20:24:53 +0900 (JST)
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
Subject: [PATCH v2 7/8] arm64: dts: renesas: rzg3e-smarc-som: Add support for enable SD on SDHI0
Date: Fri, 31 Jan 2025 11:24:22 +0000
Message-ID: <20250131112429.119882-8-biju.das.jz@bp.renesas.com>
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

Add support for enabling SD on SDHI0 on RZ/G3E SMARC SoM. It is enabled
by setting the macro SW_SD0_DEV_SEL to 1 in board DTS and setting the
switch SYS.1 to ON position on the SoM.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  3 +
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 57 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index f9248037de9e..fe67bce26d75 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -7,6 +7,9 @@
 
 /dts-v1/;
 
+/* Switch selection settings */
+#define SW_SD0_DEV_SEL		0
+
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 9b5e5fd76c29..d3b47c792454 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -5,6 +5,15 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+/*
+ * Please set the switch position SYS.1 on the SoM and the corresponding macro
+ * SW_SD0_DEV_SEL on the board DTS:
+ *
+ * SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ */
+
 / {
 	compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
 
@@ -43,6 +52,34 @@ &audio_extal_clk {
 };
 
 &pinctrl {
+#if (SW_SD0_DEV_SEL)
+	sdhi0_pins: sd0 {
+		sd0-cd {
+			pinmux = <RZG3E_PORT_PINMUX(5, 0, 8)>;
+		};
+
+		sd0-ctrl {
+			pins = "SD0CLK", "SD0CMD";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-data {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-iovs {
+			pins = "SD0IOVS";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-pwen {
+			pins = "SD0PWEN";
+			renesas,output-impedance = <3>;
+		};
+	};
+#endif
+
 	sdhi0_emmc_pins: sd0emmc {
 		sd0-emmc-ctrl {
 			pins = "SD0CLK", "SD0CMD";
@@ -96,6 +133,25 @@ &rtxin_clk {
 	clock-frequency = <32768>;
 };
 
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi0>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&vqmmc_sdhi0 {
+	regulator-name = "SD0_PVDD";
+	status = "okay";
+};
+#else
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_emmc_pins>;
 	pinctrl-1 = <&sdhi0_emmc_pins>;
@@ -109,6 +165,7 @@ &sdhi0 {
 	fixed-emmc-driver-type = <1>;
 	status = "okay";
 };
+#endif
 
 &sdhi2 {
 	pinctrl-0 = <&sdhi2_pins>;
-- 
2.43.0


