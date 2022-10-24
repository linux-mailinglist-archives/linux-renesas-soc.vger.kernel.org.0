Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F12609E89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiJXKGf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 06:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiJXKGd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 06:06:33 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C1C19C33
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 03:06:31 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1037:e7a1:b1a2:65fe])
        by baptiste.telenet-ops.be with bizsmtp
        id bm6W2800u3Gfk6v01m6Wqo; Mon, 24 Oct 2022 12:06:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1omuLl-001Ci8-Vr; Mon, 24 Oct 2022 12:06:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1omuLl-00D4PI-9q; Mon, 24 Oct 2022 12:06:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Miscellaneous whitespace fixes
Date:   Mon, 24 Oct 2022 12:06:28 +0200
Message-Id: <1666adade07e16b77af1f03c55799b2ad1378e60.1666605877.git.geert+renesas@glider.be>
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

Remove superfluous spaces near properties and equal signs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.2.

 arch/arm/boot/dts/r8a7742.dtsi   |  2 +-
 arch/arm/boot/dts/r8a7790.dtsi   |  2 +-
 arch/arm/boot/dts/r8a7791.dtsi   |  2 +-
 arch/arm/boot/dts/r8a7793.dtsi   |  2 +-
 arch/arm/boot/dts/r9a06g032.dtsi | 10 +++++-----
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 758a1bf02fae9a15..73be346001cb4039 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -1298,7 +1298,7 @@ ssi0: ssi-0 {
 					dma-names = "rx", "tx", "rxu", "txu";
 				};
 				ssi1: ssi-1 {
-					 interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&audma0 0x03>, <&audma1 0x04>,
 					       <&audma0 0x49>, <&audma1 0x4a>;
 					dma-names = "rx", "tx", "rxu", "txu";
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index db171e3c62f25eb8..111a6d23159e99c5 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1252,7 +1252,7 @@ ssi0: ssi-0 {
 					dma-names = "rx", "tx", "rxu", "txu";
 				};
 				ssi1: ssi-1 {
-					 interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&audma0 0x03>, <&audma1 0x04>,
 					       <&audma0 0x49>, <&audma1 0x4a>;
 					dma-names = "rx", "tx", "rxu", "txu";
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index d8f91d9f42aeed8a..777b672b59cc2707 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1365,7 +1365,7 @@ ssi0: ssi-0 {
 					dma-names = "rx", "tx", "rxu", "txu";
 				};
 				ssi1: ssi-1 {
-					 interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&audma0 0x03>, <&audma1 0x04>,
 					       <&audma0 0x49>, <&audma1 0x4a>;
 					dma-names = "rx", "tx", "rxu", "txu";
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 9ebe7bfaf0ed0a3a..3e0be1b589314b8c 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -1111,7 +1111,7 @@ ssi0: ssi-0 {
 					dma-names = "rx", "tx", "rxu", "txu";
 				};
 				ssi1: ssi-1 {
-					 interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&audma0 0x03>, <&audma1 0x04>,
 					       <&audma0 0x49>, <&audma1 0x4a>;
 					dma-names = "rx", "tx", "rxu", "txu";
diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 563024c9a4ae77d6..41e19c0986ce6e6b 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -199,7 +199,7 @@ uart3: serial@50000000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART3>, <&sysctrl R9A06G032_HCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas =  <&dmamux 0 0 0 0 0 1>, <&dmamux 1 0 0 0 1 1>;
+			dmas = <&dmamux 0 0 0 0 0 1>, <&dmamux 1 0 0 0 1 1>;
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
@@ -212,7 +212,7 @@ uart4: serial@50001000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART4>, <&sysctrl R9A06G032_HCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas =  <&dmamux 2 0 0 0 2 1>, <&dmamux 3 0 0 0 3 1>;
+			dmas = <&dmamux 2 0 0 0 2 1>, <&dmamux 3 0 0 0 3 1>;
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
@@ -225,7 +225,7 @@ uart5: serial@50002000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART5>, <&sysctrl R9A06G032_HCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas =  <&dmamux 4 0 0 0 4 1>, <&dmamux 5 0 0 0 5 1>;
+			dmas = <&dmamux 4 0 0 0 4 1>, <&dmamux 5 0 0 0 5 1>;
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
@@ -238,7 +238,7 @@ uart6: serial@50003000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART6>, <&sysctrl R9A06G032_HCLK_UART6>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas =  <&dmamux 6 0 0 0 6 1>, <&dmamux 7 0 0 0 7 1>;
+			dmas = <&dmamux 6 0 0 0 6 1>, <&dmamux 7 0 0 0 7 1>;
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
@@ -251,7 +251,7 @@ uart7: serial@50004000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART7>, <&sysctrl R9A06G032_HCLK_UART7>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas =  <&dmamux 4 0 0 0 20 1>, <&dmamux 5 0 0 0 21 1>;
+			dmas = <&dmamux 4 0 0 0 20 1>, <&dmamux 5 0 0 0 21 1>;
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
-- 
2.25.1

