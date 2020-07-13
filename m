Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E304218F14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 19:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgGHRtD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 13:49:03 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:47661 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726298AbgGHRtB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 13:49:01 -0400
X-IronPort-AV: E=Sophos;i="5.75,328,1589209200"; 
   d="scan'208";a="51430143"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2020 02:49:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A7FBE4005E3D;
        Thu,  9 Jul 2020 02:48:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device tree
Date:   Wed,  8 Jul 2020 18:48:29 +0100
Message-Id: <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Basic support for the RZ/G2H SoC.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 652 ++++++++++++++++++++++
 1 file changed, 652 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
new file mode 100644
index 000000000000..6637e157ffcd
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -0,0 +1,652 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the r8a774e1 SoC
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r8a774e1-cpg-mssr.h>
+#include <dt-bindings/power/r8a774e1-sysc.h>
+
+#define CPG_AUDIO_CLK_I		R8A774E1_CLK_S0D4
+
+/ {
+	compatible = "renesas,r8a774e1";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/*
+	 * The external audio clocks are configured as 0 Hz fixed frequency
+	 * clocks by default.
+	 * Boards that provide audio clocks should override them.
+	 */
+	audio_clk_a: audio_clk_a {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	audio_clk_c: audio_clk_c {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
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
+					cpu = <&a57_0>;
+				};
+				core1 {
+					cpu = <&a57_1>;
+				};
+				core2 {
+					cpu = <&a57_2>;
+				};
+				core3 {
+					cpu = <&a57_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a53_0>;
+				};
+				core1 {
+					cpu = <&a53_1>;
+				};
+				core2 {
+					cpu = <&a53_2>;
+				};
+				core3 {
+					cpu = <&a53_3>;
+				};
+			};
+		};
+
+		a57_0: cpu@0 {
+			compatible = "arm,cortex-a57";
+			reg = <0x0>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA57_CPU0>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			dynamic-power-coefficient = <854>;
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+		};
+
+		a57_1: cpu@1 {
+			compatible = "arm,cortex-a57";
+			reg = <0x1>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA57_CPU1>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+		};
+
+		a57_2: cpu@2 {
+			compatible = "arm,cortex-a57";
+			reg = <0x2>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA57_CPU2>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+		};
+
+		a57_3: cpu@3 {
+			compatible = "arm,cortex-a57";
+			reg = <0x3>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA57_CPU3>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+		};
+
+		a53_0: cpu@100 {
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA53_CPU0>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <277>;
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
+			capacity-dmips-mhz = <535>;
+		};
+
+		a53_1: cpu@101 {
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA53_CPU1>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
+			capacity-dmips-mhz = <535>;
+		};
+
+		a53_2: cpu@102 {
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA53_CPU2>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
+			capacity-dmips-mhz = <535>;
+		};
+
+		a53_3: cpu@103 {
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774E1_PD_CA53_CPU3>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
+			capacity-dmips-mhz = <535>;
+		};
+
+		L2_CA57: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A774E1_PD_CA57_SCU>;
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		L2_CA53: cache-controller-1 {
+			compatible = "cache";
+			power-domains = <&sysc R8A774E1_PD_CA53_SCU>;
+			cache-unified;
+			cache-level = <2>;
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
+	/* External PCIe clock - can be overridden by the board */
+	pcie_bus_clk: pcie_bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	pmu_a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
+	};
+
+	pmu_a57 {
+		compatible = "arm,cortex-a57-pmu";
+		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a57_0>, <&a57_1>, <&a57_2>, <&a57_3>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rwdt: watchdog@e6020000 {
+			reg = <0 0xe6020000 0 0x0c>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		gpio0: gpio@e6050000 {
+			reg = <0 0xe6050000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio1: gpio@e6051000 {
+			reg = <0 0xe6051000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio2: gpio@e6052000 {
+			reg = <0 0xe6052000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio3: gpio@e6053000 {
+			/* placeholder */
+			reg = <0 0xe6053000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio4: gpio@e6054000 {
+			reg = <0 0xe6054000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio5: gpio@e6055000 {
+			reg = <0 0xe6055000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio6: gpio@e6055400 {
+			reg = <0 0xe6055400 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		gpio7: gpio@e6055800 {
+			reg = <0 0xe6055800 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			/* placeholder */
+		};
+
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a774e1";
+			reg = <0 0xe6060000 0 0x50c>;
+		};
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a774e1-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a774e1-rst";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a774e1-sysc";
+			reg = <0 0xe6180000 0 0x0400>;
+			#power-domain-cells = <1>;
+		};
+
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a774b1", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 407>;
+		};
+
+		i2c2: i2c@e6510000 {
+			reg = <0 0xe6510000 0 0x40>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		i2c4: i2c@e66d8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0xe66d8000 0 0x40>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		hscif0: serial@e6540000 {
+			reg = <0 0xe6540000 0 0x60>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		hsusb: usb@e6590000 {
+			reg = <0 0xe6590000 0 0x200>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		usb3_phy0: usb-phy@e65ee000 {
+			reg = <0 0xe65ee000 0 0x90>;
+			#phy-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		avb: ethernet@e6800000 {
+			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		can0: can@e6c30000 {
+			reg = <0 0xe6c30000 0 0x1000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		can1: can@e6c38000 {
+			reg = <0 0xe6c38000 0 0x1000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		pwm0: pwm@e6e30000 {
+			reg = <0 0xe6e30000 0 0x8>;
+			#pwm-cells = <2>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		scif2: serial@e6e88000 {
+			compatible = "renesas,scif-r8a774e1",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e88000 0 0x40>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R8A774E1_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 310>;
+			status = "disabled";
+		};
+
+		rcar_sound: sound@ec500000 {
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+
+			status = "disabled";
+
+			/* placeholder */
+
+			rcar_sound,ssi {
+				ssi2: ssi-2 {
+					/* placeholder */
+				};
+			};
+		};
+
+		xhci0: usb@ee000000 {
+			reg = <0 0xee000000 0 0xc00>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		usb3_peri0: usb@ee020000 {
+			reg = <0 0xee020000 0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ohci0: usb@ee080000 {
+			reg = <0 0xee080000 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ohci1: usb@ee0a0000 {
+			reg = <0 0xee0a0000 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ehci0: usb@ee080100 {
+			reg = <0 0xee080100 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ehci1: usb@ee0a0100 {
+			reg = <0 0xee0a0100 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		usb2_phy0: usb-phy@ee080200 {
+			reg = <0 0xee080200 0 0x700>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		usb2_phy1: usb-phy@ee0a0200 {
+			reg = <0 0xee0a0200 0 0x700>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		sdhi0: sd@ee100000 {
+			reg = <0 0xee100000 0 0x2000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		sdhi2: sd@ee140000 {
+			reg = <0 0xee140000 0 0x2000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		sdhi3: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a774e1",
+				     "renesas,rcar-gen3-sdhi";
+			reg = <0 0xee160000 0 0x2000>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 311>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@f1010000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xf1010000 0 0x1000>,
+			      <0x0 0xf1020000 0 0x20000>,
+			      <0x0 0xf1040000 0 0x20000>,
+			      <0x0 0xf1060000 0 0x20000>;
+			interrupts = <GIC_PPI 9
+					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&cpg CPG_MOD 408>;
+			clock-names = "clk";
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 408>;
+		};
+
+		pciec0: pcie@fe000000 {
+			reg = <0 0xfe000000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		hdmi0: hdmi@fead0000 {
+			reg = <0 0xfead0000 0 0x10000>;
+			status = "disabled";
+
+			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+				port@1 {
+					reg = <1>;
+				};
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
+		du: display@feb00000 {
+			reg = <0 0xfeb00000 0 0x80000>;
+			status = "disabled";
+
+			/* placeholder */
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+				port@1 {
+					reg = <1>;
+				};
+				port@2 {
+					reg = <2>;
+				};
+			};
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
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	/* External USB clocks - can be overridden by the board */
+	usb3s0_clk: usb3s0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	usb_extal_clk: usb_extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+};
-- 
2.17.1

