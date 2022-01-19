Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D55F4937BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 10:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353058AbiASJww (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 04:52:52 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:9079 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234337AbiASJww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 04:52:52 -0500
X-IronPort-AV: E=Sophos;i="5.88,299,1635174000"; 
   d="scan'208";a="107565455"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jan 2022 18:52:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 33A3D410DB9C;
        Wed, 19 Jan 2022 18:52:48 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
Date:   Wed, 19 Jan 2022 09:52:42 +0000
Message-Id: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L and RZ/G2LC SoC use the same carrier board, but the SoM is
different.

Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface available
on PMOD1.

This patch adds support for handling the pin mapping differences by moving
definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
This patch series has dependency on [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=605897
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |   8 +-
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   1 +
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 207 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 195 +----------------
 4 files changed, 210 insertions(+), 201 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index bfeeb6c86854..18818536a54f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -9,12 +9,11 @@
 #include "r9a07g044c2.dtsi"
 #include "rzg2lc-smarc-som.dtsi"
 #include "rzg2lc-smarc-pinfunction.dtsi"
-#include "rzg2l-smarc.dtsi"
+#include "rz-smarc-common.dtsi"
 
 / {
 	model = "Renesas SMARC EVK based on r9a07g044c2";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
-
 };
 
 &canfd {
@@ -66,11 +65,6 @@
 	status = "disabled";
 };
 
-&scif2 {
-	/delete-property/ pinctrl-0;
-	status = "disabled";
-};
-
 &spi1 {
 	/delete-property/ pinctrl-0;
 	status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index 886d38886d05..bc2af6c92ccd 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -9,6 +9,7 @@
 #include "r9a07g044l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
 #include "rzg2l-smarc-pinfunction.dtsi"
+#include "rz-smarc-common.dtsi"
 #include "rzg2l-smarc.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
new file mode 100644
index 000000000000..b74fa6117207
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/{G2L, G2LC} SMARC EVK common parts
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/*
+ * SSI-WM8978
+ *
+ * This command is required when Playback/Capture
+ *
+ *	amixer cset name='Left Input Mixer L2 Switch' on
+ *	amixer cset name='Right Input Mixer R2 Switch' on
+ *	amixer cset name='Headphone Playback Volume' 100
+ *	amixer cset name='PCM Volume' 100%
+ *	amixer cset name='Input PGA Volume' 25
+ *
+ */
+
+/ {
+	aliases {
+		serial0 = &scif0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c3 = &i2c3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	audio_mclock: audio_mclock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <11289600>;
+	};
+
+	snd_rzg2l: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,widgets = "Microphone", "Microphone Jack";
+		simple-audio-card,routing =
+			    "L2", "Mic Bias",
+			    "R2", "Mic Bias",
+			    "Mic Bias", "Microphone Jack";
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&ssi0>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			clocks = <&audio_mclock>;
+			sound-dai = <&wm8978>;
+		};
+	};
+
+	usb0_vbus_otg: regulator-usb0-vbus-otg {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB0_VBUS_OTG";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vccq_sdhi1: regulator-vccq-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
+	};
+};
+
+&audio_clk1{
+	clock-frequency = <11289600>;
+};
+
+&audio_clk2{
+	clock-frequency = <12288000>;
+};
+
+&canfd {
+	pinctrl-0 = <&can0_pins &can1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+	};
+
+	channel1 {
+		status = "okay";
+	};
+};
+
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	wm8978: codec@1a {
+		compatible = "wlf,wm8978";
+		#sound-dai-cells = <0>;
+		reg = <0x1a>;
+	};
+};
+
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vccq_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ssi0 {
+	pinctrl-0 = <&ssi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 46abb29718cc..4b044b86b1fc 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the RZ/G2L SMARC EVK common parts
+ * Device Tree Source for the RZ/G2L SMARC EVK parts
  *
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
@@ -8,164 +8,13 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
-/*
- * SSI-WM8978
- *
- * This command is required when Playback/Capture
- *
- *	amixer cset name='Left Input Mixer L2 Switch' on
- *	amixer cset name='Right Input Mixer R2 Switch' on
- *	amixer cset name='Headphone Playback Volume' 100
- *	amixer cset name='PCM Volume' 100%
- *	amixer cset name='Input PGA Volume' 25
- *
- */
-
 /* comment the #define statement to disable SCIF2 (SER0) on PMOD1 (CN7) */
 #define PMOD1_SER0	1
 
 / {
 	aliases {
-		serial0 = &scif0;
 		serial1 = &scif2;
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c3 = &i2c3;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	audio_mclock: audio_mclock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <11289600>;
-	};
-
-	snd_rzg2l: sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,bitclock-master = <&cpu_dai>;
-		simple-audio-card,frame-master = <&cpu_dai>;
-		simple-audio-card,mclk-fs = <256>;
-
-		simple-audio-card,widgets = "Microphone", "Microphone Jack";
-		simple-audio-card,routing =
-			    "L2", "Mic Bias",
-			    "R2", "Mic Bias",
-			    "Mic Bias", "Microphone Jack";
-
-		cpu_dai: simple-audio-card,cpu {
-			sound-dai = <&ssi0>;
-		};
-
-		codec_dai: simple-audio-card,codec {
-			clocks = <&audio_mclock>;
-			sound-dai = <&wm8978>;
-		};
-	};
-
-	usb0_vbus_otg: regulator-usb0-vbus-otg {
-		compatible = "regulator-fixed";
-
-		regulator-name = "USB0_VBUS_OTG";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-	};
-
-	vccq_sdhi1: regulator-vccq-sdhi1 {
-		compatible = "regulator-gpio";
-		regulator-name = "SDHI1 VccQ";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
-		gpios-states = <1>;
-		states = <3300000 1>, <1800000 0>;
-	};
-};
-
-&audio_clk1{
-	clock-frequency = <11289600>;
-};
-
-&audio_clk2{
-	clock-frequency = <12288000>;
-};
-
-&canfd {
-	pinctrl-0 = <&can0_pins &can1_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	channel0 {
-		status = "okay";
 	};
-
-	channel1 {
-		status = "okay";
-	};
-};
-
-&ehci0 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
-};
-
-&hsusb {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&i2c0 {
-	pinctrl-0 = <&i2c0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&i2c3 {
-	pinctrl-0 = <&i2c3_pins>;
-	pinctrl-names = "default";
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	wm8978: codec@1a {
-		compatible = "wlf,wm8978";
-		#sound-dai-cells = <0>;
-		reg = <0x1a>;
-	};
-};
-
-&ohci0 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&ohci1 {
-	status = "okay";
-};
-
-&phyrst {
-	status = "okay";
-};
-
-&scif0 {
-	pinctrl-0 = <&scif0_pins>;
-	pinctrl-names = "default";
-	status = "okay";
 };
 
 /*
@@ -184,45 +33,3 @@
 	status = "okay";
 };
 #endif
-
-&sdhi1 {
-	pinctrl-0 = <&sdhi1_pins>;
-	pinctrl-1 = <&sdhi1_pins_uhs>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&reg_3p3v>;
-	vqmmc-supply = <&vccq_sdhi1>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-
-&spi1 {
-	pinctrl-0 = <&spi1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&ssi0 {
-	pinctrl-0 = <&ssi0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&usb2_phy0 {
-	pinctrl-0 = <&usb0_pins>;
-	pinctrl-names = "default";
-
-	vbus-supply = <&usb0_vbus_otg>;
-	status = "okay";
-};
-
-&usb2_phy1 {
-	pinctrl-0 = <&usb1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-- 
2.17.1

