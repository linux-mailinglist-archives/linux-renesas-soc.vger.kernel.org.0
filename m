Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A6250D9A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 08:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240222AbiDYGpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 02:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237461AbiDYGpd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 02:45:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 21BE92B1AE;
        Sun, 24 Apr 2022 23:42:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="117888779"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2022 15:42:21 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 602F94009BE4;
        Mon, 25 Apr 2022 15:42:21 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 6/7] arm64: dts: renesas: Add Renesas R8A779G0 SoC support
Date:   Mon, 25 Apr 2022 15:42:00 +0900
Message-Id: <20220425064201.459633-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the Renesas R8A779G0 (R-Car V4H) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 122 ++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
new file mode 100644
index 000000000000..aba3d00f02dd
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H (R8A779G0) SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a779g0-sysc.h>
+
+/ {
+	compatible = "renesas,r8a779g0";
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
+			power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
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
+			compatible = "renesas,r8a779g0-cpg-mssr";
+			reg = <0 0xe6150000 0 0x4000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a779g0-rst";
+			reg = <0 0xe6160000 0 0x4000>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a779g0-sysc";
+			reg = <0 0xe6180000 0 0x4000>;
+			#power-domain-cells = <1>;
+		};
+
+		hscif0: serial@e6540000 {
+			compatible = "renesas,hscif-r8a779g0",
+				     "renesas,rcar-gen4-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6540000 0 96>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 514>,
+				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 514>;
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

