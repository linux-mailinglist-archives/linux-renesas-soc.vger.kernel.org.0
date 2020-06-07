Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D4B1F0E18
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 20:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgFGSly (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 14:41:54 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:26544 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726611AbgFGSlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 14:41:53 -0400
X-IronPort-AV: E=Sophos;i="5.73,485,1583161200"; 
   d="scan'208";a="49036330"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jun 2020 03:41:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6496040CCFCF;
        Mon,  8 Jun 2020 03:41:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/11] arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into hihope-common-rev2.dtsi file
Date:   Sun,  7 Jun 2020 19:40:59 +0100
Message-Id: <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Separate out Rev.2.0 specific hardware changes into
hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
by all the variants for RZ/G2M[N] boards.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 .../boot/dts/renesas/hihope-common-rev2.dtsi  | 101 ++++++++++++++++++
 .../arm64/boot/dts/renesas/hihope-common.dtsi |  87 +--------------
 .../renesas/r8a774a1-hihope-rzg2m-rev2.dts    |   1 +
 .../renesas/r8a774b1-hihope-rzg2n-rev2.dts    |   1 +
 4 files changed, 105 insertions(+), 85 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
new file mode 100644
index 000000000000..66c34fc9e7a5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
+ * parts
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
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
+		led0 {
+			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		led1 {
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		led2 {
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+		};
+
+		led3 {
+			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
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
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index bd056904e8bd..4efcdebd8842 100644
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
@@ -29,40 +30,6 @@
 		};
 	};
 
-	leds {
-		compatible = "gpio-leds";
-
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
-		led1 {
-			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
-		};
-
-		led2 {
-			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
-		};
-
-		led3 {
-			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
-		};
-
-		wlan_active_led {
-			label = "yellow:wlan";
-			gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "phy0tx";
-			default-state = "off";
-		};
-	};
-
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -112,17 +79,6 @@
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
@@ -194,11 +150,6 @@
 
 	uart-has-rtscts;
 	status = "okay";
-
-	bluetooth {
-		compatible = "ti,wl1837-st";
-		enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &hsusb {
@@ -210,13 +161,6 @@
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
@@ -281,11 +225,6 @@
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
@@ -309,28 +248,6 @@
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
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
index 276f449ad14e..e7eea3225abe 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a774a1.dtsi"
 #include "hihope-common.dtsi"
+#include "hihope-common-rev2.dtsi"
 
 / {
 	model = "HopeRun HiHope RZ/G2M main board (Rev.2.0) based on r8a774a1";
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
index eb1206b2d97a..ecb527356f37 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a774b1.dtsi"
 #include "hihope-common.dtsi"
+#include "hihope-common-rev2.dtsi"
 
 / {
 	model = "HopeRun HiHope RZ/G2N main board (Rev.2.0) based on r8a774b1";
-- 
2.17.1

