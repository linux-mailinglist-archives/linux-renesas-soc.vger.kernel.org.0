Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075693B9ED1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 12:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbhGBKIW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 06:08:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38891 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231367AbhGBKIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 06:08:19 -0400
X-IronPort-AV: E=Sophos;i="5.83,317,1616425200"; 
   d="scan'208";a="86432322"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2021 19:05:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9E46A4010DC7;
        Fri,  2 Jul 2021 19:05:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a07g044: Add DMAC support
Date:   Fri,  2 Jul 2021 11:05:26 +0100
Message-Id: <20210702100527.28251-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702100527.28251-1-biju.das.jz@bp.renesas.com>
References: <20210702100527.28251-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DMAC support to RZ/G2L SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * Updated reset properties
v1->v2:
 * Updated clock and reset properties.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 81b31600bd6b..9f3e5ebd03f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -191,6 +191,42 @@
 			status = "disabled";
 		};
 
+		dmac: dma-controller@11820000 {
+			compatible = "renesas,r9a07g044-dmac",
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
+			clocks = <&cpg CPG_MOD R9A07G044_DMAC_ACLK>,
+				 <&cpg CPG_MOD R9A07G044_DMAC_PCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_DMAC_ARESETN>,
+				 <&cpg R9A07G044_DMAC_RST_ASYNC>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		gic: interrupt-controller@11900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.17.1

