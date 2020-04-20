Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB541B10B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 17:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgDTPuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 11:50:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:39520 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725971AbgDTPuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 11:50:01 -0400
X-IronPort-AV: E=Sophos;i="5.72,406,1580742000"; 
   d="scan'208";a="45217578"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Apr 2020 00:49:59 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1FA4400D4A4;
        Tue, 21 Apr 2020 00:49:57 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
Date:   Mon, 20 Apr 2020 16:49:54 +0100
Message-Id: <1587397794-11237-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for AISTARVISION MIPI Adapter V2.1 board connected
to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
which have the camera endpoint nodes for imx219 and ov5645 so that this can
be re-used with other G2x platforms.

r8a774c0-ek874-mipi-2.1.dts file enables the required VIN/CSI nodes and by
default ties ov5645 camera endpoint to CSI2.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes for v3:
 * Renamed the fixed clock to osc25250_clk and reused the same for both
   the sensors as pin 3-4 and 5-6 of J14 are short.
 * Rebased the patch on top of renesas-drivers/master

Changes for v2:
 * Dropped #{address,size}-cells
 * Dropped unit address and reg for port

 arch/arm64/boot/dts/renesas/Makefile               |  3 +-
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi | 94 ++++++++++++++++++++++
 .../boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts   | 72 +++++++++++++++++
 3 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index a7ec7a7..d17351c 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -5,7 +5,8 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
-			       r8a774c0-ek874-idk-2121wr.dtb
+			       r8a774c0-ek874-idk-2121wr.dtb \
+			       r8a774c0-ek874-mipi-2.1.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
new file mode 100644
index 0000000..dac6ff4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the AISTARVISION MIPI Adapter V2.1
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/ {
+	ov5645_vdddo_1v8: 1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdddo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	ov5645_vdda_2v8: 2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdda";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	ov5645_vddd_1v5: 1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vddd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	imx219_vana_2v8: 2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vana";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	imx219_vdig_1v8: 1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdig";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	imx219_vddl_1v2: 1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vddl";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	osc25250_clk: osc25250_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+};
+
+&MIPI_PARENT_I2C {
+	ov5645: ov5645@3c {
+		compatible = "ovti,ov5645";
+		reg = <0x3c>;
+		clock-names = "xclk";
+		clocks = <&osc25250_clk>;
+		clock-frequency = <24000000>;
+		vdddo-supply = <&ov5645_vdddo_1v8>;
+		vdda-supply = <&ov5645_vdda_2v8>;
+		vddd-supply = <&ov5645_vddd_1v5>;
+
+		port {
+			ov5645_ep: endpoint {
+			};
+		};
+	};
+
+	imx219: imx219@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&osc25250_clk>;
+		VANA-supply = <&imx219_vana_2v8>;
+		VDIG-supply = <&imx219_vdig_1v8>;
+		VDDL-supply = <&imx219_vddl_1v2>;
+
+		port {
+			imx219_ep: endpoint {
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
new file mode 100644
index 0000000..f0829e9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Silicon Linux RZ/G2E 96board platform (CAT874)
+ * connected with aistarvision-mipi-v2-adapter board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774c0-ek874.dts"
+#define MIPI_PARENT_I2C i2c3
+#include "aistarvision-mipi-adapter-2.1.dtsi"
+
+/ {
+	model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) with aistarvision-mipi-v2-adapter board";
+	compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		port {
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5645_ep>;
+			};
+		};
+	};
+};
+
+&ov5645 {
+	enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
+
+	port {
+		ov5645_ep: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			remote-endpoint = <&csi40_in>;
+		};
+	};
+};
+
+&imx219 {
+	port {
+		imx219_ep: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			link-frequencies = /bits/ 64 <456000000>;
+			/* uncomment remote-endpoint property to tie imx219 to
+			 * CSI2 also make sure remote-endpoint for ov5645 camera
+			 * is commented and remote endpoint phandle in csi40_in
+			 * is imx219_ep
+			 */
+			/* remote-endpoint = <&csi40_in>; */
+		};
+	};
+};
-- 
2.7.4

