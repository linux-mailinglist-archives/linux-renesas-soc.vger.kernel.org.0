Return-Path: <linux-renesas-soc+bounces-12710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E1A2223E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36CD13A4DF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8079C1E04BD;
	Wed, 29 Jan 2025 16:52:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678911E0B96;
	Wed, 29 Jan 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169545; cv=none; b=UVInTgVpm+bJMMLbTPTASnGysXGW9kAucGxr0Edz4xmOw9UOTmmOI8BVMn79GMyr/vuffZ2tiEwvPXA6glUnQE/JypYK4AjIkwU+Y7oWpz6EfJ9rZtGP9sMY2l1ahGMfd62A6oZ/EoN+4K8+V8d0TQgazZihjcZAQX8HOtVXK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169545; c=relaxed/simple;
	bh=S1YlamGvfyYIHqKDspZxNsMrULeFfB9ETiy9leItYGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHp7xo21J387QBcOtnfcBJmWAPVmh4FvscvEfdiXbPXz9yq/nHhCNqMFsds8RGE+cI7R2qBKibIlqB7yPuA46dUyfc6ZngOjASZPOJzRcZTA7S9gocZKFWxrIwmMAH8FFj+6QL98dqUDbm9E7NOjYK1SEX4JgqwttjZPP4/KM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 52MEr7l3T3OcsOhzATj4oA==
X-CSE-MsgGUID: oq38GtBGTsqXL69VdmOIOw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2025 01:52:22 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B66C402F02E;
	Thu, 30 Jan 2025 01:52:10 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
Date: Wed, 29 Jan 2025 16:37:42 +0000
Message-ID: <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the CPG driver for T2H family.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig     |   4 +
 drivers/clk/renesas/Makefile    |   1 +
 drivers/clk/renesas/rzt2h-cpg.c | 549 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzt2h-cpg.h | 201 ++++++++++++
 4 files changed, 755 insertions(+)
 create mode 100644 drivers/clk/renesas/rzt2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzt2h-cpg.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index ff01f5f0ed20..7ad59be2099d 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -237,6 +237,10 @@ config CLK_RZV2H
 	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_RZT2H
+	bool "RZ/T2H family clock support" if COMPILE_TEST
+	select RESET_CONTROLLER
+
 config CLK_RENESAS_VBATTB
 	tristate "Renesas VBATTB clock controller"
 	depends on ARCH_RZG2L || COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 82efaa835ac7..bd9f0b54fcda 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN4_CPG)		+= rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
+obj-$(CONFIG_CLK_RZT2H)			+= rzt2h-cpg.o
 obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 
 # Generic
diff --git a/drivers/clk/renesas/rzt2h-cpg.c b/drivers/clk/renesas/rzt2h-cpg.c
new file mode 100644
index 000000000000..79dacbd2b186
--- /dev/null
+++ b/drivers/clk/renesas/rzt2h-cpg.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/T2H Clock Pulse Generator
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+#include "rzt2h-cpg.h"
+
+#ifdef DEBUG
+#define WARN_DEBUG(x)	WARN_ON(x)
+#else
+#define WARN_DEBUG(x)	do { } while (0)
+#endif
+
+#define GET_SHIFT(val)		FIELD_GET(GENMASK(19, 12), val)
+#define GET_WIDTH(val)		FIELD_GET(GENMASK(11, 8), val)
+#define GET_REG_OFFSET(val)	FIELD_GET(GENMASK(31, 20), val)
+
+/**
+ * struct rzt2h_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @rcdev: Reset controller entity
+ * @info: Pointer to platform data
+ * @dev: CPG device
+ * @cpg_base0: CPG register block base address 0
+ * @cpg_base1: CPG register block base address 1
+ * @clks: Array containing all Core and Module Clocks
+ * @rmw_lock: protects register accesses
+ * @hw: clock hw
+ * @num_core_clks: Number of Core Clocks in clks[]
+ * @num_mod_clks: Number of Module Clocks in clks[]
+ * @num_resets: Number of Module Resets in info->resets[]
+ * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ */
+struct rzt2h_cpg_priv {
+	struct reset_controller_dev rcdev;
+	const struct rzt2h_cpg_info *info;
+	struct device *dev;
+	void __iomem *cpg_base0, *cpg_base1;
+	struct clk **clks;
+	spinlock_t rmw_lock;
+	struct clk_hw hw;
+	unsigned int num_core_clks;
+	unsigned int num_mod_clks;
+	unsigned int num_resets;
+	unsigned int last_dt_core_clk;
+};
+
+#define rcdev_to_priv(x)	container_of(x, struct rzt2h_cpg_priv, rcdev)
+
+static void rzt2h_cpg_del_clk_provider(void *data)
+{
+	of_clk_del_provider(data);
+}
+
+static struct clk * __init
+rzt2h_cpg_div_clk_register(const struct cpg_core_clk *core,
+			   void __iomem *base,
+			   struct rzt2h_cpg_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct clk **clks = priv->clks;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+
+	if (core->dtable) {
+		clk_hw = clk_hw_register_divider_table(dev, core->name,
+						       parent_name, 0,
+						       base + GET_REG_OFFSET(core->conf),
+						       GET_SHIFT(core->conf),
+						       GET_WIDTH(core->conf),
+						       core->flag,
+						       core->dtable,
+						       &priv->rmw_lock);
+	} else {
+		clk_hw = clk_hw_register_divider(dev, core->name,
+						 parent_name, 0,
+						 base + GET_REG_OFFSET(core->conf),
+						 GET_SHIFT(core->conf),
+						 GET_WIDTH(core->conf),
+						 core->flag, &priv->rmw_lock);
+	}
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
+static struct clk * __init
+rzt2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
+			   void __iomem *base,
+			   struct rzt2h_cpg_priv *priv)
+{
+	const struct clk_hw *clk_hw;
+
+	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
+					  core->parent_names, core->num_parents,
+					  core->flag,
+					  base + GET_REG_OFFSET(core->conf),
+					  GET_SHIFT(core->conf),
+					  GET_WIDTH(core->conf),
+					  core->mux_flags, &priv->rmw_lock);
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
+struct pll_clk {
+	void __iomem *base;
+	struct rzt2h_cpg_priv *priv;
+	struct clk_hw hw;
+	unsigned int conf;
+	unsigned int type;
+};
+#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
+
+static struct clk
+*rzt2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
+			       void *data)
+{
+	unsigned int clkidx = clkspec->args[1];
+	struct rzt2h_cpg_priv *priv = data;
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
+		if (clkidx >= priv->num_mod_clks) {
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
+rzt2h_cpg_register_core_clk(const struct cpg_core_clk *core,
+			    const struct rzt2h_cpg_info *info,
+			    struct rzt2h_cpg_priv *priv)
+{
+	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
+	unsigned int id = core->id, div = core->div;
+	struct device *dev = priv->dev;
+	const char *parent_name;
+
+	WARN_DEBUG(id >= priv->num_core_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
+
+	/* Skip NULLified clock */
+	if (!core->name)
+		return;
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
+	case CLK_TYPE_DIV:
+		if (core->sel_base > 0)
+			clk = rzt2h_cpg_div_clk_register(core,
+							 priv->cpg_base1, priv);
+		else
+			clk = rzt2h_cpg_div_clk_register(core,
+							 priv->cpg_base0, priv);
+		break;
+	case CLK_TYPE_MUX:
+		clk = rzt2h_cpg_mux_clk_register(core, priv->cpg_base0, priv);
+		break;
+	default:
+		goto fail;
+	}
+
+	if (IS_ERR_OR_NULL(clk))
+		goto fail;
+
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
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
+ * @baseaddr: register base address
+ * @enabled: soft state of the clock, if it is coupled with another clock
+ * @off: register offset
+ * @bit: ON/MON bit
+ */
+struct mstp_clock {
+	struct rzt2h_cpg_priv *priv;
+	struct mstp_clock *sibling;
+	void __iomem *baseaddr;
+	struct clk_hw hw;
+	bool enabled;
+	u32 off;
+	u8 bit;
+};
+#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
+static int rzt2h_mod_clock_is_enabled(struct clk_hw *hw)
+{
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzt2h_cpg_priv *priv = clock->priv;
+	u32 bitmask = BIT(clock->bit);
+	u32 value;
+
+	if (!clock->off) {
+		dev_dbg(priv->dev, "%pC does not support ON/OFF\n",  hw->clk);
+		return 1;
+	}
+	value = readl(clock->baseaddr + clock->off);
+
+	/* For all Module Stop registers, read bit meaning is as such:
+	 * 0: Release from the module-stop state
+	 * 1: Transition to the module-stop state is made
+	*/
+
+	return !(value & bitmask);
+}
+
+static const struct clk_ops rzt2h_mod_clock_ops = {
+	.is_enabled = rzt2h_mod_clock_is_enabled,
+};
+
+static void __init
+rzt2h_cpg_register_mod_clk(const struct rzt2h_mod_clk *mod,
+			   const struct rzt2h_cpg_info *info,
+			   struct rzt2h_cpg_priv *priv)
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
+	/* Skip NULLified clock */
+	if (!mod->name)
+		return;
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
+	init.ops = &rzt2h_mod_clock_ops;
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
+	clock->off = mod->addr;
+	clock->bit = mod->bit;
+	clock->baseaddr = mod->sel_base ? priv->cpg_base1 : priv->cpg_base0;
+	clock->priv = priv;
+	clock->hw.init = &init;
+
+	clk = devm_clk_register(dev, &clock->hw);
+	if (IS_ERR(clk))
+		goto fail;
+
+	priv->clks[id] = clk;
+
+	return;
+
+fail:
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
+		mod->name, PTR_ERR(clk));
+}
+
+static bool rzt2h_cpg_is_pm_clk(const struct of_phandle_args *clkspec)
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
+static int rzt2h_cpg_attach_dev(struct generic_pm_domain *unused, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args clkspec;
+	unsigned int i = 0;
+	bool once = true;
+	struct clk *clk;
+	int error;
+
+	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
+					   &clkspec)) {
+		if (!rzt2h_cpg_is_pm_clk(&clkspec)) {
+			of_node_put(clkspec.np);
+			continue;
+		}
+
+		if (once) {
+			once = false;
+			error = pm_clk_create(dev);
+			if (error) {
+				of_node_put(clkspec.np);
+				goto err;
+			}
+		}
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			error = PTR_ERR(clk);
+			goto fail_destroy;
+		}
+		error = pm_clk_add_clk(dev, clk);
+		if (error) {
+			dev_err(dev, "pm_clk_add_clk failed %d\n", error);
+			goto fail_put;
+		}
+		i++;
+	}
+
+	return 0;
+
+fail_put:
+	clk_put(clk);
+
+fail_destroy:
+	pm_clk_destroy(dev);
+err:
+	return error;
+}
+
+static void rzt2h_cpg_detach_dev(struct generic_pm_domain *unused, struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
+static void rzt2h_cpg_genpd_remove(void *data)
+{
+	pm_genpd_remove(data);
+}
+
+static int __init rzt2h_cpg_add_clk_domain(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *genpd;
+	int ret;
+
+	genpd = devm_kzalloc(dev, sizeof(*genpd), GFP_KERNEL);
+	if (!genpd)
+		return -ENOMEM;
+
+	genpd->name = np->name;
+	genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ALWAYS_ON |
+		       GENPD_FLAG_ACTIVE_WAKEUP;
+	genpd->attach_dev = rzt2h_cpg_attach_dev;
+	genpd->detach_dev = rzt2h_cpg_detach_dev;
+	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, rzt2h_cpg_genpd_remove, genpd);
+	if (ret)
+		return ret;
+
+	return of_genpd_add_provider_simple(np, genpd);
+}
+
+static int __init rzt2h_cpg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct rzt2h_cpg_info *info;
+	struct rzt2h_cpg_priv *priv;
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
+	priv->cpg_base0 = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->cpg_base1))
+		return PTR_ERR(priv->cpg_base0);
+
+	priv->cpg_base1 = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(priv->cpg_base1))
+		return PTR_ERR(priv->cpg_base1);
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
+	priv->num_resets = info->num_resets;
+	priv->last_dt_core_clk = info->last_dt_core_clk;
+
+	for (i = 0; i < nclks; i++)
+		clks[i] = ERR_PTR(-ENOENT);
+
+	for (i = 0; i < info->num_core_clks; i++)
+		rzt2h_cpg_register_core_clk(&info->core_clks[i], info, priv);
+
+	for (i = 0; i < info->num_mod_clks; i++)
+		rzt2h_cpg_register_mod_clk(&info->mod_clks[i], info, priv);
+
+	error = of_clk_add_provider(np, rzt2h_cpg_clk_src_twocell_get, priv);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(dev, rzt2h_cpg_del_clk_provider, np);
+	if (error)
+		return error;
+
+	return rzt2h_cpg_add_clk_domain(dev);
+}
+
+static const struct of_device_id rzt2h_cpg_match[] = {
+#ifdef CONFIG_CLK_R9A09G077
+	{
+		.compatible = "renesas,r9a09g077-cpg",
+		.data = &r9a09g077_cpg_info,
+	},
+#endif
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rzt2h_cpg_driver = {
+	.driver		= {
+		.name	= "rzt2-cpg",
+		.of_match_table = rzt2h_cpg_match,
+	},
+};
+
+static int __init rzt2h_cpg_init(void)
+{
+	return platform_driver_probe(&rzt2h_cpg_driver, rzt2h_cpg_probe);
+}
+
+subsys_initcall(rzt2h_cpg_init);
diff --git a/drivers/clk/renesas/rzt2h-cpg.h b/drivers/clk/renesas/rzt2h-cpg.h
new file mode 100644
index 000000000000..d9d28608e4c3
--- /dev/null
+++ b/drivers/clk/renesas/rzt2h-cpg.h
@@ -0,0 +1,201 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ/T2H Clock Pulse Generator
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __RENESAS_RZT2H_CPG_H__
+#define __RENESAS_RZT2H_CPG_H__
+
+#define SCKCR		0x00
+#define SCKCR2		0x04
+#define SCKCR3		0x08
+#define SCKCR4		0x0C
+#define PMSEL		0x10
+#define PMSEL_PLL0	BIT(0)
+#define PMSEL_PLL2	BIT(2)
+#define PMSEL_PLL3	BIT(3)
+#define PLL0EN		BIT(0)
+#define PLL2EN		BIT(0)
+#define PLL3EN		BIT(0)
+#define PLL0MON		0x20
+#define PLL0EN_REG	0x30
+#define PLL0_SSC_CTR	0x34
+#define PLL1MON		0x40
+#define LOCOCR		0x70
+#define HIZCTRLEN	0x80
+#define PLL2MON		0x90
+#define PLL2EN_REG	0xA0
+#define PLL2_SSC_CTR	0xAC
+#define PLL3MON		0xB0
+#define PLL3EN_REG	0xC0
+#define PLL3_VCO_CTR0	0xC4
+#define PLL3_VCO_CTR1	0xC8
+#define PLL4MON		0xD0
+#define PHYSEL		BIT(21)
+
+
+#define MRCTLA		0x240
+#define MRCTLE		0x250
+#define MRCTLI		0x260
+#define MRCTLM		0x270
+
+#define DDIV_PACK(offset, bitpos, size) \
+		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+
+#define DIVCA55		DDIV_PACK(SCKCR2, 8, 4)
+#define DIVCA55S	DDIV_PACK(SCKCR2, 12, 1)
+#define DIVCR520	DDIV_PACK(SCKCR2, 2, 2)
+#define DIVCR521	DDIV_PACK(SCKCR2, 0, 2)
+#define DIVLCDC		DDIV_PACK(SCKCR3, 20, 3)
+#define DIVCKIO		DDIV_PACK(SCKCR, 16, 3)
+#define DIVETHPHY	DDIV_PACK(SCKCR, 21, 1)
+#define DIVCANFD	DDIV_PACK(SCKCR, 20, 1)
+#define DIVSPI0		DDIV_PACK(SCKCR3, 0, 2)
+#define DIVSPI1		DDIV_PACK(SCKCR3, 2, 2)
+#define DIVSPI2		DDIV_PACK(SCKCR3, 4, 2)
+#define DIVSPI3		DDIV_PACK(SCKCR2, 16, 2)
+
+#define SEL_PLL_PACK(offset, bitpos, size) \
+	(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+
+#define	SEL_PLL		SEL_PLL_PACK(SCKCR, 22, 1)
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
+	const struct clk_div_table *dtable;
+	const char * const *parent_names;
+	unsigned int id;
+	unsigned int parent;
+	unsigned int div;
+	unsigned int mult;
+	unsigned int type;
+	unsigned int conf;
+	int flag;
+	int mux_flags;
+	int num_parents;
+	int sel_base;
+};
+
+enum clk_types {
+	/* Generic */
+	CLK_TYPE_IN,		/* External Clock Input */
+	CLK_TYPE_MAIN,
+	CLK_TYPE_FF,		/* Fixed Factor Clock */
+	CLK_TYPE_PLL,
+	CLK_TYPE_SAM_PLL,
+
+	/* Clock with divider */
+	CLK_TYPE_DIV,
+
+	/* Clock with clock source selector */
+	CLK_TYPE_MUX,
+
+	/* Clock with SD clock source selector */
+	CLK_TYPE_SD_MUX,
+};
+
+#define DEF_TYPE(_name, _id, _type...) \
+	{ .name = _name, .id = _id, .type = _type }
+#define DEF_BASE(_name, _id, _type, _parent...) \
+	DEF_TYPE(_name, _id, _type, .parent = _parent)
+#define DEF_INPUT(_name, _id) \
+	DEF_TYPE(_name, _id, CLK_TYPE_IN)
+#define DEF_FIXED(_name, _id, _parent, _mult, _div) \
+	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
+#define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag, _sel_base) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, .sel_base = _sel_base, \
+		 .parent = _parent, .dtable = _dtable, .flag = _flag)
+#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
+		_mux_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, .num_parents = _num_parents, \
+		 .flag = _flag, .mux_flags = _mux_flags)
+
+/**
+ * struct rzt2h_mod_clk - Module Clocks definitions
+ *
+ * @name: handle between common and hardware-specific interfaces
+ * @id: clock index in array containing all Core and Module Clocks
+ * @parent: id of parent clock
+ * @addr: register address
+ * @sel_base: selects base address
+ * @is_coupled: flag to indicate coupled clock
+ * @bit: ON/OFF bit
+ */
+struct rzt2h_mod_clk {
+	const char *name;
+	unsigned int id;
+	unsigned int parent;
+	u32 addr;
+	int sel_base;
+	bool is_coupled;
+	u8 bit;
+};
+
+#define DEF_MOD_BASE(_name, _id, _parent, _addr, _bit, _sel_base, _is_coupled) { \
+	.name = (_name), \
+	.id = MOD_CLK_BASE + (_id), \
+	.parent = (_parent), \
+	.addr = (_addr), \
+	.bit = (_bit), \
+	.sel_base = (_sel_base), \
+	.is_coupled = (_is_coupled) \
+}
+
+#define DEF_MOD(_name, _id, _parent, _addr, _bit, _sel_base) \
+	DEF_MOD_BASE(_name, _id, _parent, _addr, _bit, _sel_base, false)
+
+/**
+ * struct rzt2_cpg_info - SoC-specific CPG Description
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
+ * @resets: Array of Module Reset definitions
+ * @num_resets: Number of entries in resets[]
+ *
+ * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
+ *                 should not be disabled without a knowledgeable driver
+ * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ */
+struct rzt2h_cpg_info {
+	/* Core Clocks */
+	const struct cpg_core_clk *core_clks;
+	unsigned int num_core_clks;
+	unsigned int last_dt_core_clk;
+	unsigned int num_total_core_clks;
+
+	/* Module Clocks */
+	const struct rzt2h_mod_clk *mod_clks;
+	unsigned int num_mod_clks;
+	unsigned int num_hw_mod_clks;
+
+	/* Resets */
+	const struct rzt2h_reset *resets;
+	unsigned int num_resets;
+
+	/* Critical Module Clocks that should not be disabled */
+	const unsigned int *crit_mod_clks;
+	unsigned int num_crit_mod_clks;
+};
+
+extern const struct rzt2h_cpg_info r9a09g077_cpg_info;
+
+#endif
-- 
2.43.0


