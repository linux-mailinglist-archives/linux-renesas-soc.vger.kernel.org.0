Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B89519C2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 11:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347705AbiEDJtT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 05:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347816AbiEDJtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:49:12 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7FA4D1EC4D;
        Wed,  4 May 2022 02:45:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,197,1647270000"; 
   d="scan'208";a="119925343"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 May 2022 18:45:35 +0900
Received: from localhost.localdomain (unknown [10.226.93.27])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 45D5C4009679;
        Wed,  4 May 2022 18:45:33 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v4 2/2] arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC
Date:   Wed,  4 May 2022 10:44:56 +0100
Message-Id: <20220504094456.24386-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504094456.24386-1-phil.edworthy@renesas.com>
References: <20220504094456.24386-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Details of the SoC can be found here:
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
 - Removed arm,arch_timer optional clock and reset

v3:
 - Replace CPG_CORE with CPG_MOD
 - Add UART pclk
 - Add gic clk
 - Fix cpg and uart0 register region
 - Remove sys as we are currently not using it and binding not accepted
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g011.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
new file mode 100644
index 000000000000..27810f4ad4cb
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2M SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r9a09g011-cpg.h>
+
+/ {
+	compatible = "renesas,r9a09g011";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+			device_type = "cpu";
+			clocks = <&cpg CPG_MOD R9A09G011_CA53_CLK>;
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@82000000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0x82010000 0 0x1000>,
+			      <0x0 0x82020000 0 0x20000>,
+			      <0x0 0x82040000 0 0x20000>,
+			      <0x0 0x82060000 0 0x20000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&cpg CPG_MOD R9A09G011_GIC_CLK>;
+			clock-names = "clk";
+		};
+
+		cpg: clock-controller@a3500000 {
+			compatible = "renesas,r9a09g011-cpg";
+			reg = <0 0xa3500000 0 0x1000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		uart0: serial@a4040000 {
+			compatible = "renesas,r9a09g011-uart", "renesas,em-uart";
+			reg = <0 0xa4040000 0 0x80>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_URT0_CLK>,
+				 <&cpg CPG_MOD R9A09G011_URT_PCLK>;
+			clock-names = "sclk", "pclk";
+			status = "disabled";
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
2.32.0

