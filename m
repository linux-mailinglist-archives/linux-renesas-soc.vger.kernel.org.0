Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C7C123512
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 19:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfLQSir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 13:38:47 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:49174 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfLQSir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 13:38:47 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id f6ei2100P5USYZQ016eiWp; Tue, 17 Dec 2019 19:38:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-0003aG-JH; Tue, 17 Dec 2019 19:38:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-00007x-HX; Tue, 17 Dec 2019 19:38:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] arm64: dts: renesas: Rename r8a7795{-es1,}* to r8a7795[01]*
Date:   Tue, 17 Dec 2019 19:38:37 +0100
Message-Id: <20191217183841.432-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
References: <20191217183841.432-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Despite using the same compatible values ("r8a7795"-based) because of
historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
(R8A77951) are really different SoCs, with different part numbers.

Reflect this in the DTS files by changing their base names from
"r8a7795-es1" and "r8a7795" to "r8a77950" resp. "r8a77951".
Drop all "ES" references next to part numbers, as they are implied by
the part numbers, and thus redundant.

Note that DT binding headers, definitions, and compatible values are
not renamed, to preserve backward compatibility.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                   | 10 +++++-----
 .../{r8a7795-h3ulcb-kf.dts => r8a77950-h3ulcb-kf.dts}  |  4 ++--
 .../{r8a7795-es1-h3ulcb.dts => r8a77950-h3ulcb.dts}    |  4 ++--
 ...7795-es1-salvator-x.dts => r8a77950-salvator-x.dts} |  4 ++--
 .../dts/renesas/{r8a7795-es1.dtsi => r8a77950.dtsi}    |  4 ++--
 ...8a7795-es1-h3ulcb-kf.dts => r8a77951-h3ulcb-kf.dts} |  4 ++--
 .../{r8a7795-h3ulcb.dts => r8a77951-h3ulcb.dts}        |  4 ++--
 ...{r8a7795-salvator-x.dts => r8a77951-salvator-x.dts} |  4 ++--
 ...8a7795-salvator-xs.dts => r8a77951-salvator-xs.dts} |  8 ++++----
 .../boot/dts/renesas/{r8a7795.dtsi => r8a77951.dtsi}   |  2 +-
 10 files changed, 24 insertions(+), 24 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb-kf.dts => r8a77950-h3ulcb-kf.dts} (75%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb.dts => r8a77950-h3ulcb.dts} (89%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-salvator-x.dts => r8a77950-salvator-x.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1.dtsi => r8a77950.dtsi} (98%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb-kf.dts => r8a77951-h3ulcb-kf.dts} (75%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb.dts => r8a77951-h3ulcb.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-x.dts => r8a77951-salvator-x.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-xs.dts => r8a77951-salvator-xs.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795.dtsi => r8a77951.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d4cc3323d0668dba..12c2382c0a5427e2 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -4,11 +4,11 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-h3ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-h3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-h3ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb r8a77950-h3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-h3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-m3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb-kf.dts
similarity index 75%
rename from arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
rename to arch/arm64/boot/dts/renesas/r8a77950-h3ulcb-kf.dts
index 80791ed27539bf8f..1e84a40f1dcab353 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb-kf.dts
@@ -6,11 +6,11 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
-#include "r8a7795-h3ulcb.dts"
+#include "r8a77950-h3ulcb.dts"
 #include "ulcb-kf.dtsi"
 
 / {
-	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES2.0+";
+	model = "Renesas H3ULCB Kingfisher board based on r8a77950";
 	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
 		     "renesas,r8a7795";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb.dts
similarity index 89%
rename from arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
rename to arch/arm64/boot/dts/renesas/r8a77950-h3ulcb.dts
index 598b98168559e0e4..38a6d6a108d488ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb.dts
@@ -7,11 +7,11 @@
  */
 
 /dts-v1/;
-#include "r8a7795-es1.dtsi"
+#include "r8a77950.dtsi"
 #include "ulcb.dtsi"
 
 / {
-	model = "Renesas H3ULCB board based on r8a7795 ES1.x";
+	model = "Renesas H3ULCB board based on r8a77950";
 	compatible = "renesas,h3ulcb", "renesas,r8a7795";
 
 	memory@48000000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
similarity index 96%
rename from arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
rename to arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
index c72968623e94b790..2438825c9b22e26d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
@@ -6,11 +6,11 @@
  */
 
 /dts-v1/;
-#include "r8a7795-es1.dtsi"
+#include "r8a77950.dtsi"
 #include "salvator-x.dtsi"
 
 / {
-	model = "Renesas Salvator-X board based on r8a7795 ES1.x";
+	model = "Renesas Salvator-X board based on r8a77950";
 	compatible = "renesas,salvator-x", "renesas,r8a7795";
 
 	memory@48000000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
rename to arch/arm64/boot/dts/renesas/r8a77950.dtsi
index 14d8513d2a47336f..15216495e1c8b31c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
+ * Device Tree Source for the R-Car H3 (R8A77950) SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
 
-#include "r8a7795.dtsi"
+#include "r8a77951.dtsi"
 
 &audma0 {
 	iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb-kf.dts
similarity index 75%
rename from arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
rename to arch/arm64/boot/dts/renesas/r8a77951-h3ulcb-kf.dts
index 2f24dfc45617baf6..647198bb3bf7746a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb-kf.dts
@@ -6,11 +6,11 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
-#include "r8a7795-es1-h3ulcb.dts"
+#include "r8a77951-h3ulcb.dts"
 #include "ulcb-kf.dtsi"
 
 / {
-	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES1.x";
+	model = "Renesas H3ULCB Kingfisher board based on r8a77951";
 	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
 		     "renesas,r8a7795";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb.dts
similarity index 92%
rename from arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
rename to arch/arm64/boot/dts/renesas/r8a77951-h3ulcb.dts
index 54515eaf0310f172..8ad8f2a539771de8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb.dts
@@ -7,11 +7,11 @@
  */
 
 /dts-v1/;
-#include "r8a7795.dtsi"
+#include "r8a77951.dtsi"
 #include "ulcb.dtsi"
 
 / {
-	model = "Renesas H3ULCB board based on r8a7795 ES2.0+";
+	model = "Renesas H3ULCB board based on r8a77951";
 	compatible = "renesas,h3ulcb", "renesas,r8a7795";
 
 	memory@48000000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
similarity index 96%
rename from arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
rename to arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
index 72874f675359e7a4..a402a2fb6e3c313b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
@@ -6,11 +6,11 @@
  */
 
 /dts-v1/;
-#include "r8a7795.dtsi"
+#include "r8a77951.dtsi"
 #include "salvator-x.dtsi"
 
 / {
-	model = "Renesas Salvator-X board based on r8a7795 ES2.0+";
+	model = "Renesas Salvator-X board based on r8a77951";
 	compatible = "renesas,salvator-x", "renesas,r8a7795";
 
 	memory@48000000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
similarity index 96%
rename from arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
rename to arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index 36667c81d43d517b..cef9da4376a3f673 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -1,16 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Salvator-X 2nd version board with R-Car H3 ES2.0
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car H3 ES2.0+
  *
  * Copyright (C) 2015-2017 Renesas Electronics Corp.
  */
 
 /dts-v1/;
-#include "r8a7795.dtsi"
+#include "r8a77951.dtsi"
 #include "salvator-xs.dtsi"
 
 / {
-	model = "Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+";
+	model = "Renesas Salvator-X 2nd version board based on r8a77951";
 	compatible = "renesas,salvator-xs", "renesas,r8a7795";
 
 	memory@48000000 {
@@ -136,7 +136,7 @@
 	 * - On Salvator-X[S], GP6_3[01] are connected to ADV7482 as irq pins
 	 *   (when SW31 is the default setting on Salvator-XS).
 	 * - If SW31 is the default setting, you cannot use USB2.0 ch3 on
-	 *   r8a7795 with Salvator-XS.
+	 *   r8a77951 with Salvator-XS.
 	 *   Hence the SW31 setting must be changed like 2) below.
 	 *   1) Default setting of SW31: ON-ON-OFF-OFF-OFF-OFF:
 	 *	- Connect GP6_3[01] to ADV7842.
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
similarity index 99%
rename from arch/arm64/boot/dts/renesas/r8a7795.dtsi
rename to arch/arm64/boot/dts/renesas/r8a77951.dtsi
index fde6ec122d3b4006..821891548d5fde0f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the R-Car H3 (R8A77950) SoC
+ * Device Tree Source for the R-Car H3 (R8A77951) SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
-- 
2.17.1

