Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A9C3D2570
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jul 2021 16:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhGVNek (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jul 2021 09:34:40 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:26929 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232282AbhGVNe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jul 2021 09:34:26 -0400
X-IronPort-AV: E=Sophos;i="5.84,261,1620658800"; 
   d="scan'208";a="88414806"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jul 2021 23:15:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 95871401224A;
        Thu, 22 Jul 2021 23:14:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 18/18] arm64: dts: renesas: r9a07g044: Add GbEther nodes
Date:   Thu, 22 Jul 2021 15:13:51 +0100
Message-Id: <20210722141351.13668-19-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Gigabit Ethernet{0,1} nodes to SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 17bd09641529..816bf5ff5d54 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -331,6 +331,48 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		eth0: ethernet@11c20000 {
+			compatible = "renesas,r9a07g044-gbeth",
+				     "renesas,rzg2l-gbeth";
+			reg = <0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "int_fil_n",
+					  "int_arp_ns_n";
+			phy-mode = "rgmii";
+			clocks = <&cpg CPG_MOD R9A07G044_ETH0_CLK_AXI>,
+				 <&cpg CPG_MOD R9A07G044_ETH0_CLK_CHI>,
+				 <&cpg CPG_CORE R9A07G044_CLK_HP>;
+			clock-names = "axi", "chi", "refclk";
+			resets = <&cpg R9A07G044_ETH0_RST_HW_N>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		eth1: ethernet@11c30000 {
+			compatible = "renesas,r9a07g044-gbeth",
+				     "renesas,rzg2l-gbeth";
+			reg = <0 0x11c30000 0 0x10000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "int_fil_n",
+					  "int_arp_ns_n";
+			phy-mode = "rgmii";
+			clocks = <&cpg CPG_MOD R9A07G044_ETH1_CLK_AXI>,
+				 <&cpg CPG_MOD R9A07G044_ETH1_CLK_CHI>,
+				 <&cpg CPG_CORE R9A07G044_CLK_HP>;
+			clock-names = "axi", "chi", "refclk";
+			resets = <&cpg R9A07G044_ETH1_RST_HW_N>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		phyrst: usbphy-ctrl@11c40000 {
 			compatible = "renesas,r9a07g044-usbphy-ctrl",
 				     "renesas,rzg2l-usbphy-ctrl";
-- 
2.17.1

