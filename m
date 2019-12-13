Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB7711E894
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbfLMQlk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:40 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:33468 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbfLMQlk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:40 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id dUhG2100b5USYZQ06UhGDL; Fri, 13 Dec 2019 17:41:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uV-Gr; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000z7-F7; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/7] ARM: dts: renesas: Group tuples in interrupt properties
Date:   Fri, 13 Dec 2019 17:41:10 +0100
Message-Id: <20191213164115.3697-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in the various properties containing interrupt specifiers should be
grouped.  While "make dtbs_check" does not impose this yet for the
"interrupts" property, it does for the "interrupt-map" property, leading
to warnings like:

    pci@ee090000: interrupt-map:0: [0, 0, 0, 1, 5, 0, 108, 4, 2048, 0, 0, 1, 5, 0, 108, 4, 4096, 0, 0, 2, 5, 0, 108, 4] is too long
    pci@ee0d0000: interrupt-map:0: [0, 0, 0, 1, 5, 0, 113, 4, 2048, 0, 0, 1, 5, 0, 113, 4, 4096, 0, 0, 2, 5, 0, 113, 4] is too long

Fix this by grouping the tuples of the "interrupts" and "interrupt-map"
properties using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi |  18 ++--
 arch/arm/boot/dts/r8a73a4.dtsi  |  42 ++++-----
 arch/arm/boot/dts/r8a7740.dtsi  | 102 +++++++++++-----------
 arch/arm/boot/dts/r8a7743.dtsi  | 140 +++++++++++++++---------------
 arch/arm/boot/dts/r8a7744.dtsi  | 140 +++++++++++++++---------------
 arch/arm/boot/dts/r8a7745.dtsi  | 112 ++++++++++++------------
 arch/arm/boot/dts/r8a77470.dtsi |  80 ++++++++---------
 arch/arm/boot/dts/r8a7778.dtsi  |   8 +-
 arch/arm/boot/dts/r8a7779.dtsi  |   8 +-
 arch/arm/boot/dts/r8a7790.dtsi  | 146 ++++++++++++++++----------------
 arch/arm/boot/dts/r8a7791.dtsi  | 140 +++++++++++++++---------------
 arch/arm/boot/dts/r8a7792.dtsi  |  64 +++++++-------
 arch/arm/boot/dts/r8a7793.dtsi  | 120 +++++++++++++-------------
 arch/arm/boot/dts/r8a7794.dtsi  | 104 +++++++++++------------
 arch/arm/boot/dts/sh73a0.dtsi   | 122 +++++++++++++-------------
 15 files changed, 673 insertions(+), 673 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index d03dcd919d6f5cfb..75b2796ebfcaf650 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -313,9 +313,9 @@
 		mmcif: mmc@e804c800 {
 			compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
 			reg = <0xe804c800 0x80>;
-			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
 			power-domains = <&cpg_clocks>;
 			reg-io-width = <4>;
@@ -326,9 +326,9 @@
 		sdhi0: sd@e804e000 {
 			compatible = "renesas,sdhi-r7s72100";
 			reg = <0xe804e000 0x100>;
-			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&mstp12_clks R7S72100_CLK_SDHI00>,
 				 <&mstp12_clks R7S72100_CLK_SDHI01>;
@@ -342,9 +342,9 @@
 		sdhi1: sd@e804e800 {
 			compatible = "renesas,sdhi-r7s72100";
 			reg = <0xe804e800 0x100>;
-			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&mstp12_clks R7S72100_CLK_SDHI10>,
 				 <&mstp12_clks R7S72100_CLK_SDHI11>;
diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index dd865f3c2eda76a1..a5cd31229fbde835 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -84,27 +84,27 @@
 		dma0: dma-controller@e6700020 {
 			compatible = "renesas,shdma-r8a73a4";
 			reg = <0 0xe6700020 0 0x89e0>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-					GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 12ffe73bf2bc43cd..ebc1ff64f530d42c 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -102,14 +102,14 @@
 			<0xe6900020 1>,
 			<0xe6900040 1>,
 			<0xe6900060 1>;
-		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
 		power-domains = <&pd_a4s>;
 	};
@@ -124,14 +124,14 @@
 			<0xe6900024 1>,
 			<0xe6900044 1>,
 			<0xe6900064 1>;
-		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
 		power-domains = <&pd_a4s>;
 	};
@@ -146,14 +146,14 @@
 			<0xe6900028 1>,
 			<0xe6900048 1>,
 			<0xe6900068 1>;
-		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
 		power-domains = <&pd_a4s>;
 	};
@@ -168,14 +168,14 @@
 			<0xe690002c 1>,
 			<0xe690004c 1>,
 			<0xe690006c 1>;
-		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
 		power-domains = <&pd_a4s>;
 	};
@@ -198,10 +198,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-r8a7740", "renesas,rmobile-iic";
 		reg = <0xfff20000 0x425>;
-		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7740_CLK_IIC0>;
 		power-domains = <&pd_a4r>;
 		status = "disabled";
@@ -212,10 +212,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-r8a7740", "renesas,rmobile-iic";
 		reg = <0xe6c20000 0x425>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7740_CLK_IIC1>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
@@ -342,8 +342,8 @@
 	mmcif0: mmc@e6bd0000 {
 		compatible = "renesas,mmcif-r8a7740", "renesas,sh-mmcif";
 		reg = <0xe6bd0000 0x100>;
-		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7740_CLK_MMC>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
@@ -352,9 +352,9 @@
 	sdhi0: sd@e6850000 {
 		compatible = "renesas,sdhi-r8a7740";
 		reg = <0xe6850000 0x100>;
-		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7740_CLK_SDHI0>;
 		power-domains = <&pd_a3sp>;
 		cap-sd-highspeed;
@@ -365,9 +365,9 @@
 	sdhi1: sd@e6860000 {
 		compatible = "renesas,sdhi-r8a7740";
 		reg = <0xe6860000 0x100>;
-		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7740_CLK_SDHI1>;
 		power-domains = <&pd_a3sp>;
 		cap-sd-highspeed;
@@ -378,9 +378,9 @@
 	sdhi2: sd@e6870000 {
 		compatible = "renesas,sdhi-r8a7740";
 		reg = <0xe6870000 0x100>;
-		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp4_clks R8A7740_CLK_SDHI2>;
 		power-domains = <&pd_a3sp>;
 		cap-sd-highspeed;
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index dcf09d9a1d76bb02..36d45f5a6281bb89 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -606,8 +606,8 @@
 			compatible = "renesas,r8a7743-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
@@ -620,8 +620,8 @@
 			compatible = "renesas,r8a7743-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
@@ -634,22 +634,22 @@
 			compatible = "renesas,dmac-r8a7743",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -667,22 +667,22 @@
 			compatible = "renesas,dmac-r8a7743",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1372,20 +1372,20 @@
 			compatible = "renesas,dmac-r8a7743",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1403,20 +1403,20 @@
 			compatible = "renesas,dmac-r8a7743",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1468,9 +1468,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x800 0 0 0 0>;
@@ -1503,9 +1503,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0c0000 0 0xee0c0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x10800 0 0 0 0>;
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 357640e3693480f3..366201d0a71d1986 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -606,8 +606,8 @@
 			compatible = "renesas,r8a7744-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
@@ -620,8 +620,8 @@
 			compatible = "renesas,r8a7744-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
@@ -634,22 +634,22 @@
 			compatible = "renesas,dmac-r8a7744",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -667,22 +667,22 @@
 			compatible = "renesas,dmac-r8a7744",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1372,20 +1372,20 @@
 			compatible = "renesas,dmac-r8a7744",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1403,20 +1403,20 @@
 			compatible = "renesas,dmac-r8a7744",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1468,9 +1468,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x800 0 0 0 0>;
@@ -1503,9 +1503,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0c0000 0 0xee0c0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x10800 0 0 0 0>;
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index edcc74ff90865540..3f88a7e34af2c28b 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -549,8 +549,8 @@
 			compatible = "renesas,r8a7745-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
@@ -563,8 +563,8 @@
 			compatible = "renesas,r8a7745-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
@@ -577,22 +577,22 @@
 			compatible = "renesas,dmac-r8a7745",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -610,22 +610,22 @@
 			compatible = "renesas,dmac-r8a7745",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1299,20 +1299,20 @@
 			compatible = "renesas,dmac-r8a7745",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1344,9 +1344,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x800 0 0 0 0>;
@@ -1379,9 +1379,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0c0000 0 0xee0c0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x10800 0 0 0 0>;
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 8b522ed4eb1ef815..6efcef1670e15a95 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -413,8 +413,8 @@
 			compatible = "renesas,r8a77470-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
@@ -427,8 +427,8 @@
 			compatible = "renesas,r8a77470-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
@@ -441,8 +441,8 @@
 			compatible = "renesas,r8a77470-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a8000 0 0x100>;
-			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 326>;
 			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
@@ -455,8 +455,8 @@
 			compatible = "renesas,r8a77470-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b8000 0 0x100>;
-			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 327>;
 			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
@@ -469,22 +469,22 @@
 			compatible = "renesas,dmac-r8a77470",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -502,22 +502,22 @@
 			compatible = "renesas,dmac-r8a77470",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 5628b8a3598f43c1..593c6df90303524d 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -79,10 +79,10 @@
 			<0xfe780024 4>,
 			<0xfe780044 4>,
 			<0xfe780064 4>;
-		interrupts =   <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH
-				GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH
-				GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH
-				GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		sense-bitfield-width = <2>;
 	};
 
diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 63341635bddf873f..beb9885e6ffca7a5 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -172,10 +172,10 @@
 			<0xfe780044 4>,
 			<0xfe780064 4>,
 			<0xfe780000 4>;
-		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		sense-bitfield-width = <2>;
 	};
 
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 344519957916f473..ebe9dbf3f8884e99 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -672,8 +672,8 @@
 			compatible = "renesas,r8a7790-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
@@ -686,8 +686,8 @@
 			compatible = "renesas,r8a7790-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
@@ -700,22 +700,22 @@
 			compatible = "renesas,dmac-r8a7790",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -733,22 +733,22 @@
 			compatible = "renesas,dmac-r8a7790",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1303,20 +1303,20 @@
 			compatible = "renesas,dmac-r8a7790",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1334,20 +1334,20 @@
 			compatible = "renesas,dmac-r8a7790",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1392,9 +1392,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x800 0 0 0 0>;
@@ -1427,9 +1427,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0a0000 0 0xee0a0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pci2: pci@ee0d0000 {
@@ -1450,9 +1450,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0c0000 0 0xee0c0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x20800 0 0 0 0>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 119e67b665392a5a..2267607616e6413b 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -622,8 +622,8 @@
 			compatible = "renesas,r8a7791-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
@@ -636,8 +636,8 @@
 			compatible = "renesas,r8a7791-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
@@ -650,22 +650,22 @@
 			compatible = "renesas,dmac-r8a7791",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -683,22 +683,22 @@
 			compatible = "renesas,dmac-r8a7791",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1342,20 +1342,20 @@
 			compatible = "renesas,dmac-r8a7791",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1373,20 +1373,20 @@
 			compatible = "renesas,dmac-r8a7791",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1431,9 +1431,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x800 0 0 0 0>;
@@ -1466,9 +1466,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0c0000 0 0xee0c0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x10800 0 0 0 0>;
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 5956854e60d8d585..39af16caa2aef501 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -469,22 +469,22 @@
 			compatible = "renesas,dmac-r8a7792",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -502,22 +502,22 @@
 			compatible = "renesas,dmac-r8a7792",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 91c7c3cfe7476cbf..eef035c4d98341b6 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -568,22 +568,22 @@
 			compatible = "renesas,dmac-r8a7793",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -601,22 +601,22 @@
 			compatible = "renesas,dmac-r8a7793",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1169,20 +1169,20 @@
 			compatible = "renesas,dmac-r8a7793",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1200,20 +1200,20 @@
 			compatible = "renesas,dmac-r8a7793",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 7d4644fac3771798..05ef79c6ed7f6b61 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -530,22 +530,22 @@
 			compatible = "renesas,dmac-r8a7794",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x20000>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -563,22 +563,22 @@
 			compatible = "renesas,dmac-r8a7794",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6720000 0 0x20000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1135,20 +1135,20 @@
 			compatible = "renesas,dmac-r8a7794",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3", "ch4",
 					  "ch5", "ch6", "ch7", "ch8", "ch9",
@@ -1180,9 +1180,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x800 0 0 0 0>;
@@ -1215,9 +1215,9 @@
 			#interrupt-cells = <1>;
 			ranges = <0x02000000 0 0xee0c0000 0 0xee0c0000 0 0x00010000>;
 			interrupt-map-mask = <0xf800 0 0 0x7>;
-			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
-					 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
 			usb@1,0 {
 				reg = <0x10800 0 0 0 0>;
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 7c67581f57422a26..fa5108f142ca974b 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -122,14 +122,14 @@
 			<0xe6900020 1>,
 			<0xe6900040 1>,
 			<0xe6900060 1>;
-		interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp5_clks SH73A0_CLK_INTCA0>;
 		power-domains = <&pd_a4s>;
 		control-parent;
@@ -144,14 +144,14 @@
 			<0xe6900024 1>,
 			<0xe6900044 1>,
 			<0xe6900064 1>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp5_clks SH73A0_CLK_INTCA0>;
 		power-domains = <&pd_a4s>;
 		control-parent;
@@ -166,14 +166,14 @@
 			<0xe6900028 1>,
 			<0xe6900048 1>,
 			<0xe6900068 1>;
-		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp5_clks SH73A0_CLK_INTCA0>;
 		power-domains = <&pd_a4s>;
 		control-parent;
@@ -188,14 +188,14 @@
 			<0xe690002c 1>,
 			<0xe690004c 1>,
 			<0xe690006c 1>;
-		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp5_clks SH73A0_CLK_INTCA0>;
 		power-domains = <&pd_a4s>;
 		control-parent;
@@ -206,10 +206,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-sh73a0", "renesas,rmobile-iic";
 		reg = <0xe6820000 0x425>;
-		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks SH73A0_CLK_IIC0>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
@@ -220,10 +220,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-sh73a0", "renesas,rmobile-iic";
 		reg = <0xe6822000 0x425>;
-		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_IIC1>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
@@ -234,10 +234,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-sh73a0", "renesas,rmobile-iic";
 		reg = <0xe6824000 0x425>;
-		interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks SH73A0_CLK_IIC2>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
@@ -248,10 +248,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-sh73a0", "renesas,rmobile-iic";
 		reg = <0xe6826000 0x425>;
-		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp4_clks SH73A0_CLK_IIC3>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
@@ -262,10 +262,10 @@
 		#size-cells = <0>;
 		compatible = "renesas,iic-sh73a0", "renesas,rmobile-iic";
 		reg = <0xe6828000 0x425>;
-		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp4_clks SH73A0_CLK_IIC4>;
 		power-domains = <&pd_c5>;
 		status = "disabled";
@@ -274,8 +274,8 @@
 	mmcif: mmc@e6bd0000 {
 		compatible = "renesas,mmcif-sh73a0", "renesas,sh-mmcif";
 		reg = <0xe6bd0000 0x100>;
-		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_MMCIF0>;
 		power-domains = <&pd_a3sp>;
 		reg-io-width = <4>;
@@ -329,9 +329,9 @@
 	sdhi0: sd@ee100000 {
 		compatible = "renesas,sdhi-sh73a0";
 		reg = <0xee100000 0x100>;
-		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI0>;
 		power-domains = <&pd_a3sp>;
 		cap-sd-highspeed;
@@ -342,8 +342,8 @@
 	sdhi1: sd@ee120000 {
 		compatible = "renesas,sdhi-sh73a0";
 		reg = <0xee120000 0x100>;
-		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI1>;
 		power-domains = <&pd_a3sp>;
 		disable-wp;
@@ -354,8 +354,8 @@
 	sdhi2: sd@ee140000 {
 		compatible = "renesas,sdhi-sh73a0";
 		reg = <0xee140000 0x100>;
-		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI2>;
 		power-domains = <&pd_a3sp>;
 		disable-wp;
-- 
2.17.1

