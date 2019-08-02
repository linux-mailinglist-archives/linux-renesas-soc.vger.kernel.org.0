Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3B07ED9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387536AbfHBHfd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:35:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6202 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733123AbfHBHfd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:35:33 -0400
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; 
   d="scan'208";a="23151225"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:31 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 262CA4007528;
        Fri,  2 Aug 2019 16:35:27 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: [PATCH/RFC 12/12] arm64: dts: renesas: Add EK874 board with idk-2121wr display support
Date:   Fri,  2 Aug 2019 08:34:09 +0100
Message-Id: <1564731249-22671-13-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The EK874 is advertised as compatible with panel IDK-2121WR from
Advantech, however the panel isn't sold alongside the board.
A new dts, adding everything that's required to get the panel to
to work with the EK874, is the most convenient way to support the
EK874 when it's connected to the IDK-2121WR.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 112 +++++++++++++++++++++
 2 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 42b74c2..ce48478 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
-dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
+			       r8a774c0-ek874-idk-2121wr.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
new file mode 100644
index 0000000..d989998
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Silicon Linux RZ/G2E evaluation kit (EK874),
+ * connected to an Advantech IDK-2121WR 21.5" LVDS panel
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include "r8a774c0-ek874.dts"
+
+/ {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm5 0 50000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		power-supply = <&reg_12p0v>;
+		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel-lvds {
+		compatible = "advantech,idk-2121wr", "panel-lvds";
+
+		width-mm = <476>;
+		height-mm = <268>;
+
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hsync-len = <44>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds0_panel_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lvds1_panel_in: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+		};
+	};
+};
+
+&gpio0 {
+	lvds-connector-en-gpio{
+		gpio-hog;
+		gpios = <17 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "lvds-connector-en-gpio";
+	};
+};
+
+&lvds0 {
+	renesas,swap-data;
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&lvds0_panel_in>;
+			};
+		};
+	};
+};
+
+&lvds1 {
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 727>, <&x13_clk>, <&extal_clk>;
+	clock-names = "fck", "dclkin.0", "extal";
+
+	ports {
+		port@1 {
+			lvds1_out: endpoint {
+				remote-endpoint = <&lvds1_panel_in>;
+			};
+		};
+	};
+};
+
+&pfc {
+	pwm5_pins: pwm5 {
+		groups = "pwm5_a";
+		function = "pwm5";
+	};
+};
+
+&pwm5 {
+	pinctrl-0 = <&pwm5_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4

