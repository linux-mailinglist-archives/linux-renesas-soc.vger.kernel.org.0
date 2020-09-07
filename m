Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE24925F64B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgIGJUZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18912 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728329AbgIGJUM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:12 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56349414"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:09 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4358F40065CD;
        Mon,  7 Sep 2020 18:20:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 12/14] clk: renesas: cpg-mssr: Add support for R-Car V3U
Date:   Mon,  7 Sep 2020 18:19:48 +0900
Message-Id: <1599470390-29719-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial support for R-Car V3U (r8a779a0), including core, module
clocks and register access, because register specification differs
than R-Car Gen2/3.

Inspired by patches in the BSP by LUU HOAI.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/Kconfig             |   4 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 479 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |  20 +-
 drivers/clk/renesas/renesas-cpg-mssr.h  |   2 +
 5 files changed, 503 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779a0-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 28e8730..b2126fa 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -30,6 +30,7 @@ config CLK_RENESAS
 	select CLK_R8A77980 if ARCH_R8A77980
 	select CLK_R8A77990 if ARCH_R8A77990
 	select CLK_R8A77995 if ARCH_R8A77995
+	select CLK_R8A779A0 if ARCH_R8A779A0
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_SH73A0 if ARCH_SH73A0
 
@@ -145,6 +146,9 @@ config CLK_R8A77995
 	bool "R-Car D3 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A779A0
+	bool "R-Car V3U clock support" if COMPILE_TEST
+
 config CLK_R9A06G032
 	bool "Renesas R9A06G032 clock driver"
 	help
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index c7c03ab..c803912 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_CLK_R8A77970)		+= r8a77970-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77980)		+= r8a77980-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77990)		+= r8a77990-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
new file mode 100644
index 0000000..2e1f579
--- /dev/null
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a779a0 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ *
+ * Based on r8a7795-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ */
+
+#include <linux/bug.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/soc/renesas/rcar-rst.h>
+#include <linux/sys_soc.h>
+
+#include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+
+enum rcar_r8a779a0_clk_types {
+	CLK_TYPE_R8A779A0_MAIN = CLK_TYPE_CUSTOM,
+	CLK_TYPE_R8A779A0_PLL1,
+	CLK_TYPE_R8A779A0_PLL20,
+	CLK_TYPE_R8A779A0_PLL21,
+	CLK_TYPE_R8A779A0_PLL30,
+	CLK_TYPE_R8A779A0_PLL31,
+	CLK_TYPE_R8A779A0_PLL5,
+	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
+	CLK_TYPE_R8A779A0_Z,
+	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
+
+	/* SoC specific definitions start here */
+	CLK_TYPE_R8A779A0_SOC_BASE,
+};
+
+#define DEF_R8A779A0_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_MDSEL,	\
+		 (_parent0) << 16 | (_parent1),		\
+		 .div = (_div0) << 16 | (_div1), .offset = _md)
+
+#define DEF_R8A779A0_OSC(_name, _id, _parent, _div)		\
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_OSC, _parent, .div = _div)
+
+struct rcar_r8a779a0_cpg_pll_config {
+	u8 extal_div;
+	u8 pll1_mult;
+	u8 pll1_div;
+	u8 pll5_mult;
+	u8 pll5_div;
+	u8 osc_prediv;
+};
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A779A0_CLK_OSCCLK,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL1,
+	CLK_PLL20,
+	CLK_PLL21,
+	CLK_PLL30,
+	CLK_PLL31,
+	CLK_PLL5,
+	CLK_PLL1_DIV2,
+	CLK_PLL20_DIV2,
+	CLK_PLL21_DIV2,
+	CLK_PLL30_DIV2,
+	CLK_PLL31_DIV2,
+	CLK_PLL5_DIV2,
+	CLK_PLL5_DIV4,
+	CLK_S1,
+	CLK_S2,
+	CLK_S3,
+	CLK_SDSRC,
+	CLK_RPCSRC,
+	CLK_OCO,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",  CLK_EXTAL),
+	DEF_INPUT("extalr", CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_R8A779A0_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll1",       CLK_PLL1, CLK_TYPE_R8A779A0_PLL1, CLK_MAIN),
+	DEF_BASE(".pll20",      CLK_PLL20, CLK_TYPE_R8A779A0_PLL20, CLK_MAIN),
+	DEF_BASE(".pll21",      CLK_PLL21, CLK_TYPE_R8A779A0_PLL21, CLK_MAIN),
+	DEF_BASE(".pll30",      CLK_PLL30, CLK_TYPE_R8A779A0_PLL30, CLK_MAIN),
+	DEF_BASE(".pll31",      CLK_PLL31, CLK_TYPE_R8A779A0_PLL31, CLK_MAIN),
+	DEF_BASE(".pll5",       CLK_PLL5, CLK_TYPE_R8A779A0_PLL5, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2",	 CLK_PLL1_DIV2,	   CLK_PLL1,   2, 1),
+	DEF_FIXED(".pll20_div2", CLK_PLL20_DIV2,   CLK_PLL20,  2, 1),
+	DEF_FIXED(".pll21_div2", CLK_PLL21_DIV2,   CLK_PLL21,  2, 1),
+	DEF_FIXED(".pll30_div2", CLK_PLL30_DIV2,   CLK_PLL30,  2, 1),
+	DEF_FIXED(".pll31_div2", CLK_PLL31_DIV2,   CLK_PLL31,  2, 1),
+	DEF_FIXED(".pll5_div2",	 CLK_PLL5_DIV2,	   CLK_PLL5,   2, 1),
+	DEF_FIXED(".pll5_div4",  CLK_PLL5_DIV4,    CLK_PLL5_DIV2,   2, 1),
+	DEF_FIXED(".s1",	CLK_S1,		   CLK_PLL1_DIV2,   2, 1),
+	DEF_FIXED(".s2",	CLK_S2,		   CLK_PLL1_DIV2,   133, 50),
+	DEF_FIXED(".s3",	CLK_S3,		   CLK_PLL1_DIV2,   4, 1),
+	DEF_RATE(".oco",	CLK_OCO,           32768),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("zx",		R8A779A0_CLK_ZX,     CLK_PLL20_DIV2,  2, 1),
+	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,   CLK_S1, 1, 1),
+	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,   CLK_S1, 2, 1),
+	DEF_FIXED("s1d4",	R8A779A0_CLK_S1D4,   CLK_S1, 4, 1),
+	DEF_FIXED("s1d8",	R8A779A0_CLK_S1D8,   CLK_S1, 8, 1),
+	DEF_FIXED("s1d12",	R8A779A0_CLK_S1D12,  CLK_S1, 12, 1),
+	DEF_FIXED("s2d1",	R8A779A0_CLK_S2D1,   CLK_S2, 1, 1),
+	DEF_FIXED("s2d2",	R8A779A0_CLK_S2D2,   CLK_S2, 2, 1),
+	DEF_FIXED("s2d4",	R8A779A0_CLK_S2D4,   CLK_S2, 4, 1),
+	DEF_FIXED("s3d1",	R8A779A0_CLK_S3D1,   CLK_S3, 1, 1),
+	DEF_FIXED("s3d2",	R8A779A0_CLK_S3D2,   CLK_S3, 2, 1),
+	DEF_FIXED("s3d4",	R8A779A0_CLK_S3D4,   CLK_S3, 4, 1),
+	DEF_FIXED("zs",		R8A779A0_CLK_ZS,     CLK_PLL1_DIV2,   4, 1),
+	DEF_FIXED("zt",		R8A779A0_CLK_ZT,     CLK_PLL1_DIV2,   2, 1),
+	DEF_FIXED("ztr",	R8A779A0_CLK_ZTR,    CLK_PLL1_DIV2,   2, 1),
+	DEF_FIXED("zr",		R8A779A0_CLK_ZR,     CLK_PLL1_DIV2,   1, 1),
+	DEF_FIXED("dsi",	R8A779A0_CLK_DSI,    CLK_PLL5_DIV4,   1, 1),
+	DEF_FIXED("cnndsp",	R8A779A0_CLK_CNNDSP, CLK_PLL5_DIV4,   1, 1),
+	DEF_FIXED("vip",	R8A779A0_CLK_VIP,    CLK_PLL5,        5, 1),
+	DEF_FIXED("adgh",	R8A779A0_CLK_ADGH,   CLK_PLL5_DIV4,   1, 1),
+	DEF_FIXED("icu",	R8A779A0_CLK_ICU,    CLK_PLL5_DIV4,   2, 1),
+	DEF_FIXED("icud2",	R8A779A0_CLK_ICUD2,  CLK_PLL5_DIV4,   4, 1),
+	DEF_FIXED("vcbus",	R8A779A0_CLK_VCBUS,  CLK_PLL5_DIV4,   1, 1),
+
+	DEF_FIXED("cbfusa",	R8A779A0_CLK_CBFUSA, CLK_MAIN,	 2, 1),
+
+	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,    CLK_PLL5_DIV4, 0x87c),
+	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,  CLK_PLL5_DIV4, 0x878),
+	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,   CLK_PLL5_DIV4, 0x880),
+	DEF_DIV6P1("fray",	R8A779A0_CLK_FRAY,   CLK_PLL5_DIV4, 0x88c),
+	DEF_DIV6P1("post",	R8A779A0_CLK_POST,   CLK_PLL5_DIV4, 0x890),
+	DEF_DIV6P1("post2",	R8A779A0_CLK_POST2,  CLK_PLL5_DIV4, 0x894),
+	DEF_DIV6P1("post3",	R8A779A0_CLK_POST3,  CLK_PLL5_DIV4, 0x898),
+
+	DEF_R8A779A0_OSC("osc",	R8A779A0_CLK_OSCCLK, CLK_EXTAL,     8),
+	DEF_R8A779A0_MDSEL("r",	R8A779A0_CLK_RCLK, 29, CLK_EXTALR, 1, CLK_OCO, 1),
+};
+
+static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
+	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
+	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
+	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
+};
+
+static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
+};
+
+#define CPG_PLL20CR		0x0834
+#define CPG_PLL21CR		0x0838
+#define CPG_PLL30CR		0x083c
+#define CPG_PLL31CR		0x0840
+
+static spinlock_t cpg_lock;
+
+static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&cpg_lock, flags);
+	val = readl(reg);
+	val &= ~clear;
+	val |= set;
+	writel(val, reg);
+	spin_unlock_irqrestore(&cpg_lock, flags);
+};
+
+/*
+ * Z Clock & Z2 Clock
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is adjustable.  clk->rate = (parent->rate * mult / 32 ) / 2
+ * parent - fixed parent.  No clk_set_parent support
+ */
+#define CPG_FRQCRB			0x00000804
+#define CPG_FRQCRB_KICK			BIT(31)
+#define CPG_FRQCRC			0x00000808
+
+struct cpg_z_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+	void __iomem *kick_reg;
+	unsigned long mask;
+	unsigned int fixed_div;
+};
+
+#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
+
+static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	u32 val;
+
+	val = readl(zclk->reg) & zclk->mask;
+	mult = 32 - (val >> __ffs(zclk->mask));
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult,
+				     32 * zclk->fixed_div);
+}
+
+static int cpg_z_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int min_mult, max_mult, mult;
+	unsigned long prate;
+
+	prate = req->best_parent_rate / zclk->fixed_div;
+	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
+	max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
+	if (max_mult < min_mult)
+		return -EINVAL;
+
+	mult = div64_ul(req->rate * 32ULL, prate);
+	mult = clamp(mult, min_mult, max_mult);
+
+	req->rate = div_u64((u64)prate * mult, 32);
+	return 0;
+}
+
+static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	unsigned int i;
+
+	mult = DIV64_U64_ROUND_CLOSEST(rate * 32ULL * zclk->fixed_div,
+				       parent_rate);
+	mult = clamp(mult, 1U, 32U);
+
+	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+		return -EBUSY;
+
+	cpg_reg_modify(zclk->reg, zclk->mask,
+		       ((32 - mult) << __ffs(zclk->mask)) & zclk->mask);
+
+	/*
+	 * Set KICK bit in FRQCRB to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	cpg_reg_modify(zclk->kick_reg, 0, CPG_FRQCRB_KICK);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~10 iterations are needed, independently of the CPU rate.
+	 * Since this value might be dependent of external xtal rate, pll1
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	for (i = 1000; i; i--) {
+		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct clk_ops cpg_z_clk_ops = {
+	.recalc_rate = cpg_z_clk_recalc_rate,
+	.determine_rate = cpg_z_clk_determine_rate,
+	.set_rate = cpg_z_clk_set_rate,
+};
+
+static struct clk * __init cpg_z_clk_register(const char *name,
+					      const char *parent_name,
+					      void __iomem *reg,
+					      unsigned int div,
+					      unsigned int offset)
+{
+	struct clk_init_data init;
+	struct cpg_z_clk *zclk;
+	struct clk *clk;
+
+	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
+	if (!zclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_z_clk_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	zclk->reg = reg + CPG_FRQCRC;
+	zclk->kick_reg = reg + CPG_FRQCRB;
+	zclk->hw.init = &init;
+	zclk->mask = GENMASK(offset + 4, offset);
+	zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
+	clk = clk_register(NULL, &zclk->hw);
+	if (IS_ERR(clk))
+		kfree(zclk);
+
+	return clk;
+}
+
+static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
+static unsigned int cpg_clk_extalr __initdata;
+static u32 cpg_mode __initdata;
+
+struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	const struct clk *parent;
+	unsigned int mult = 1;
+	unsigned int div = 1;
+	u32 value;
+
+	parent = clks[core->parent & 0xffff];	/* some types use high bits */
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	switch (core->type) {
+	case CLK_TYPE_R8A779A0_MAIN:
+		div = cpg_pll_config->extal_div;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL1:
+		mult = cpg_pll_config->pll1_mult;
+		div = cpg_pll_config->pll1_div;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL20:
+		value = readl(base + CPG_PLL20CR);
+		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL21:
+		value = readl(base + CPG_PLL21CR);
+		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL30:
+		value = readl(base + CPG_PLL30CR);
+		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL31:
+		value = readl(base + CPG_PLL31CR);
+		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL5:
+		mult = cpg_pll_config->pll5_mult;
+		div = cpg_pll_config->pll5_div;
+		break;
+
+	case CLK_TYPE_R8A779A0_MDSEL:
+		/*
+		 * Clock selectable between two parents and two fixed dividers
+		 * using a mode pin
+		 */
+		if (cpg_mode & BIT(core->offset)) {
+			div = core->div & 0xffff;
+		} else {
+			parent = clks[core->parent >> 16];
+			if (IS_ERR(parent))
+				return ERR_CAST(parent);
+			div = core->div >> 16;
+		}
+		mult = 1;
+		break;
+
+	case CLK_TYPE_R8A779A0_Z:
+		return cpg_z_clk_register(core->name, __clk_get_name(parent),
+					  base, core->div, core->offset);
+
+	case CLK_TYPE_R8A779A0_OSC:
+		/*
+		 * Clock combining OSC EXTAL predivider and a fixed divider
+		 */
+		div = cpg_pll_config->osc_prediv * core->div;
+		break;
+
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	return clk_register_fixed_factor(NULL, core->name,
+					 __clk_get_name(parent), 0, mult, div);
+}
+
+/*
+ * CPG Clock Data
+ */
+/*
+ *   MD	 EXTAL		PLL1	PLL20	PLL30	PLL4	PLL5	PLL6	OSC
+ * 14 13 (MHz)			   21	   31
+ * --------------------------------------------------------
+ * 0  0	 16.66 x 1	x128	x216	x128	x144	x192	x128	/16
+ * 0  1	 20    x 1	x106	x180	x106	x120	x160	x106	/19
+ * 1  0	 Prohibited setting
+ * 1  1	 33.33 / 2	x128	x216	x128	x144	x192	x128	/32
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
+					 (((md) & BIT(13)) >> 13))
+
+static const struct rcar_r8a779a0_cpg_pll_config cpg_pll_configs[4] = {
+	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
+	{ 1,		128,	1,	192,	1,	16,	},
+	{ 1,		106,	1,	160,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	},
+	{ 2,		128,	1,	192,	1,	32,	},
+};
+
+static int __init r8a779a0_cpg_mssr_init(struct device *dev)
+{
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	cpg_clk_extalr = CLK_EXTALR;
+	spin_lock_init(&cpg_lock);
+
+	return 0;
+}
+
+const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a779a0_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a779a0_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a779a0_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a779a0_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a779a0_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a779a0_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a779a0_cpg_mssr_init,
+	.cpg_clk_register = rcar_r8a779a0_cpg_clk_register,
+
+	/* The device has only MSTP Control Register */
+	.mstpctrl = true,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5a306d2..c259e05 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -57,8 +57,14 @@ static const u16 mstpsr[] = {
 	0x9A0, 0x9A4, 0x9A8, 0x9AC,
 };
 
-#define	MSTPSR(i)	mstpsr[i]
+static const u16 mstpsr_mstpcr_only[] = {
+	0x2E00, 0x2E04, 0x2E08, 0x2E0C, 0x2E10, 0x2E14, 0x2E18, 0x2E1C,
+	0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38,
+};
+
+static bool mstpcr_only;
 
+#define	MSTPSR(i)	(mstpcr_only ? mstpsr_mstpcr_only[i] : mstpsr[i])
 
 /*
  * System Module Stop Control Register offsets
@@ -69,7 +75,8 @@ static const u16 smstpcr[] = {
 	0x990, 0x994, 0x998, 0x99C,
 };
 
-#define	SMSTPCR(i)	smstpcr[i]
+#define	SMSTPCR(i)	(mstpcr_only ? (mstpsr_mstpcr_only[i] - 0x100) : \
+			 smstpcr[i])
 
 /*
  * Standby Control Register offsets (RZ/A)
@@ -140,7 +147,7 @@ struct cpg_mssr_priv {
 	struct {
 		u32 mask;
 		u32 val;
-	} smstpcr_saved[ARRAY_SIZE(smstpcr)];
+	} smstpcr_saved[ARRAY_SIZE(mstpsr_mstpcr_only)];
 
 	struct clk *clks[];
 };
@@ -804,6 +811,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a77995_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A779A0
+	{
+		.compatible = "renesas,r8a779a0-cpg-mssr",
+		.data = &r8a779a0_cpg_mssr_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
@@ -938,6 +951,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
 	priv->stbyctrl = info->stbyctrl;
+	mstpcr_only = info->mstpctrl;
 
 	for (i = 0; i < nclks; i++)
 		priv->clks[i] = ERR_PTR(-ENOENT);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 1cc5694..061eb83 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -131,6 +131,7 @@ struct cpg_mssr_info {
 	unsigned int last_dt_core_clk;
 	unsigned int num_total_core_clks;
 	bool stbyctrl;
+	bool mstpctrl;
 
 	/* Module Clocks */
 	const struct mssr_mod_clk *mod_clks;
@@ -174,6 +175,7 @@ extern const struct cpg_mssr_info r8a77970_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77980_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.7.4

