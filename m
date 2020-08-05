Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE6923CD41
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 19:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgHERXg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 13:23:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:56777 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728575AbgHERRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 13:17:03 -0400
X-IronPort-AV: E=Sophos;i="5.75,436,1589209200"; 
   d="scan'208";a="53743861"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2020 23:26:39 +0900
Received: from localhost.localdomain (unknown [172.29.52.220])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E1BBB42921F2;
        Wed,  5 Aug 2020 23:26:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
Date:   Wed,  5 Aug 2020 15:26:34 +0100
Message-Id: <20200805142634.12252-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some r8a7745-iwg22d-sodimm.dts device nodes are not sorted alphabetically.
This patch fixes the sorting of nodes and also fixes a typo in the stmpe
node.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:- Fixed sorting of sound node
v1:- https://patchwork.kernel.org/patch/11690969/
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 112 ++++++++++----------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index b15b1b088a32..1c7b37a01f0a 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -53,42 +53,6 @@
 		clock-frequency = <26000000>;
 	};
 
-	rsnd_sgtl5000: sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,bitclock-master = <&sndcodec>;
-		simple-audio-card,frame-master = <&sndcodec>;
-
-		sndcpu: simple-audio-card,cpu {
-			sound-dai = <&rcar_sound>;
-		};
-
-		sndcodec: simple-audio-card,codec {
-			sound-dai = <&sgtl5000>;
-		};
-	};
-
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
-	vccq_panel: regulator-vccq-panel {
-		compatible = "regulator-fixed";
-		regulator-name = "Panel VccQ";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
-		enable-active-high;
-	};
-
 	backlight_lcd: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&tpu 3 5000000 PWM_POLARITY_INVERTED>;
@@ -107,19 +71,40 @@
 			};
 		};
 	};
-};
 
-&du {
-	pinctrl-0 = <&du0_pins>;
-	pinctrl-names = "default";
+	vccq_panel: regulator-vccq-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "Panel VccQ";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
 
-	status = "okay";
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
 
-	ports {
-		port@0 {
-			endpoint {
-				remote-endpoint = <&lcd_in>;
-			};
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	rsnd_sgtl5000: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sndcodec>;
+		simple-audio-card,frame-master = <&sndcodec>;
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&sgtl5000>;
 		};
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

