Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E4A3AEB69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 16:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhFUOgI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 10:36:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:13241 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230061AbhFUOgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 10:36:06 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="85068689"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jun 2021 23:33:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D97A4400A100;
        Mon, 21 Jun 2021 23:33:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a07g044: Add DMAC support
Date:   Mon, 21 Jun 2021 15:33:38 +0100
Message-Id: <20210621143339.16754-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621143339.16754-1-biju.das.jz@bp.renesas.com>
References: <20210621143339.16754-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DMAC support to RZ/G2L SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Updated clock and reset properties.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 671960cbaeeb..ef48b023b41a 100644
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
+			resets = <&cpg R9A07G044_DMAC_ACLK>,
+				 <&cpg R9A07G044_DMAC_PCLK>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		gic: interrupt-controller@11900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.17.1

