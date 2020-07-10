Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BEF21B4A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2020 14:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgGJMEJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jul 2020 08:04:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:9438 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726757AbgGJMEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 08:04:09 -0400
X-IronPort-AV: E=Sophos;i="5.75,335,1589209200"; 
   d="scan'208";a="51600991"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jul 2020 21:04:07 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 79CC5425636C;
        Fri, 10 Jul 2020 21:04:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: Fix SD Card/eMMC interface device node names
Date:   Fri, 10 Jul 2020 21:03:54 +0900
Message-Id: <1594382634-13714-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the device node names as "mmc@".

Fixes: 663386c3e1aa ("arm64: dts: renesas: r8a774a1: Add SDHI nodes")
Fixes: 9b33e3001b67 ("arm64: dts: renesas: Initial r8a774b1 SoC device tree")
Fixes: 77223211f44d ("arm64: dts: renesas: r8a774c0: Add SDHI nodes")
Fixes: d9d67010e0c6 ("arm64: dts: r8a7795: Add SDHI support to dtsi")
Fixes: a513cf1e6457 ("arm64: dts: r8a7796: add SDHI nodes")
Fixes: 111cc9ace2b5 ("arm64: dts: renesas: r8a77961: Add SDHI nodes")
Fixes: f51746ad7d1f ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")
Fixes: df863d6f95f5 ("arm64: dts: renesas: initial R8A77965 SoC device tree")
Fixes: 9aa3558a02f0 ("arm64: dts: renesas: ebisu: Add and enable SDHI device nodes")
Fixes: 83f18749c2f6 ("arm64: dts: renesas: r8a77995: Add SDHI (MMC) support")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 6 +++---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 6 +++---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 9 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 51a5728..8e80f50 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2252,7 +2252,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2264,7 +2264,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2276,7 +2276,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2288,7 +2288,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index b221f25..49e5add 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2110,7 +2110,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2122,7 +2122,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2134,7 +2134,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2146,7 +2146,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 5c72a7e..4217119 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1618,7 +1618,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a774c0",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -1630,7 +1630,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a774c0",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -1642,7 +1642,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a774c0",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 61d67d9..9beb8e7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2590,7 +2590,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2603,7 +2603,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2616,7 +2616,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2629,7 +2629,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 33bf62a..4dfb7f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2394,7 +2394,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2407,7 +2407,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2420,7 +2420,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2433,7 +2433,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index de5770c..542c44c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1346,7 +1346,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -1358,7 +1358,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -1370,7 +1370,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -1382,7 +1382,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6f7ab39..fe4dc12 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2120,7 +2120,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2133,7 +2133,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2146,7 +2146,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2159,7 +2159,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index cd11f24..1991bdc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1595,7 +1595,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77990",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -1608,7 +1608,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a77990",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -1621,7 +1621,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77990",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index e5617ec..2c2272f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -916,7 +916,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77995",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
-- 
2.7.4

