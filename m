Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBEE4CC2B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 17:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbiCCQ1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 11:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234967AbiCCQ1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 11:27:42 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23CCC19BE43;
        Thu,  3 Mar 2022 08:26:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="113064930"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Mar 2022 01:26:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 89F9140178B7;
        Fri,  4 Mar 2022 01:26:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH V2 6/7] arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
Date:   Thu,  3 Mar 2022 16:26:33 +0000
Message-Id: <20220303162634.6572-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303162634.6572-1-biju.das.jz@bp.renesas.com>
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial DTSI for RZ/G2UL SoC.

Both RZ/G2L and RZ/G2UL uses the same SMARC EVK. Therefore they share
the common dtsi (rz-smarc.dtsi) file. Place holders are added in
device nodes to avoid compilation errors for the devices which have
not been enabled yet on RZ/G2UL SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Changed soc compatible from r9a07g043u->r9a07g043.
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 413 ++++++++++++++++++++
 1 file changed, 413 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
new file mode 100644
index 000000000000..b162cc74becd
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2UL SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r9a07g043u-cpg.h>
+
+/ {
+	compatible = "renesas,r9a07g043";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	audio_clk1: audio_clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it */
+		clock-frequency = <0>;
+	};
+
+	audio_clk2: audio_clk2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it */
+		clock-frequency = <0>;
+	};
+
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
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
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A07G043U_CLK_I>;
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x40000>;
+		};
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
+		ssi0: ssi@10049c00 {
+			reg = <0 0x10049c00 0 0x400>;
+			#sound-dai-cells = <0>;
+			/* place holder */
+		};
+
+		spi1: spi@1004b000 {
+			reg = <0 0x1004b000 0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			/* place holder */
+		};
+
+		scif0: serial@1004b800 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004b800 0 0x400>;
+			interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCIF0_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCIF0_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif1: serial@1004bc00 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004bc00 0 0x400>;
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCIF1_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCIF1_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif2: serial@1004c000 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004c000 0 0x400>;
+			interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCIF2_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCIF2_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif3: serial@1004c400 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004c400 0 0x400>;
+			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCIF3_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCIF3_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif4: serial@1004c800 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004c800 0 0x400>;
+			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCIF4_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCIF4_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		sci0: serial@1004d000 {
+			compatible = "renesas,r9a07g043-sci", "renesas,sci";
+			reg = <0 0x1004d000 0 0x400>;
+			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCI0_CLKP>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCI0_RST>;
+			status = "disabled";
+		};
+
+		sci1: serial@1004d400 {
+			compatible = "renesas,r9a07g043-sci", "renesas,sci";
+			reg = <0 0x1004d400 0 0x400>;
+			interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043U_SCI1_CLKP>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_SCI1_RST>;
+			status = "disabled";
+		};
+
+		canfd: can@10050000 {
+			reg = <0 0x10050000 0 0x8000>;
+			/* place holder */
+		};
+
+		i2c0: i2c@10058000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x10058000 0 0x400>;
+			/* place holder */
+		};
+
+		i2c1: i2c@10058400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x10058400 0 0x400>;
+			/* place holder */
+		};
+
+		i2c3: i2c@10058c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x10058c00 0 0x400>;
+			/* place holder */
+		};
+
+		adc: adc@10059000 {
+			reg = <0 0x10059000 0 0x400>;
+			/* place holder */
+		};
+
+		sbc: spi@10060000 {
+			reg = <0 0x10060000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>,
+			      <0 0x10070000 0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			/* place holder */
+		};
+
+		cpg: clock-controller@11010000 {
+			compatible = "renesas,r9a07g043u-cpg";
+			reg = <0 0x11010000 0 0x10000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		sysc: system-controller@11020000 {
+			compatible = "renesas,r9a07g043u-sysc";
+			reg = <0 0x11020000 0 0x10000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpm_int", "ca55stbydone_int",
+					  "cm33stbyr_int", "ca55_deny";
+			status = "disabled";
+		};
+
+		pinctrl: pinctrl@11030000 {
+			reg = <0 0x11030000 0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			/* place holder */
+		};
+
+		dmac: dma-controller@11820000 {
+			compatible = "renesas,r9a07g043-dmac",
+				     "renesas,rz-dmac";
+			reg = <0 0x11820000 0 0x10000>,
+			      <0 0x11830000 0 0x10000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD R9A07G043U_DMAC_ACLK>,
+				 <&cpg CPG_MOD R9A07G043U_DMAC_PCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043U_DMAC_ARESETN>,
+				 <&cpg R9A07G043U_DMAC_RST_ASYNC>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
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
+		};
+
+		sdhi0: mmc@11c00000  {
+			reg = <0x0 0x11c00000 0 0x10000>;
+			/* place holder */
+		};
+
+		sdhi1: mmc@11c10000 {
+			reg = <0x0 0x11c10000 0 0x10000>;
+			/* place holder */
+		};
+
+		phyrst: usbphy-ctrl@11c40000 {
+			reg = <0 0x11c40000 0 0x10000>;
+			/* place holder */
+		};
+
+		ohci0: usb@11c50000 {
+			reg = <0 0x11c50000 0 0x100>;
+			/* place holder */
+		};
+
+		ohci1: usb@11c70000 {
+			reg = <0 0x11c70000 0 0x100>;
+			/* place holder */
+		};
+
+		ehci0: usb@11c50100 {
+			reg = <0 0x11c50100 0 0x100>;
+			/* place holder */
+		};
+
+		ehci1: usb@11c70100 {
+			reg = <0 0x11c70100 0 0x100>;
+			/* place holder */
+		};
+
+		usb2_phy0: usb-phy@11c50200 {
+			reg = <0 0x11c50200 0 0x700>;
+			/* place holder */
+		};
+
+		usb2_phy1: usb-phy@11c70200 {
+			reg = <0 0x11c70200 0 0x700>;
+			/* place holder */
+		};
+
+		hsusb: usb@11c60000 {
+			reg = <0 0x11c60000 0 0x10000>;
+			/* place holder */
+		};
+
+		wdt0: watchdog@12800800 {
+			reg = <0 0x12800800 0 0x400>;
+			/* place holder */
+		};
+
+		wdt2: watchdog@12800400 {
+			reg = <0 0x12800400 0 0x400>;
+			/* place holder */
+		};
+
+		ostm0: timer@12801000 {
+			reg = <0x0 0x12801000 0x0 0x400>;
+			/* place holder */
+		};
+
+		ostm1: timer@12801400 {
+			reg = <0x0 0x12801400 0x0 0x400>;
+			/* place holder */
+		};
+
+		ostm2: timer@12801800 {
+			reg = <0x0 0x12801800 0x0 0x400>;
+			/* place holder */
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
2.17.1

