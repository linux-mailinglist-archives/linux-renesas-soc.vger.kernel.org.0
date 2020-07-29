Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4080C231E83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jul 2020 14:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgG2M0K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jul 2020 08:26:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:43345 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbgG2M0K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jul 2020 08:26:10 -0400
X-IronPort-AV: E=Sophos;i="5.75,410,1589209200"; 
   d="scan'208";a="53141138"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Jul 2020 21:26:08 +0900
Received: from localhost.localdomain (unknown [172.29.53.182])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 392F84004BDA;
        Wed, 29 Jul 2020 21:26:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
Date:   Wed, 29 Jul 2020 13:26:02 +0100
Message-Id: <20200729122602.9561-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some device nodes in the r8a7745-iwg22d-sodimm.dts are not sorted
alphabetically. This patch fixes the sorting of nodes and also fixes a
typo in the stmpe node.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is tested against renesas-devel
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 104 ++++++++++----------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index b15b1b088a32..5f7f230de529 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -53,6 +53,25 @@
 		clock-frequency = <26000000>;
 	};
 
+	backlight_lcd: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpu 3 5000000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+	};
+
+	lcd_panel: lcd {
+		compatible = "edt,etm043080dh6gp";
+		power-supply = <&vccq_panel>;
+		backlight = <&backlight_lcd>;
+
+		port {
+			lcd_in: endpoint {
+				remote-endpoint = <&du_out_rgb0>;
+			};
+		};
+	};
+
 	rsnd_sgtl5000: sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
@@ -68,18 +87,6 @@
 		};
 	};
 
-	vccq_sdhi0: regulator-vccq-sdhi0 {
-		compatible = "regulator-gpio";
-
-		regulator-name = "SDHI0 VccQ";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
-		gpios-states = <1>;
-		states = <3300000 1>, <1800000 0>;
-	};
-
 	vccq_panel: regulator-vccq-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "Panel VccQ";
@@ -89,38 +96,16 @@
 		enable-active-high;
 	};
 
-	backlight_lcd: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&tpu 3 5000000 PWM_POLARITY_INVERTED>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <7>;
-	};
-
-	lcd_panel: lcd {
-		compatible = "edt,etm043080dh6gp";
-		power-supply = <&vccq_panel>;
-		backlight = <&backlight_lcd>;
-
-		port {
-			lcd_in: endpoint {
-				remote-endpoint = <&du_out_rgb0>;
-			};
-		};
-	};
-};
-
-&du {
-	pinctrl-0 = <&du0_pins>;
-	pinctrl-names = "default";
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
 
-	status = "okay";
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
 
-	ports {
-		port@0 {
-			endpoint {
-				remote-endpoint = <&lcd_in>;
-			};
-		};
+		gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
 	};
 };
 
@@ -150,6 +135,21 @@
 	status = "okay";
 };
 
+&du {
+	pinctrl-0 = <&du0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&lcd_in>;
+			};
+		};
+	};
+};
+
 &hscif1 {
 	pinctrl-0 = <&hscif1_pins>;
 	pinctrl-names = "default";
@@ -171,6 +171,15 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	sgtl5000: codec@a {
+		compatible = "fsl,sgtl5000";
+		#sound-dai-cells = <0>;
+		reg = <0x0a>;
+		clocks = <&audio_clock>;
+		VDDA-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_3p3v>;
+	};
+
 	stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
@@ -179,7 +188,7 @@
 
 		/* 3.25 MHz ADC clock speed */
 		st,adc-freq = <1>;
-		/* ADC converstion time: 80 clocks */
+		/* ADC conversion time: 80 clocks */
 		st,sample-time = <4>;
 		/* 12-bit ADC */
 		st,mod-12b = <1>;
@@ -203,15 +212,6 @@
 			st,touch-det-delay = <5>;
 		};
 	};
-
-	sgtl5000: codec@a {
-		compatible = "fsl,sgtl5000";
-		#sound-dai-cells = <0>;
-		reg = <0x0a>;
-		clocks = <&audio_clock>;
-		VDDA-supply = <&reg_3p3v>;
-		VDDIO-supply = <&reg_3p3v>;
-	};
 };
 
 &pci1 {
-- 
2.17.1

