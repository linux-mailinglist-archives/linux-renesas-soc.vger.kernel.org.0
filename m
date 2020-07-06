Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5A2215AF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 17:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729607AbgGFPkW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 11:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729286AbgGFPkV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:40:21 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C87C061755
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2020 08:40:21 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e012:1552:6e81:c371])
        by xavier.telenet-ops.be with bizsmtp
        id zrgJ2200E0tDR5Q01rgJCw; Mon, 06 Jul 2020 17:40:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jsTEA-0006Hy-3t; Mon, 06 Jul 2020 17:40:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jsTEA-0007ct-1A; Mon, 06 Jul 2020 17:40:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Restructure Makefile
Date:   Mon,  6 Jul 2020 17:40:15 +0200
Message-Id: <20200706154015.29257-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make the Makefile for building Renesas DTB files easier to read and
maintain:
  - Get rid of line continuations,
  - Use a single entry per line,
  - Sort SoCs and boards alphabetically,
  - Separate SoCs by blank lines.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.9.

 arch/arm64/boot/dts/renesas/Makefile | 69 ++++++++++++++++++----------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 21cc6346908226ad..5f00f90a89bd6a6a 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,30 +1,51 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb \
-			       r8a774a1-hihope-rzg2m-rev2.dtb
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb \
-			       r8a774a1-hihope-rzg2m-rev2-ex.dtb
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb \
-			       r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
-dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb \
-			       r8a774b1-hihope-rzg2n-rev2.dtb
-dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb \
-			       r8a774b1-hihope-rzg2n-rev2-ex.dtb
-dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb \
-			       r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb
-dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
-			       r8a774c0-ek874-idk-2121wr.dtb \
-			       r8a774c0-ek874-mipi-2.1.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
+
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb
+
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874.dtb
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-idk-2121wr.dtb
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-mipi-2.1.dtb
+
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
-dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb r8a77960-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb-kf.dtb
+
+dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb-kf.dtb
+
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb-kf.dtb
+
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb r8a77965-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
-dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
+
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
+
+dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
+dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
+
+dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
+dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-v3hsk.dtb
+
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
+
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
-- 
2.17.1

