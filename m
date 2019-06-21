Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 032D34E302
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfFUJQn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:16:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A349B25BE08;
        Fri, 21 Jun 2019 19:16:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AC684940CB2; Fri, 21 Jun 2019 11:16:32 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/53] arm64: dts: renesas: cat874: Add HDMI video support
Date:   Fri, 21 Jun 2019 11:15:45 +0200
Message-Id: <94fc0ee22a5cb3a744a38906a55323fd6ac793fa.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

The CAT874 board comes with a HDMI connector, managed by
a TDA19988BET chip, connected to the RZ/G2E SoC via DPAD.
This patch adds the necessary support to the board DT.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 82 +++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 013a48c01211..06239503093b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -22,6 +22,17 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&tda19988_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -74,6 +85,31 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	x13_clk: x13 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&x13_clk>;
+	clock-names = "du.0", "du.1", "dclkin.0";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&tda19988_in>;
+			};
+		};
+	};
 };
 
 &ehci0 {
@@ -85,6 +121,39 @@
 	clock-frequency = <48000000>;
 };
 
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	tda19988: tda19988@70 {
+		compatible = "nxp,tda998x";
+		reg = <0x70>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+
+		video-ports = <0x234501>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				tda19988_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				tda19988_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -98,6 +167,13 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 727>, <&x13_clk>, <&extal_clk>;
+	clock-names = "fck", "dclkin.0", "extal";
+};
+
 &ohci0 {
 	dr_mode = "host";
 	status = "okay";
@@ -113,6 +189,12 @@
 };
 
 &pfc {
+	du_pins: du {
+		groups = "du_rgb888", "du_clk_out_0", "du_sync", "du_disp",
+			 "du_clk_in_0";
+		function = "du";
+	};
+
 	i2c1_pins: i2c1 {
 		groups = "i2c1_b";
 		function = "i2c1";
-- 
2.11.0

