Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D194AC05F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 15:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfI0NGq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 09:06:46 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:60758 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbfI0NGp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 09:06:45 -0400
X-IronPort-AV: E=Sophos;i="5.64,555,1559487600"; 
   d="scan'208";a="27470037"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Sep 2019 22:06:42 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 113DC4274F75;
        Fri, 27 Sep 2019 22:06:39 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: Initial r8a774b1 SoC device tree
Date:   Fri, 27 Sep 2019 14:06:24 +0100
Message-Id: <1569589584-56917-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Basic support for the RZ/G2N (R8A774B1) SoC. Added placeholders
to avoid compilation error with the common platform code.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
 * Incorporated Geert's review comment
 * Added Geert's Reviewed-by tag
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 472 ++++++++++++++++++++++++++++++
 1 file changed, 472 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
new file mode 100644
index 0000000..fc7aec6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -0,0 +1,472 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the r8a774b1 SoC
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r8a774b1-cpg-mssr.h>
+#include <dt-bindings/power/r8a774b1-sysc.h>
+
+/ {
+	compatible = "renesas,r8a774b1";
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
+	audio_clk_b: audio_clk_b {
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
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		a57_0: cpu@0 {
+			compatible = "arm,cortex-a57";
+			reg = <0x0>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774B1_PD_CA57_CPU0>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <854>;
+			clocks = <&cpg CPG_CORE R8A774B1_CLK_Z>;
+		};
+
+		a57_1: cpu@1 {
+			compatible = "arm,cortex-a57";
+			reg = <0x1>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774B1_PD_CA57_CPU1>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774B1_CLK_Z>;
+		};
+
+		L2_CA57: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A774B1_PD_CA57_SCU>;
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
+	pmu_a57 {
+		compatible = "arm,cortex-a57-pmu";
+		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a57_0>, <&a57_1>;
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
+			/* placeholder */
+		};
+
+		gpio0: gpio@e6050000 {
+			reg = <0 0xe6050000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio1: gpio@e6051000 {
+			reg = <0 0xe6051000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio2: gpio@e6052000 {
+			reg = <0 0xe6052000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio3: gpio@e6053000 {
+			reg = <0 0xe6053000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio4: gpio@e6054000 {
+			reg = <0 0xe6054000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio5: gpio@e6055000 {
+			reg = <0 0xe6055000 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio6: gpio@e6055400 {
+			reg = <0 0xe6055400 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		gpio7: gpio@e6055800 {
+			reg = <0 0xe6055800 0 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			/* placeholder */
+		};
+
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a774b1";
+			reg = <0 0xe6060000 0 0x50c>;
+		};
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a774b1-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a774b1-rst";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a774b1-sysc";
+			reg = <0 0xe6180000 0 0x0400>;
+			#power-domain-cells = <1>;
+		};
+
+		i2c4: i2c@e66d8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0xe66d8000 0 0x40>;
+			/* placeholder */
+		};
+
+		hscif0: serial@e6540000 {
+			reg = <0 0xe6540000 0 0x60>;
+			/* placeholder */
+		};
+
+		hsusb: usb@e6590000 {
+			reg = <0 0xe6590000 0 0x200>;
+			/* placeholder */
+		};
+
+		usb3_phy0: usb-phy@e65ee000 {
+			reg = <0 0xe65ee000 0 0x90>;
+			#phy-cells = <0>;
+			/* placeholder */
+		};
+
+		avb: ethernet@e6800000 {
+			reg = <0 0xe6800000 0 0x800>;
+			/* placeholder */
+		};
+
+		can0: can@e6c30000 {
+			reg = <0 0xe6c30000 0 0x1000>;
+			/* placeholder */
+		};
+
+		can1: can@e6c38000 {
+			reg = <0 0xe6c38000 0 0x1000>;
+			/* placeholder */
+		};
+
+		canfd: can@e66c0000 {
+			reg = <0 0xe66c0000 0 0x8000>;
+			/* placeholder */
+		};
+
+		scif2: serial@e6e88000 {
+			compatible = "renesas,scif-r8a774b1",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e88000 0 64>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R8A774B1_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 { };
+				ssi1: ssi-1 { };
+				ssi2: ssi-2 { };
+				ssi3: ssi-3 { };
+				ssi4: ssi-4 { };
+				ssi5: ssi-5 { };
+				ssi6: ssi-6 { };
+				ssi7: ssi-7 { };
+				ssi8: ssi-8 { };
+				ssi9: ssi-9 { };
+			};
+		};
+
+		xhci0: usb@ee000000 {
+			reg = <0 0xee000000 0 0xc00>;
+			/* placeholder */
+		};
+
+		usb3_peri0: usb@ee020000 {
+			reg = <0 0xee020000 0 0x400>;
+			/* placeholder */
+		};
+
+		ohci0: usb@ee080000 {
+			reg = <0 0xee080000 0 0x100>;
+			/* placeholder */
+		};
+
+		ohci1: usb@ee0a0000 {
+			reg = <0 0xee0a0000 0 0x100>;
+			/* placeholder */
+		};
+
+		ehci0: usb@ee080100 {
+			reg = <0 0xee080100 0 0x100>;
+			/* placeholder */
+		};
+
+		ehci1: usb@ee0a0100 {
+			reg = <0 0xee0a0100 0 0x100>;
+			/* placeholder */
+		};
+
+		usb2_phy0: usb-phy@ee080200 {
+			reg = <0 0xee080200 0 0x700>;
+			/* placeholder */
+		};
+
+		usb2_phy1: usb-phy@ee0a0200 {
+			reg = <0 0xee0a0200 0 0x700>;
+			/* placeholder */
+		};
+
+		sdhi0: sd@ee100000 {
+			reg = <0 0xee100000 0 0x2000>;
+			/* placeholder */
+		};
+
+		sdhi1: sd@ee120000 {
+			reg = <0 0xee120000 0 0x2000>;
+			/* placeholder */
+		};
+
+		sdhi2: sd@ee140000 {
+			reg = <0 0xee140000 0 0x2000>;
+			/* placeholder */
+		};
+
+		sdhi3: sd@ee160000 {
+			reg = <0 0xee160000 0 0x2000>;
+			/* placeholder */
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
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 408>;
+		};
+
+		pciec0: pcie@fe000000 {
+			reg = <0 0xfe000000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			/* placeholder */
+		};
+
+		pciec1: pcie@ee800000 {
+			reg = <0 0xee800000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			/* placeholder */
+		};
+
+		hdmi0: hdmi@fead0000 {
+			reg = <0 0xfead0000 0 0x10000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dw_hdmi0_in: endpoint {
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		du: display@feb00000 {
+			reg = <0 0xfeb00000 0 0x80000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+				port@1 {
+					reg = <1>;
+					du_out_hdmi0: endpoint {
+					};
+				};
+				port@2 {
+					reg = <2>;
+					du_out_lvds0: endpoint {
+					};
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
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
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
2.7.4

