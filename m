Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EC22645C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 14:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbgIJMDz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 08:03:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:55864 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730189AbgIJMDZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:03:25 -0400
X-IronPort-AV: E=Sophos;i="5.76,412,1592838000"; 
   d="scan'208";a="56719479"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Sep 2020 21:03:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A8CAA425ACDC;
        Thu, 10 Sep 2020 21:03:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: Add Renesas R8A779A0 SoC support
Date:   Thu, 10 Sep 2020 21:02:51 +0900
Message-Id: <1599739372-30669-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the Renesas R8A77990 (R-Car V3U) support.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 133 ++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
new file mode 100644
index 0000000..6cf77ce
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the R-Car V3U (R8A779A0) SoC
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a779a0-sysc.h>
+
+/ {
+	compatible = "renesas,r8a779a0";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		a76_0: cpu@0 {
+			compatible = "arm,cortex-a76";
+			reg = <0>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779A0_PD_A1E0D0C0>;
+			next-level-cache = <&L3_CA76_0>;
+		};
+
+		L3_CA76_0: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779A0_PD_A2E0D0>;
+			cache-unified;
+			cache-level = <3>;
+		};
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	extalr_clk: extalr {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	pmu_a76 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts-extended = <&gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a779a0-cpg-mssr";
+			reg = <0 0xe6150000 0 0x4000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a779a0-rst";
+			reg = <0 0xe6160000 0 0x4000>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a779a0-sysc";
+			reg = <0 0xe6180000 0 0x4000>;
+			#power-domain-cells = <1>;
+		};
+
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a779a0",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 702>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 702>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@f1000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xf1000000 0 0x20000>,
+			      <0x0 0xf1060000 0 0x110000>;
+			interrupts = <GIC_PPI 9
+				      (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+		};
+
+		prr: chipid@fff00044 {
+			compatible = "renesas,prr";
+			reg = <0 0xfff00044 0 4>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.7.4

