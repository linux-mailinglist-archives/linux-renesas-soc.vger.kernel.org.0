Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51990123514
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 19:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfLQSis (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 13:38:48 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34172 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfLQSis (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 13:38:48 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id f6ei2100F5USYZQ016eiFY; Tue, 17 Dec 2019 19:38:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-0003aJ-KK; Tue, 17 Dec 2019 19:38:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-00007z-Ix; Tue, 17 Dec 2019 19:38:42 +0100
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
Subject: [PATCH 2/5] arm64: dts: renesas: Drop redudant SoC prefixes from ULCB DTS file names
Date:   Tue, 17 Dec 2019 19:38:38 +0100
Message-Id: <20191217183841.432-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
References: <20191217183841.432-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Unlike the V3MSK and V3HSK boards, the various "ULCB" boards are really
the same boards, with different SiPs fitted, just like the Salvator-X(S)
boards.  Furthermore, the "H3", "M3", and "M3N" prefixes of the "ULCB"
parts in the DTS file names are redundant, as they are implied by the
SoC part numbers, which are also part of the file names.

Hence drop the redundant prefixes, to make the DTS file names consistent
with the file names for the various "Salvator-X(S)" boards.

Suggested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile             | 16 ++++++++--------
 ...a77950-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} |  2 +-
 .../{r8a77950-h3ulcb.dts => r8a77950-ulcb.dts}   |  0
 ...a77951-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} |  2 +-
 .../{r8a77951-h3ulcb.dts => r8a77951-ulcb.dts}   |  0
 ...a77960-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} |  2 +-
 .../{r8a77960-m3ulcb.dts => r8a77960-ulcb.dts}   |  0
 ...77965-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} |  2 +-
 .../{r8a77965-m3nulcb.dts => r8a77965-ulcb.dts}  |  0
 9 files changed, 12 insertions(+), 12 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a77950-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77950-h3ulcb.dts => r8a77950-ulcb.dts} (100%)
 rename arch/arm64/boot/dts/renesas/{r8a77951-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77951-h3ulcb.dts => r8a77951-ulcb.dts} (100%)
 rename arch/arm64/boot/dts/renesas/{r8a77960-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77960-m3ulcb.dts => r8a77960-ulcb.dts} (100%)
 rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb.dts => r8a77965-ulcb.dts} (100%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 12c2382c0a5427e2..f7ed7b5a41ea3c77 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -4,18 +4,18 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-h3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-h3ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb r8a77950-h3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-h3ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-m3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-m3ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb r8a77950-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb.dtb
-dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
similarity index 92%
rename from arch/arm64/boot/dts/renesas/r8a77950-h3ulcb-kf.dts
rename to arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
index 1e84a40f1dcab353..dcaaf12cec40dab4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
@@ -6,7 +6,7 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
-#include "r8a77950-h3ulcb.dts"
+#include "r8a77950-ulcb.dts"
 #include "ulcb-kf.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r8a77950-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
similarity index 100%
rename from arch/arm64/boot/dts/renesas/r8a77950-h3ulcb.dts
rename to arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
similarity index 92%
rename from arch/arm64/boot/dts/renesas/r8a77951-h3ulcb-kf.dts
rename to arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
index 647198bb3bf7746a..11f943a67703f0a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
@@ -6,7 +6,7 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
-#include "r8a77951-h3ulcb.dts"
+#include "r8a77951-ulcb.dts"
 #include "ulcb-kf.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
similarity index 100%
rename from arch/arm64/boot/dts/renesas/r8a77951-h3ulcb.dts
rename to arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
diff --git a/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
similarity index 92%
rename from arch/arm64/boot/dts/renesas/r8a77960-m3ulcb-kf.dts
rename to arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
index 611dd2d4fae98d29..2151c37d77a6c942 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
@@ -6,7 +6,7 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
-#include "r8a77960-m3ulcb.dts"
+#include "r8a77960-ulcb.dts"
 #include "ulcb-kf.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
similarity index 100%
rename from arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts
rename to arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
similarity index 92%
rename from arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts
rename to arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
index dadad97051b99f8c..12aa08fd6fd87f7e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
@@ -6,7 +6,7 @@
  * Copyright (C) 2018 Cogent Embedded, Inc.
  */
 
-#include "r8a77965-m3nulcb.dts"
+#include "r8a77965-ulcb.dts"
 #include "ulcb-kf.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
similarity index 100%
rename from arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dts
rename to arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
-- 
2.17.1

