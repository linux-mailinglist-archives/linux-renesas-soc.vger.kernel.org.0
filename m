Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10EC82B6753
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 15:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgKQOY4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 09:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgKQOY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 09:24:56 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89B7C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 06:24:55 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id tSQt2300V4C55Sk06SQteV; Tue, 17 Nov 2020 15:24:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kf1uf-003GMk-AR; Tue, 17 Nov 2020 15:24:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kf1ue-009Fo1-Rh; Tue, 17 Nov 2020 15:24:52 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] ARM: shmobile: Stop using __raw_*() I/O accessors
Date:   Tue, 17 Nov 2020 15:24:47 +0100
Message-Id: <20201117142447.2205664-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no reason to keep on using the __raw_{read,write}l() I/O
accessors in Renesas ARM platform code.  Switch to using the plain
{read,write}l() I/O accessors, to have a chance that this works on
big-endian.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.11.

 arch/arm/mach-shmobile/platsmp-scu.c   |  2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c |  8 ++++----
 arch/arm/mach-shmobile/setup-r8a7779.c | 14 +++++++-------
 arch/arm/mach-shmobile/smp-r8a7779.c   |  2 +-
 arch/arm/mach-shmobile/smp-sh73a0.c    | 10 +++++-----
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-shmobile/platsmp-scu.c b/arch/arm/mach-shmobile/platsmp-scu.c
index fcfcef1d1ae4f81f..3849f71e6e12eba6 100644
--- a/arch/arm/mach-shmobile/platsmp-scu.c
+++ b/arch/arm/mach-shmobile/platsmp-scu.c
@@ -64,7 +64,7 @@ static int shmobile_smp_scu_psr_core_disabled(int cpu)
 {
 	unsigned long mask = SCU_PM_POWEROFF << (cpu * 8);
 
-	if ((__raw_readl(shmobile_scu_base + 8) & mask) == mask)
+	if ((readl(shmobile_scu_base + 8) & mask) == mask)
 		return 1;
 
 	return 0;
diff --git a/arch/arm/mach-shmobile/setup-r8a7778.c b/arch/arm/mach-shmobile/setup-r8a7778.c
index 819dbda47298ae88..02cda9cada4c4546 100644
--- a/arch/arm/mach-shmobile/setup-r8a7778.c
+++ b/arch/arm/mach-shmobile/setup-r8a7778.c
@@ -31,12 +31,12 @@ static void __init r8a7778_init_irq_dt(void)
 	irqchip_init();
 
 	/* route all interrupts to ARM */
-	__raw_writel(0x73ffffff, base + INT2NTSR0);
-	__raw_writel(0xffffffff, base + INT2NTSR1);
+	writel(0x73ffffff, base + INT2NTSR0);
+	writel(0xffffffff, base + INT2NTSR1);
 
 	/* unmask all known interrupts in INTCS2 */
-	__raw_writel(0x08330773, base + INT2SMSKCR0);
-	__raw_writel(0x00311110, base + INT2SMSKCR1);
+	writel(0x08330773, base + INT2SMSKCR0);
+	writel(0x00311110, base + INT2SMSKCR1);
 
 	iounmap(base);
 }
diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index 446d40b50b7b784b..b6e282116d664705 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -34,15 +34,15 @@ static void __init r8a7779_init_irq_dt(void)
 	irqchip_init();
 
 	/* route all interrupts to ARM */
-	__raw_writel(0xffffffff, base + INT2NTSR0);
-	__raw_writel(0x3fffffff, base + INT2NTSR1);
+	writel(0xffffffff, base + INT2NTSR0);
+	writel(0x3fffffff, base + INT2NTSR1);
 
 	/* unmask all known interrupts in INTCS2 */
-	__raw_writel(0xfffffff0, base + INT2SMSKCR0);
-	__raw_writel(0xfff7ffff, base + INT2SMSKCR1);
-	__raw_writel(0xfffbffdf, base + INT2SMSKCR2);
-	__raw_writel(0xbffffffc, base + INT2SMSKCR3);
-	__raw_writel(0x003fee3f, base + INT2SMSKCR4);
+	writel(0xfffffff0, base + INT2SMSKCR0);
+	writel(0xfff7ffff, base + INT2SMSKCR1);
+	writel(0xfffbffdf, base + INT2SMSKCR2);
+	writel(0xbffffffc, base + INT2SMSKCR3);
+	writel(0x003fee3f, base + INT2SMSKCR4);
 
 	iounmap(base);
 }
diff --git a/arch/arm/mach-shmobile/smp-r8a7779.c b/arch/arm/mach-shmobile/smp-r8a7779.c
index 80fef14a47ba6b7e..51163854d9a14d17 100644
--- a/arch/arm/mach-shmobile/smp-r8a7779.c
+++ b/arch/arm/mach-shmobile/smp-r8a7779.c
@@ -45,7 +45,7 @@ static void __init r8a7779_smp_prepare_cpus(unsigned int max_cpus)
 	void __iomem *base = ioremap(HPBREG_BASE, 0x1000);
 
 	/* Map the reset vector (in headsmp-scu.S, headsmp.S) */
-	__raw_writel(__pa(shmobile_boot_vector), base + AVECR);
+	writel(__pa(shmobile_boot_vector), base + AVECR);
 
 	/* setup r8a7779 specific SCU bits */
 	shmobile_smp_scu_prepare_cpus(R8A7779_SCU_BASE, max_cpus);
diff --git a/arch/arm/mach-shmobile/smp-sh73a0.c b/arch/arm/mach-shmobile/smp-sh73a0.c
index 916f6367bc282eb4..62f4d2501e174a78 100644
--- a/arch/arm/mach-shmobile/smp-sh73a0.c
+++ b/arch/arm/mach-shmobile/smp-sh73a0.c
@@ -39,10 +39,10 @@ static int sh73a0_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	unsigned int lcpu = cpu_logical_map(cpu);
 	void __iomem *cpg2 = ioremap(CPG_BASE2, PAGE_SIZE);
 
-	if (((__raw_readl(cpg2 + PSTR) >> (4 * lcpu)) & 3) == 3)
-		__raw_writel(1 << lcpu, cpg2 + WUPCR);	/* wake up */
+	if (((readl(cpg2 + PSTR) >> (4 * lcpu)) & 3) == 3)
+		writel(1 << lcpu, cpg2 + WUPCR);	/* wake up */
 	else
-		__raw_writel(1 << lcpu, cpg2 + SRESCR);	/* reset */
+		writel(1 << lcpu, cpg2 + SRESCR);	/* reset */
 	iounmap(cpg2);
 	return 0;
 }
@@ -53,8 +53,8 @@ static void __init sh73a0_smp_prepare_cpus(unsigned int max_cpus)
 	void __iomem *sysc = ioremap(SYSC_BASE, PAGE_SIZE);
 
 	/* Map the reset vector (in headsmp.S) */
-	__raw_writel(0, ap + APARMBAREA);      /* 4k */
-	__raw_writel(__pa(shmobile_boot_vector), sysc + SBAR);
+	writel(0, ap + APARMBAREA);      /* 4k */
+	writel(__pa(shmobile_boot_vector), sysc + SBAR);
 	iounmap(sysc);
 	iounmap(ap);
 
-- 
2.25.1

