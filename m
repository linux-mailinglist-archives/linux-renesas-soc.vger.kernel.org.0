Return-Path: <linux-renesas-soc+bounces-13198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88758A380D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BDC8188DADB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D7F217654;
	Mon, 17 Feb 2025 10:54:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC348216E1B;
	Mon, 17 Feb 2025 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789690; cv=none; b=RrkO0Ys2BgoxjcvUKNT5/VCqhbi1qXMeMVz6gwH9AfDxU/W5n/OzRQuf41ub49Kp7h+wDUjhQPIOP9CTmOw+D/JstLh2s+CAVaz0EEsl0+iUvSLVq7vVlI1x/OskPJk54YaYQ3bL0HpMS2uMXvvXz8BlVuPoqCcPMQFnR1qXdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789690; c=relaxed/simple;
	bh=Qsh0HwY5lyjr/noq6U5vgQKLnX1x4QbYJggrRouwLWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGWQk7HRFTOvIoM3k1pB5q1FdZnZDDVi5NdmeQRGSPWjrQD6TMtSyvKpA6eLjcJoUfA8LmD4GOqparUtpcy/96NUs+yjAmrIdIzNryQSIBz/0acvwoI8FimevwlD2ZaRCSHaQB4kqmI65RIzAqrP72cbRDWZsUcCD8Ycq6duIig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: cKSNU2XRTYuNVDM0ZJfr5g==
X-CSE-MsgGUID: B9sxQNFhRj+GWMG4Gfg3Lg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Feb 2025 19:54:47 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A11D1428055D;
	Mon, 17 Feb 2025 19:54:44 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
Date: Mon, 17 Feb 2025 11:52:06 +0100
Message-ID: <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a coming evolution, the registration callback will need more parameters
from cpg_mssr_priv (like another base address with clock controllers
with double register block).
Instead of adding more parameters, mode the needed parameters to a public
sub-struct.
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c  |  7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 11 +--
 drivers/clk/renesas/rcar-gen3-cpg.c     |  8 +-
 drivers/clk/renesas/rcar-gen3-cpg.h     |  6 +-
 drivers/clk/renesas/rcar-gen4-cpg.c     |  9 ++-
 drivers/clk/renesas/rcar-gen4-cpg.h     |  3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c  | 99 +++++++++++++------------
 drivers/clk/renesas/renesas-cpg-mssr.h  | 21 +++++-
 8 files changed, 93 insertions(+), 71 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index a85227c248f3..733244687daa 100644
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
index 3cec0f501b94..c50aa1a49196 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -218,11 +218,13 @@ static int __init r8a77970_cpg_mssr_init(struct device *dev)
 }
 
 static struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
-	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	const struct cpg_core_clk *core,
+	const struct cpg_mssr_info *info,
+	struct cpg_mssr_pub *pub)
 {
 	const struct clk_div_table *table;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	const struct clk *parent;
 	unsigned int shift;
 
@@ -236,8 +238,7 @@ static struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
 		shift = 4;
 		break;
 	default:
-		return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
-						  notifiers);
+		return rcar_gen3_cpg_clk_register(dev, core, info, pub);
 	}
 
 	parent = clks[core->parent];
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 027100e84ee4..aafeb139fdb4 100644
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
@@ -431,7 +433,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 			}
 
 			writel(value, csn->reg);
-			cpg_simple_notifier_register(notifiers, csn);
+			cpg_simple_notifier_register(&pub->notifiers, csn);
 			break;
 		}
 
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index bfdc649bdf12..6ad560fca01b 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -80,9 +80,9 @@ struct rcar_gen3_cpg_pll_config {
 #define CPG_RCKCR	0x240
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
-	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers);
+	const struct cpg_core_clk *core,
+	const struct cpg_mssr_info *info,
+	struct cpg_mssr_pub *pub);
 int rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
 		       unsigned int clk_extalr, u32 mode);
 
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 31aa790fd003..e02e49f7fcf8 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -418,10 +418,11 @@ static const struct clk_div_table cpg_rpcsrc_div_table[] = {
 
 struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
+	struct cpg_mssr_pub *pub)
 {
 	const struct clk *parent;
+	void __iomem *base = pub->base0;
+	struct clk **clks = pub->clks;
 	unsigned int mult = 1;
 	unsigned int div = 1;
 	u32 value;
@@ -479,7 +480,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN4_SDH:
 		return cpg_sdh_clk_register(core->name, base + core->offset,
-					   __clk_get_name(parent), notifiers);
+					   __clk_get_name(parent), &pub->notifiers);
 
 	case CLK_TYPE_GEN4_SD:
 		return cpg_sd_clk_register(core->name, base + core->offset,
@@ -517,7 +518,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN4_RPC:
 		return cpg_rpc_clk_register(core->name, base + CPG_RPCCKCR,
-					    __clk_get_name(parent), notifiers);
+					    __clk_get_name(parent), &pub->notifiers);
 
 	case CLK_TYPE_GEN4_RPCD2:
 		return cpg_rpcd2_clk_register(core->name, base + CPG_RPCCKCR,
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
index 79e7a90c3b1b..7d5fba3aef19 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -127,7 +127,6 @@ static const u16 srstclr_for_gen4[] = {
  *
  * @rcdev: Optional reset controller entity
  * @dev: CPG/MSSR device
- * @base: CPG/MSSR register block base address
  * @reg_layout: CPG/MSSR register layout
  * @rmw_lock: protects RMW register accesses
  * @np: Device node in DT for this CPG/MSSR module
@@ -143,6 +142,7 @@ static const u16 srstclr_for_gen4[] = {
  *                 [].val: Saved values of SMSTPCR[]
  * @reserved_ids: Temporary used, reserved id list
  * @num_reserved_ids: Temporary used, number of reserved id list
+ * @pub: Data passed to clock registration callback
  * @clks: Array containing all Core and Module Clocks
  */
 struct cpg_mssr_priv {
@@ -150,16 +150,13 @@ struct cpg_mssr_priv {
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
@@ -172,6 +169,7 @@ struct cpg_mssr_priv {
 	unsigned int *reserved_ids;
 	unsigned int num_reserved_ids;
 
+	struct cpg_mssr_pub pub;
 	struct clk *clks[];
 };
 
@@ -205,38 +203,40 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	dev_dbg(dev, "MSTP %u%02u/%pC %s\n", reg, bit, hw->clk,
 		enable ? "ON" : "OFF");
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
 
-	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
+	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
+		priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
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
@@ -255,12 +255,13 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
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
@@ -352,7 +353,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_DIV6P1:
 	case CLK_TYPE_DIV6_RO:
 		WARN_DEBUG(core->parent >= priv->num_core_clks);
-		parent = priv->clks[core->parent];
+		parent = priv->pub.clks[core->parent];
 		if (IS_ERR(parent)) {
 			clk = parent;
 			goto fail;
@@ -362,12 +363,12 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 
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
@@ -383,8 +384,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	default:
 		if (info->cpg_clk_register)
 			clk = info->cpg_clk_register(dev, core, info,
-						     priv->clks, priv->base,
-						     &priv->notifiers);
+						     &priv->pub);
 		else
 			dev_err(dev, "%s has unsupported core clock type %u\n",
 				core->name, core->type);
@@ -395,7 +395,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 		goto fail;
 
 	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
+	priv->pub.clks[id] = clk;
 	return;
 
 fail:
@@ -418,14 +418,14 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
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
@@ -627,13 +627,13 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
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
@@ -647,7 +647,7 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 
 	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
 
-	writel(bitmask, priv->base + priv->reset_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
 	return 0;
 }
 
@@ -661,7 +661,7 @@ static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
 
 	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
 
-	writel(bitmask, priv->base + priv->reset_clear_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
 	return 0;
 }
 
@@ -673,7 +673,7 @@ static int cpg_mssr_status(struct reset_controller_dev *rcdev,
 	unsigned int bit = id % 32;
 	u32 bitmask = BIT(bit);
 
-	return !!(readl(priv->base + priv->reset_regs[reg]) & bitmask);
+	return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
 }
 
 static const struct reset_control_ops cpg_mssr_reset_ops = {
@@ -899,12 +899,12 @@ static int cpg_mssr_suspend_noirq(struct device *dev)
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
@@ -921,7 +921,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		return 0;
 
 	/* Restore core clocks */
-	raw_notifier_call_chain(&priv->notifiers, PM_EVENT_RESUME, NULL);
+	raw_notifier_call_chain(&priv->pub.notifiers, PM_EVENT_RESUME, NULL);
 
 	/* Restore module clocks */
 	for (reg = 0; reg < ARRAY_SIZE(priv->smstpcr_saved); reg++) {
@@ -930,29 +930,29 @@ static int cpg_mssr_resume_noirq(struct device *dev)
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
@@ -1062,12 +1062,13 @@ static int __init cpg_mssr_common_init(struct device *dev,
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
@@ -1075,7 +1076,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
-	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
+	RAW_INIT_NOTIFIER_HEAD(&priv->pub.notifiers);
 	priv->reg_layout = info->reg_layout;
 	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3) {
 		priv->status_regs = mstpsr;
@@ -1095,7 +1096,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	}
 
 	for (i = 0; i < nclks; i++)
-		priv->clks[i] = ERR_PTR(-ENOENT);
+		priv->pub.clks[i] = ERR_PTR(-ENOENT);
 
 	error = cpg_mssr_reserved_init(priv, info);
 	if (error)
@@ -1112,8 +1113,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
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
index a1d6e0cbcff9..adc8948e6af4 100644
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
@@ -27,6 +29,21 @@ struct cpg_core_clk {
 	unsigned int div;
 	unsigned int mult;
 	unsigned int offset;
+
+/**
+ * struct cpg_mssr_pub - Private data shared with
+ * device-specific clk registration code
+ *
+ * @base0: CPG/MSSR register block base0 address
+ * @rmw_lock: protects RMW register accesses
+ * @notifiers: Notifier chain to save/restore clock state for system resume
+ * @clks: pointer to clocks
+ */
+struct cpg_mssr_pub {
+	void __iomem *base0;
+	struct raw_notifier_head notifiers;
+	spinlock_t rmw_lock;
+	struct clk **clks;
 };
 
 enum clk_types {
@@ -153,8 +170,8 @@ struct cpg_mssr_info {
 	struct clk *(*cpg_clk_register)(struct device *dev,
 					const struct cpg_core_clk *core,
 					const struct cpg_mssr_info *info,
-					struct clk **clks, void __iomem *base,
-					struct raw_notifier_head *notifiers);
+					struct cpg_mssr_pub *pub);
+
 };
 
 extern const struct cpg_mssr_info r7s9210_cpg_mssr_info;
-- 
2.43.0


