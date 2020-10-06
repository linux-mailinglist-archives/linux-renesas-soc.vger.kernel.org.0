Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2903284AE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Oct 2020 13:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgJFL1S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Oct 2020 07:27:18 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21444 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726131AbgJFL1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 07:27:17 -0400
X-IronPort-AV: E=Sophos;i="5.77,342,1596466800"; 
   d="scan'208";a="59050102"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Oct 2020 20:27:16 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9590D42CD75E;
        Tue,  6 Oct 2020 20:27:14 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2H
Date:   Tue,  6 Oct 2020 12:26:59 +0100
Message-Id: <20201006112701.11800-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for AISTARVISION MIPI Adapter V2.1 board connected to HiHope
RZ/G2H board.

Common file hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi is created
which will be used by RZ/G2{HMN}, by default the CSI20 node is tied to
ov5645 camera endpoint and the imx219 camera endpoint is tied to CSI40.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 ...rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi | 109 ++++++++++++++++++
 .../r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts     |  16 +++
 3 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index dffefe030a76..f98e9e2e520d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-mipi-2.1.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
+dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb
 
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
new file mode 100644
index 000000000000..c62ddb9b2ba5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2[HMN] MIPI common parts
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#define MIPI_OV5645_PARENT_I2C i2c2
+#define MIPI_IMX219_PARENT_I2C i2c3
+#include "aistarvision-mipi-adapter-2.1.dtsi"
+
+&csi20 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csi20_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5645_ep>;
+			};
+		};
+	};
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx219_ep>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&imx219 {
+	port {
+		imx219_ep: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			link-frequencies = /bits/ 64 <456000000>;
+			remote-endpoint = <&csi40_in>;
+		};
+	};
+};
+
+&ov5645 {
+	enable-gpios = <&gpio6 4 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
+
+	port {
+		ov5645_ep: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			remote-endpoint = <&csi20_in>;
+		};
+	};
+};
+
+&pfc {
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+};
+
+&vin0 {
+	status = "okay";
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
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
+&vin6 {
+	status = "okay";
+};
+
+&vin7 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts
new file mode 100644
index 000000000000..46adb6efb5e6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2H board
+ * connected with aistarvision-mipi-v2-adapter board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774e1-hihope-rzg2h-ex.dts"
+#include "hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2H with sub board connected with aistarvision-mipi-v2-adapter board";
+	compatible = "hoperun,hihope-rzg2h", "renesas,r8a774e1";
+};
-- 
2.17.1

