Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2BE5F6993
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 16:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiJFO1B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 10:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiJFO1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 10:27:00 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D80AA59A1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 07:26:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by laurent.telenet-ops.be with bizsmtp
        id UeSt2800X5Lh0ZK01eStLH; Thu, 06 Oct 2022 16:26:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogRpt-000oYL-30; Thu, 06 Oct 2022 16:26:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogRps-00177s-Nh; Thu, 06 Oct 2022 16:26:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add SCIF nodes
Date:   Thu,  6 Oct 2022 16:26:50 +0200
Message-Id: <f1eee854931169dead087eac6b5afadebe74ee7f.1665065132.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665065132.git.geert+renesas@glider.be>
References: <cover.1665065132.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the Serial Communication Interfaces with FIFO
(SCIF) on the Renesas R-Car V4H (R8A779G0) SoC, including DMA support.

Based on patches in the BSP by Takeshi Kihara and Vinh Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index edabd1519ccc979d..0c5e580cbd6c3753 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -512,6 +512,74 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a779g0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 0x64>;
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 702>,
+				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x51>, <&dmac0 0x50>,
+			       <&dmac1 0x51>, <&dmac1 0x50>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 702>;
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a779g0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 0x64>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>,
+				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x53>, <&dmac0 0x52>,
+			       <&dmac1 0x53>, <&dmac1 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6c50000 {
+			compatible = "renesas,scif-r8a779g0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6c50000 0 0x64>;
+			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>,
+				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x57>, <&dmac0 0x56>,
+			       <&dmac1 0x57>, <&dmac1 0x56>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6c40000 {
+			compatible = "renesas,scif-r8a779g0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6c40000 0 0x64>;
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>,
+				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x59>, <&dmac0 0x58>,
+			       <&dmac1 0x59>, <&dmac1 0x58>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a779g0",
 				     "renesas,rcar-gen4-msiof";
-- 
2.25.1

