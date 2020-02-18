Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB38162574
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 12:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgBRLYR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 06:24:17 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:33228 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgBRLYR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 06:24:17 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 4BQF2200G5USYZQ06BQFeN; Tue, 18 Feb 2020 12:24:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j40z9-00042x-Gk; Tue, 18 Feb 2020 12:24:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j40z9-0001Sw-EJ; Tue, 18 Feb 2020 12:24:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Remove use of ARCH_R8A7795
Date:   Tue, 18 Feb 2020 12:24:14 +0100
Message-Id: <20200218112414.5591-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.7.
---
 arch/arm64/boot/dts/renesas/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f63d8220a91594fb..0804af6547367dbd 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -5,10 +5,6 @@ dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
 			       r8a774c0-ek874-idk-2121wr.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
-- 
2.17.1

