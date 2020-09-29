Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEC927D08B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Sep 2020 16:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgI2OFH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Sep 2020 10:05:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21448 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728481AbgI2OFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Sep 2020 10:05:07 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596466800"; 
   d="scan'208";a="58254312"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Sep 2020 23:05:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8E7F34006DF0;
        Tue, 29 Sep 2020 23:05:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Date:   Tue, 29 Sep 2020 15:05:02 +0100
Message-Id: <20200929140502.16017-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The iwg21d comes with a 7" capacitive touch screen, therefore
add support for it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
* Renamed vcc-supply to power-supply due to recent bindings changes [4]
  (similar changes done for G1[MN] [5]).
* Restored RB tags from Laurent and Geert.
* Sorted the DTS

v1->v2
* This patch is part of series [1] (rest of the patches have be accepted
  by Geert [2]).
* Added regulator for lvds
* Added reset pin for touchpanel
* This patch is based on series [3]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
    ?series=330277
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
[3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
    ?series=330957
[4] https://patchwork.kernel.org/patch/11792205/
[5] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
    commit/?h=next-20200929&id=08d7a73fffb6769b1cf2278bf697e692daba3abf
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index c2c05c9685d1..0063ef92f50e 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -30,6 +30,7 @@
 
 /dts-v1/;
 #include "r8a7742-iwg21m.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "iWave Systems RainboW-G21D-Qseven board based on RZ/G1H";
@@ -52,6 +53,16 @@
 		clock-frequency = <26000000>;
 	};
 
+	lcd_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpu 2 5000000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		pinctrl-0 = <&backlight_pins>;
+		pinctrl-names = "default";
+		default-brightness-level = <7>;
+		enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -62,6 +73,41 @@
 		};
 	};
 
+	lvds-receiver {
+		compatible = "ti,ds90cf384a", "lvds-decoder";
+		power-supply = <&vcc_3v3_tft1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds_receiver_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				lvds_receiver_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+
+	panel {
+		compatible = "edt,etm0700g0dh6";
+		backlight = <&lcd_backlight>;
+		power-supply = <&vcc_3v3_tft1>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_receiver_out>;
+			};
+		};
+	};
+
 	reg_1p5v: 1p5v {
 		compatible = "regulator-fixed";
 		regulator-name = "1P5V";
@@ -85,6 +131,17 @@
 		};
 	};
 
+	vcc_3v3_tft1: regulator-panel {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc-3v3-tft1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		startup-delay-us = <500>;
+		gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+	};
+
 	vcc_sdhi2: regulator-vcc-sdhi2 {
 		compatible = "regulator-fixed";
 
@@ -139,6 +196,16 @@
 		VDDIO-supply = <&reg_3p3v>;
 		VDDD-supply = <&reg_1p5v>;
 	};
+
+	touch: touchpanel@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		/* GP1_29 is also shared with audio codec reset pin */
+		reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc_3v3_tft1>;
+	};
 };
 
 &can1 {
@@ -152,6 +219,18 @@
 	status = "okay";
 };
 
+&du {
+	status = "okay";
+};
+
+&gpio0 {
+	touch-interrupt {
+		gpio-hog;
+		gpios = <24 GPIO_ACTIVE_LOW>;
+		input;
+	};
+};
+
 &gpio1 {
 	can-trx-en-gpio{
 		gpio-hog;
@@ -167,6 +246,17 @@
 	status = "okay";
 };
 
+&lvds0 {
+	status = "okay";
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&lvds_receiver_in>;
+			};
+		};
+	};
+};
+
 &msiof0 {
 	pinctrl-0 = <&msiof0_pins>;
 	pinctrl-names = "default";
@@ -229,6 +319,11 @@
 		function = "avb";
 	};
 
+	backlight_pins: backlight {
+		groups = "tpu0_to2";
+		function = "tpu0";
+	};
+
 	can1_pins: can1 {
 		groups = "can1_data_b";
 		function = "can1";
@@ -335,6 +430,10 @@
 	shared-pin;
 };
 
+&tpu {
+	status = "okay";
+};
+
 &usbphy {
 	status = "okay";
 };
-- 
2.17.1

