Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0B93A19CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbhFIPfb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:35:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:54523 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237438AbhFIPfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:35:19 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83886989"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jun 2021 00:33:23 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EA356400911A;
        Thu, 10 Jun 2021 00:33:19 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 08/11] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Date:   Wed,  9 Jun 2021 16:32:27 +0100
Message-Id: <20210609153230.6967-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CPG core wrapper for RZ/G2L family.

Based on a patch in the BSP by Binh Nguyen
<binh.nguyen.jz@renesas.com>.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 744 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.h | 134 +++++
 4 files changed, 884 insertions(+)
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 607e64a17d72..a067428cb7af 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -182,6 +182,11 @@ config CLK_RCAR_USB2_CLOCK_SEL
 	help
 	  This is a driver for R-Car USB2 clock selector
 
+config CLK_RZG2L
+	bool "Renesas RZ/G2L SoC clock support" if COMPILE_TEST && !ARCH_RENESAS
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select RESET_CONTROLLER
+
 # Generic
 config CLK_RENESAS_CPG_MSSR
 	bool "CPG/MSSR clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index ef0d2bba92bf..a9c299686b4a 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+= rcar-cpg-lib.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
+obj-$(CONFIG_CLK_RZG2L)			+= renesas-rzg2l-cpg.o
 
 # Generic
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
new file mode 100644
index 000000000000..9e860d55c916
--- /dev/null
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -0,0 +1,744 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G2L Clock Pulse Generator
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Based on renesas-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ * Copyright (C) 2013 Ideas On Board SPRL
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+#include "renesas-rzg2l-cpg.h"
+
+#ifdef DEBUG
+#define WARN_DEBUG(x)	WARN_ON(x)
+#else
+#define WARN_DEBUG(x)	do { } while (0)
+#endif
+
+#define DIV_RSMASK(v, s, m)	((v >> s) & m)
+#define GET_SHIFT(val)		((val >> 12) & 0xff)
+#define GET_WIDTH(val)		((val >> 8) & 0xf)
+
+#define KDIV(val)		DIV_RSMASK(val, 16, 0xffff)
+#define MDIV(val)		DIV_RSMASK(val, 6, 0x3ff)
+#define PDIV(val)		DIV_RSMASK(val, 0, 0x3f)
+#define SDIV(val)		DIV_RSMASK(val, 0, 0x7)
+
+#define CLK_ON_R(reg)		(reg)
+#define CLK_MON_R(reg)		(0x680 - 0x500 + (reg))
+#define CLK_RST_R(reg)		(0x800 - 0x500 + (reg))
+#define CLK_MRST_R(reg)		(0x980 - 0x500 + (reg))
+
+#define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
+#define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
+#define GET_REG_SAMPLL_CLK2(val)	((val >> 12) & 0xfff)
+
+/**
+ * struct rzg2l_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @rcdev: Reset controller entity
+ * @dev: CPG device
+ * @base: CPG register block base address
+ * @rmw_lock: protects register accesses
+ * @clks: Array containing all Core and Module Clocks
+ * @num_core_clks: Number of Core Clocks in clks[]
+ * @num_mod_clks: Number of Module Clocks in clks[]
+ * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @notifiers: Notifier chain to save/restore clock state for system resume
+ * @info: Pointer to platform data
+ */
+struct rzg2l_cpg_priv {
+	struct reset_controller_dev rcdev;
+	struct device *dev;
+	void __iomem *base;
+	spinlock_t rmw_lock;
+
+	struct clk **clks;
+	unsigned int num_core_clks;
+	unsigned int num_mod_clks;
+	unsigned int last_dt_core_clk;
+
+	struct raw_notifier_head notifiers;
+	const struct rzg2l_cpg_info *info;
+};
+
+static void rzg2l_cpg_del_clk_provider(void *data)
+{
+	of_clk_del_provider(data);
+}
+
+static struct clk * __init
+rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
+			   struct clk **clks,
+			   void __iomem *base,
+			   struct rzg2l_cpg_priv *priv)
+{
+	struct device *dev = priv->dev;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+
+	parent = clks[core->parent & 0xffff];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+
+	if (core->dtable)
+		clk_hw = clk_hw_register_divider_table(dev, core->name,
+						       parent_name, 0,
+						       base + GET_REG_OFFSET(core->conf),
+						       GET_SHIFT(core->conf),
+						       GET_WIDTH(core->conf),
+						       core->flag,
+						       core->dtable,
+						       &priv->rmw_lock);
+	else
+		clk_hw = clk_hw_register_divider(dev, core->name,
+						 parent_name, 0,
+						 base + GET_REG_OFFSET(core->conf),
+						 GET_SHIFT(core->conf),
+						 GET_WIDTH(core->conf),
+						 core->flag, &priv->rmw_lock);
+
+	if (IS_ERR(clk_hw))
+		return NULL;
+
+	return clk_hw->clk;
+}
+
+struct pll_clk {
+	struct clk_hw hw;
+	unsigned int conf;
+	unsigned int type;
+	void __iomem *base;
+	struct rzg2l_cpg_priv *priv;
+};
+
+#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
+
+static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	unsigned int val1, val2;
+	unsigned int mult = 1;
+	unsigned int div = 1;
+
+	if (pll_clk->type != CLK_TYPE_SAM_PLL)
+		return parent_rate;
+
+	val1 = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
+	val2 = readl(priv->base + GET_REG_SAMPLL_CLK2(pll_clk->conf));
+	mult = MDIV(val1) + KDIV(val1) / 65536;
+	div = PDIV(val1) * (1 << SDIV(val2));
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult, div);
+}
+
+static const struct clk_ops rzg2l_cpg_pll_ops = {
+	.recalc_rate = rzg2l_cpg_pll_clk_recalc_rate,
+};
+
+static struct clk * __init
+rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
+			   struct clk **clks,
+			   void __iomem *base,
+			   struct rzg2l_cpg_priv *priv)
+{
+	struct device *dev = priv->dev;
+	const struct clk *parent;
+	struct clk_init_data init;
+	const char *parent_name;
+	struct pll_clk *pll_clk;
+	struct clk *clk;
+
+	parent = clks[core->parent & 0xffff];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk) {
+		clk = ERR_PTR(-ENOMEM);
+		return NULL;
+	}
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzg2l_cpg_pll_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	pll_clk->hw.init = &init;
+	pll_clk->conf = core->conf;
+	pll_clk->base = base;
+	pll_clk->priv = priv;
+	pll_clk->type = core->type;
+
+	clk = clk_register(NULL, &pll_clk->hw);
+	if (IS_ERR(clk))
+		kfree(pll_clk);
+
+	return clk;
+}
+
+static struct clk
+*rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
+			       void *data)
+{
+	unsigned int clkidx = clkspec->args[1];
+	struct rzg2l_cpg_priv *priv = data;
+	struct device *dev = priv->dev;
+	const char *type;
+	struct clk *clk;
+
+	switch (clkspec->args[0]) {
+	case CPG_CORE:
+		type = "core";
+		if (clkidx > priv->last_dt_core_clk) {
+			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
+			return ERR_PTR(-EINVAL);
+		}
+		clk = priv->clks[clkidx];
+		break;
+
+	case CPG_MOD:
+		type = "module";
+		if (clkidx > priv->num_core_clks + priv->num_mod_clks) {
+			dev_err(dev, "Invalid %s clock index %u\n", type,
+				clkidx);
+			return ERR_PTR(-EINVAL);
+		}
+		clk = priv->clks[priv->num_core_clks + clkidx];
+		break;
+
+	default:
+		dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (IS_ERR(clk))
+		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
+			PTR_ERR(clk));
+	else
+		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
+			clkspec->args[0], clkspec->args[1], clk,
+			clk_get_rate(clk));
+	return clk;
+}
+
+static void __init
+rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
+			    const struct rzg2l_cpg_info *info,
+			    struct rzg2l_cpg_priv *priv)
+{
+	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
+	struct device *dev = priv->dev;
+	unsigned int id = core->id, div = core->div;
+	const char *parent_name;
+
+	WARN_DEBUG(id >= priv->num_core_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
+
+	if (!core->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
+	switch (core->type) {
+	case CLK_TYPE_IN:
+		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
+		break;
+	case CLK_TYPE_FF:
+		WARN_DEBUG(core->parent >= priv->num_core_clks);
+		parent = priv->clks[core->parent];
+		if (IS_ERR(parent)) {
+			clk = parent;
+			goto fail;
+		}
+
+		parent_name = __clk_get_name(parent);
+		clk = clk_register_fixed_factor(NULL, core->name,
+						parent_name, CLK_SET_RATE_PARENT,
+						core->mult, div);
+		break;
+	case CLK_TYPE_SAM_PLL:
+		clk = rzg2l_cpg_pll_clk_register(core, priv->clks,
+						 priv->base, priv);
+		break;
+	case CLK_TYPE_DIV:
+		clk = rzg2l_cpg_div_clk_register(core, priv->clks,
+						 priv->base, priv);
+		break;
+	default:
+		goto fail;
+	};
+
+	if (IS_ERR_OR_NULL(clk))
+		goto fail;
+
+	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+	return;
+
+fail:
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
+		core->name, PTR_ERR(clk));
+}
+
+/**
+ * struct mstp_clock - MSTP gating clock
+ *
+ * @hw: handle between common and hardware-specific interfaces
+ * @off: register offset
+ * @onoff: ON/MON bits
+ * @reset: reset bits
+ * @priv: CPG/MSTP private data
+ */
+struct mstp_clock {
+	struct clk_hw hw;
+	u16 off;
+	u8 onoff;
+	u8 reset;
+	struct rzg2l_cpg_priv *priv;
+};
+
+#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
+
+static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
+{
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	unsigned int reg = clock->off;
+	struct device *dev = priv->dev;
+	unsigned long flags;
+	unsigned int i;
+	u32 value;
+
+	if (!clock->off) {
+		dev_dbg(dev, "%pC does not support ON/OFF\n",  hw->clk);
+		return 0;
+	}
+
+	dev_dbg(dev, "CLK_ON %u/%pC %s\n", CLK_ON_R(reg), hw->clk,
+		enable ? "ON" : "OFF");
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+
+	if (enable)
+		value = (clock->onoff << 16) | clock->onoff;
+	else
+		value = clock->onoff << 16;
+	writel(value, priv->base + CLK_ON_R(reg));
+
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+
+	if (!enable)
+		return 0;
+
+	for (i = 1000; i > 0; --i) {
+		if (((readl(priv->base + CLK_MON_R(reg))) & clock->onoff))
+			break;
+		cpu_relax();
+	}
+
+	if (!i) {
+		dev_err(dev, "Failed to enable CLK_ON %p\n",
+			priv->base + CLK_ON_R(reg));
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int rzg2l_mod_clock_enable(struct clk_hw *hw)
+{
+	return rzg2l_mod_clock_endisable(hw, true);
+}
+
+static void rzg2l_mod_clock_disable(struct clk_hw *hw)
+{
+	rzg2l_mod_clock_endisable(hw, false);
+}
+
+static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
+{
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	u32 value;
+
+	if (!clock->off) {
+		dev_dbg(priv->dev, "%pC does not support ON/OFF\n",  hw->clk);
+		return 1;
+	}
+
+	value = readl(priv->base + CLK_MON_R(clock->off));
+
+	return !(value & clock->onoff);
+}
+
+static const struct clk_ops rzg2l_mod_clock_ops = {
+	.enable = rzg2l_mod_clock_enable,
+	.disable = rzg2l_mod_clock_disable,
+	.is_enabled = rzg2l_mod_clock_is_enabled,
+};
+
+static void __init
+rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
+			   const struct rzg2l_cpg_info *info,
+			   struct rzg2l_cpg_priv *priv)
+{
+	struct mstp_clock *clock = NULL;
+	struct device *dev = priv->dev;
+	unsigned int id = mod->id;
+	struct clk_init_data init;
+	struct clk *parent, *clk;
+	const char *parent_name;
+	unsigned int i;
+
+	WARN_DEBUG(id < priv->num_core_clks);
+	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
+	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
+
+	if (!mod->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
+	parent = priv->clks[mod->parent];
+	if (IS_ERR(parent)) {
+		clk = parent;
+		goto fail;
+	}
+
+	clock = devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
+	if (!clock) {
+		clk = ERR_PTR(-ENOMEM);
+		goto fail;
+	}
+
+	init.name = mod->name;
+	init.ops = &rzg2l_mod_clock_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	for (i = 0; i < info->num_crit_mod_clks; i++)
+		if (id == info->crit_mod_clks[i]) {
+			dev_dbg(dev, "CPG %s setting CLK_IS_CRITICAL\n",
+				mod->name);
+			init.flags |= CLK_IS_CRITICAL;
+			break;
+		}
+
+	parent_name = __clk_get_name(parent);
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clock->off = mod->off;
+	clock->onoff = mod->onoff;
+	clock->reset = mod->reset;
+	clock->priv = priv;
+	clock->hw.init = &init;
+
+	clk = clk_register(NULL, &clock->hw);
+	if (IS_ERR(clk))
+		goto fail;
+
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+	return;
+
+fail:
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
+		mod->name, PTR_ERR(clk));
+	kfree(clock);
+}
+
+#define rcdev_to_priv(x)	container_of(x, struct rzg2l_cpg_priv, rcdev)
+
+static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzg2l_cpg_info *info = priv->info;
+	unsigned int reg = info->mod_clks[id].off;
+	u32 dis = info->mod_clks[id].reset;
+	u32 we = dis << 16;
+
+	dev_dbg(rcdev->dev, "reset name:%s id:%ld offset:0x%x\n",
+		info->mod_clks[id].name, id, CLK_RST_R(reg));
+
+	/* Reset module */
+	writel(we, priv->base + CLK_RST_R(reg));
+
+	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
+	udelay(35);
+
+	/* Release module from reset state */
+	writel(we | dis, priv->base + CLK_RST_R(reg));
+
+	return 0;
+}
+
+static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzg2l_cpg_info *info = priv->info;
+	unsigned int reg = info->mod_clks[id].off;
+	u32 value = info->mod_clks[id].reset << 16;
+
+	dev_dbg(rcdev->dev, "assert name:%s id:%ld offset:0x%x\n",
+		info->mod_clks[id].name, id, CLK_RST_R(reg));
+
+	writel(value, priv->base + CLK_RST_R(reg));
+	return 0;
+}
+
+static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzg2l_cpg_info *info = priv->info;
+	unsigned int reg = info->mod_clks[id].off;
+	u32 dis = info->mod_clks[id].reset;
+	u32 value = (dis << 16) | dis;
+
+	dev_dbg(rcdev->dev, "deassert name:%s id:%ld offset:0x%x\n",
+		info->mod_clks[id].name, id, CLK_RST_R(reg));
+
+	writel(value, priv->base + CLK_RST_R(reg));
+	return 0;
+}
+
+static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzg2l_cpg_info *info = priv->info;
+	unsigned int reg = info->mod_clks[id].off;
+	u32 bitmask = info->mod_clks[id].reset;
+
+	return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+}
+
+static const struct reset_control_ops rzg2l_cpg_reset_ops = {
+	.reset = rzg2l_cpg_reset,
+	.assert = rzg2l_cpg_assert,
+	.deassert = rzg2l_cpg_deassert,
+	.status = rzg2l_cpg_status,
+};
+
+static int rzg2l_cpg_reset_xlate(struct reset_controller_dev *rcdev,
+				 const struct of_phandle_args *reset_spec)
+{
+	unsigned int id = reset_spec->args[0];
+
+	if (id >= rcdev->nr_resets) {
+		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
+		return -EINVAL;
+	}
+
+	return id;
+}
+
+static int rzg2l_cpg_reset_controller_register(struct rzg2l_cpg_priv *priv)
+{
+	priv->rcdev.ops = &rzg2l_cpg_reset_ops;
+	priv->rcdev.of_node = priv->dev->of_node;
+	priv->rcdev.dev = priv->dev;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.of_xlate = rzg2l_cpg_reset_xlate;
+	priv->rcdev.nr_resets = priv->num_mod_clks;
+
+	return devm_reset_controller_register(priv->dev, &priv->rcdev);
+}
+
+static bool rzg2l_cpg_is_pm_clk(const struct of_phandle_args *clkspec)
+{
+	if (clkspec->args_count != 2)
+		return false;
+
+	switch (clkspec->args[0]) {
+	case CPG_MOD:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static int rzg2l_cpg_attach_dev(struct generic_pm_domain *unused, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args clkspec;
+	struct clk *clk;
+	int error;
+	int i = 0;
+
+	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
+					   &clkspec)) {
+		if (rzg2l_cpg_is_pm_clk(&clkspec))
+			goto found;
+
+		of_node_put(clkspec.np);
+		i++;
+	}
+
+	return 0;
+
+found:
+	clk = of_clk_get_from_provider(&clkspec);
+	of_node_put(clkspec.np);
+
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	error = pm_clk_create(dev);
+	if (error)
+		goto fail_put;
+
+	error = pm_clk_add_clk(dev, clk);
+	if (error)
+		goto fail_destroy;
+
+	return 0;
+
+fail_destroy:
+	pm_clk_destroy(dev);
+fail_put:
+	clk_put(clk);
+	return error;
+}
+
+static void rzg2l_cpg_detach_dev(struct generic_pm_domain *unused, struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
+static int __init rzg2l_cpg_add_clk_domain(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *genpd;
+
+	genpd = devm_kzalloc(dev, sizeof(*genpd), GFP_KERNEL);
+	if (!genpd)
+		return -ENOMEM;
+
+	genpd->name = np->name;
+	genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ALWAYS_ON |
+		       GENPD_FLAG_ACTIVE_WAKEUP;
+	genpd->attach_dev = rzg2l_cpg_attach_dev;
+	genpd->detach_dev = rzg2l_cpg_detach_dev;
+	pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+
+	of_genpd_add_provider_simple(np, genpd);
+	return 0;
+}
+
+static int __init rzg2l_cpg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct rzg2l_cpg_info *info;
+	struct rzg2l_cpg_priv *priv;
+	unsigned int nclks, i;
+	struct clk **clks;
+	int error;
+
+	info = of_device_get_match_data(dev);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->info = info;
+	spin_lock_init(&priv->rmw_lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	nclks = info->num_total_core_clks + info->num_hw_mod_clks;
+	clks = devm_kmalloc_array(dev, nclks, sizeof(*clks), GFP_KERNEL);
+	if (!clks)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->clks = clks;
+	priv->num_core_clks = info->num_total_core_clks;
+	priv->num_mod_clks = info->num_hw_mod_clks;
+	priv->last_dt_core_clk = info->last_dt_core_clk;
+
+	for (i = 0; i < nclks; i++)
+		clks[i] = ERR_PTR(-ENOENT);
+
+	for (i = 0; i < info->num_core_clks; i++)
+		rzg2l_cpg_register_core_clk(&info->core_clks[i], info, priv);
+
+	for (i = 0; i < info->num_mod_clks; i++)
+		rzg2l_cpg_register_mod_clk(&info->mod_clks[i], info, priv);
+
+	error = of_clk_add_provider(np, rzg2l_cpg_clk_src_twocell_get, priv);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(dev, rzg2l_cpg_del_clk_provider, np);
+	if (error)
+		return error;
+
+	error = rzg2l_cpg_add_clk_domain(dev);
+	if (error)
+		return error;
+
+	error = rzg2l_cpg_reset_controller_register(priv);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static const struct of_device_id rzg2l_cpg_match[] = {
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rzg2l_cpg_driver = {
+	.driver		= {
+		.name	= "rzg2l-cpg",
+		.of_match_table = rzg2l_cpg_match,
+	},
+};
+
+static int __init rzg2l_cpg_init(void)
+{
+	return platform_driver_probe(&rzg2l_cpg_driver, rzg2l_cpg_probe);
+}
+
+subsys_initcall(rzg2l_cpg_init);
+
+MODULE_DESCRIPTION("Renesas RZ/G2L CPG Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
new file mode 100644
index 000000000000..8ff0047ffeb9
--- /dev/null
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ/G2L Clock Pulse Generator
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __RENESAS_RZG2L_CPG_H__
+#define __RENESAS_RZG2L_CPG_H__
+
+#define CPG_PL2_DDIV		(0x204)
+#define CPG_PL3A_DDIV		(0x208)
+
+/* n = 0/1/2 for PLL1/4/6 */
+#define CPG_SAMPLL_CLK1(n)	(0x04 + (16 * n))
+#define CPG_SAMPLL_CLK2(n)	(0x08 + (16 * n))
+
+#define PLL146_CONF(n)	(CPG_SAMPLL_CLK1(n) << 22 | CPG_SAMPLL_CLK2(n) << 12)
+
+#define DDIV_PACK(offset, bitpos, size) \
+		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+#define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
+#define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
+
+/**
+ * Definitions of CPG Core Clocks
+ *
+ * These include:
+ *   - Clock outputs exported to DT
+ *   - External input clocks
+ *   - Internal CPG clocks
+ */
+struct cpg_core_clk {
+	const char *name;
+	unsigned int id;
+	unsigned int parent;
+	unsigned int div;
+	unsigned int mult;
+	unsigned int type;
+	unsigned int conf;
+	const struct clk_div_table *dtable;
+	const char * const *parent_names;
+	int flag;
+	int num_parents;
+};
+
+enum clk_types {
+	/* Generic */
+	CLK_TYPE_IN,		/* External Clock Input */
+	CLK_TYPE_FF,		/* Fixed Factor Clock */
+	CLK_TYPE_SAM_PLL,
+
+	/* Clock with divider */
+	CLK_TYPE_DIV,
+};
+
+#define DEF_TYPE(_name, _id, _type...) \
+	{ .name = _name, .id = _id, .type = _type }
+#define DEF_BASE(_name, _id, _type, _parent...) \
+	DEF_TYPE(_name, _id, _type, .parent = _parent)
+#define DEF_SAMPLL(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
+#define DEF_INPUT(_name, _id) \
+	DEF_TYPE(_name, _id, CLK_TYPE_IN)
+#define DEF_FIXED(_name, _id, _parent, _mult, _div) \
+	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
+#define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, .flag = _flag)
+
+/**
+ * struct rzg2l_mod_clk - Module Clocks definitions
+ *
+ * @name: handle between common and hardware-specific interfaces
+ * @id: clock index in array containing all Core and Module Clocks
+ * @parent: id of parent clock
+ * @off: register offset
+ * @onoff: ON/MON bits
+ * @reset: reset bits
+ */
+struct rzg2l_mod_clk {
+	const char *name;
+	unsigned int id;
+	unsigned int parent;
+	u16 off;
+	u8 onoff;
+	u8 reset;
+};
+
+#define DEF_MOD(_name, _id, _parent, _off, _onoff, _reset)	\
+	[_id] = { \
+		.name = _name, \
+		.id = MOD_CLK_BASE + _id, \
+		.parent = (_parent), \
+		.off = (_off), \
+		.onoff = (_onoff), \
+		.reset = (_reset) \
+	}
+
+/**
+ * struct rzg2l_cpg_info - SoC-specific CPG Description
+ *
+ * @core_clks: Array of Core Clock definitions
+ * @num_core_clks: Number of entries in core_clks[]
+ * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @num_total_core_clks: Total number of Core Clocks (exported + internal)
+ *
+ * @mod_clks: Array of Module Clock definitions
+ * @num_mod_clks: Number of entries in mod_clks[]
+ * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
+ *
+ * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
+ *                 should not be disabled without a knowledgeable driver
+ * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ */
+struct rzg2l_cpg_info {
+	/* Core Clocks */
+	const struct cpg_core_clk *core_clks;
+	unsigned int num_core_clks;
+	unsigned int last_dt_core_clk;
+	unsigned int num_total_core_clks;
+
+	/* Module Clocks */
+	const struct rzg2l_mod_clk *mod_clks;
+	unsigned int num_mod_clks;
+	unsigned int num_hw_mod_clks;
+
+	/* Critical Module Clocks that should not be disabled */
+	const unsigned int *crit_mod_clks;
+	unsigned int num_crit_mod_clks;
+};
+
+#endif
-- 
2.17.1

