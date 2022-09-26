Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8DF75EACBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 18:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiIZQjq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 12:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiIZQjY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 12:39:24 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C10137910
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 08:26:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
        by albert.telenet-ops.be with bizsmtp
        id QfST2800B3Qogd106fSTWt; Mon, 26 Sep 2022 17:26:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocq02-006Jqx-WD; Mon, 26 Sep 2022 17:26:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocq02-00DOPu-Gs; Mon, 26 Sep 2022 17:26:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add DMA support
Date:   Mon, 26 Sep 2022 17:26:23 +0200
Message-Id: <1ea45b51f897a11d9477be4ac54fdb0efcc624e1.1664204771.git.geert+renesas@glider.be>
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

Add device nodes for the Direct Memory Access Controllers for System
(SYS-DMAC) on the Renesas R-Car V4H (R8A779G0) SoC.

Link all DMA consumers to the corresponding DMA controller channels.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 91 +++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index d70f0600ae5a9469..632b9f49de296ce0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -241,6 +241,9 @@ i2c0: i2c@e6500000 {
 			reg = <0 0xe6500000 0 0x40>;
 			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 518>;
+			dmas = <&dmac0 0x91>, <&dmac0 0x90>,
+			       <&dmac1 0x91>, <&dmac1 0x90>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 518>;
 			i2c-scl-internal-delay-ns = <110>;
@@ -255,6 +258,9 @@ i2c1: i2c@e6508000 {
 			reg = <0 0xe6508000 0 0x40>;
 			interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 519>;
+			dmas = <&dmac0 0x93>, <&dmac0 0x92>,
+			       <&dmac1 0x93>, <&dmac1 0x92>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 519>;
 			i2c-scl-internal-delay-ns = <110>;
@@ -269,6 +275,9 @@ i2c2: i2c@e6510000 {
 			reg = <0 0xe6510000 0 0x40>;
 			interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 520>;
+			dmas = <&dmac0 0x95>, <&dmac0 0x94>,
+			       <&dmac1 0x95>, <&dmac1 0x94>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 520>;
 			i2c-scl-internal-delay-ns = <110>;
@@ -283,6 +292,9 @@ i2c3: i2c@e66d0000 {
 			reg = <0 0xe66d0000 0 0x40>;
 			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 521>;
+			dmas = <&dmac0 0x97>, <&dmac0 0x96>,
+			       <&dmac1 0x97>, <&dmac1 0x96>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 521>;
 			i2c-scl-internal-delay-ns = <110>;
@@ -297,6 +309,9 @@ i2c4: i2c@e66d8000 {
 			reg = <0 0xe66d8000 0 0x40>;
 			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
+			dma-names = "tx", "rx", "tx", "rx";
+			dmas = <&dmac0 0x99>, <&dmac0 0x98>,
+			       <&dmac1 0x99>, <&dmac1 0x98>;
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			i2c-scl-internal-delay-ns = <110>;
@@ -311,6 +326,9 @@ i2c5: i2c@e66e0000 {
 			reg = <0 0xe66e0000 0 0x40>;
 			interrupts = <GIC_SPI 615 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 523>;
+			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
+			       <&dmac1 0x9b>, <&dmac1 0x9a>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 523>;
 			i2c-scl-internal-delay-ns = <110>;
@@ -329,6 +347,9 @@ hscif0: serial@e6540000 {
 				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x31>, <&dmac0 0x30>,
+			       <&dmac1 0x31>, <&dmac1 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 514>;
 			status = "disabled";
@@ -475,6 +496,76 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		dmac0: dma-controller@e7350000 {
+			compatible = "renesas,dmac-r8a779g0",
+				     "renesas,rcar-gen4-dmac";
+			reg = <0 0xe7350000 0 0x1000>,
+			      <0 0xe7300000 0 0x10000>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3", "ch4",
+					  "ch5", "ch6", "ch7", "ch8", "ch9",
+					  "ch10", "ch11", "ch12", "ch13",
+					  "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 709>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 709>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
+		dmac1: dma-controller@e7351000 {
+			compatible = "renesas,dmac-r8a779g0",
+				     "renesas,rcar-gen4-dmac";
+			reg = <0 0xe7351000 0 0x1000>,
+			      <0 0xe7310000 0 0x10000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3", "ch4",
+					  "ch5", "ch6", "ch7", "ch8", "ch9",
+					  "ch10", "ch11", "ch12", "ch13",
+					  "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 710>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 710>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.25.1

