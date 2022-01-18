Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF0A492B7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jan 2022 17:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbiARQso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jan 2022 11:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbiARQsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 11:48:39 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F17C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jan 2022 08:48:38 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by xavier.telenet-ops.be with bizsmtp
        id kGob2600H0kcUhD01Gobkh; Tue, 18 Jan 2022 17:48:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9res-00AGv1-Ti; Tue, 18 Jan 2022 17:48:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9res-001B7W-97; Tue, 18 Jan 2022 17:48:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Miscellaneous whitespace fixes
Date:   Tue, 18 Jan 2022 17:48:31 +0100
Message-Id: <3f2bcae1253c7a31d3eb6755185092a1f2b99b09.1642524439.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make whitespace and indentation more consistent.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.18.

 .../dts/renesas/beacon-renesom-baseboard.dtsi |  9 ++++-----
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     | 14 ++++++-------
 .../dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi     | 10 +++++-----
 .../dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 12 +++++------
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     | 12 +++++------
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 20 +++++++++----------
 14 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 2692cc64bff61e61..5ad6cd1864c10442 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -359,11 +359,10 @@ versaclock6_bb: clock-controller@6a {
 		clocks = <&x304_clk>;
 		clock-names = "xin";
 
-		assigned-clocks = <&versaclock6_bb 1>,
-				   <&versaclock6_bb 2>,
-				   <&versaclock6_bb 3>,
-				   <&versaclock6_bb 4>;
-		assigned-clock-rates =	<24000000>, <24000000>, <24000000>, <24576000>;
+		assigned-clocks = <&versaclock6_bb 1>, <&versaclock6_bb 2>,
+				  <&versaclock6_bb 3>, <&versaclock6_bb 4>;
+		assigned-clock-rates = <24000000>, <24000000>, <24000000>,
+				       <24576000>;
 
 		OUT1 {
 			idt,mode = <VC5_CMOS>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index eda6a840371a8c15..12846125a4c983df 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1698,12 +1698,12 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a774a1", "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			compatible = "renesas,rcar_sound-r8a774a1", "renesas,rcar_sound-gen3";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
@@ -2010,7 +2010,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
index 3c0d59def8ee5342..89d708346ba8176d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "Beacon Embedded Works RZ/G2N Development Kit";
-	compatible =	"beacon,beacon-rzg2n", "renesas,r8a774b1";
+	compatible = "beacon,beacon-rzg2n", "renesas,r8a774b1";
 
 	aliases {
 		serial0 = &scif2;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 44f79fbd75dc9e48..a4b406a346f9c380 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1571,7 +1571,7 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a774b1", "renesas,rcar_sound-gen3";
+			compatible = "renesas,rcar_sound-r8a774b1", "renesas,rcar_sound-gen3";
 			reg = <0 0xec500000 0 0x1000>, /* SCU */
 			      <0 0xec5a0000 0 0x100>,  /* ADG */
 			      <0 0xec540000 0 0x1000>, /* SSIU */
@@ -1883,7 +1883,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index b8dcbbbf3db5397f..e123c8d1bab93752 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1328,11 +1328,11 @@ rcar_sound: sound@ec500000 {
 			 */
 			compatible = "renesas,rcar_sound-r8a774c0",
 				     "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
index 7b6649a3ded0299e..3e9ced3b2d334999 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "Beacon Embedded Works RZ/G2H Development Kit";
-	compatible =	"beacon,beacon-rzg2h", "renesas,r8a774e1";
+	compatible = "beacon,beacon-rzg2h", "renesas,r8a774e1";
 
 	aliases {
 		serial0 = &scif2;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index e6d8610730a84ab8..989c1c00dcdcb393 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1784,7 +1784,7 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a774e1", "renesas,rcar_sound-gen3";
+			compatible = "renesas,rcar_sound-r8a774e1", "renesas,rcar_sound-gen3";
 			reg = <0 0xec500000 0 0x1000>, /* SCU */
 			      <0 0xec5a0000 0 0x100>,  /* ADG */
 			      <0 0xec540000 0 0x1000>, /* SSIU */
@@ -2043,7 +2043,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index f1b1aa7e2adbe578..d792bf14d18dd418 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2018,12 +2018,12 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a7795", "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			compatible = "renesas,rcar_sound-r8a7795", "renesas,rcar_sound-gen3";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
@@ -2277,7 +2277,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e9e18873b05ca2f6..56b91411a16b4604 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -1890,12 +1890,12 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a7796", "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			compatible = "renesas,rcar_sound-r8a7796", "renesas,rcar_sound-gen3";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
@@ -2202,7 +2202,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 4252cbcf34fb490a..6eac95b986e6737a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1734,7 +1734,7 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a77961", "renesas,rcar_sound-gen3";
+			compatible = "renesas,rcar_sound-r8a77961", "renesas,rcar_sound-gen3";
 			reg = <0 0xec500000 0 0x1000>, /* SCU */
 			      <0 0xec5a0000 0 0x100>,  /* ADG */
 			      <0 0xec540000 0 0x1000>, /* SSIU */
@@ -2046,7 +2046,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 363f7f513f5a1c43..8429133650655146 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1753,12 +1753,12 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a77965", "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			compatible = "renesas,rcar_sound-r8a77965", "renesas,rcar_sound-gen3";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
@@ -2012,7 +2012,7 @@ ssiu37: ssiu-31 {
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
-					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dmas = <&audma0 0x71>, <&audma1 0x72>;
 					dma-names = "rx", "tx";
 				};
 				ssiu41: ssiu-33 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 1a497a7ba09168dd..f2bb829e8d0aa7f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1489,12 +1489,12 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a77990", "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			compatible = "renesas,rcar_sound-r8a77990", "renesas,rcar_sound-gen3";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index ea03a6f9a8abc84d..9326344db8eec147 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1046,12 +1046,12 @@ rcar_sound: sound@ec500000 {
 			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
 			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
 			 */
-			compatible =  "renesas,rcar_sound-r8a77995", "renesas,rcar_sound-gen3";
-			reg =	<0 0xec500000 0 0x1000>, /* SCU */
-				<0 0xec5a0000 0 0x100>,  /* ADG */
-				<0 0xec540000 0 0x1000>, /* SSIU */
-				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
+			compatible = "renesas,rcar_sound-r8a77995", "renesas,rcar_sound-gen3";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 65d0ddb42f611213..c80f4584035e79e1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -109,7 +109,7 @@ gpio0: gpio@e6058180 {
 			interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 916>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 916>;
+			resets = <&cpg 916>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 0 28>;
@@ -123,7 +123,7 @@ gpio1: gpio@e6050180 {
 			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 915>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 915>;
+			resets = <&cpg 915>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 32 31>;
@@ -137,7 +137,7 @@ gpio2: gpio@e6050980 {
 			interrupts = <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 915>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 915>;
+			resets = <&cpg 915>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 64 25>;
@@ -151,7 +151,7 @@ gpio3: gpio@e6058980 {
 			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 916>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 916>;
+			resets = <&cpg 916>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 96 17>;
@@ -165,7 +165,7 @@ gpio4: gpio@e6060180 {
 			interrupts = <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 917>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 917>;
+			resets = <&cpg 917>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 128 27>;
@@ -179,7 +179,7 @@ gpio5: gpio@e6060980 {
 			interrupts = <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 917>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 917>;
+			resets = <&cpg 917>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 160 21>;
@@ -193,7 +193,7 @@ gpio6: gpio@e6068180 {
 			interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets = <&cpg 918>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 192 21>;
@@ -207,7 +207,7 @@ gpio7: gpio@e6068980 {
 			interrupts = <GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets = <&cpg 918>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 224 21>;
@@ -221,7 +221,7 @@ gpio8: gpio@e6069180 {
 			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets = <&cpg 918>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 256 21>;
@@ -235,7 +235,7 @@ gpio9: gpio@e6069980 {
 			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets = <&cpg 918>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pfc 0 288 21>;
-- 
2.25.1

