Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B02B2645AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 14:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbgIJMEB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 08:04:01 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49725 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730340AbgIJMD0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:03:26 -0400
X-IronPort-AV: E=Sophos;i="5.76,412,1592838000"; 
   d="scan'208";a="56936704"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Sep 2020 21:03:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 99B19425ACD5;
        Thu, 10 Sep 2020 21:03:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/4] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
Date:   Thu, 10 Sep 2020 21:02:50 +0900
Message-Id: <1599739372-30669-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car V3U (R8A779A0) SoC power areas and
register access, because register specification differs
from R-Car Gen2/3.

Inspired by patches in the BSP by Tho Vu.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig         |   4 +
 drivers/soc/renesas/Makefile        |   1 +
 drivers/soc/renesas/r8a779a0-sysc.c | 450 ++++++++++++++++++++++++++++++++++++
 3 files changed, 455 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a779a0-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index e0c39efd..8fd5525 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -275,6 +275,7 @@ config ARCH_R8A77995
 config ARCH_R8A779A0
 	bool "Renesas R-Car V3U SoC Platform"
 	select ARCH_RCAR_GEN3
+	select SYSC_R8A779A0
 	help
 	  This enables support for the Renesas R-Car V3U SoC.
 
@@ -365,6 +366,9 @@ config SYSC_R8A77995
 	bool "System Controller support for R-Car D3" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A779A0
+	bool "R-Car V3U System Controller support" if COMPILE_TEST
+
 # Family
 config RST_RCAR
 	bool "Reset Controller support for R-Car" if COMPILE_TEST
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 10a399f..9b29bed 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
 obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
 obj-$(CONFIG_SYSC_R8A77990)	+= r8a77990-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
+obj-$(CONFIG_SYSC_R8A779A0)	+= r8a779a0-sysc.o
 ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a779a0-sysc.c
new file mode 100644
index 0000000..a74f16b
--- /dev/null
+++ b/drivers/soc/renesas/r8a779a0-sysc.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R-Car V3U System Controller
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk/renesas.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/of_address.h>
+#include <linux/pm_domain.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <dt-bindings/power/r8a779a0-sysc.h>
+
+/*
+ * Power Domain flags
+ */
+#define PD_CPU		BIT(0)	/* Area contains main CPU core */
+#define PD_SCU		BIT(1)	/* Area contains SCU and L2 cache */
+#define PD_NO_CR	BIT(2)	/* Area lacks PWR{ON,OFF}CR registers */
+
+#define PD_CPU_NOCR	PD_CPU | PD_NO_CR /* CPU area lacks CR */
+#define PD_ALWAYS_ON	PD_NO_CR	  /* Always-on area */
+
+/*
+ * Description of a Power Area
+ */
+struct r8a779a0_sysc_area {
+	const char *name;
+	u8 pdr;			/* PDRn */
+	int parent;		/* -1 if none */
+	unsigned int flags;	/* See PD_* */
+};
+
+/*
+ * SoC-specific Power Area Description
+ */
+struct r8a779a0_sysc_info {
+	const struct r8a779a0_sysc_area *areas;
+	unsigned int num_areas;
+};
+
+static struct r8a779a0_sysc_area r8a779a0_areas[] __initdata = {
+	{ "always-on",	R8A779A0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "a3e0",	R8A779A0_PD_A3E0, R8A779A0_PD_ALWAYS_ON, PD_SCU },
+	{ "a3e1",	R8A779A0_PD_A3E1, R8A779A0_PD_ALWAYS_ON, PD_SCU },
+	{ "a2e0d0",	R8A779A0_PD_A2E0D0, R8A779A0_PD_A3E0, PD_SCU },
+	{ "a2e0d1",	R8A779A0_PD_A2E0D1, R8A779A0_PD_A3E0, PD_SCU },
+	{ "a2e1d0",	R8A779A0_PD_A2E1D0, R8A779A0_PD_A3E1, PD_SCU },
+	{ "a2e1d1",	R8A779A0_PD_A2E1D1, R8A779A0_PD_A3E1, PD_SCU },
+	{ "a1e0d0c0",	R8A779A0_PD_A1E0D0C0, R8A779A0_PD_A2E0D0, PD_CPU_NOCR },
+	{ "a1e0d0c1",	R8A779A0_PD_A1E0D0C1, R8A779A0_PD_A2E0D0, PD_CPU_NOCR },
+	{ "a1e0d1c0",	R8A779A0_PD_A1E0D1C0, R8A779A0_PD_A2E0D1, PD_CPU_NOCR },
+	{ "a1e0d1c1",	R8A779A0_PD_A1E0D1C1, R8A779A0_PD_A2E0D1, PD_CPU_NOCR },
+	{ "a1e1d0c0",	R8A779A0_PD_A1E1D0C0, R8A779A0_PD_A2E1D0, PD_CPU_NOCR },
+	{ "a1e1d0c1",	R8A779A0_PD_A1E1D0C1, R8A779A0_PD_A2E1D0, PD_CPU_NOCR },
+	{ "a1e1d1c0",	R8A779A0_PD_A1E1D1C0, R8A779A0_PD_A2E1D1, PD_CPU_NOCR },
+	{ "a1e1d1c1",	R8A779A0_PD_A1E1D1C1, R8A779A0_PD_A2E1D1, PD_CPU_NOCR },
+	{ "3dg-a",	R8A779A0_PD_3DG_A, R8A779A0_PD_ALWAYS_ON },
+	{ "3dg-b",	R8A779A0_PD_3DG_B, R8A779A0_PD_3DG_A },
+	{ "a3vip0",	R8A779A0_PD_A3VIP0, R8A779A0_PD_ALWAYS_ON },
+	{ "a3vip1",	R8A779A0_PD_A3VIP1, R8A779A0_PD_ALWAYS_ON },
+	{ "a3vip3",	R8A779A0_PD_A3VIP3, R8A779A0_PD_ALWAYS_ON },
+	{ "a3vip2",	R8A779A0_PD_A3VIP2, R8A779A0_PD_ALWAYS_ON },
+	{ "a3isp01",	R8A779A0_PD_A3ISP01, R8A779A0_PD_ALWAYS_ON },
+	{ "a3isp23",	R8A779A0_PD_A3ISP23, R8A779A0_PD_ALWAYS_ON },
+	{ "a3ir",	R8A779A0_PD_A3IR, R8A779A0_PD_ALWAYS_ON },
+	{ "a2cn0",	R8A779A0_PD_A2CN0, R8A779A0_PD_A3IR },
+	{ "a2imp01",	R8A779A0_PD_A2IMP01, R8A779A0_PD_A3IR },
+	{ "a2dp0",	R8A779A0_PD_A2DP0, R8A779A0_PD_A3IR },
+	{ "a2cv0",	R8A779A0_PD_A2CV0, R8A779A0_PD_A3IR },
+	{ "a2cv1",	R8A779A0_PD_A2CV1, R8A779A0_PD_A3IR },
+	{ "a2cv4",	R8A779A0_PD_A2CV4, R8A779A0_PD_A3IR },
+	{ "a2cv6",	R8A779A0_PD_A2CV6, R8A779A0_PD_A3IR },
+	{ "a2cn2",	R8A779A0_PD_A2CN2, R8A779A0_PD_A3IR },
+	{ "a2imp23",	R8A779A0_PD_A2IMP23, R8A779A0_PD_A3IR },
+	{ "a2dp1",	R8A779A0_PD_A2DP0, R8A779A0_PD_A3IR },
+	{ "a2cv2",	R8A779A0_PD_A2CV0, R8A779A0_PD_A3IR },
+	{ "a2cv3",	R8A779A0_PD_A2CV1, R8A779A0_PD_A3IR },
+	{ "a2cv5",	R8A779A0_PD_A2CV4, R8A779A0_PD_A3IR },
+	{ "a2cv7",	R8A779A0_PD_A2CV6, R8A779A0_PD_A3IR },
+	{ "a2cn1",	R8A779A0_PD_A2CN1, R8A779A0_PD_A3IR },
+	{ "a1cnn0",	R8A779A0_PD_A1CNN0, R8A779A0_PD_A2CN0 },
+	{ "a1cnn2",	R8A779A0_PD_A1CNN2, R8A779A0_PD_A2CN2 },
+	{ "a1dsp0",	R8A779A0_PD_A1DSP0, R8A779A0_PD_A2CN2 },
+	{ "a1cnn1",	R8A779A0_PD_A1CNN1, R8A779A0_PD_A2CN1 },
+	{ "a1dsp1",	R8A779A0_PD_A1DSP1, R8A779A0_PD_A2CN1 },
+};
+
+const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
+	.areas = r8a779a0_areas,
+	.num_areas = ARRAY_SIZE(r8a779a0_areas),
+};
+
+/* SYSC Common */
+#define SYSCSR		0x000	/* SYSC Status Register */
+#define SYSCPONSR(x)	(0x800 + ((x) * 0x4)) /* Power-ON Status Register 0 */
+#define SYSCPOFFSR(x)	(0x808 + ((x) * 0x4)) /* Power-OFF Status Register */
+#define SYSCISCR(x)	(0x810 + ((x) * 0x4)) /* Interrupt Status/Clear Register */
+#define SYSCIER(x)	(0x820 + ((x) * 0x4)) /* Interrupt Enable Register */
+#define SYSCIMR(x)	(0x830 + ((x) * 0x4)) /* Interrupt Mask Register */
+
+/* Power Domain Registers */
+#define PDRSR(n)	(0x1000 + ((n) * 0x40))
+#define PDRONCR(n)	(0x1004 + ((n) * 0x40))
+#define PDROFFCR(n)	(0x1008 + ((n) * 0x40))
+#define PDRESR(n)	(0x100C + ((n) * 0x40))
+
+/* PWRON/PWROFF */
+#define PWRON_PWROFF		BIT(0)	/* Power-ON/OFF request */
+
+/* PDRESR */
+#define PDRESR_ERR		BIT(0)
+
+/* PDRSR */
+#define PDRSR_OFF		BIT(0)	/* Power-OFF state */
+#define PDRSR_ON		BIT(4)	/* Power-ON state */
+#define PDRSR_OFF_STATE		BIT(8)  /* Processing Power-OFF sequence */
+#define PDRSR_ON_STATE		BIT(12) /* Processing Power-ON sequence */
+
+#define SYSCSR_BUSY		GENMASK(1, 0)	/* All bit sets is not busy */
+
+#define SYSCSR_RETRIES		1000
+#define SYSCSR_DELAY_US		10
+
+#define PDRESR_RETRIES		1000
+#define PDRESR_DELAY_US		10
+
+#define SYSCISR_RETRIES		1000
+#define SYSCISR_DELAY_US	10
+
+#define R8A779A0_PD_ALWAYS_ON	64	/* Always-on power area */
+
+#define NUM_DOMAINS_EACH_REG	BITS_PER_TYPE(u32)
+
+static void __iomem *r8a779a0_sysc_base;
+static DEFINE_SPINLOCK(r8a779a0_sysc_lock); /* SMP CPUs + I/O devices */
+
+static int r8a779a0_sysc_pwr_on_off(u8 pdr, bool on)
+{
+	unsigned int reg_offs;
+	u32 val;
+	int ret;
+
+	if (on)
+		reg_offs = PDRONCR(pdr);
+	else
+		reg_offs = PDROFFCR(pdr);
+
+	/* Wait until SYSC is ready to accept a power request */
+	ret = readl_poll_timeout_atomic(r8a779a0_sysc_base + SYSCSR, val,
+					(val & SYSCSR_BUSY) == SYSCSR_BUSY,
+					SYSCSR_DELAY_US, SYSCSR_RETRIES);
+	if (ret < 0)
+		return -EAGAIN;
+
+	/* Submit power shutoff or power resume request */
+	iowrite32(PWRON_PWROFF, r8a779a0_sysc_base + reg_offs);
+
+	return 0;
+}
+
+static int clear_irq_flags(unsigned int reg_idx, unsigned int isr_mask)
+{
+	u32 val;
+	int ret;
+
+	iowrite32(isr_mask, r8a779a0_sysc_base + SYSCISCR(reg_idx));
+
+	ret = readl_poll_timeout_atomic(r8a779a0_sysc_base + SYSCISCR(reg_idx),
+					val, !(val & isr_mask),
+					SYSCISR_DELAY_US, SYSCISR_RETRIES);
+	if (ret < 0) {
+		pr_err("\n %s : Can not clear IRQ flags in SYSCISCR", __func__);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int r8a779a0_sysc_power(u8 pdr, bool on)
+{
+	unsigned int isr_mask;
+	unsigned int reg_idx, bit_idx;
+	unsigned int status;
+	unsigned long flags;
+	int ret = 0;
+	u32 val;
+	int k;
+
+	spin_lock_irqsave(&r8a779a0_sysc_lock, flags);
+
+	reg_idx = pdr / NUM_DOMAINS_EACH_REG;
+	bit_idx = pdr % NUM_DOMAINS_EACH_REG;
+
+	isr_mask = BIT(bit_idx);
+
+	/*
+	 * The interrupt source needs to be enabled, but masked, to prevent the
+	 * CPU from receiving it.
+	 */
+	iowrite32(ioread32(r8a779a0_sysc_base + SYSCIER(reg_idx)) | isr_mask,
+		  r8a779a0_sysc_base + SYSCIER(reg_idx));
+	iowrite32(ioread32(r8a779a0_sysc_base + SYSCIMR(reg_idx)) | isr_mask,
+		  r8a779a0_sysc_base + SYSCIMR(reg_idx));
+
+	ret = clear_irq_flags(reg_idx, isr_mask);
+	if (ret)
+		goto out;
+
+	/* Submit power shutoff or resume request until it was accepted */
+	for (k = 0; k < PDRESR_RETRIES; k++) {
+		ret = r8a779a0_sysc_pwr_on_off(pdr, on);
+		if (ret)
+			goto out;
+
+		status = ioread32(r8a779a0_sysc_base + PDRESR(pdr));
+		if (!(status & PDRESR_ERR))
+			break;
+
+		udelay(PDRESR_DELAY_US);
+	}
+
+	if (k == PDRESR_RETRIES) {
+		ret = -EIO;
+		goto out;
+	}
+
+	/* Wait until the power shutoff or resume request has completed * */
+	ret = readl_poll_timeout_atomic(r8a779a0_sysc_base + SYSCISCR(reg_idx),
+					val, (val & isr_mask),
+					SYSCISR_DELAY_US, SYSCISR_RETRIES);
+	if (ret < 0) {
+		ret = -EIO;
+		goto out;
+	}
+
+	/* Clear interrupt flags */
+	ret = clear_irq_flags(reg_idx, isr_mask);
+	if (ret)
+		goto out;
+
+ out:
+	spin_unlock_irqrestore(&r8a779a0_sysc_lock, flags);
+
+	pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+		 pdr, ioread32(r8a779a0_sysc_base + SYSCISCR(reg_idx)), ret);
+	return ret;
+}
+
+static bool r8a779a0_sysc_power_is_off(u8 pdr)
+{
+	unsigned int st;
+
+	st = ioread32(r8a779a0_sysc_base + PDRSR(pdr));
+
+	if (st & PDRSR_OFF)
+		return true;
+
+	return false;
+}
+
+struct r8a779a0_sysc_pd {
+	struct generic_pm_domain genpd;
+	u8 pdr;
+	unsigned int flags;
+	char name[];
+};
+
+static inline struct r8a779a0_sysc_pd *to_r8a779a0_pd(struct generic_pm_domain *d)
+{
+	return container_of(d, struct r8a779a0_sysc_pd, genpd);
+}
+
+static int r8a779a0_sysc_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct r8a779a0_sysc_pd *pd = to_r8a779a0_pd(genpd);
+
+	pr_debug("%s: %s\n", __func__, genpd->name);
+	return r8a779a0_sysc_power(pd->pdr, false);
+}
+
+static int r8a779a0_sysc_pd_power_on(struct generic_pm_domain *genpd)
+{
+	struct r8a779a0_sysc_pd *pd = to_r8a779a0_pd(genpd);
+
+	pr_debug("%s: %s\n", __func__, genpd->name);
+	return r8a779a0_sysc_power(pd->pdr, true);
+}
+
+static int __init r8a779a0_sysc_pd_setup(struct r8a779a0_sysc_pd *pd)
+{
+	struct generic_pm_domain *genpd = &pd->genpd;
+	const char *name = pd->genpd.name;
+	int error;
+
+	if (pd->flags & PD_CPU) {
+		/*
+		 * This domain contains a CPU core and therefore it should
+		 * only be turned off if the CPU is not in use.
+		 */
+		pr_debug("PM domain %s contains %s\n", name, "CPU");
+		genpd->flags |= GENPD_FLAG_ALWAYS_ON;
+	} else if (pd->flags & PD_SCU) {
+		/*
+		 * This domain contains an SCU and cache-controller, and
+		 * therefore it should only be turned off if the CPU cores are
+		 * not in use.
+		 */
+		pr_debug("PM domain %s contains %s\n", name, "SCU");
+		genpd->flags |= GENPD_FLAG_ALWAYS_ON;
+	} else if (pd->flags & PD_NO_CR) {
+		/*
+		 * This domain cannot be turned off.
+		 */
+		genpd->flags |= GENPD_FLAG_ALWAYS_ON;
+	}
+
+	if (!(pd->flags & (PD_CPU | PD_SCU))) {
+		/* Enable Clock Domain for I/O devices */
+		genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
+		genpd->attach_dev = cpg_mssr_attach_dev;
+		genpd->detach_dev = cpg_mssr_detach_dev;
+	}
+
+	genpd->power_off = r8a779a0_sysc_pd_power_off;
+	genpd->power_on = r8a779a0_sysc_pd_power_on;
+
+	if (pd->flags & (PD_CPU | PD_NO_CR)) {
+		/* Skip CPUs (handled by SMP code) and areas without control */
+		pr_debug("%s: Not touching %s\n", __func__, genpd->name);
+		goto finalize;
+	}
+
+	if (!r8a779a0_sysc_power_is_off(pd->pdr)) {
+		pr_debug("%s: %s is already powered\n", __func__, genpd->name);
+		goto finalize;
+	}
+
+	r8a779a0_sysc_power(pd->pdr, true);
+
+finalize:
+	error = pm_genpd_init(genpd, &simple_qos_governor, false);
+	if (error)
+		pr_err("Failed to init PM domain %s: %d\n", name, error);
+
+	return error;
+}
+
+static const struct of_device_id r8a779a0_sysc_matches[] __initconst = {
+	{ .compatible = "renesas,r8a779a0-sysc", .data = &r8a779a0_sysc_info },
+	{ /* sentinel */ }
+};
+
+struct r8a779a0_pm_domains {
+	struct genpd_onecell_data onecell_data;
+	struct generic_pm_domain *domains[R8A779A0_PD_ALWAYS_ON + 1];
+};
+
+static struct genpd_onecell_data *r8a779a0_sysc_onecell_data;
+
+static int __init r8a779a0_sysc_pd_init(void)
+{
+	const struct r8a779a0_sysc_info *info;
+	const struct of_device_id *match;
+	struct r8a779a0_pm_domains *domains;
+	struct device_node *np;
+	void __iomem *base;
+	unsigned int i;
+	int error;
+
+	np = of_find_matching_node_and_match(NULL, r8a779a0_sysc_matches, &match);
+	if (!np)
+		return -ENODEV;
+
+	info = match->data;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_warn("%pOF: Cannot map regs\n", np);
+		error = -ENOMEM;
+		goto out_put;
+	}
+
+	r8a779a0_sysc_base = base;
+
+	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
+	if (!domains) {
+		error = -ENOMEM;
+		goto out_put;
+	}
+
+	domains->onecell_data.domains = domains->domains;
+	domains->onecell_data.num_domains = ARRAY_SIZE(domains->domains);
+	r8a779a0_sysc_onecell_data = &domains->onecell_data;
+
+	for (i = 0; i < info->num_areas; i++) {
+		const struct r8a779a0_sysc_area *area = &info->areas[i];
+		struct r8a779a0_sysc_pd *pd;
+
+		if (!area->name) {
+			/* Skip NULLified area */
+			continue;
+		}
+
+		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
+		if (!pd) {
+			error = -ENOMEM;
+			goto out_put;
+		}
+
+		strcpy(pd->name, area->name);
+		pd->genpd.name = pd->name;
+		pd->pdr = area->pdr;
+		pd->flags = area->flags;
+
+		error = r8a779a0_sysc_pd_setup(pd);
+		if (error)
+			goto out_put;
+
+		domains->domains[area->pdr] = &pd->genpd;
+
+		if (area->parent < 0)
+			continue;
+
+		error = pm_genpd_add_subdomain(domains->domains[area->parent],
+					       &pd->genpd);
+		if (error) {
+			pr_warn("Failed to add PM subdomain %s to parent %u\n",
+				area->name, area->parent);
+			goto out_put;
+		}
+	}
+
+	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
+
+out_put:
+	of_node_put(np);
+	return error;
+}
+early_initcall(r8a779a0_sysc_pd_init);
-- 
2.7.4

