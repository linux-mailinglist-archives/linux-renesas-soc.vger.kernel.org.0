Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C31160794E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Oct 2022 16:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiJUONN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Oct 2022 10:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiJUONL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 10:13:11 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF00B27BB31
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2022 07:13:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:8c7:6dd8:b0ce:eea6])
        by andre.telenet-ops.be with bizsmtp
        id aeD72800K5BCT2h01eD7MD; Fri, 21 Oct 2022 16:13:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1olsln-000evD-Ij; Fri, 21 Oct 2022 16:13:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1olsln-001LDO-7g; Fri, 21 Oct 2022 16:13:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/2] arm64: dts: renesas: r8a779g0: Add remaining HSCIF nodes
Date:   Fri, 21 Oct 2022 16:13:05 +0200
Message-Id: <64c15b2d13439b2072cde0b588a251cb54f7dc01.1666361314.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666361314.git.geert+renesas@glider.be>
References: <cover.1666361314.git.geert+renesas@glider.be>
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

Add device nodes for the remaining High Speed Serial Communication
Interfaces with FIFO (HSCIF) on the Renesas R-Car V4H (R8A779G0) SoC,
including DMA support.

Reformat the existing HSCIF0 node for consistency.

Based on patches in the BSP by Takeshi Kihara and Vinh Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - Replace S0D3_PER by SASYNCPERD1, as per R-Car V4H Hardware User's
    Manual rev. 0.54.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 56 +++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8023bada93493100..8141ffc38a08301d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -355,9 +355,8 @@ i2c5: i2c@e66e0000 {
 
 		hscif0: serial@e6540000 {
 			compatible = "renesas,hscif-r8a779g0",
-				     "renesas,rcar-gen4-hscif",
-				     "renesas,hscif";
-			reg = <0 0xe6540000 0 96>;
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe6540000 0 0x60>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 514>,
 				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
@@ -371,6 +370,57 @@ hscif0: serial@e6540000 {
 			status = "disabled";
 		};
 
+		hscif1: serial@e6550000 {
+			compatible = "renesas,hscif-r8a779g0",
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe6550000 0 0x60>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 515>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x33>, <&dmac0 0x32>,
+			       <&dmac1 0x33>, <&dmac1 0x32>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 515>;
+			status = "disabled";
+		};
+
+		hscif2: serial@e6560000 {
+			compatible = "renesas,hscif-r8a779g0",
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe6560000 0 0x60>;
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 516>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x35>, <&dmac0 0x34>,
+			       <&dmac1 0x35>, <&dmac1 0x34>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 516>;
+			status = "disabled";
+		};
+
+		hscif3: serial@e66a0000 {
+			compatible = "renesas,hscif-r8a779g0",
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe66a0000 0 0x60>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 517>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x37>, <&dmac0 0x36>,
+			       <&dmac1 0x37>, <&dmac1 0x36>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 517>;
+			status = "disabled";
+		};
+
 		avb0: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a779g0",
 				     "renesas,etheravb-rcar-gen4";
-- 
2.25.1

