Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74EBC14D09E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 19:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgA2SlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 13:41:02 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:42889 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727522AbgA2SlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 13:41:02 -0500
X-IronPort-AV: E=Sophos;i="5.70,378,1574089200"; 
   d="scan'208";a="37715614"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2020 03:41:01 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 160814006181;
        Thu, 30 Jan 2020 03:40:59 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Chris Paterson <chris.paterson2@renesas.com>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: [PATCH 1/2] ARM: dts: iwg22d-sodimm: enable LCD panel
Date:   Wed, 29 Jan 2020 18:40:52 +0000
Message-Id: <1580323253-3281-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
References: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
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

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 60 +++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index ce6603b..878113a 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -79,6 +79,52 @@
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
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpu 3 5000000 GPIO_ACTIVE_LOW>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		pinctrl-0 = <&backlight_pins>;
+		pinctrl-names = "default";
+	};
+
+	lcd {
+		compatible = "edt,etm043080dh6gp", "simple-panel";
+		power-supply = <&vccq_panel>;
+
+		ports {
+			port@0 {
+				lcd_in: endpoint {
+					remote-endpoint = <&du_out_rgb0>;
+				};
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
@@ -150,11 +196,21 @@
 		function = "avb";
 	};
 
+	backlight_pins: backlight {
+		renesas,groups = "tpu_to3";
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
@@ -230,6 +286,10 @@
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
2.7.4

