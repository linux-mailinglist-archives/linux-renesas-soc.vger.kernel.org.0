Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712FB609E7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 12:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiJXKEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 06:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiJXKEM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 06:04:12 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29025D886
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 03:03:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1037:e7a1:b1a2:65fe])
        by andre.telenet-ops.be with bizsmtp
        id bm3u280043Gfk6v01m3uWP; Mon, 24 Oct 2022 12:03:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1omuJF-001ChN-R7; Mon, 24 Oct 2022 12:03:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1omuJF-00D4JE-CQ; Mon, 24 Oct 2022 12:03:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
Date:   Mon, 24 Oct 2022 12:03:52 +0200
Message-Id: <387168aef20d399d4f4318f4ecab9c3b016fd6f2.1666605756.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

Despite the name, R-Car V3U is the first member of the R-Car Gen4
family.  Hence update the compatible properties in various device nodes
to include family-specific compatible values for R-Car Gen4 instead of
R-Car Gen3:
  - EtherAVB,
  - MSIOF.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Dependencies are in v6.1-rc1, to be queued in renesas-devel for v6.2.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index ed9400f903c9ecef..41fbb9998cf8279c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -656,7 +656,7 @@ channel7 {
 
 		avb0: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a779a0",
-				     "renesas,etheravb-rcar-gen3";
+				     "renesas,etheravb-rcar-gen4";
 			reg = <0 0xe6800000 0 0x800>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
@@ -704,7 +704,7 @@ avb0: ethernet@e6800000 {
 
 		avb1: ethernet@e6810000 {
 			compatible = "renesas,etheravb-r8a779a0",
-				     "renesas,etheravb-rcar-gen3";
+				     "renesas,etheravb-rcar-gen4";
 			reg = <0 0xe6810000 0 0x800>;
 			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
@@ -752,7 +752,7 @@ avb1: ethernet@e6810000 {
 
 		avb2: ethernet@e6820000 {
 			compatible = "renesas,etheravb-r8a779a0",
-				     "renesas,etheravb-rcar-gen3";
+				     "renesas,etheravb-rcar-gen4";
 			reg = <0 0xe6820000 0 0x1000>;
 			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
@@ -800,7 +800,7 @@ avb2: ethernet@e6820000 {
 
 		avb3: ethernet@e6830000 {
 			compatible = "renesas,etheravb-r8a779a0",
-				     "renesas,etheravb-rcar-gen3";
+				     "renesas,etheravb-rcar-gen4";
 			reg = <0 0xe6830000 0 0x1000>;
 			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
@@ -848,7 +848,7 @@ avb3: ethernet@e6830000 {
 
 		avb4: ethernet@e6840000 {
 			compatible = "renesas,etheravb-r8a779a0",
-				     "renesas,etheravb-rcar-gen3";
+				     "renesas,etheravb-rcar-gen4";
 			reg = <0 0xe6840000 0 0x1000>;
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
@@ -896,7 +896,7 @@ avb4: ethernet@e6840000 {
 
 		avb5: ethernet@e6850000 {
 			compatible = "renesas,etheravb-r8a779a0",
-				     "renesas,etheravb-rcar-gen3";
+				     "renesas,etheravb-rcar-gen4";
 			reg = <0 0xe6850000 0 0x1000>;
 			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
@@ -1019,7 +1019,7 @@ tpu: pwm@e6e80000 {
 
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a779a0",
-				     "renesas,rcar-gen3-msiof";
+				     "renesas,rcar-gen4-msiof";
 			reg = <0 0xe6e90000 0 0x0064>;
 			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 618>;
@@ -1034,7 +1034,7 @@ msiof0: spi@e6e90000 {
 
 		msiof1: spi@e6ea0000 {
 			compatible = "renesas,msiof-r8a779a0",
-				     "renesas,rcar-gen3-msiof";
+				     "renesas,rcar-gen4-msiof";
 			reg = <0 0xe6ea0000 0 0x0064>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 619>;
@@ -1049,7 +1049,7 @@ msiof1: spi@e6ea0000 {
 
 		msiof2: spi@e6c00000 {
 			compatible = "renesas,msiof-r8a779a0",
-				     "renesas,rcar-gen3-msiof";
+				     "renesas,rcar-gen4-msiof";
 			reg = <0 0xe6c00000 0 0x0064>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 620>;
@@ -1064,7 +1064,7 @@ msiof2: spi@e6c00000 {
 
 		msiof3: spi@e6c10000 {
 			compatible = "renesas,msiof-r8a779a0",
-				     "renesas,rcar-gen3-msiof";
+				     "renesas,rcar-gen4-msiof";
 			reg = <0 0xe6c10000 0 0x0064>;
 			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 621>;
@@ -1079,7 +1079,7 @@ msiof3: spi@e6c10000 {
 
 		msiof4: spi@e6c20000 {
 			compatible = "renesas,msiof-r8a779a0",
-				     "renesas,rcar-gen3-msiof";
+				     "renesas,rcar-gen4-msiof";
 			reg = <0 0xe6c20000 0 0x0064>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
@@ -1094,7 +1094,7 @@ msiof4: spi@e6c20000 {
 
 		msiof5: spi@e6c28000 {
 			compatible = "renesas,msiof-r8a779a0",
-				     "renesas,rcar-gen3-msiof";
+				     "renesas,rcar-gen4-msiof";
 			reg = <0 0xe6c28000 0 0x0064>;
 			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
-- 
2.25.1

