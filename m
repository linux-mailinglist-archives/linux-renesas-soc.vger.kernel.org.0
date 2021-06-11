Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A1E3A4158
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 13:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhFKLi5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 07:38:57 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42669 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231681AbhFKLi4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 07:38:56 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="83950432"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2021 20:36:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E56B4401BBFD;
        Fri, 11 Jun 2021 20:36:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add DMAC support
Date:   Fri, 11 Jun 2021 12:36:41 +0100
Message-Id: <20210611113642.18457-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DMAC support to RZ/G2L SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
This patch depend on [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210609153230.6967-11-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 476ee9a69065..47f9fafd6c06 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -8,6 +8,10 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a07g044-cpg.h>
 
+#define CH_CFG(reqd, loen, hien, lvl, am, sds, dds, tm) \
+	((((tm) << 22) | ((dds) << 16) | ((sds) << 12) | ((am) << 8) | \
+	((lvl) << 6) | ((hien) << 5) | ((loen) << 4) | ((reqd) << 3)) & 0x004FF778)
+
 / {
 	compatible = "renesas,r9a07g044";
 	#address-cells = <2>;
@@ -111,6 +115,40 @@
 			status = "disabled";
 		};
 
+		dmac: dma-controller@11820000 {
+			compatible = "renesas,dmac-r9a07g044",
+				     "renesas,rz-dmac";
+			reg = <0 0x11820000 0 0x10000>,
+			      <0 0x11830000 0 0x10000>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
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
+				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15",
+					  "error";
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_DMAC>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_CLK_DMAC>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		gic: interrupt-controller@11900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.17.1

