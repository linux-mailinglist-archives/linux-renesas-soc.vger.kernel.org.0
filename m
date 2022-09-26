Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115855EACBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 18:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIZQjo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 12:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiIZQjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 12:39:22 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BE6138F04
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 08:26:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
        by laurent.telenet-ops.be with bizsmtp
        id QfST2800L3Qogd101fSTCv; Mon, 26 Sep 2022 17:26:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocq02-006Jqy-Vw; Mon, 26 Sep 2022 17:26:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocq02-00DOQ0-Hl; Mon, 26 Sep 2022 17:26:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779g0: Add MSIOF nodes
Date:   Mon, 26 Sep 2022 17:26:24 +0200
Message-Id: <450921ef6d8c30ca2953a1665c8597f6a69d01f2.1664204771.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664204771.git.geert+renesas@glider.be>
References: <cover.1664204771.git.geert+renesas@glider.be>
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

Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
(MSIOF) on the Renesas R-Car V4H (R8A779G0) SoC, including DMA support.

Based on patches in the BSP by Thanh Quan.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Update compatible values,
  - Drop bogus clocks and assigned clocks properties.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 96 +++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 632b9f49de296ce0..d31b1fb42fc67cf8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -496,6 +496,102 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a779g0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6e90000 0 0x0064>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 618>;
+			dmas = <&dmac0 0x41>, <&dmac0 0x40>,
+			       <&dmac1 0x41>, <&dmac1 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 618>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a779g0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 619>;
+			dmas = <&dmac0 0x43>, <&dmac0 0x42>,
+			       <&dmac1 0x43>, <&dmac1 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 619>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a779g0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 620>;
+			dmas = <&dmac0 0x45>, <&dmac0 0x44>,
+			       <&dmac1 0x45>, <&dmac1 0x44>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 620>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a779g0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			dmas = <&dmac0 0x47>, <&dmac0 0x46>,
+			       <&dmac1 0x47>, <&dmac1 0x46>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof4: spi@e6c20000 {
+			compatible = "renesas,msiof-r8a779g0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c20000 0 0x0064>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			dmas = <&dmac0 0x49>, <&dmac0 0x48>,
+			       <&dmac1 0x49>, <&dmac1 0x48>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof5: spi@e6c28000 {
+			compatible = "renesas,msiof-r8a779g0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c28000 0 0x0064>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			dmas = <&dmac0 0x4b>, <&dmac0 0x4a>,
+			       <&dmac1 0x4b>, <&dmac1 0x4a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779g0",
 				     "renesas,rcar-gen4-dmac";
-- 
2.25.1

