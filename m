Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104365B8A9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 16:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiINOdv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 10:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbiINOds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 10:33:48 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BC963F39
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 07:33:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
        by baptiste.telenet-ops.be with bizsmtp
        id KqZi2800y3vs4GX01qZiPX; Wed, 14 Sep 2022 16:33:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTSQ-005B5L-9k; Wed, 14 Sep 2022 16:33:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTAa-000z4H-GB; Wed, 14 Sep 2022 16:15:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
Date:   Wed, 14 Sep 2022 16:15:14 +0200
Message-Id: <f14fde21270bf8269a61a75fc6e50af2765f2a42.1663164707.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Despite the name, R-Car V3U is the first member of the R-Car Gen4
family.  Hence update the compatible properties in various device nodes
to include family-specific compatible values for R-Car Gen4 instead of
R-Car Gen3:
  - CMT,
  - SDHI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Dependencies are in v6.0-rc1, to be queued in renesas-devel for v6.1.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 8539013f5870c2f0..ed9400f903c9ecef 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -247,7 +247,7 @@ gpio9: gpio@e6069980 {
 
 		cmt0: timer@e60f0000 {
 			compatible = "renesas,r8a779a0-cmt0",
-				     "renesas,rcar-gen3-cmt0";
+				     "renesas,rcar-gen4-cmt0";
 			reg = <0 0xe60f0000 0 0x1004>;
 			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>;
@@ -260,7 +260,7 @@ cmt0: timer@e60f0000 {
 
 		cmt1: timer@e6130000 {
 			compatible = "renesas,r8a779a0-cmt1",
-				     "renesas,rcar-gen3-cmt1";
+				     "renesas,rcar-gen4-cmt1";
 			reg = <0 0xe6130000 0 0x1004>;
 			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
@@ -279,7 +279,7 @@ cmt1: timer@e6130000 {
 
 		cmt2: timer@e6140000 {
 			compatible = "renesas,r8a779a0-cmt1",
-				     "renesas,rcar-gen3-cmt1";
+				     "renesas,rcar-gen4-cmt1";
 			reg = <0 0xe6140000 0 0x1004>;
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
@@ -298,7 +298,7 @@ cmt2: timer@e6140000 {
 
 		cmt3: timer@e6148000 {
 			compatible = "renesas,r8a779a0-cmt1",
-				     "renesas,rcar-gen3-cmt1";
+				     "renesas,rcar-gen4-cmt1";
 			reg = <0 0xe6148000 0 0x1004>;
 			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
@@ -2065,7 +2065,7 @@ dmac2: dma-controller@e7351000 {
 
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a779a0",
-				     "renesas,rcar-gen3-sdhi";
+				     "renesas,rcar-gen4-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
 			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 706>, <&cpg CPG_CORE R8A779A0_CLK_SD0H>;
-- 
2.25.1

