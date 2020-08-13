Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD8B243B2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 16:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMOAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 10:00:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:16111 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726053AbgHMOAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 10:00:47 -0400
X-IronPort-AV: E=Sophos;i="5.76,308,1592838000"; 
   d="scan'208";a="54305209"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Aug 2020 23:00:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0634B4004CF4;
        Thu, 13 Aug 2020 23:00:42 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Date:   Thu, 13 Aug 2020 15:00:41 +0100
Message-Id: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The iwg21d comes with a 7" capacitive touch screen, therefore
add support for it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
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
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index b3461a61a4bf..9bf4fbd9c736 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -30,6 +30,7 @@
 
 /dts-v1/;
 #include "r8a7742-iwg21m.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "iWave Systems RainboW-G21D-Qseven board based on RZ/G1H";
@@ -52,6 +53,51 @@
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
+	lvds-receiver {
+		compatible = "ti,ds90cf384a", "lvds-decoder";
+		vcc-supply = <&vcc_3v3_tft1>;
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
@@ -75,6 +121,17 @@
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
 
@@ -129,12 +186,34 @@
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
 
 &cmt0 {
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
 &hsusb {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
@@ -165,6 +244,11 @@
 		function = "avb";
 	};
 
+	backlight_pins: backlight {
+		groups = "tpu0_to2";
+		function = "tpu0";
+	};
+
 	i2c2_pins: i2c2 {
 		groups = "i2c2_b";
 		function = "i2c2";
@@ -208,6 +292,17 @@
 	};
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
 &rcar_sound {
 	pinctrl-0 = <&sound_pins>;
 	pinctrl-names = "default";
@@ -261,6 +356,10 @@
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

