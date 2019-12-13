Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513F411E893
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbfLMQli (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:38 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:51328 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbfLMQli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:38 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id dUhG2100a5USYZQ01UhGnB; Fri, 13 Dec 2019 17:41:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006ug-KN; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000zI-Iq; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/7] arm64: dts: renesas: Group tuples in interrupt properties
Date:   Fri, 13 Dec 2019 17:41:13 +0100
Message-Id: <20191213164115.3697-7-geert+renesas@glider.be>
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
"interrupts" property, it does for the "interrupt-map" property.

Fix this by grouping the tuples of the "interrupts" and "interrupt-map"
properties using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 190 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 190 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 156 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 198 +++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 190 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 190 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |  48 +++---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  83 +++++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 156 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a77995.dtsi |  74 ++++----
 10 files changed, 737 insertions(+), 738 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 0a48b53c3f9dcd69..a733dc26e1f3196f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -521,12 +521,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -837,8 +837,8 @@
 			compatible = "renesas,r8a774a1-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -851,8 +851,8 @@
 			compatible = "renesas,r8a774a1-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -878,23 +878,23 @@
 			compatible = "renesas,dmac-r8a774a1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -920,23 +920,23 @@
 			compatible = "renesas,dmac-r8a774a1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -962,23 +962,23 @@
 			compatible = "renesas,dmac-r8a774a1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -2075,23 +2075,23 @@
 			compatible = "renesas,dmac-r8a774a1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -2117,23 +2117,23 @@
 			compatible = "renesas,dmac-r8a774a1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 2ef0e136c84dcd25..4ea64290da5b7f85 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -395,12 +395,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -711,8 +711,8 @@
 			compatible = "renesas,r8a774b1-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
@@ -725,8 +725,8 @@
 			compatible = "renesas,r8a774b1-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
@@ -752,23 +752,23 @@
 			compatible = "renesas,dmac-r8a774b1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -794,23 +794,23 @@
 			compatible = "renesas,dmac-r8a774b1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -836,23 +836,23 @@
 			compatible = "renesas,dmac-r8a774b1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1949,23 +1949,23 @@
 			compatible = "renesas,dmac-r8a774b1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1983,23 +1983,23 @@
 			compatible = "renesas,dmac-r8a774b1",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 40aceb6681474f0d..e2fc1b9385d3f65f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -369,12 +369,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -697,8 +697,8 @@
 			compatible = "renesas,r8a774c0-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -711,8 +711,8 @@
 			compatible = "renesas,r8a774c0-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -725,23 +725,23 @@
 			compatible = "renesas,dmac-r8a774c0",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -767,23 +767,23 @@
 			compatible = "renesas,dmac-r8a774c0",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -809,23 +809,23 @@
 			compatible = "renesas,dmac-r8a774c0",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1521,23 +1521,23 @@
 			compatible = "renesas,dmac-r8a774c0",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c7b4ece0ab3ee03f..c49b539e895f7868 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -605,12 +605,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -873,8 +873,8 @@
 			compatible = "renesas,r8a7795-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -887,8 +887,8 @@
 			compatible = "renesas,r8a7795-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -901,8 +901,8 @@
 			compatible = "renesas,r8a7795-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe6460000 0 0x100>;
-			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 326>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -915,8 +915,8 @@
 			compatible = "renesas,r8a7795-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe6470000 0 0x100>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 329>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -951,23 +951,23 @@
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -993,23 +993,23 @@
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1035,23 +1035,23 @@
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -2343,23 +2343,23 @@
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -2385,23 +2385,23 @@
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 95fa1608add896bf..f4804153f41ce285 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -574,12 +574,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -825,8 +825,8 @@
 			compatible = "renesas,r8a7796-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -839,8 +839,8 @@
 			compatible = "renesas,r8a7796-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -866,23 +866,23 @@
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -908,23 +908,23 @@
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -950,23 +950,23 @@
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -2210,23 +2210,23 @@
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -2252,23 +2252,23 @@
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index fb48dabb25adaf77..143b4fae7ea0042a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -429,12 +429,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -680,8 +680,8 @@
 			compatible = "renesas,r8a77965-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -694,8 +694,8 @@
 			compatible = "renesas,r8a77965-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -721,23 +721,23 @@
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -763,23 +763,23 @@
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -805,23 +805,23 @@
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1937,23 +1937,23 @@
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1971,23 +1971,23 @@
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index c47608c3e0fa066f..6e1456032851c88f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -318,12 +318,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -933,15 +933,15 @@
 			compatible = "renesas,dmac-r8a77970",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7";
@@ -961,15 +961,15 @@
 			compatible = "renesas,dmac-r8a77970",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7";
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 53a01265233901fe..f5afb28043eb62ce 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -348,12 +348,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -1174,23 +1174,23 @@
 			compatible = "renesas,dmac-r8a77980",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1216,23 +1216,23 @@
 			compatible = "renesas,dmac-r8a77980",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					  "ch0", "ch1", "ch2", "ch3",
 					  "ch4", "ch5", "ch6", "ch7",
@@ -1380,8 +1380,7 @@
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &gic GIC_SPI 148
-					 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 8283eb311eac6334..8318466df00cca71 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -394,12 +394,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -643,8 +643,8 @@
 			compatible = "renesas,r8a77990-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -657,8 +657,8 @@
 			compatible = "renesas,r8a77990-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -671,23 +671,23 @@
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -713,23 +713,23 @@
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
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
-				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
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
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -755,23 +755,23 @@
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
@@ -1474,23 +1474,23 @@
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
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
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7",
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index d969d7347cf872a4..2b5c39bd86856579 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -231,12 +231,12 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
@@ -365,8 +365,8 @@
 			compatible = "renesas,r8a77995-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65a0000 0 0x100>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -379,8 +379,8 @@
 			compatible = "renesas,r8a77995-usb-dmac",
 				     "renesas,usb-dmac";
 			reg = <0 0xe65b0000 0 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -418,15 +418,15 @@
 			compatible = "renesas,dmac-r8a77995",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe6700000 0 0x10000>;
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7";
@@ -446,15 +446,15 @@
 			compatible = "renesas,dmac-r8a77995",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7300000 0 0x10000>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7";
@@ -474,15 +474,15 @@
 			compatible = "renesas,dmac-r8a77995",
 				     "renesas,rcar-dmac";
 			reg = <0 0xe7310000 0 0x10000>;
-			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error",
 					"ch0", "ch1", "ch2", "ch3",
 					"ch4", "ch5", "ch6", "ch7";
-- 
2.17.1

