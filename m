Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907C621B4A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2020 14:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgGJMEY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jul 2020 08:04:24 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62095 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726828AbgGJMEX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 08:04:23 -0400
X-IronPort-AV: E=Sophos;i="5.75,335,1589209200"; 
   d="scan'208";a="51600999"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jul 2020 21:04:22 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C40EE4257167;
        Fri, 10 Jul 2020 21:04:22 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [/home/shimoda/make_patches/renesas/2020-07-10-fix-arm-mmc-name/]  ARM: dts: shmobile: Fix SD Card/eMMC interface device node names
Date:   Fri, 10 Jul 2020 21:04:12 +0900
Message-Id: <1594382652-13759-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the device node names as "mmc@".

Fixes: 66474697923c ("ARM: dts: r7s72100: add sdhi to device tree")
Fixes: a49f76cddaee ("ARM: dts: r7s9210: Add SDHI support")
Fixes: 43304a5f5106 ("ARM: shmobile: r8a73a4: tidyup DT node naming")
Fixes: 7d907894bfe3 ("ARM: shmobile: r8a7740: tidyup DT node naming")
Fixes: 3ab2ea5fd1ce ("ARM: dts: r8a7742: Add SDHI nodes")
Fixes: 63ce8a617b51 ("ARM: dts: r8a7743: Add SDHI controllers")
Fixes: b591e323b271 ("ARM: dts: r8a7744: Add SDHI nodes")
Fixes: d83010f87ab3 ("ARM: dts: r8a7744: Initial SoC device tree")
Fixes: 7079131ef9b9 ("ARM: dts: r8a7745: Add SDHI controllers")
Fixes: 0485da788028 ("ARM: dts: r8a77470: Add SDHI1 support")
Fixes: 15aa5a95e820 ("ARM: dts: r8a77470: Add SDHI0 support")
Fixes: f068cc816015 ("ARM: dts: r8a77470: Add SDHI2 support")
Fixes: 14e1d9147d96 ("ARM: shmobile: r8a7778: tidyup DT node naming")
Fixes: 2624705ceb7b ("ARM: shmobile: r8a7779: tidyup DT node naming")
Fixes: b718aa448378 ("ARM: shmobile: r8a7790: tidyup DT node naming")
Fixes: b7ed8a0dd4f1 ("ARM: shmobile: Add SDHI devices to r8a7791 DTSI")
Fixes: ce01b14ecf19 ("ARM: dts: r8a7792: add SDHI support")
Fixes: fc9ee228f500 ("ARM: dts: r8a7793: Add SDHI controllers")
Fixes: b8e8ea127d00 ("ARM: shmobile: r8a7794: add SDHI DT support")
Fixes: 33f6be3bf6b7 ("ARM: shmobile: sh73a0: tidyup DT node naming")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 4 ++--
 arch/arm/boot/dts/r7s9210.dtsi  | 4 ++--
 arch/arm/boot/dts/r8a73a4.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7740.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7742.dtsi  | 8 ++++----
 arch/arm/boot/dts/r8a7743.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7744.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7745.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a77470.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7778.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7779.dtsi  | 8 ++++----
 arch/arm/boot/dts/r8a7790.dtsi  | 8 ++++----
 arch/arm/boot/dts/r8a7791.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7792.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7793.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi  | 6 +++---
 arch/arm/boot/dts/sh73a0.dtsi   | 6 +++---
 17 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 0a567d8..b9b1388 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -323,7 +323,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@e804e000 {
+		sdhi0: mmc@e804e000 {
 			compatible = "renesas,sdhi-r7s72100";
 			reg = <0xe804e000 0x100>;
 			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
@@ -339,7 +339,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@e804e800 {
+		sdhi1: mmc@e804e800 {
 			compatible = "renesas,sdhi-r7s72100";
 			reg = <0xe804e800 0x100>;
 			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index cace438..838920a 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -416,7 +416,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@e8228000 {
+		sdhi0: mmc@e8228000 {
 			compatible = "renesas,sdhi-r7s9210";
 			reg = <0xe8228000 0x8c0>;
 			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
@@ -428,7 +428,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@e822a000 {
+		sdhi1: mmc@e822a000 {
 			compatible = "renesas,sdhi-r7s9210";
 			reg = <0xe822a000 0x8c0>;
 			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index a3ba722..b92e725 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -409,7 +409,7 @@
 		status = "disabled";
 	};
 
-	sdhi0: sd@ee100000 {
+	sdhi0: mmc@ee100000 {
 		compatible = "renesas,sdhi-r8a73a4";
 		reg = <0 0xee100000 0 0x100>;
 		interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
@@ -419,7 +419,7 @@
 		status = "disabled";
 	};
 
-	sdhi1: sd@ee120000 {
+	sdhi1: mmc@ee120000 {
 		compatible = "renesas,sdhi-r8a73a4";
 		reg = <0 0xee120000 0 0x100>;
 		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
@@ -429,7 +429,7 @@
 		status = "disabled";
 	};
 
-	sdhi2: sd@ee140000 {
+	sdhi2: mmc@ee140000 {
 		compatible = "renesas,sdhi-r8a73a4";
 		reg = <0 0xee140000 0 0x100>;
 		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 0588d44..8048303 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -349,7 +349,7 @@
 		status = "disabled";
 	};
 
-	sdhi0: sd@e6850000 {
+	sdhi0: mmc@e6850000 {
 		compatible = "renesas,sdhi-r8a7740";
 		reg = <0xe6850000 0x100>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
@@ -362,7 +362,7 @@
 		status = "disabled";
 	};
 
-	sdhi1: sd@e6860000 {
+	sdhi1: mmc@e6860000 {
 		compatible = "renesas,sdhi-r8a7740";
 		reg = <0xe6860000 0x100>;
 		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
@@ -375,7 +375,7 @@
 		status = "disabled";
 	};
 
-	sdhi2: sd@e6870000 {
+	sdhi2: mmc@e6870000 {
 		compatible = "renesas,sdhi-r8a7740";
 		reg = <0xe6870000 0x100>;
 		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 08d89cf..9743b42 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -1286,7 +1286,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7742",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1301,7 +1301,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a7742",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee120000 0 0x328>;
@@ -1316,7 +1316,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7742",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1331,7 +1331,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7742",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index fff1237..896916a 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1520,7 +1520,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7743",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1535,7 +1535,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee140000 {
+		sdhi1: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7743",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1550,7 +1550,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7743",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 5050ac1..6b56aa2 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1520,7 +1520,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7744",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1535,7 +1535,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee140000 {
+		sdhi1: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7744",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1550,7 +1550,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7744",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index b0d1fc2..636248f 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -1396,7 +1396,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7745",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1411,7 +1411,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee140000 {
+		sdhi1: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7745",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1426,7 +1426,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7745",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index f551531..6baa126 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -882,7 +882,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -897,7 +897,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee300000 {
+		sdhi1: mmc@ee300000 {
 			compatible = "renesas,sdhi-mmc-r8a77470";
 			reg = <0 0xee300000 0 0x2000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
@@ -908,7 +908,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x328>;
diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 887ffa9..1612b00 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -401,7 +401,7 @@
 		status = "disabled";
 	};
 
-	sdhi0: sd@ffe4c000 {
+	sdhi0: mmc@ffe4c000 {
 		compatible = "renesas,sdhi-r8a7778",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4c000 0x100>;
@@ -411,7 +411,7 @@
 		status = "disabled";
 	};
 
-	sdhi1: sd@ffe4d000 {
+	sdhi1: mmc@ffe4d000 {
 		compatible = "renesas,sdhi-r8a7778",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4d000 0x100>;
@@ -421,7 +421,7 @@
 		status = "disabled";
 	};
 
-	sdhi2: sd@ffe4f000 {
+	sdhi2: mmc@ffe4f000 {
 		compatible = "renesas,sdhi-r8a7778",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4f000 0x100>;
diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index c0999e2..c5634da 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -385,7 +385,7 @@
 		status = "disabled";
 	};
 
-	sdhi0: sd@ffe4c000 {
+	sdhi0: mmc@ffe4c000 {
 		compatible = "renesas,sdhi-r8a7779",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4c000 0x100>;
@@ -395,7 +395,7 @@
 		status = "disabled";
 	};
 
-	sdhi1: sd@ffe4d000 {
+	sdhi1: mmc@ffe4d000 {
 		compatible = "renesas,sdhi-r8a7779",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4d000 0x100>;
@@ -405,7 +405,7 @@
 		status = "disabled";
 	};
 
-	sdhi2: sd@ffe4e000 {
+	sdhi2: mmc@ffe4e000 {
 		compatible = "renesas,sdhi-r8a7779",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4e000 0x100>;
@@ -415,7 +415,7 @@
 		status = "disabled";
 	};
 
-	sdhi3: sd@ffe4f000 {
+	sdhi3: mmc@ffe4f000 {
 		compatible = "renesas,sdhi-r8a7779",
 			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4f000 0x100>;
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 166d556..769ba2a 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1467,7 +1467,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7790",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1482,7 +1482,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a7790",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee120000 0 0x328>;
@@ -1497,7 +1497,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7790",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1512,7 +1512,7 @@
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7790",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 225676f..499cf38 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1563,7 +1563,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7791",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1578,7 +1578,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee140000 {
+		sdhi1: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7791",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1593,7 +1593,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7791",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 4627eef..597848a 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -780,7 +780,7 @@
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7792",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 1b62a7e..6d50709 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -1227,7 +1227,7 @@
 			dma-channels = <13>;
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7793",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1242,7 +1242,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee140000 {
+		sdhi1: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7793",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1257,7 +1257,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7793",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 8d7f879..5f34039 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1232,7 +1232,7 @@
 			};
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7794",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
@@ -1247,7 +1247,7 @@
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee140000 {
+		sdhi1: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7794",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
@@ -1262,7 +1262,7 @@
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee160000 {
+		sdhi2: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7794",
 				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 01fd063..46370d5 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -321,7 +321,7 @@
 		status = "disabled";
 	};
 
-	sdhi0: sd@ee100000 {
+	sdhi0: mmc@ee100000 {
 		compatible = "renesas,sdhi-sh73a0";
 		reg = <0xee100000 0x100>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
@@ -334,7 +334,7 @@
 	};
 
 	/* SDHI1 and SDHI2 have no CD pins, no need for CD IRQ */
-	sdhi1: sd@ee120000 {
+	sdhi1: mmc@ee120000 {
 		compatible = "renesas,sdhi-sh73a0";
 		reg = <0xee120000 0x100>;
 		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
@@ -346,7 +346,7 @@
 		status = "disabled";
 	};
 
-	sdhi2: sd@ee140000 {
+	sdhi2: mmc@ee140000 {
 		compatible = "renesas,sdhi-sh73a0";
 		reg = <0xee140000 0x100>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4

