Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C99524D3FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 13:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHULbR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 07:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgHULbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 07:31:08 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D91C06138B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 04:23:56 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id JBPs2300F4C55Sk06BPsGH; Fri, 21 Aug 2020 13:23:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k959E-0002vs-7s; Fri, 21 Aug 2020 13:23:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k959E-0001Rj-61; Fri, 21 Aug 2020 13:23:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Fix pin controller node names
Date:   Fri, 21 Aug 2020 13:23:51 +0200
Message-Id: <20200821112351.5518-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Devicetree Specification v0.2 and later, Section "Generic
Names Recommendation", the node name for a pin controller device node
should be "pinctrl".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.10.

 arch/arm/boot/dts/emev2.dtsi     | 2 +-
 arch/arm/boot/dts/r7s72100.dtsi  | 2 +-
 arch/arm/boot/dts/r7s9210.dtsi   | 2 +-
 arch/arm/boot/dts/r8a73a4.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7740.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7742.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7743.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7744.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7745.dtsi   | 2 +-
 arch/arm/boot/dts/r8a77470.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7778.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7779.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7790.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7791.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7792.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7793.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7794.dtsi   | 2 +-
 arch/arm/boot/dts/r9a06g032.dtsi | 2 +-
 arch/arm/boot/dts/sh73a0.dtsi    | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
index 96678ddbb4e6a2a9..ecfaa0b7523e83b2 100644
--- a/arch/arm/boot/dts/emev2.dtsi
+++ b/arch/arm/boot/dts/emev2.dtsi
@@ -195,7 +195,7 @@
 		clock-names = "sclk";
 	};
 
-	pfc: pin-controller@e0140200 {
+	pfc: pinctrl@e0140200 {
 		compatible = "renesas,pfc-emev2";
 		reg = <0xe0140200 0x100>;
 	};
diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index b9b1388880488059..45cf75b5824cbe7f 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -499,7 +499,7 @@
 			clock-output-names = "sdhi00", "sdhi01", "sdhi10", "sdhi11";
 		};
 
-		pinctrl: pin-controller@fcfe3000 {
+		pinctrl: pinctrl@fcfe3000 {
 			compatible = "renesas,r7s72100-ports";
 
 			reg = <0xfcfe3000 0x4230>;
diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 838920aef9925c2f..85c0399b1339585b 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -489,7 +489,7 @@
 			interrupt-map-mask = <7 0>;
 		};
 
-		pinctrl: pin-controller@fcffe000 {
+		pinctrl: pinctrl@fcffe000 {
 			compatible = "renesas,r7s9210-pinctrl";
 			reg = <0xfcffe000 0x1000>;
 
diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index b92e7257983611b1..e5fb1ce261f72f2d 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -221,7 +221,7 @@
 		power-domains = <&pd_c4>;
 	};
 
-	pfc: pin-controller@e6050000 {
+	pfc: pinctrl@e6050000 {
 		compatible = "renesas,pfc-r8a73a4";
 		reg = <0 0xe6050000 0 0x9000>;
 		gpio-controller;
diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 8048303037ee970f..1b2cf5fa322b2985 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -311,7 +311,7 @@
 		status = "disabled";
 	};
 
-	pfc: pin-controller@e6050000 {
+	pfc: pinctrl@e6050000 {
 		compatible = "renesas,pfc-r8a7740";
 		reg = <0xe6050000 0x8000>,
 		      <0xe605800c 0x20>;
diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 009827708bf44ba0..aab640da17ea942a 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -330,7 +330,7 @@
 			resets = <&cpg 907>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7742";
 			reg = <0 0xe6060000 0 0x250>;
 		};
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 896916a00b8429a6..f444e418f4085a26 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -265,7 +265,7 @@
 			resets = <&cpg 904>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7743";
 			reg = <0 0xe6060000 0 0x250>;
 		};
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 6b56aa2863377e00..0442aad4f9dba024 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -265,7 +265,7 @@
 			resets = <&cpg 904>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7744";
 			reg = <0 0xe6060000 0 0x250>;
 		};
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 636248f370e02be4..0f14ac22921de7d4 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -230,7 +230,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7745";
 			reg = <0 0xe6060000 0 0x11c>;
 		};
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 6baa126b6590f51a..691b1a131c870df3 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -187,7 +187,7 @@
 			resets = <&cpg 907>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77470";
 			reg = <0 0xe6060000 0 0x118>;
 		};
diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 1612b003fb55ed5b..c9f8735860bf824c 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -142,7 +142,7 @@
 		interrupt-controller;
 	};
 
-	pfc: pin-controller@fffc0000 {
+	pfc: pinctrl@fffc0000 {
 		compatible = "renesas,pfc-r8a7778";
 		reg = <0xfffc0000 0x118>;
 	};
diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index c5634daef96f49f5..74d7e9084eabe173 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -321,7 +321,7 @@
 		status = "disabled";
 	};
 
-	pfc: pin-controller@fffc0000 {
+	pfc: pinctrl@fffc0000 {
 		compatible = "renesas,pfc-r8a7779";
 		reg = <0xfffc0000 0x23c>;
 	};
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 769ba2a33d39e885..b0569b4ea5c8ae96 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -363,7 +363,7 @@
 			resets = <&cpg 907>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7790";
 			reg = <0 0xe6060000 0 0x250>;
 		};
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index cdc67a476d02f795..6590b91cbcc70dc3 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -287,7 +287,7 @@
 			resets = <&cpg 904>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7791";
 			reg = <0 0xe6060000 0 0x250>;
 		};
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 597848ad4dfa109d..f5b299bfcb23796c 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -296,7 +296,7 @@
 			resets = <&cpg 913>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7792";
 			reg = <0 0xe6060000 0 0x144>;
 		};
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 6d507091b163bd86..f930f69f7bcce43a 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -271,7 +271,7 @@
 			resets = <&cpg 904>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7793";
 			reg = <0 0xe6060000 0 0x250>;
 		};
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 5f340397ab64ca47..cd5e2904068abd69 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -238,7 +238,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7794";
 			reg = <0 0xe6060000 0 0x11c>;
 		};
diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index ee59cc84f2121488..c47896e4ab5877dd 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -165,7 +165,7 @@
 			status = "disabled";
 		};
 
-		pinctrl: pin-controller@40067000 {
+		pinctrl: pinctrl@40067000 {
 			compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
 			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
 			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index a9bb46e007f366f4..a20134f9dc25209a 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -453,7 +453,7 @@
 		status = "disabled";
 	};
 
-	pfc: pin-controller@e6050000 {
+	pfc: pinctrl@e6050000 {
 		compatible = "renesas,pfc-sh73a0";
 		reg = <0xe6050000 0x8000>,
 		      <0xe605801c 0x1c>;
-- 
2.17.1

