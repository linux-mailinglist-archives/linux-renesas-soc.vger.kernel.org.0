Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E99384D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 09:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfFGHSk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 03:18:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24576 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726699AbfFGHSk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 03:18:40 -0400
X-IronPort-AV: E=Sophos;i="5.60,562,1549897200"; 
   d="scan'208";a="18060389"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2019 16:18:39 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3C9F341FE039;
        Fri,  7 Jun 2019 16:18:37 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Add PCIe device nodes
Date:   Fri,  7 Jun 2019 08:13:57 +0100
Message-Id: <1559891639-62529-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds PCIe{0,1} device nodes for R8A774A1 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 54 +++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 4b1332f..eb9f299 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1914,6 +1914,60 @@
 			resets = <&cpg 408>;
 		};
 
+		pciec0: pcie@fe000000 {
+			compatible = "renesas,pcie-r8a774a1",
+				     "renesas,pcie-rcar-gen3";
+			reg = <0 0xfe000000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
+				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
+				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
+				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 319>;
+			status = "disabled";
+		};
+
+		pciec1: pcie@ee800000 {
+			compatible = "renesas,pcie-r8a774a1",
+				     "renesas,pcie-rcar-gen3";
+			reg = <0 0xee800000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
+				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
+				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
+				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 318>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 318>;
+			status = "disabled";
+		};
+
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;
-- 
2.7.4

