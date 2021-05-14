Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89F93810DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhENTa0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:30:26 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62816 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231684AbhENTaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:30:25 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81148007"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2021 04:24:08 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E40E64010914;
        Sat, 15 May 2021 04:24:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 15/16] arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's
Date:   Fri, 14 May 2021 20:22:17 +0100
Message-Id: <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial DTSI for RZ/G2{L,LC} SoC's.

File structure:
r9a07g044.dtsi  => RZ/G2L family SoC common parts
r9a07g044l.dtsi => Specific to RZ/G2L (R9A07G044L) SoC
r9a07g044l1.dtsi => Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
r9a07g044l2.dtsi => Specific to RZ/G2L (R9A07G044L dual cortex A55) SoC

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 70 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044l.dtsi  | 21 ++++++
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi | 43 ++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi | 62 +++++++++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
new file mode 100644
index 000000000000..c625d302f889
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r9a07g044l-cpg.h>
+
+/ {
+	compatible = "renesas,r9a07g044";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scif0: serial@1004b800 {
+			compatible = "renesas,scif-r9a07g044";
+			reg = <0 0x1004b800 0 0x400>;
+			interrupts =
+				<GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_SCIF0>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_CLK_SCIF0>;
+			status = "disabled";
+		};
+
+		devid: chipid@11020a04 {
+			compatible = "renesas,devid";
+			reg = <0 0x11020a04 0 4>;
+		};
+
+		gic: interrupt-controller@11900000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0x11900000 0 0x40000>,
+			      <0x0 0x11940000 0 0x60000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_GIC600>;
+			clock-names = "gic6000";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_CLK_GIC600>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
new file mode 100644
index 000000000000..8d396b9100c1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2L common SoC parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044.dtsi"
+
+&soc {
+	cpg: clock-controller@11010000 {
+		compatible = "renesas,r9a07g044l-cpg";
+		reg = <0 0x11010000 0 0x10000>;
+		clocks = <&extal_clk>;
+		clock-names = "extal";
+		#clock-cells = <2>;
+		#reset-cells = <1>;
+		#power-domain-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
new file mode 100644
index 000000000000..44d4504e44c3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2L R9A07G044L1 common parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044l.dtsi"
+
+/ {
+	compatible = "renesas,r9a07g044l1";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		a55_0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x40000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended =
+			<&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			<&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			<&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			<&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
new file mode 100644
index 000000000000..33bb35e1c369
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2L R9A07G044L2 common parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044l.dtsi"
+
+/ {
+	compatible = "renesas,r9a07g044l2";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a55_0>;
+				};
+				core1 {
+					cpu = <&a55_1>;
+				};
+			};
+		};
+
+		a55_0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		a55_1: cpu@1 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x40000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended =
+			<&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			<&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			<&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			<&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.17.1

