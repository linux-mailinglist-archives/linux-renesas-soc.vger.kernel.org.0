Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6F935F597
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 16:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351687AbhDNNv3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 09:51:29 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56557 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349193AbhDNNv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 09:51:27 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4D4E360019;
        Wed, 14 Apr 2021 13:51:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] arm64: dts: renesas: eagle: Enable MAX9286
Date:   Wed, 14 Apr 2021 15:51:26 +0200
Message-Id: <20210414135128.180980-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Enable the MAX9286 GMSL deserializer on the Eagle-V3M board.

Connected cameras should be defined in a device-tree overlay or included
after these definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 874a7fc2730b..d2b6368d1e72 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -6,6 +6,8 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 /dts-v1/;
 #include "r8a77970.dtsi"
 
@@ -188,6 +190,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	i2c3_pins: i2c3 {
+		groups = "i2c3_a";
+		function = "i2c3";
+	};
+
 	qspi0_pins: qspi0 {
 		groups = "qspi0_ctrl", "qspi0_data4";
 		function = "qspi0";
@@ -266,6 +273,118 @@ &rwdt {
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
+		compatible = "maxim,max9286";
+		reg = <0x48>;
+
+		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+
+		/* eagle-pca9654-max9286-pwdn */
+		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
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
2.31.1

