Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1082B5CE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgKQKac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbgKQKac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC4CC061A04
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id tNWU2300q4C55Sk01NWUry; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bbw-Kt; Tue, 17 Nov 2020 11:30:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xpC-7s; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
Date:   Tue, 17 Nov 2020 11:30:18 +0100
Message-Id: <20201117103022.2136527-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace using the legacy IOMEM() macro to map the ARM Reset Vector
Address Register (AVECR) by ioremap().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-r8a7779.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7779.c b/arch/arm/mach-shmobile/smp-r8a7779.c
index 0ed73b650c141e58..f6713886ee16b279 100644
--- a/arch/arm/mach-shmobile/smp-r8a7779.c
+++ b/arch/arm/mach-shmobile/smp-r8a7779.c
@@ -20,8 +20,10 @@
 #include "common.h"
 #include "r8a7779.h"
 
-#define AVECR IOMEM(0xfe700040)
-#define R8A7779_SCU_BASE 0xf0000000
+#define HPBREG_BASE		0xfe700000
+#define AVECR			0x0040	/* ARM Reset Vector Address Register */
+
+#define R8A7779_SCU_BASE	0xf0000000
 
 static int r8a7779_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
@@ -36,11 +38,15 @@ static int r8a7779_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 static void __init r8a7779_smp_prepare_cpus(unsigned int max_cpus)
 {
+	void __iomem *base = ioremap(HPBREG_BASE, 0x1000);
+
 	/* Map the reset vector (in headsmp-scu.S, headsmp.S) */
-	__raw_writel(__pa(shmobile_boot_vector), AVECR);
+	__raw_writel(__pa(shmobile_boot_vector), base + AVECR);
 
 	/* setup r8a7779 specific SCU bits */
 	shmobile_smp_scu_prepare_cpus(R8A7779_SCU_BASE, max_cpus);
+
+	iounmap(base);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.25.1

