Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F07B120275
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfLPK3k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:39 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCBBD130D;
        Mon, 16 Dec 2019 11:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492175;
        bh=SDhpg95pNYwvTDG8mWp7nEbGSj6l4DgwHKU7WgYNMFc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CRcP1LmSoPLRCJSII2TUCiM3IvETSrZ4An9JtZt3rD3xW15lgh9YZgBfknLY5SF7W
         2K3WePNvTQSXNMb0qEMZlokP/25BYK4P5pCMpo/W5HpMfcTrehfPjpQRYPek+Xm4te
         kI/e5NOQWDRmUZwVhiUUrYkRH5Qr5lXZRNeS9t10=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 05/13] arm64: dts: renesas: eagle: Provide MAX9286 GMSL deserialiser
Date:   Mon, 16 Dec 2019 10:29:22 +0000
Message-Id: <20191216102930.5867-6-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide the wiring for the MAX9286 populated on the Eagle-V3M board
which has 4 FAKRA connectors.

No cameras are connected, and the I2C muxes are disabled by default.

Connected cameras should be defined in a device-tree overlay or included
after these definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2
 - Rebase to mainline, and fix DTB merge issues.

v3:
 - Fix up gmsl-serialiszer i2c bus unit address

v6:
 - Use new i2c-mux subnode

 - Make use of the GPIO controller exposed by the max9286 to expose a
   hog on the line we need to hold low for camera power.

   Produces this:

   gpiochip7 - 2 lines:
	line   0:   "GPIO0OUT" "CSI0_CAMVDD_EN" output active-high [used]
	line   1:   "GPIO1OUT"       unused  output  active-high

 - Remove the powerdown hog, and utilise an optional enable-gpio line
   instead.
---
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 2be89ed879a5..86caf98e9eb0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -6,6 +6,8 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 /dts-v1/;
 #include "r8a77970.dtsi"
 
@@ -189,6 +191,11 @@
 		function = "i2c0";
 	};
 
+	i2c3_pins: i2c3 {
+		groups = "i2c3_a";
+		function = "i2c3";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -200,6 +207,134 @@
 	status = "okay";
 };
 
+&csi40 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max9286_out0>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gmsl: gmsl-deserializer@48 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		compatible = "maxim,max9286";
+		reg = <0x48>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* eagle-pca9654-max9286-pwdn */
+		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
+
+		/*
+		 * Workaround: Hog the CAMVDD line high as we can't establish a
+		 * regulator-fixed on the gpio_chip exposed by &gmsl due to
+		 * circular-dependency issues.
+		 */
+		camvdd_en {
+			gpio-hog;
+			gpios = <0 0>;
+			output-low;
+			line-name = "CSI0_CAMVDD_EN";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				max9286_in0: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				max9286_in1: endpoint {
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				max9286_in2: endpoint {
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				max9286_in3: endpoint {
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				max9286_out0: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+
+		i2c-mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				status = "disabled";
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				status = "disabled";
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+				status = "disabled";
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+				status = "disabled";
+			};
+		};
+	};
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.20.1

