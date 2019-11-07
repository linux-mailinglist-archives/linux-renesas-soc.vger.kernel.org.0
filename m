Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006A6F394D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfKGULk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:11:40 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:32690 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725906AbfKGULk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:11:40 -0500
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; 
   d="scan'208";a="30895672"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:39 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 727E94009F8A;
        Fri,  8 Nov 2019 05:11:35 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 6/7] ARM: dts: iwg20d-q7-common: Add LCD support
Date:   Thu,  7 Nov 2019 20:11:02 +0000
Message-Id: <1573157463-14070-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The iwg20d comes with a 7" capacitive touch screen, therefore
add support for it.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* No change
v1->v2:
* No change
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi  | 85 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi |  1 -
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ae75a1db..3428b8d 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -46,6 +46,49 @@
 		clock-frequency = <26000000>;
 	};
 
+	lcd_backlight: backlight {
+		compatible = "pwm-backlight";
+
+		pwms = <&pwm3 0 5000000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		enable-gpios = <&gpio5 14 GPIO_ACTIVE_HIGH>;
+	};
+
+	lvds-receiver {
+		compatible = "lvds-decoder";
+		powerdown = <&gpio7 25 GPIO_ACTIVE_LOW>;
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
+		compatible = "edt,etm0700g0dh6", "simple-panel";
+		backlight = <&lcd_backlight>;
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
@@ -120,6 +163,18 @@
 	status = "okay";
 };
 
+&du {
+	status = "okay";
+};
+
+&gpio2 {
+	touch-interrupt {
+		gpio-hog;
+		gpios = <12 GPIO_ACTIVE_LOW>;
+		input;
+	};
+};
+
 &hsusb {
 	status = "okay";
 	pinctrl-0 = <&usb0_pins>;
@@ -147,6 +202,25 @@
 		VDDIO-supply = <&reg_3p3v>;
 		VDDD-supply = <&reg_1p5v>;
 	};
+
+	touch: touchpanel@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&lvds_receiver_in>;
+			};
+		};
+	};
 };
 
 &pci0 {
@@ -180,6 +254,11 @@
 		function = "i2c2";
 	};
 
+	pwm3_pins: pwm3 {
+		groups = "pwm3";
+		function = "pwm3";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data_d";
 		function = "scif0";
@@ -218,6 +297,12 @@
 	};
 };
 
+&pwm3 {
+	pinctrl-0 = <&pwm3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
index 0e99df2..ede2e0c 100644
--- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
@@ -39,7 +39,6 @@
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
-	status = "okay";
 
 	ports {
 		port@0 {
-- 
2.7.4

