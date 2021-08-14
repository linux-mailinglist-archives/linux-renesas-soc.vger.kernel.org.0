Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7853EC305
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Aug 2021 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238563AbhHNN4F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Aug 2021 09:56:05 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:23701 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238551AbhHNN4E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 09:56:04 -0400
X-IronPort-AV: E=Sophos;i="5.84,321,1620658800"; 
   d="scan'208";a="90627093"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2021 22:55:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.7])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9518A4272039;
        Sat, 14 Aug 2021 22:55:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a07g044: Add SSI support
Date:   Sat, 14 Aug 2021 14:55:26 +0100
Message-Id: <20210814135526.15561-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210814135526.15561-1-biju.das.jz@bp.renesas.com>
References: <20210814135526.15561-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SSI{0,1,2,3} nodes to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 6bbf1fae8ca5..c8b517d235e3 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -92,6 +92,86 @@
 		#size-cells = <2>;
 		ranges;
 
+		ssi0: ssi@10049c00 {
+			compatible = "renesas,r9a07g044-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x10049c00 0 0x400>;
+			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+			clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
+				 <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
+				 <&audio_clk1>,
+				 <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi1: ssi@1004a000 {
+			compatible = "renesas,r9a07g044-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x1004a000 0 0x400>;
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+			clocks = <&cpg CPG_MOD R9A07G044_SSI1_PCLK2>,
+				 <&cpg CPG_MOD R9A07G044_SSI1_PCLK_SFR>,
+				 <&audio_clk1>,
+				 <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A07G044_SSI1_RST_M2_REG>;
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi2: ssi@1004a400 {
+			compatible = "renesas,r9a07g044-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x1004a400 0 0x400>;
+			interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 336 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 337 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+			clocks = <&cpg CPG_MOD R9A07G044_SSI2_PCLK2>,
+				 <&cpg CPG_MOD R9A07G044_SSI2_PCLK_SFR>,
+				 <&audio_clk1>,
+				 <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A07G044_SSI2_RST_M2_REG>;
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi3: ssi@1004a800 {
+			compatible = "renesas,r9a07g044-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x1004a800 0 0x400>;
+			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 341 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+			clocks = <&cpg CPG_MOD R9A07G044_SSI3_PCLK2>,
+				 <&cpg CPG_MOD R9A07G044_SSI3_PCLK_SFR>,
+				 <&audio_clk1>,
+				 <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A07G044_SSI3_RST_M2_REG>;
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		scif0: serial@1004b800 {
 			compatible = "renesas,scif-r9a07g044";
 			reg = <0 0x1004b800 0 0x400>;
-- 
2.17.1

