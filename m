Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610A3452C00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKPHqB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:46:01 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6254 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231404AbhKPHpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:47 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100433349"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B31FE40083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 14/16] arm64: dts: renesas: Add Renesas R8A779F0 SoC support
Date:   Tue, 16 Nov 2021 16:41:28 +0900
Message-Id: <20211116074130.107554-15-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the Renesas R8A779F0 (R-Car S4-8) support.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 121 ++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
new file mode 100644
index 000000000000..eda597766eaf
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the R-Car S4-8 (R8A779F0) SoC
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a779f0-sysc.h>
+
+/ {
+	compatible = "renesas,r8a779f0";
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
+			power-domains = <&sysc R8A779F0_PD_A1E0D0C0>;
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
+	pmu_a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
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
+			compatible = "renesas,r8a779f0-cpg-mssr";
+			reg = <0 0xe6150000 0 0x4000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a779f0-rst";
+			reg = <0 0xe6160000 0 0x4000>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a779f0-sysc";
+			reg = <0 0xe6180000 0 0x4000>;
+			#power-domain-cells = <1>;
+		};
+
+		scif3: serial@e6c50000 {
+			compatible = "renesas,scif-r8a779f0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6c50000 0 64>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>,
+				 <&cpg CPG_CORE R8A779F0_CLK_S0D3_PER>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
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
2.25.1

