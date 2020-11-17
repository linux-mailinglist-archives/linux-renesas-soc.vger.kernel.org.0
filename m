Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84902B5CE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgKQKab (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbgKQKab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:31 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4FFC0617A6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id tNWV2300G4C55Sk06NWVKw; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bbz-VZ; Tue, 17 Nov 2020 11:30:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xpR-A4; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
Date:   Tue, 17 Nov 2020 11:30:21 +0100
Message-Id: <20201117103022.2136527-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace using the legacy IOMEM() macro to map various registers related
to secondary CPU bringup by ioremap().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-sh73a0.c | 33 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-sh73a0.c b/arch/arm/mach-shmobile/smp-sh73a0.c
index 0403aa8629ddc10a..6d892d11d81c524d 100644
--- a/arch/arm/mach-shmobile/smp-sh73a0.c
+++ b/arch/arm/mach-shmobile/smp-sh73a0.c
@@ -16,31 +16,42 @@
 #include "common.h"
 #include "sh73a0.h"
 
-#define WUPCR		IOMEM(0xe6151010)
-#define SRESCR		IOMEM(0xe6151018)
-#define PSTR		IOMEM(0xe6151040)
-#define SBAR		IOMEM(0xe6180020)
-#define APARMBAREA	IOMEM(0xe6f10020)
+#define CPG_BASE2	0xe6151000
+#define WUPCR		0x10	/* System-CPU Wake Up Control Register */
+#define SRESCR		0x18	/* System-CPU Software Reset Control Register */
+#define PSTR		0x40	/* System-CPU Power Status Register */
+
+#define SYSC_BASE	0xe6180000
+#define SBAR		0x20	/* SYS Boot Address Register */
+
+#define AP_BASE		0xe6f10000
+#define APARMBAREA	0x20	/* Address Translation Area Register */
 
 #define SH73A0_SCU_BASE 0xf0000000
 
 static int sh73a0_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	unsigned int lcpu = cpu_logical_map(cpu);
+	void __iomem *cpg2 = ioremap(CPG_BASE2, PAGE_SIZE);
 
-	if (((__raw_readl(PSTR) >> (4 * lcpu)) & 3) == 3)
-		__raw_writel(1 << lcpu, WUPCR);	/* wake up */
+	if (((__raw_readl(cpg2 + PSTR) >> (4 * lcpu)) & 3) == 3)
+		__raw_writel(1 << lcpu, cpg2 + WUPCR);	/* wake up */
 	else
-		__raw_writel(1 << lcpu, SRESCR);	/* reset */
-
+		__raw_writel(1 << lcpu, cpg2 + SRESCR);	/* reset */
+	iounmap(cpg2);
 	return 0;
 }
 
 static void __init sh73a0_smp_prepare_cpus(unsigned int max_cpus)
 {
+	void __iomem *ap = ioremap(AP_BASE, PAGE_SIZE);
+	void __iomem *sysc = ioremap(SYSC_BASE, PAGE_SIZE);
+
 	/* Map the reset vector (in headsmp.S) */
-	__raw_writel(0, APARMBAREA);      /* 4k */
-	__raw_writel(__pa(shmobile_boot_vector), SBAR);
+	__raw_writel(0, ap + APARMBAREA);      /* 4k */
+	__raw_writel(__pa(shmobile_boot_vector), sysc + SBAR);
+	iounmap(sysc);
+	iounmap(ap);
 
 	/* setup sh73a0 specific SCU bits */
 	shmobile_smp_scu_prepare_cpus(SH73A0_SCU_BASE, max_cpus);
-- 
2.25.1

