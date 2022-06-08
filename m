Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6AD654372F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244179AbiFHPVX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245121AbiFHPUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:20:04 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D68A102760
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:16:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by michel.telenet-ops.be with bizsmtp
        id gfGU2700U1qF9lr06fGUPN; Wed, 08 Jun 2022 17:16:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxQ4-003Dnk-36; Wed, 08 Jun 2022 17:16:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxQ3-008k0W-4f; Wed, 08 Jun 2022 17:16:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
Date:   Wed,  8 Jun 2022 17:16:25 +0200
Message-Id: <b477eea0fc33a055d1b1874847e26614f68f5da0.1654701299.git.geert+renesas@glider.be>
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
  - GPIO.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel-for-v5.20.

Depends on commit 43ebbb92e43fc9d8 ("gpio: rcar: Add R-Car Gen4
support"), which is now in v5.19-rc1.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index b9731504b7cd5e7f..8162ef8503761efd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -105,7 +105,8 @@ pfc: pinctrl@e6050000 {
 		};
 
 		gpio0: gpio@e6058180 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6058180 0 0x54>;
 			interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 916>;
@@ -119,7 +120,8 @@ gpio0: gpio@e6058180 {
 		};
 
 		gpio1: gpio@e6050180 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6050180 0 0x54>;
 			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 915>;
@@ -133,7 +135,8 @@ gpio1: gpio@e6050180 {
 		};
 
 		gpio2: gpio@e6050980 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6050980 0 0x54>;
 			interrupts = <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 915>;
@@ -147,7 +150,8 @@ gpio2: gpio@e6050980 {
 		};
 
 		gpio3: gpio@e6058980 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6058980 0 0x54>;
 			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 916>;
@@ -161,7 +165,8 @@ gpio3: gpio@e6058980 {
 		};
 
 		gpio4: gpio@e6060180 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6060180 0 0x54>;
 			interrupts = <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 917>;
@@ -175,7 +180,8 @@ gpio4: gpio@e6060180 {
 		};
 
 		gpio5: gpio@e6060980 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6060980 0 0x54>;
 			interrupts = <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 917>;
@@ -189,7 +195,8 @@ gpio5: gpio@e6060980 {
 		};
 
 		gpio6: gpio@e6068180 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6068180 0 0x54>;
 			interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
@@ -203,7 +210,8 @@ gpio6: gpio@e6068180 {
 		};
 
 		gpio7: gpio@e6068980 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6068980 0 0x54>;
 			interrupts = <GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
@@ -217,7 +225,8 @@ gpio7: gpio@e6068980 {
 		};
 
 		gpio8: gpio@e6069180 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6069180 0 0x54>;
 			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
@@ -231,7 +240,8 @@ gpio8: gpio@e6069180 {
 		};
 
 		gpio9: gpio@e6069980 {
-			compatible = "renesas,gpio-r8a779a0";
+			compatible = "renesas,gpio-r8a779a0",
+				     "renesas,rcar-gen4-gpio";
 			reg = <0 0xe6069980 0 0x54>;
 			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
-- 
2.25.1

