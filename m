Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0254C1F0E10
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 20:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgFGSlf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 14:41:35 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:47302 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726611AbgFGSle (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 14:41:34 -0400
X-IronPort-AV: E=Sophos;i="5.73,485,1583161200"; 
   d="scan'208";a="48826654"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jun 2020 03:41:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C36F440CC796;
        Mon,  8 Jun 2020 03:41:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 01/11] arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]: Rename HiHope RZ/G2M boards
Date:   Sun,  7 Jun 2020 19:40:57 +0100
Message-Id: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The existing DTS files for HiHope RZ/G2M boards are for Rev.2.0 version
so reflect the same for the DTS file names so that the existing naming
convention can be used for Rev.3.0/4.0 boards.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile                        | 6 +++---
 ...0wr.dts => r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts} | 4 ++--
 ...ihope-rzg2m-ex.dts => r8a774a1-hihope-rzg2m-rev2-ex.dts} | 6 +++---
 ...74a1-hihope-rzg2m.dts => r8a774a1-hihope-rzg2m-rev2.dts} | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts => r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts} (86%)
 rename arch/arm64/boot/dts/renesas/{r8a774a1-hihope-rzg2m-ex.dts => r8a774a1-hihope-rzg2m-rev2-ex.dts} (59%)
 rename arch/arm64/boot/dts/renesas/{r8a774a1-hihope-rzg2m.dts => r8a774a1-hihope-rzg2m-rev2.dts} (83%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d17351cdbce0..e8461918f441 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
similarity index 86%
rename from arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
rename to arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
index 2ab5edd84e9b..3a1dcc914985 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2M sub board connected to an
+ * Device Tree Source for the HiHope RZ/G2M Rev.2.0 sub board connected to an
  * Advantech IDK-1110WR 10.1" LVDS panel
  *
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
-#include "r8a774a1-hihope-rzg2m-ex.dts"
+#include "r8a774a1-hihope-rzg2m-rev2-ex.dts"
 #include "rzg2-advantech-idk-1110wr-panel.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts
similarity index 59%
rename from arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
rename to arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts
index c754fca239d9..b94bcffabb5f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2M sub board
+ * Device Tree Source for the HiHope RZ/G2M Rev.2.0 connected to sub board
  *
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
-#include "r8a774a1-hihope-rzg2m.dts"
+#include "r8a774a1-hihope-rzg2m-rev2.dts"
 #include "hihope-rzg2-ex.dtsi"
 
 / {
-	model = "HopeRun HiHope RZ/G2M with sub board";
+	model = "HopeRun HiHope RZ/G2M (Rev.2.0) with sub board";
 	compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
 		     "renesas,r8a774a1";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
similarity index 83%
rename from arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
rename to arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
index 96f2fb080a1a..276f449ad14e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2M main board
+ * Device Tree Source for the HiHope RZ/G2M Rev.2.0 main board
  *
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
@@ -10,7 +10,7 @@
 #include "hihope-common.dtsi"
 
 / {
-	model = "HopeRun HiHope RZ/G2M main board based on r8a774a1";
+	model = "HopeRun HiHope RZ/G2M main board (Rev.2.0) based on r8a774a1";
 	compatible = "hoperun,hihope-rzg2m", "renesas,r8a774a1";
 
 	memory@48000000 {
-- 
2.17.1

