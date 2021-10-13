Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4218642B9C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 09:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238612AbhJMH7A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 03:59:00 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:54373 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229902AbhJMH67 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 03:58:59 -0400
X-IronPort-AV: E=Sophos;i="5.85,369,1624287600"; 
   d="scan'208";a="97044425"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Oct 2021 16:56:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.46])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5C4A54237D2E;
        Wed, 13 Oct 2021 16:56:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
Date:   Wed, 13 Oct 2021 08:56:46 +0100
Message-Id: <20211013075647.32231-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211013075647.32231-1-biju.das.jz@bp.renesas.com>
References: <20211013075647.32231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Gigabit Ethernet{0,1} nodes to SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---v1->v2:
 * Removed extra space before arp_ns.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 0b0372a02515..485ef5f0fea1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -488,6 +488,46 @@
 			status = "disabled";
 		};
 
+		eth0: ethernet@11c20000 {
+			compatible = "renesas,r9a07g044-gbeth",
+				     "renesas,rzg2l-gbeth";
+			reg = <0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "fil", "arp_ns";
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
+			interrupt-names = "mux", "fil", "arp_ns";
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

