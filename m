Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3794177641
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 13:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgCCMoy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 07:44:54 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:34512 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727896AbgCCMoy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 07:44:54 -0500
X-IronPort-AV: E=Sophos;i="5.70,511,1574089200"; 
   d="scan'208";a="40636229"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2020 21:44:52 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9905041E1BCD;
        Tue,  3 Mar 2020 21:44:51 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Chris Paterson <chris.paterson2@renesas.com>,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: [PATCH v2] ARM: dts: iwg22d-sodimm: enable LCD panel
Date:   Tue,  3 Mar 2020 12:44:50 +0000
Message-Id: <1583239490-8837-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On the Generic SODIMM Development Platform there is an RGB LCD panel
directly connected to the DU output. It uses the TPU0 as backlight, one
GPIO pull-up configuration for power enable, R[2:7], G[2:7], B[2:7],
VSYNC, HSYNC, DU0_DISP and, DU0_CLK as inputs.

There is no encoder between the DU and the panel, therefore the default
connector driver is used.

The two variants of the iW-G22D should be mutually exclusive, therefore
this patch also disables the RGB LCD display when the HDMI extension board
is used.

Changes for v2:
- fix the backlight of the panel
- remove "simple-panel" compatible as it is not needed
- use only one port for the endpoint connection of the panel

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts |  6 +++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        | 60 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
index 2aeebfc..92aa26b 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
@@ -108,6 +108,12 @@
 	};
 };
 
+&lcd_panel {
+	status = "disabled";
+
+	/delete-node/ port;
+};
+
 &pfc {
 	can1_pins: can1 {
 		groups = "can1_data_b";
diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index ce6603b..872f8a6 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -30,6 +30,7 @@
 
 /dts-v1/;
 #include "r8a7745-iwg22m.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "iWave Systems RainboW-G22D-SODIMM board based on RZ/G1E";
@@ -79,6 +80,49 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	vccq_panel: regulator-vccq-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "Panel VccQ";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
+
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
+};
+
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
 };
 
 &avb {
@@ -150,11 +194,21 @@
 		function = "avb";
 	};
 
+	backlight_pins: backlight {
+		renesas,groups = "tpu_to3_c";
+		renesas,function = "tpu";
+	};
+
 	can0_pins: can0 {
 		groups = "can0_data";
 		function = "can0";
 	};
 
+	du0_pins: du0 {
+		renesas,groups = "du0_rgb666", "du0_sync", "du0_disp", "du0_clk0_out";
+		renesas,function = "du0";
+	};
+
 	hscif1_pins: hscif1 {
 		groups = "hscif1_data", "hscif1_ctrl";
 		function = "hscif1";
@@ -230,6 +284,12 @@
 	shared-pin;
 };
 
+&tpu {
+	pinctrl-0 = <&backlight_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &usbphy {
 	status = "okay";
 };
-- 
2.7.4

