Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5792D18E955
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2020 15:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgCVONJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 22 Mar 2020 10:13:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:44787 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725785AbgCVONJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Mar 2020 10:13:09 -0400
X-IronPort-AV: E=Sophos;i="5.72,292,1580742000"; 
   d="scan'208";a="42507573"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2020 23:13:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 22EBF420C93D;
        Sun, 22 Mar 2020 23:13:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
Date:   Sun, 22 Mar 2020 14:12:32 +0000
Message-Id: <1584886352-4132-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 Changes for v2:
 * Dropped #{address,size}-cells
 * Dropped unit address and reg for port

 arch/arm64/boot/dts/renesas/Makefile          |  3 +-
 .../aistarvision-mipi-adapter-2.1.dtsi        | 95 +++++++++++++++++++
 .../dts/renesas/r8a774c0-ek874-mipi-2.1.dts   | 75 +++++++++++++++
 3 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 2153842321ce..9f5c53d62f5e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -4,7 +4,8 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
-			       r8a774c0-ek874-idk-2121wr.dtb
+			       r8a774c0-ek874-idk-2121wr.dtb \
+			       r8a774c0-ek874-mipi-2.1.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
new file mode 100644
index 000000000000..d2b656579b54
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -0,0 +1,95 @@
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
+	imx219_clk: imx219_clk {
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
+
+		clock-names = "xclk";
+
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
+
+		VANA-supply = <&imx219_vana_2v8>;
+		VDIG-supply = <&imx219_vdig_1v8>;
+		VDDL-supply = <&imx219_vddl_1v2>;
+		clocks = <&imx219_clk>;
+
+		port {
+			imx219_ep: endpoint {
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
new file mode 100644
index 000000000000..62000cc933bf
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
@@ -0,0 +1,75 @@
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
+	clocks = <&cpg CPG_MOD 716>;
+	clock-frequency = <24000000>;
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
2.20.1

