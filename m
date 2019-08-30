Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8486A38BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 16:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfH3OEf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 10:04:35 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:52066 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfH3OEf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 10:04:35 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id vS4T2000205gfCL01S4Tlu; Fri, 30 Aug 2019 16:04:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIB-0003KX-1t; Fri, 30 Aug 2019 15:50:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3h4b-0002wZ-6q; Fri, 30 Aug 2019 15:36:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Remove R-Car Gen2 legacy DT clock support
Date:   Fri, 30 Aug 2019 15:36:15 +0200
Message-Id: <20190830133615.11274-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 362b334b17943d84 ("ARM: dts: r8a7791: Convert to new
CPG/MSSR bindings"), all upstream R-Car Gen2 device tree source files
use the unified "Renesas Clock Pulse Generator / Module Standby and
Software Reset" DT bindings.

Hence remove backward compatibility with old R-Car Gen2 device trees
describing a hierarchical representation of the various CPG and MSTP
clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.5.

The abovementioned commit was part of the v4.15 release.
The conversion was backported to v4.14.75-ltsi, and included in any
R-Car BSP based on v4.14 (rcar-3.6.0 and later).
---
 drivers/clk/renesas/Kconfig         |  20 --
 drivers/clk/renesas/Makefile        |   1 -
 drivers/clk/renesas/clk-rcar-gen2.c | 457 ----------------------------
 3 files changed, 478 deletions(-)
 delete mode 100644 drivers/clk/renesas/clk-rcar-gen2.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index b879e3e3a6b426ae..afca67f7e27ace2d 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -31,17 +31,6 @@ config CLK_RENESAS
 
 if CLK_RENESAS
 
-config CLK_RENESAS_LEGACY
-	bool "Legacy DT clock support"
-	depends on CLK_R8A7790 || CLK_R8A7791 || CLK_R8A7792 || CLK_R8A7794
-	help
-	  Enable backward compatibility with old device trees describing a
-	  hierarchical representation of the various CPG and MSTP clocks.
-
-	  Say Y if you want your kernel to work with old DTBs.
-	  It is safe to say N if you use the DTS that is supplied with the
-	  current kernel source tree.
-
 # SoC
 config CLK_EMEV2
 	bool "Emma Mobile EV2 clock support" if COMPILE_TEST
@@ -94,24 +83,20 @@ config CLK_R8A7779
 
 config CLK_R8A7790
 	bool "R-Car H2 clock support" if COMPILE_TEST
-	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7791
 	bool "R-Car M2-W/N clock support" if COMPILE_TEST
-	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7792
 	bool "R-Car V2H clock support" if COMPILE_TEST
-	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 
 config CLK_R8A7794
 	bool "R-Car E2 clock support" if COMPILE_TEST
-	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_DIV6
 
@@ -155,11 +140,6 @@ config CLK_SH73A0
 
 
 # Family
-config CLK_RCAR_GEN2
-	bool "R-Car Gen2 legacy clock support" if COMPILE_TEST
-	select CLK_RENESAS_CPG_MSTP
-	select CLK_RENESAS_DIV6
-
 config CLK_RCAR_GEN2_CPG
 	bool "R-Car Gen2 CPG clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index c793e3cc9452af5f..eab3af2539c72684 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
-obj-$(CONFIG_CLK_RCAR_GEN2)		+= clk-rcar-gen2.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
deleted file mode 100644
index da9fe3f032eb2a0d..0000000000000000
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ /dev/null
@@ -1,457 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * rcar_gen2 Core CPG Clocks
- *
- * Copyright (C) 2013  Ideas On Board SPRL
- *
- * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/clk/renesas.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/math64.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/soc/renesas/rcar-rst.h>
-
-struct rcar_gen2_cpg {
-	struct clk_onecell_data data;
-	spinlock_t lock;
-	void __iomem *reg;
-};
-
-#define CPG_FRQCRB			0x00000004
-#define CPG_FRQCRB_KICK			BIT(31)
-#define CPG_SDCKCR			0x00000074
-#define CPG_PLL0CR			0x000000d8
-#define CPG_FRQCRC			0x000000e0
-#define CPG_FRQCRC_ZFC_MASK		(0x1f << 8)
-#define CPG_FRQCRC_ZFC_SHIFT		8
-#define CPG_ADSPCKCR			0x0000025c
-#define CPG_RCANCKCR			0x00000270
-
-/* -----------------------------------------------------------------------------
- * Z Clock
- *
- * Traits of this clock:
- * prepare - clk_prepare only ensures that parents are prepared
- * enable - clk_enable only ensures that parents are enabled
- * rate - rate is adjustable.  clk->rate = parent->rate * mult / 32
- * parent - fixed parent.  No clk_set_parent support
- */
-
-struct cpg_z_clk {
-	struct clk_hw hw;
-	void __iomem *reg;
-	void __iomem *kick_reg;
-};
-
-#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
-
-static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
-					   unsigned long parent_rate)
-{
-	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int mult;
-	unsigned int val;
-
-	val = (readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK) >> CPG_FRQCRC_ZFC_SHIFT;
-	mult = 32 - val;
-
-	return div_u64((u64)parent_rate * mult, 32);
-}
-
-static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
-{
-	unsigned long prate  = *parent_rate;
-	unsigned int mult;
-
-	if (!prate)
-		prate = 1;
-
-	mult = div_u64((u64)rate * 32, prate);
-	mult = clamp(mult, 1U, 32U);
-
-	return *parent_rate / 32 * mult;
-}
-
-static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long parent_rate)
-{
-	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int mult;
-	u32 val, kick;
-	unsigned int i;
-
-	mult = div_u64((u64)rate * 32, parent_rate);
-	mult = clamp(mult, 1U, 32U);
-
-	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
-		return -EBUSY;
-
-	val = readl(zclk->reg);
-	val &= ~CPG_FRQCRC_ZFC_MASK;
-	val |= (32 - mult) << CPG_FRQCRC_ZFC_SHIFT;
-	writel(val, zclk->reg);
-
-	/*
-	 * Set KICK bit in FRQCRB to update hardware setting and wait for
-	 * clock change completion.
-	 */
-	kick = readl(zclk->kick_reg);
-	kick |= CPG_FRQCRB_KICK;
-	writel(kick, zclk->kick_reg);
-
-	/*
-	 * Note: There is no HW information about the worst case latency.
-	 *
-	 * Using experimental measurements, it seems that no more than
-	 * ~10 iterations are needed, independently of the CPU rate.
-	 * Since this value might be dependent on external xtal rate, pll1
-	 * rate or even the other emulation clocks rate, use 1000 as a
-	 * "super" safe value.
-	 */
-	for (i = 1000; i; i--) {
-		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
-			return 0;
-
-		cpu_relax();
-	}
-
-	return -ETIMEDOUT;
-}
-
-static const struct clk_ops cpg_z_clk_ops = {
-	.recalc_rate = cpg_z_clk_recalc_rate,
-	.round_rate = cpg_z_clk_round_rate,
-	.set_rate = cpg_z_clk_set_rate,
-};
-
-static struct clk * __init cpg_z_clk_register(struct rcar_gen2_cpg *cpg)
-{
-	static const char *parent_name = "pll0";
-	struct clk_init_data init;
-	struct cpg_z_clk *zclk;
-	struct clk *clk;
-
-	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
-	if (!zclk)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = "z";
-	init.ops = &cpg_z_clk_ops;
-	init.flags = 0;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
-
-	zclk->reg = cpg->reg + CPG_FRQCRC;
-	zclk->kick_reg = cpg->reg + CPG_FRQCRB;
-	zclk->hw.init = &init;
-
-	clk = clk_register(NULL, &zclk->hw);
-	if (IS_ERR(clk))
-		kfree(zclk);
-
-	return clk;
-}
-
-static struct clk * __init cpg_rcan_clk_register(struct rcar_gen2_cpg *cpg,
-						 struct device_node *np)
-{
-	const char *parent_name = of_clk_get_parent_name(np, 1);
-	struct clk_fixed_factor *fixed;
-	struct clk_gate *gate;
-	struct clk *clk;
-
-	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
-	if (!fixed)
-		return ERR_PTR(-ENOMEM);
-
-	fixed->mult = 1;
-	fixed->div = 6;
-
-	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-	if (!gate) {
-		kfree(fixed);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	gate->reg = cpg->reg + CPG_RCANCKCR;
-	gate->bit_idx = 8;
-	gate->flags = CLK_GATE_SET_TO_DISABLE;
-	gate->lock = &cpg->lock;
-
-	clk = clk_register_composite(NULL, "rcan", &parent_name, 1, NULL, NULL,
-				     &fixed->hw, &clk_fixed_factor_ops,
-				     &gate->hw, &clk_gate_ops, 0);
-	if (IS_ERR(clk)) {
-		kfree(gate);
-		kfree(fixed);
-	}
-
-	return clk;
-}
-
-/* ADSP divisors */
-static const struct clk_div_table cpg_adsp_div_table[] = {
-	{  1,  3 }, {  2,  4 }, {  3,  6 }, {  4,  8 },
-	{  5, 12 }, {  6, 16 }, {  7, 18 }, {  8, 24 },
-	{ 10, 36 }, { 11, 48 }, {  0,  0 },
-};
-
-static struct clk * __init cpg_adsp_clk_register(struct rcar_gen2_cpg *cpg)
-{
-	const char *parent_name = "pll1";
-	struct clk_divider *div;
-	struct clk_gate *gate;
-	struct clk *clk;
-
-	div = kzalloc(sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
-	div->reg = cpg->reg + CPG_ADSPCKCR;
-	div->width = 4;
-	div->table = cpg_adsp_div_table;
-	div->lock = &cpg->lock;
-
-	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-	if (!gate) {
-		kfree(div);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	gate->reg = cpg->reg + CPG_ADSPCKCR;
-	gate->bit_idx = 8;
-	gate->flags = CLK_GATE_SET_TO_DISABLE;
-	gate->lock = &cpg->lock;
-
-	clk = clk_register_composite(NULL, "adsp", &parent_name, 1, NULL, NULL,
-				     &div->hw, &clk_divider_ops,
-				     &gate->hw, &clk_gate_ops, 0);
-	if (IS_ERR(clk)) {
-		kfree(gate);
-		kfree(div);
-	}
-
-	return clk;
-}
-
-/* -----------------------------------------------------------------------------
- * CPG Clock Data
- */
-
-/*
- *   MD		EXTAL		PLL0	PLL1	PLL3
- * 14 13 19	(MHz)		*1	*1
- *---------------------------------------------------
- * 0  0  0	15 x 1		x172/2	x208/2	x106
- * 0  0  1	15 x 1		x172/2	x208/2	x88
- * 0  1  0	20 x 1		x130/2	x156/2	x80
- * 0  1  1	20 x 1		x130/2	x156/2	x66
- * 1  0  0	26 / 2		x200/2	x240/2	x122
- * 1  0  1	26 / 2		x200/2	x240/2	x102
- * 1  1  0	30 / 2		x172/2	x208/2	x106
- * 1  1  1	30 / 2		x172/2	x208/2	x88
- *
- * *1 :	Table 7.6 indicates VCO output (PLLx = VCO/2)
- */
-#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 12) | \
-					 (((md) & BIT(13)) >> 12) | \
-					 (((md) & BIT(19)) >> 19))
-struct cpg_pll_config {
-	unsigned int extal_div;
-	unsigned int pll1_mult;
-	unsigned int pll3_mult;
-	unsigned int pll0_mult;		/* For R-Car V2H and E2 only */
-};
-
-static const struct cpg_pll_config cpg_pll_configs[8] __initconst = {
-	{ 1, 208, 106, 200 }, { 1, 208,  88, 200 },
-	{ 1, 156,  80, 150 }, { 1, 156,  66, 150 },
-	{ 2, 240, 122, 230 }, { 2, 240, 102, 230 },
-	{ 2, 208, 106, 200 }, { 2, 208,  88, 200 },
-};
-
-/* SDHI divisors */
-static const struct clk_div_table cpg_sdh_div_table[] = {
-	{  0,  2 }, {  1,  3 }, {  2,  4 }, {  3,  6 },
-	{  4,  8 }, {  5, 12 }, {  6, 16 }, {  7, 18 },
-	{  8, 24 }, { 10, 36 }, { 11, 48 }, {  0,  0 },
-};
-
-static const struct clk_div_table cpg_sd01_div_table[] = {
-	{  4,  8 },
-	{  5, 12 }, {  6, 16 }, {  7, 18 }, {  8, 24 },
-	{ 10, 36 }, { 11, 48 }, { 12, 10 }, {  0,  0 },
-};
-
-/* -----------------------------------------------------------------------------
- * Initialization
- */
-
-static u32 cpg_mode __initdata;
-
-static const char * const pll0_mult_match[] = {
-	"renesas,r8a7792-cpg-clocks",
-	"renesas,r8a7794-cpg-clocks",
-	NULL
-};
-
-static struct clk * __init
-rcar_gen2_cpg_register_clock(struct device_node *np, struct rcar_gen2_cpg *cpg,
-			     const struct cpg_pll_config *config,
-			     const char *name)
-{
-	const struct clk_div_table *table = NULL;
-	const char *parent_name;
-	unsigned int shift;
-	unsigned int mult = 1;
-	unsigned int div = 1;
-
-	if (!strcmp(name, "main")) {
-		parent_name = of_clk_get_parent_name(np, 0);
-		div = config->extal_div;
-	} else if (!strcmp(name, "pll0")) {
-		/* PLL0 is a configurable multiplier clock. Register it as a
-		 * fixed factor clock for now as there's no generic multiplier
-		 * clock implementation and we currently have no need to change
-		 * the multiplier value.
-		 */
-		if (of_device_compatible_match(np, pll0_mult_match)) {
-			/* R-Car V2H and E2 do not have PLL0CR */
-			mult = config->pll0_mult;
-			div = 3;
-		} else {
-			u32 value = readl(cpg->reg + CPG_PLL0CR);
-			mult = ((value >> 24) & ((1 << 7) - 1)) + 1;
-		}
-		parent_name = "main";
-	} else if (!strcmp(name, "pll1")) {
-		parent_name = "main";
-		mult = config->pll1_mult / 2;
-	} else if (!strcmp(name, "pll3")) {
-		parent_name = "main";
-		mult = config->pll3_mult;
-	} else if (!strcmp(name, "lb")) {
-		parent_name = "pll1";
-		div = cpg_mode & BIT(18) ? 36 : 24;
-	} else if (!strcmp(name, "qspi")) {
-		parent_name = "pll1_div2";
-		div = (cpg_mode & (BIT(3) | BIT(2) | BIT(1))) == BIT(2)
-		    ? 8 : 10;
-	} else if (!strcmp(name, "sdh")) {
-		parent_name = "pll1";
-		table = cpg_sdh_div_table;
-		shift = 8;
-	} else if (!strcmp(name, "sd0")) {
-		parent_name = "pll1";
-		table = cpg_sd01_div_table;
-		shift = 4;
-	} else if (!strcmp(name, "sd1")) {
-		parent_name = "pll1";
-		table = cpg_sd01_div_table;
-		shift = 0;
-	} else if (!strcmp(name, "z")) {
-		return cpg_z_clk_register(cpg);
-	} else if (!strcmp(name, "rcan")) {
-		return cpg_rcan_clk_register(cpg, np);
-	} else if (!strcmp(name, "adsp")) {
-		return cpg_adsp_clk_register(cpg);
-	} else {
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (!table)
-		return clk_register_fixed_factor(NULL, name, parent_name, 0,
-						 mult, div);
-	else
-		return clk_register_divider_table(NULL, name, parent_name, 0,
-						 cpg->reg + CPG_SDCKCR, shift,
-						 4, 0, table, &cpg->lock);
-}
-
-/*
- * Reset register definitions.
- */
-#define MODEMR	0xe6160060
-
-static u32 __init rcar_gen2_read_mode_pins(void)
-{
-	void __iomem *modemr = ioremap_nocache(MODEMR, 4);
-	u32 mode;
-
-	BUG_ON(!modemr);
-	mode = ioread32(modemr);
-	iounmap(modemr);
-
-	return mode;
-}
-
-static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
-{
-	const struct cpg_pll_config *config;
-	struct rcar_gen2_cpg *cpg;
-	struct clk **clks;
-	unsigned int i;
-	int num_clks;
-
-	if (rcar_rst_read_mode_pins(&cpg_mode)) {
-		/* Backward-compatibility with old DT */
-		pr_warn("%pOF: failed to obtain mode pins from RST\n", np);
-		cpg_mode = rcar_gen2_read_mode_pins();
-	}
-
-	num_clks = of_property_count_strings(np, "clock-output-names");
-	if (num_clks < 0) {
-		pr_err("%s: failed to count clocks\n", __func__);
-		return;
-	}
-
-	cpg = kzalloc(sizeof(*cpg), GFP_KERNEL);
-	clks = kcalloc(num_clks, sizeof(*clks), GFP_KERNEL);
-	if (cpg == NULL || clks == NULL) {
-		/* We're leaking memory on purpose, there's no point in cleaning
-		 * up as the system won't boot anyway.
-		 */
-		return;
-	}
-
-	spin_lock_init(&cpg->lock);
-
-	cpg->data.clks = clks;
-	cpg->data.clk_num = num_clks;
-
-	cpg->reg = of_iomap(np, 0);
-	if (WARN_ON(cpg->reg == NULL))
-		return;
-
-	config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
-
-	for (i = 0; i < num_clks; ++i) {
-		const char *name;
-		struct clk *clk;
-
-		of_property_read_string_index(np, "clock-output-names", i,
-					      &name);
-
-		clk = rcar_gen2_cpg_register_clock(np, cpg, config, name);
-		if (IS_ERR(clk))
-			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
-			       __func__, np, name, PTR_ERR(clk));
-		else
-			cpg->data.clks[i] = clk;
-	}
-
-	of_clk_add_provider(np, of_clk_src_onecell_get, &cpg->data);
-
-	cpg_mstp_add_clk_domain(np);
-}
-CLK_OF_DECLARE(rcar_gen2_cpg_clks, "renesas,rcar-gen2-cpg-clocks",
-	       rcar_gen2_cpg_clocks_init);
-- 
2.17.1

