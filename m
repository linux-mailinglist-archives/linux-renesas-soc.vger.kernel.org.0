Return-Path: <linux-renesas-soc+bounces-17136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C7AB8931
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CAB71BC52C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 14:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E0920297C;
	Thu, 15 May 2025 14:18:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FEE1F7910;
	Thu, 15 May 2025 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318736; cv=none; b=eSXaMjVQrM+CvSJAZxZ04gJUdTmpTG0Bgg+bp9/0aSbG8aLpUlyn3A4VJ2G/PPwrgScVjITvZ6RvP6B1WMStAoa5PGrK6JL/eR17CaMvPVUmpxgswO+vQ4YbhAWQgmKiktgl2n4adB/0JoQuzeCCX8oMjKfIuhQGzRZyy9U7Cvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318736; c=relaxed/simple;
	bh=Zx45zPLOkig7Vf2l7X+lRU4FyAe0XEiyMSOngEtFxLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EX6Gtb1C4+ZZuJeg5nLcIATVD+XYNrHCCrBi1lX7lZK88+/WkoAERysE0xszSbabJ9nLpid88HfqQj8P3Ye8qvDwXIl+2xj2QyLtJMs8aHFOKWhh8KgdOzVU7agevD/WvWOkGJVm+W5IdSxSxDB5Q62h0SI0rQ9hhk7jTGL9JPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: hmtK1E12QiitJTjtCxzshQ==
X-CSE-MsgGUID: Q1TbsaH0SumFBlC2BqZzzw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2025 23:18:51 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.187])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2692C401A460;
	Thu, 15 May 2025 23:18:47 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/10] clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
Date: Thu, 15 May 2025 16:18:19 +0200
Message-ID: <20250515141828.43444-5-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a subsequent patch, the registration callback will need more parameters
from cpg_mssr_priv (like another base address with clock controllers
with double register block, and also, notifiers and rmw_lock).
Instead of adding more parameters, move the needed parameters to a public
sub-struct.
Instead moving clks to this structure, which would have implied to add
an allocation (and cleanup) for it, keep the way the allocation is done
and just have a copy of the pointer in the public structure.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v8->v9: rebase on linux-next
Changes v7->v8:
 - moved struct cpg_mssr_pub pub to the beginning of struct cpg_mssr_priv
 - make *core & *info fit on the same line
 - order of doc tags
Changes v6->v7: none
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4: none
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c  |  7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c |  8 +-
 drivers/clk/renesas/rcar-gen2-cpg.c     |  5 +-
 drivers/clk/renesas/rcar-gen2-cpg.h     |  3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c     |  6 +-
 drivers/clk/renesas/rcar-gen3-cpg.h     |  3 +-
 drivers/clk/renesas/rcar-gen4-cpg.c     |  6 +-
 drivers/clk/renesas/rcar-gen4-cpg.h     |  3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c  | 98 ++++++++++++-------------
 drivers/clk/renesas/renesas-cpg-mssr.h  | 20 ++++-
 10 files changed, 88 insertions(+), 71 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index e1812867a6da..a8ed87c11ba1 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -159,12 +159,13 @@ static void __init r7s9210_update_clk_table(struct clk *extal_clk,
 
 static struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	struct cpg_mssr_pub *pub)
 {
-	struct clk *parent;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	unsigned int mult = 1;
 	unsigned int div = 1;
+	struct clk *parent;
 
 	parent = clks[core->parent];
 	if (IS_ERR(parent))
diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index 3cec0f501b94..e2bda2c10730 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -219,10 +219,11 @@ static int __init r8a77970_cpg_mssr_init(struct device *dev)
 
 static struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	struct cpg_mssr_pub *pub)
 {
 	const struct clk_div_table *table;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	const struct clk *parent;
 	unsigned int shift;
 
@@ -236,8 +237,7 @@ static struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
 		shift = 4;
 		break;
 	default:
-		return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
-						  notifiers);
+		return rcar_gen3_cpg_clk_register(dev, core, info, pub);
 	}
 
 	parent = clks[core->parent];
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
index 4c3764972bad..ab34bb8c3e07 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.c
+++ b/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -274,10 +274,11 @@ static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 
 struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	struct cpg_mssr_pub *pub)
 {
 	const struct clk_div_table *table = NULL;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	const struct clk *parent;
 	const char *parent_name;
 	unsigned int mult = 1;
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.h b/drivers/clk/renesas/rcar-gen2-cpg.h
index bdcd4a38d48d..3d4b127fdeaf 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.h
+++ b/drivers/clk/renesas/rcar-gen2-cpg.h
@@ -32,8 +32,7 @@ struct rcar_gen2_cpg_pll_config {
 
 struct clk *rcar_gen2_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers);
+	struct cpg_mssr_pub *pub);
 int rcar_gen2_cpg_init(const struct rcar_gen2_cpg_pll_config *config,
 		       unsigned int pll0_div, u32 mode);
 
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 027100e84ee4..10ae20489df9 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -345,9 +345,11 @@ static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 
 struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	struct cpg_mssr_pub *pub)
 {
+	struct raw_notifier_head *notifiers = &pub->notifiers;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	const struct clk *parent;
 	unsigned int mult = 1;
 	unsigned int div = 1;
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index bfdc649bdf12..d15a5d1df71c 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -81,8 +81,7 @@ struct rcar_gen3_cpg_pll_config {
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers);
+	struct cpg_mssr_pub *pub);
 int rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
 		       unsigned int clk_extalr, u32 mode);
 
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 31aa790fd003..fb9a876aaba5 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -418,9 +418,11 @@ static const struct clk_div_table cpg_rpcsrc_div_table[] = {
 
 struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	struct cpg_mssr_pub *pub)
 {
+	struct raw_notifier_head *notifiers = &pub->notifiers;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	const struct clk *parent;
 	unsigned int mult = 1;
 	unsigned int div = 1;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 717fd148464f..6c8280b37c37 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -78,8 +78,7 @@ struct rcar_gen4_cpg_pll_config {
 
 struct clk *rcar_gen4_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers);
+	struct cpg_mssr_pub *pub);
 int rcar_gen4_cpg_init(const struct rcar_gen4_cpg_pll_config *config,
 		       unsigned int clk_extalr, u32 mode);
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 71431970d6e6..f102a1dd9694 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -126,16 +126,14 @@ static const u16 srstclr_for_gen4[] = {
  * struct cpg_mssr_priv - Clock Pulse Generator / Module Standby
  *                        and Software Reset Private Data
  *
+ * @pub: Data passed to clock registration callback
  * @rcdev: Optional reset controller entity
  * @dev: CPG/MSSR device
- * @base: CPG/MSSR register block base address
  * @reg_layout: CPG/MSSR register layout
- * @rmw_lock: protects RMW register accesses
  * @np: Device node in DT for this CPG/MSSR module
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
- * @notifiers: Notifier chain to save/restore clock state for system resume
  * @status_regs: Pointer to status registers array
  * @control_regs: Pointer to control registers array
  * @reset_regs: Pointer to reset registers array
@@ -147,20 +145,18 @@ static const u16 srstclr_for_gen4[] = {
  * @clks: Array containing all Core and Module Clocks
  */
 struct cpg_mssr_priv {
+	struct cpg_mssr_pub pub;
 #ifdef CONFIG_RESET_CONTROLLER
 	struct reset_controller_dev rcdev;
 #endif
 	struct device *dev;
-	void __iomem *base;
 	enum clk_reg_layout reg_layout;
-	spinlock_t rmw_lock;
 	struct device_node *np;
 
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
 	unsigned int last_dt_core_clk;
 
-	struct raw_notifier_head notifiers;
 	const u16 *status_regs;
 	const u16 *control_regs;
 	const u16 *reset_regs;
@@ -206,38 +202,39 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	dev_dbg(dev, "MSTP %u%02u/%pC %s\n", reg, bit, hw->clk,
 		str_on_off(enable));
-	spin_lock_irqsave(&priv->rmw_lock, flags);
+	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
-		value = readb(priv->base + priv->control_regs[reg]);
+		value = readb(priv->pub.base0 + priv->control_regs[reg]);
 		if (enable)
 			value &= ~bitmask;
 		else
 			value |= bitmask;
-		writeb(value, priv->base + priv->control_regs[reg]);
+		writeb(value, priv->pub.base0 + priv->control_regs[reg]);
 
 		/* dummy read to ensure write has completed */
-		readb(priv->base + priv->control_regs[reg]);
-		barrier_data(priv->base + priv->control_regs[reg]);
+		readb(priv->pub.base0 + priv->control_regs[reg]);
+		barrier_data(priv->pub.base0 + priv->control_regs[reg]);
+
 	} else {
-		value = readl(priv->base + priv->control_regs[reg]);
+		value = readl(priv->pub.base0 + priv->control_regs[reg]);
 		if (enable)
 			value &= ~bitmask;
 		else
 			value |= bitmask;
-		writel(value, priv->base + priv->control_regs[reg]);
+		writel(value, priv->pub.base0 + priv->control_regs[reg]);
 	}
 
-	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 
 	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		return 0;
 
-	error = readl_poll_timeout_atomic(priv->base + priv->status_regs[reg],
+	error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
 					  value, !(value & bitmask), 0, 10);
 	if (error)
 		dev_err(dev, "Failed to enable SMSTP %p[%d]\n",
-			priv->base + priv->control_regs[reg], bit);
+			priv->pub.base0 + priv->control_regs[reg], bit);
 
 	return error;
 }
@@ -256,12 +253,13 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
 	struct cpg_mssr_priv *priv = clock->priv;
+	unsigned int reg = clock->index / 32;
 	u32 value;
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
-		value = readb(priv->base + priv->control_regs[clock->index / 32]);
+		value = readb(priv->pub.base0 + priv->control_regs[reg]);
 	else
-		value = readl(priv->base + priv->status_regs[clock->index / 32]);
+		value = readl(priv->pub.base0 + priv->status_regs[reg]);
 
 	return !(value & BIT(clock->index % 32));
 }
@@ -348,7 +346,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_DIV6P1:
 	case CLK_TYPE_DIV6_RO:
 		WARN_DEBUG(core->parent >= priv->num_core_clks);
-		parent = priv->clks[core->parent];
+		parent = priv->pub.clks[core->parent];
 		if (IS_ERR(parent)) {
 			clk = parent;
 			goto fail;
@@ -358,12 +356,12 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 
 		if (core->type == CLK_TYPE_DIV6_RO)
 			/* Multiply with the DIV6 register value */
-			div *= (readl(priv->base + core->offset) & 0x3f) + 1;
+			div *= (readl(priv->pub.base0 + core->offset) & 0x3f) + 1;
 
 		if (core->type == CLK_TYPE_DIV6P1) {
 			clk = cpg_div6_register(core->name, 1, &parent_name,
-						priv->base + core->offset,
-						&priv->notifiers);
+						priv->pub.base0 + core->offset,
+						&priv->pub.notifiers);
 		} else {
 			clk = clk_register_fixed_factor(NULL, core->name,
 							parent_name, 0,
@@ -379,8 +377,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	default:
 		if (info->cpg_clk_register)
 			clk = info->cpg_clk_register(dev, core, info,
-						     priv->clks, priv->base,
-						     &priv->notifiers);
+						     &priv->pub);
 		else
 			dev_err(dev, "%s has unsupported core clock type %u\n",
 				core->name, core->type);
@@ -391,7 +388,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 		goto fail;
 
 	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
+	priv->pub.clks[id] = clk;
 	return;
 
 fail:
@@ -414,14 +411,14 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	WARN_DEBUG(id < priv->num_core_clks);
 	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
 	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
-	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
+	WARN_DEBUG(PTR_ERR(priv->pub.clks[id]) != -ENOENT);
 
 	if (!mod->name) {
 		/* Skip NULLified clock */
 		return;
 	}
 
-	parent = priv->clks[mod->parent];
+	parent = priv->pub.clks[mod->parent];
 	if (IS_ERR(parent)) {
 		clk = parent;
 		goto fail;
@@ -623,13 +620,13 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
 
 	/* Reset module */
-	writel(bitmask, priv->base + priv->reset_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
 
 	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
 	udelay(35);
 
 	/* Release module from reset state */
-	writel(bitmask, priv->base + priv->reset_clear_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
 
 	return 0;
 }
@@ -643,7 +640,7 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 
 	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
 
-	writel(bitmask, priv->base + priv->reset_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
 	return 0;
 }
 
@@ -657,7 +654,7 @@ static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
 
 	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
 
-	writel(bitmask, priv->base + priv->reset_clear_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
 	return 0;
 }
 
@@ -669,7 +666,7 @@ static int cpg_mssr_status(struct reset_controller_dev *rcdev,
 	unsigned int bit = id % 32;
 	u32 bitmask = BIT(bit);
 
-	return !!(readl(priv->base + priv->reset_regs[reg]) & bitmask);
+	return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
 }
 
 static const struct reset_control_ops cpg_mssr_reset_ops = {
@@ -895,12 +892,12 @@ static int cpg_mssr_suspend_noirq(struct device *dev)
 		if (priv->smstpcr_saved[reg].mask)
 			priv->smstpcr_saved[reg].val =
 				priv->reg_layout == CLK_REG_LAYOUT_RZ_A ?
-				readb(priv->base + priv->control_regs[reg]) :
-				readl(priv->base + priv->control_regs[reg]);
+				readb(priv->pub.base0 + priv->control_regs[reg]) :
+				readl(priv->pub.base0 + priv->control_regs[reg]);
 	}
 
 	/* Save core clocks */
-	raw_notifier_call_chain(&priv->notifiers, PM_EVENT_SUSPEND, NULL);
+	raw_notifier_call_chain(&priv->pub.notifiers, PM_EVENT_SUSPEND, NULL);
 
 	return 0;
 }
@@ -917,7 +914,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		return 0;
 
 	/* Restore core clocks */
-	raw_notifier_call_chain(&priv->notifiers, PM_EVENT_RESUME, NULL);
+	raw_notifier_call_chain(&priv->pub.notifiers, PM_EVENT_RESUME, NULL);
 
 	/* Restore module clocks */
 	for (reg = 0; reg < ARRAY_SIZE(priv->smstpcr_saved); reg++) {
@@ -926,29 +923,29 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			continue;
 
 		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
-			oldval = readb(priv->base + priv->control_regs[reg]);
+			oldval = readb(priv->pub.base0 + priv->control_regs[reg]);
 		else
-			oldval = readl(priv->base + priv->control_regs[reg]);
+			oldval = readl(priv->pub.base0 + priv->control_regs[reg]);
 		newval = oldval & ~mask;
 		newval |= priv->smstpcr_saved[reg].val & mask;
 		if (newval == oldval)
 			continue;
 
 		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
-			writeb(newval, priv->base + priv->control_regs[reg]);
+			writeb(newval, priv->pub.base0 + priv->control_regs[reg]);
 			/* dummy read to ensure write has completed */
-			readb(priv->base + priv->control_regs[reg]);
-			barrier_data(priv->base + priv->control_regs[reg]);
+			readb(priv->pub.base0 + priv->control_regs[reg]);
+			barrier_data(priv->pub.base0 + priv->control_regs[reg]);
 			continue;
 		} else
-			writel(newval, priv->base + priv->control_regs[reg]);
+			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
 
 		/* Wait until enabled clocks are really enabled */
 		mask &= ~priv->smstpcr_saved[reg].val;
 		if (!mask)
 			continue;
 
-		error = readl_poll_timeout_atomic(priv->base + priv->status_regs[reg],
+		error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
 						oldval, !(oldval & mask), 0, 10);
 		if (error)
 			dev_warn(dev, "Failed to enable SMSTP%u[0x%x]\n", reg,
@@ -1058,12 +1055,13 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->pub.clks = priv->clks;
 	priv->np = np;
 	priv->dev = dev;
-	spin_lock_init(&priv->rmw_lock);
+	spin_lock_init(&priv->pub.rmw_lock);
 
-	priv->base = of_iomap(np, 0);
-	if (!priv->base) {
+	priv->pub.base0 = of_iomap(np, 0);
+	if (!priv->pub.base0) {
 		error = -ENOMEM;
 		goto out_err;
 	}
@@ -1071,7 +1069,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
-	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
+	RAW_INIT_NOTIFIER_HEAD(&priv->pub.notifiers);
 	priv->reg_layout = info->reg_layout;
 	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3) {
 		priv->status_regs = mstpsr;
@@ -1091,7 +1089,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	}
 
 	for (i = 0; i < nclks; i++)
-		priv->clks[i] = ERR_PTR(-ENOENT);
+		priv->pub.clks[i] = ERR_PTR(-ENOENT);
 
 	error = cpg_mssr_reserved_init(priv, info);
 	if (error)
@@ -1108,8 +1106,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 reserve_err:
 	cpg_mssr_reserved_exit(priv);
 out_err:
-	if (priv->base)
-		iounmap(priv->base);
+	if (priv->pub.base0)
+		iounmap(priv->pub.base0);
 	kfree(priv);
 
 	return error;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index a1d6e0cbcff9..7ce3cc9a64c1 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -8,6 +8,8 @@
 #ifndef __CLK_RENESAS_CPG_MSSR_H__
 #define __CLK_RENESAS_CPG_MSSR_H__
 
+#include <linux/notifier.h>
+
     /*
      * Definitions of CPG Core Clocks
      *
@@ -29,6 +31,21 @@ struct cpg_core_clk {
 	unsigned int offset;
 };
 
+/**
+ * struct cpg_mssr_pub - data shared with device-specific clk registration code
+ *
+ * @base0: CPG/MSSR register block base0 address
+ * @notifiers: Notifier chain to save/restore clock state for system resume
+ * @rmw_lock: protects RMW register accesses
+ * @clks: pointer to clocks
+ */
+struct cpg_mssr_pub {
+	void __iomem *base0;
+	struct raw_notifier_head notifiers;
+	spinlock_t rmw_lock;
+	struct clk **clks;
+};
+
 enum clk_types {
 	/* Generic */
 	CLK_TYPE_IN,		/* External Clock Input */
@@ -153,8 +170,7 @@ struct cpg_mssr_info {
 	struct clk *(*cpg_clk_register)(struct device *dev,
 					const struct cpg_core_clk *core,
 					const struct cpg_mssr_info *info,
-					struct clk **clks, void __iomem *base,
-					struct raw_notifier_head *notifiers);
+					struct cpg_mssr_pub *pub);
 };
 
 extern const struct cpg_mssr_info r7s9210_cpg_mssr_info;
-- 
2.43.0


