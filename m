Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59D9207418
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387709AbgFXNOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:14:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62151 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387558AbgFXNOd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:14:33 -0400
X-IronPort-AV: E=Sophos;i="5.75,275,1589209200"; 
   d="scan'208";a="50279156"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jun 2020 22:14:31 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05C8E40062A1;
        Wed, 24 Jun 2020 22:14:29 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 03/11] arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into hihope-common-rev2.dtsi file
Date:   Wed, 24 Jun 2020 14:12:02 +0100
Message-Id: <1593004330-5039-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Separate out Rev.2.0 specific hardware changes into
hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
by all the variants for RZ/G2M[N] boards.

LED node names have been updated according to Rev.4.0 schematics.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../arm64/boot/dts/renesas/hihope-common.dtsi | 71 +--------------
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi  | 86 +++++++++++++++++++
 .../renesas/r8a774a1-hihope-rzg2m-rev2.dts    |  2 +-
 .../renesas/r8a774b1-hihope-rzg2n-rev2.dts    |  2 +-
 4 files changed, 92 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index bd056904e8bd..beddfd7a7584 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2[MN] main board common parts
+ * Device Tree Source for the HiHope RZ/G2[MN] main board
+ * Rev.[2.0/3.0/4.0] common parts
  *
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
@@ -32,17 +33,6 @@
 	leds {
 		compatible = "gpio-leds";
 
-		bt_active_led {
-			label = "blue:bt";
-			gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "hci0-power";
-			default-state = "off";
-		};
-
-		led0 {
-			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
-		};
-
 		led1 {
 			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
 		};
@@ -55,11 +45,8 @@
 			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
 		};
 
-		wlan_active_led {
-			label = "yellow:wlan";
-			gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "phy0tx";
-			default-state = "off";
+		led4 {
+			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
@@ -112,17 +99,6 @@
 		states = <3300000 1>, <1800000 0>;
 	};
 
-	wlan_en_reg: regulator-wlan_en {
-		compatible = "regulator-fixed";
-		regulator-name = "wlan-en-regulator";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		startup-delay-us = <70000>;
-
-		gpio = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	x302_clk: x302-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -194,11 +170,6 @@
 
 	uart-has-rtscts;
 	status = "okay";
-
-	bluetooth {
-		compatible = "ti,wl1837-st";
-		enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &hsusb {
@@ -210,13 +181,6 @@
 	clock-frequency = <400000>;
 	status = "okay";
 
-	gpio_expander: gpio@20 {
-		compatible = "onnn,pca9654";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	versaclock5: clock-generator@6a {
 		compatible = "idt,5p49v5923";
 		reg = <0x6a>;
@@ -281,11 +245,6 @@
 		power-source = <1800>;
 	};
 
-	sound_clk_pins: sound_clk {
-		groups = "audio_clk_a_a";
-		function = "audio_clk";
-	};
-
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -309,28 +268,6 @@
 	};
 };
 
-&rcar_sound {
-	pinctrl-0 = <&sound_clk_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
-	rsnd_port: port {
-		rsnd_endpoint: endpoint {
-			remote-endpoint = <&dw_hdmi0_snd_in>;
-
-			dai-format = "i2s";
-			bitclock-master = <&rsnd_endpoint>;
-			frame-master = <&rsnd_endpoint>;
-
-			playback = <&ssi2>;
-		};
-	};
-};
-
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
new file mode 100644
index 000000000000..8e2db1d6ca81
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
+ * parts
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "hihope-common.dtsi"
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		bt_active_led {
+			label = "blue:bt";
+			gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "hci0-power";
+			default-state = "off";
+		};
+
+		wlan_active_led {
+			label = "yellow:wlan";
+			gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+	};
+
+	wlan_en_reg: regulator-wlan_en {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <70000>;
+
+		gpio = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&hscif0 {
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c4 {
+	gpio_expander: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pfc {
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a_a";
+		function = "audio_clk";
+	};
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_clk_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	rsnd_port: port {
+		rsnd_endpoint: endpoint {
+			remote-endpoint = <&dw_hdmi0_snd_in>;
+
+			dai-format = "i2s";
+			bitclock-master = <&rsnd_endpoint>;
+			frame-master = <&rsnd_endpoint>;
+
+			playback = <&ssi2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
index 276f449ad14e..bb18f6ee2048 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 #include "r8a774a1.dtsi"
-#include "hihope-common.dtsi"
+#include "hihope-rev2.dtsi"
 
 / {
 	model = "HopeRun HiHope RZ/G2M main board (Rev.2.0) based on r8a774a1";
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
index eb1206b2d97a..c69ca5cf6f77 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 #include "r8a774b1.dtsi"
-#include "hihope-common.dtsi"
+#include "hihope-rev2.dtsi"
 
 / {
 	model = "HopeRun HiHope RZ/G2N main board (Rev.2.0) based on r8a774b1";
-- 
2.17.1

