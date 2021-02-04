Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178BA30FA63
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237500AbhBDRzt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237773AbhBDRvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:51:23 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E48CC061788
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id R5qf240034C55Sk065qfPL; Thu, 04 Feb 2021 18:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-Nx; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5G-006vwD-3m; Thu, 04 Feb 2021 14:54:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 6/6] [WIP] ARM: shmobile: r8a73a4: Add SMP support
Date:   Thu,  4 Feb 2021 14:54:09 +0100
Message-Id: <20210204135409.1652604-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hoop up APMU-based secondary CPU support for R-Mobile APE6.
This brings up the 3 other Cortex-A15 CPU cores.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Makefile       |   1 +
 arch/arm/mach-shmobile/platsmp-apmu.c |  15 ++-
 arch/arm/mach-shmobile/pm-r8a73a4.c   | 152 ++++++++++++++++++++++++++
 arch/arm/mach-shmobile/r8a73a4.h      |   7 ++
 drivers/soc/renesas/Kconfig           |   1 +
 5 files changed, 174 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/mach-shmobile/pm-r8a73a4.c
 create mode 100644 arch/arm/mach-shmobile/r8a73a4.h

diff --git a/arch/arm/mach-shmobile/Makefile b/arch/arm/mach-shmobile/Makefile
index bce16aa04c5c1bb2..78e9fd2bab847cb6 100644
--- a/arch/arm/mach-shmobile/Makefile
+++ b/arch/arm/mach-shmobile/Makefile
@@ -37,6 +37,7 @@ smp-$(CONFIG_ARCH_EMEV2)	+= smp-emev2.o headsmp-scu.o platsmp-scu.o
 # PM objects
 obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_ARCH_RCAR_GEN2)	+= pm-rcar-gen2.o
+obj-$(CONFIG_ARCH_R8A73A4)	+= pm-r8a73a4.o
 
 # Framework support
 obj-$(CONFIG_SMP)		+= $(smp-y)
diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
index e771ce70e132ff53..f2af3edc16a02808 100644
--- a/arch/arm/mach-shmobile/platsmp-apmu.c
+++ b/arch/arm/mach-shmobile/platsmp-apmu.c
@@ -21,6 +21,7 @@
 #include <asm/suspend.h>
 #include "common.h"
 #include "rcar-gen2.h"
+#include "r8a73a4.h"
 
 static struct {
 	void __iomem *iomem;
@@ -194,7 +195,7 @@ static void apmu_init_cpu(struct resource *res, int cpu, int bit)
 
 	pr_debug("apmu ioremap %d %d %pr\n", cpu, bit, res);
 
-	/* Setup for debug mode */
+	/* Setup for debug mode */	// FIXME Not documented on APE6?
 	x = readl(apmu_cpus[cpu].iomem + DBGRCR_OFFS);
 	x |= DBGCPUREN | DBGCPUNREN(bit) | DBGCPUPREN;
 	writel(x, apmu_cpus[cpu].iomem + DBGRCR_OFFS);
@@ -253,7 +254,9 @@ static void __init shmobile_smp_apmu_setup_boot(void)
 {
 	/* install boot code shared by all CPUs */
 	shmobile_boot_fn = __pa_symbol(shmobile_smp_boot);
+#ifdef CONFIG_ARCH_RCAR_GEN2	// FIXME
 	shmobile_boot_fn_gen2 = shmobile_boot_fn;
+#endif
 }
 
 static int shmobile_smp_apmu_boot_secondary(unsigned int cpu,
@@ -269,7 +272,15 @@ static void __init shmobile_smp_apmu_prepare_cpus_dt(unsigned int max_cpus)
 {
 	shmobile_smp_apmu_setup_boot();
 	apmu_parse_dt(apmu_init_cpu);
-	rcar_gen2_pm_init();
+	if (of_machine_is_compatible("renesas,r8a73a4")) {	// FIXME
+#ifdef CONFIG_ARCH_R8A73A4
+		r8a73a4_pm_init();
+#endif
+	} else {
+#ifdef CONFIG_ARCH_RCAR_GEN2
+		rcar_gen2_pm_init();
+#endif
+	}
 }
 
 static struct smp_operations apmu_smp_ops __initdata = {
diff --git a/arch/arm/mach-shmobile/pm-r8a73a4.c b/arch/arm/mach-shmobile/pm-r8a73a4.c
new file mode 100644
index 0000000000000000..3ee270063ecf9f9b
--- /dev/null
+++ b/arch/arm/mach-shmobile/pm-r8a73a4.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Mobile APE6 Power management support
+ * Based on R-Car Generation 2 Power management support
+ *
+ * Copyright (C) 2013 - 2015  Renesas Electronics Corporation
+ * Copyright (C) 2011 - 2013  Renesas Solutions Corp.
+ * Copyright (C) 2012 Takashi Yoshii <takashi.yoshii.ze@renesas.com>
+ * Copyright (C) 2011  Magnus Damm
+ */
+
+#include <linux/kernel.h>
+#include <linux/ioport.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/smp.h>
+#include <asm/io.h>
+#include <asm/cputype.h>
+#include "common.h"
+#include "r8a73a4.h"
+
+/* System Controller */
+#define SYSC		0xe6180000	// FIXME
+
+/* Boot Address Registers */
+#define CA7BAR		0x4020		/* CA7 Boot Address Register */
+#define CA15BAR		0x6020		/* CA15 Boot Address Register */
+#define SBAR_BAREN	BIT(4)		/* SBAR is valid */
+
+/* Reset Control Register */
+#define RESCNT		0x801c		/* Reset Control Register */
+#define RESCNT_MSTPCA15	BIT(10)		/* AP-System Core(CA15) Module stop */
+#define RESCNT_MSTPCA7	BIT(9)		/* AP-System Core(CA9) Module stop */
+
+/* CCI-400 */
+#define CCI_BASE		0xf0190000	// FIXME
+
+#define CCI_SLAVE3		0x4000		/* S3: CA15 */
+#define CCI_SLAVE4		0x5000		/* S4: CA7 */
+
+#define CCI_PORT_CTRL		0x0000
+
+#define CCI_ENABLE_SNOOP_REQ	BIT(0)
+#define CCI_ENABLE_DVM_REQ	BIT(1)
+#define CCI_ENABLE_REQ		(CCI_ENABLE_SNOOP_REQ | CCI_ENABLE_DVM_REQ)
+
+#define CCI_CTRL_STATUS		0x000c
+
+static inline u32 phys_to_sbar(phys_addr_t addr)
+{
+	return (addr >> 8) & 0xfffffc00;
+}
+
+void __init r8a73a4_pm_init(void)
+{
+	void __iomem *p;
+	u32 bar;
+	static int once;
+	struct device_node *np;
+	bool has_a7 = false;
+	bool has_a15 = false;
+	struct resource res;
+	int error;
+
+	if (once++)
+		return;
+
+	for_each_of_cpu_node(np) {
+		if (of_device_is_compatible(np, "arm,cortex-a15"))
+			has_a15 = true;
+		else if (of_device_is_compatible(np, "arm,cortex-a7"))
+			has_a7 = true;
+	}
+
+	np = of_find_compatible_node(NULL, NULL, "renesas,smp-sram");
+	if (!np)
+		return;
+
+	error = of_address_to_resource(np, 0, &res);
+	of_node_put(np);
+	if (error) {
+		pr_err("Failed to get smp-sram address: %d\n", error);
+		return;
+	}
+
+	/* RAM for jump stub, because BAR requires 256KB aligned address */
+	if (res.start & (256 * 1024 - 1) ||
+	    resource_size(&res) < shmobile_boot_size) {
+		pr_err("Invalid smp-sram region\n");
+		return;
+	}
+
+	/* install reset vector */
+	p = ioremap(res.start, resource_size(&res));
+	if (!p)
+		return;
+
+	memcpy_toio(p, shmobile_boot_vector, shmobile_boot_size);
+	iounmap(p);
+
+	/* setup reset vector and disable reset */
+	p = ioremap(SYSC, 0x9000);
+	bar = phys_to_sbar(res.start);
+	if (has_a15) {
+		writel_relaxed(bar, p + CA15BAR);
+		// FIXME The register write below breaks the CFI FLASH:
+		// -0.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000089 Chip ID 0x0088b1
+		// -Intel/Sharp Extended Query Table at 0x010A
+		// -Intel/Sharp Extended Query Table at 0x010A
+		// -Intel/Sharp Extended Query Table at 0x010A
+		// -Intel/Sharp Extended Query Table at 0x010A
+		// -Intel/Sharp Extended Query Table at 0x010A
+		// -Using buffer write method
+		// -Using auto-unlock on power-up/resume
+		// -cfi_cmdset_0001: Erase suspend on write enabled
+		// -erase region 0: offset=0x0,size=0x40000,blocks=512
+		// -0.flash: program region size/ctrl_valid/ctrl_inval = 1024/16/16
+		// -0.flash: 1 set(s) of 1 interleaved chips --> 8 partitions of 16384 KiB
+		// -3 fixed-partitions partitions found on MTD device 0.flash
+		// -Creating 3 MTD partitions on "0.flash":
+		// -0x000000000000-0x000000040000 : "uboot"
+		// -0x000000040000-0x000000080000 : "uboot-env"
+		// -0x000000080000-0x000008000000 : "flash"
+		// +physmap-flash 0.flash: map_probe failed
+		writel_relaxed(bar | SBAR_BAREN, p + CA15BAR);
+
+		/* de-assert reset for CA15 CPUs */
+		writel_relaxed(readl_relaxed(p + RESCNT) & ~RESCNT_MSTPCA15,
+			       p + RESCNT);
+	}
+	if (has_a7) {
+		writel_relaxed(bar, p + CA7BAR);
+		writel_relaxed(bar | SBAR_BAREN, p + CA7BAR);
+
+		/* de-assert reset for CA7 CPUs */
+		writel_relaxed(readl_relaxed(p + RESCNT) & ~RESCNT_MSTPCA7,
+			       p + RESCNT);
+	}
+	iounmap(p);
+
+	/* enable snoop and DVM */
+	p = ioremap(CCI_BASE, 0x8000);
+	if (has_a15)
+		writel_relaxed(CCI_ENABLE_REQ, p + CCI_SLAVE3 + CCI_PORT_CTRL);
+	if (has_a7)
+		writel_relaxed(CCI_ENABLE_REQ, p + CCI_SLAVE4 + CCI_PORT_CTRL);
+	while (readl_relaxed(p + CCI_CTRL_STATUS))
+		/* wait for pending bit low */;
+	iounmap(p);
+
+	shmobile_smp_apmu_suspend_init();
+}
diff --git a/arch/arm/mach-shmobile/r8a73a4.h b/arch/arm/mach-shmobile/r8a73a4.h
new file mode 100644
index 0000000000000000..d2ca57225ac5e5a3
--- /dev/null
+++ b/arch/arm/mach-shmobile/r8a73a4.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_R8A73A4_H__
+#define __ASM_R8A73A4_H__
+
+void r8a73a4_pm_init(void);
+
+#endif /* __ASM_R8A73A4_H__ */
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index f92b6cdff8d6ca25..4fe0247189a615b0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -117,6 +117,7 @@ config ARCH_R8A73A4
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
 	select HAVE_ARM_ARCH_TIMER
+	select RENESAS_APMU
 	select RENESAS_IRQC
 
 config ARCH_R7S72100
-- 
2.25.1

