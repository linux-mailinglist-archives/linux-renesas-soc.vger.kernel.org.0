Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9564207417
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390949AbgFXNNx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:13:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38054 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387923AbgFXNNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:13:53 -0400
X-IronPort-AV: E=Sophos;i="5.75,275,1589209200"; 
   d="scan'208";a="50489661"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jun 2020 22:13:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5CB5240062A1;
        Wed, 24 Jun 2020 22:13:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 02/11] arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]: Rename HiHope RZ/G2N boards
Date:   Wed, 24 Jun 2020 14:12:01 +0100
Message-Id: <1593004330-5039-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The existing DTS files for HiHope RZ/G2N boards are for Rev.2.0 version
so reflect the same for the DTS file names so that the existing naming
convention can be used for Rev.3.0/4.0 boards.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                        | 4 ++--
 ...ihope-rzg2n-ex.dts => r8a774b1-hihope-rzg2n-rev2-ex.dts} | 6 +++---
 ...74b1-hihope-rzg2n.dts => r8a774b1-hihope-rzg2n-rev2.dts} | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a774b1-hihope-rzg2n-ex.dts => r8a774b1-hihope-rzg2n-rev2-ex.dts} (56%)
 rename arch/arm64/boot/dts/renesas/{r8a774b1-hihope-rzg2n.dts => r8a774b1-hihope-rzg2n-rev2.dts} (84%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e8461918f441..fc171c3d6986 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -2,8 +2,8 @@
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
-dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
-dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
 			       r8a774c0-ek874-idk-2121wr.dtb \
 			       r8a774c0-ek874-mipi-2.1.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts
similarity index 56%
rename from arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts
rename to arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts
index ab47c0bd9c19..2e5e1de04049 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2N sub board
+ * Device Tree Source for the HiHope RZ/G2N Rev.2.0 connected to sub board
  *
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
-#include "r8a774b1-hihope-rzg2n.dts"
+#include "r8a774b1-hihope-rzg2n-rev2.dts"
 #include "hihope-rzg2-ex.dtsi"
 
 / {
-	model = "HopeRun HiHope RZ/G2N with sub board";
+	model = "HopeRun HiHope RZ/G2N (Rev.2.0) with sub board";
 	compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2n",
 		     "renesas,r8a774b1";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
similarity index 84%
rename from arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
rename to arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
index 9910c1aa0a61..eb1206b2d97a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2N main board
+ * Device Tree Source for the HiHope RZ/G2N Rev.2.0 main board
  *
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
@@ -10,7 +10,7 @@
 #include "hihope-common.dtsi"
 
 / {
-	model = "HopeRun HiHope RZ/G2N main board based on r8a774b1";
+	model = "HopeRun HiHope RZ/G2N main board (Rev.2.0) based on r8a774b1";
 	compatible = "hoperun,hihope-rzg2n", "renesas,r8a774b1";
 
 	memory@48000000 {
-- 
2.17.1

