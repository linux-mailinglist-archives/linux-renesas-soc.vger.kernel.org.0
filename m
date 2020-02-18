Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10EA162576
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 12:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgBRLYx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 06:24:53 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:41194 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgBRLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 06:24:53 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 4BQq2200W5USYZQ06BQqvp; Tue, 18 Feb 2020 12:24:50 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j40zi-00043M-IS; Tue, 18 Feb 2020 12:24:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j40zi-0001V3-GB; Tue, 18 Feb 2020 12:24:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Remove ARCH_R8A7795
Date:   Tue, 18 Feb 2020 12:24:49 +0100
Message-Id: <20200218112449.5723-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the final user of CONFIG_ARCH_R8A7795 by CONFIG_ARCH_R8A77950 ||
CONFIG_ARCH_R8A77951, and remove the now unused CONFIG_ARCH_R8A7795
symbol definition.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.7.
---
 drivers/soc/renesas/Kconfig       | 16 ++++++++--------
 drivers/soc/renesas/renesas-soc.c |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index de5cfe3fddd335d5..1982c7fb45fa2556 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -195,19 +195,19 @@ config ARCH_R8A774C0
 	  This enables support for the Renesas RZ/G2E SoC.
 
 config ARCH_R8A77950
-	bool
+	bool "Renesas R-Car H3 ES1.x SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A7795
+	help
+	  This enables support for the Renesas R-Car H3 SoC (revision 1.x).
 
 config ARCH_R8A77951
-	bool
-
-config ARCH_R8A7795
-	bool "Renesas R-Car H3 SoC Platform"
-	select ARCH_R8A77950
-	select ARCH_R8A77951
+	bool "Renesas R-Car H3 ES2.0+ SoC Platform"
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A7795
 	help
-	  This enables support for the Renesas R-Car H3 SoC.
+	  This enables support for the Renesas R-Car H3 SoC (revisions 2.0 and
+	  later).
 
 config ARCH_R8A77960
 	bool "Renesas R-Car M3-W SoC Platform"
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 850f5733dc880a2d..c43e910b869d1ccf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -259,7 +259,7 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A7794
 	{ .compatible = "renesas,r8a7794",	.data = &soc_rcar_e2 },
 #endif
-#ifdef CONFIG_ARCH_R8A7795
+#if defined(CONFIG_ARCH_R8A77950) || defined(CONFIG_ARCH_R8A77951)
 	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
 #endif
 #ifdef CONFIG_ARCH_R8A77960
-- 
2.17.1

