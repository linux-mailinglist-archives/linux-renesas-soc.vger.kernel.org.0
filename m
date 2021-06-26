Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C64F3B4DA0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Jun 2021 10:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFZIQ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Jun 2021 04:16:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:51598 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229635AbhFZIQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Jun 2021 04:16:27 -0400
X-IronPort-AV: E=Sophos;i="5.83,301,1616425200"; 
   d="scan'208";a="85587085"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2021 17:14:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A25784008C54;
        Sat, 26 Jun 2021 17:14:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 06/10] drivers: clk: renesas: r9a07g044-cpg: Update {GIC,IA55,SCIF} clock/reset entries
Date:   Sat, 26 Jun 2021 09:13:40 +0100
Message-Id: <20210626081344.5783-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update {GIC,IA55,SCIF} clock and reset entries to CPG driver to match with
RZ/G2L clock list hardware manual(RZG2L_clock_list_r02_02.xlsx) and RZ/G2L
HW manual(Rev.0.50).

Also separate reset from module clocks in order to handle it efficiently.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
 * FIxed the code comment onoff to bit.
v2->v3:
 * merged patch 6 and patch7
 * Added check for xlate
 * Improved DEF_MOD and DEF_RST macros
v2:
 * New patch
---
 drivers/clk/renesas/r9a07g044-cpg.c     | 62 ++++++++++++++-----------
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 59 +++++++++++------------
 drivers/clk/renesas/renesas-rzg2l-cpg.h | 36 ++++++++++----
 3 files changed, 93 insertions(+), 64 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 70df4feda417..ae24e0397d3c 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -84,34 +84,40 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
-	DEF_MOD("gic",		R9A07G044_CLK_GIC600,
-				R9A07G044_CLK_P1,
-				0x514, BIT(0), (BIT(0) | BIT(1))),
-	DEF_MOD("ia55",		R9A07G044_CLK_IA55,
-				R9A07G044_CLK_P1,
-				0x518, (BIT(0) | BIT(1)), BIT(0)),
-	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
-				R9A07G044_CLK_P0,
-				0x584, BIT(0), BIT(0)),
-	DEF_MOD("scif1",	R9A07G044_CLK_SCIF1,
-				R9A07G044_CLK_P0,
-				0x584, BIT(1), BIT(1)),
-	DEF_MOD("scif2",	R9A07G044_CLK_SCIF2,
-				R9A07G044_CLK_P0,
-				0x584, BIT(2), BIT(2)),
-	DEF_MOD("scif3",	R9A07G044_CLK_SCIF3,
-				R9A07G044_CLK_P0,
-				0x584, BIT(3), BIT(3)),
-	DEF_MOD("scif4",	R9A07G044_CLK_SCIF4,
-				R9A07G044_CLK_P0,
-				0x584, BIT(4), BIT(4)),
-	DEF_MOD("sci0",		R9A07G044_CLK_SCI0,
-				R9A07G044_CLK_P0,
-				0x588, BIT(0), BIT(0)),
+	DEF_MOD("gic",		R9A07G044_GIC600_GICCLK, R9A07G044_CLK_P1,
+				0x514, 0),
+	DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
+				0x518, 0),
+	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
+				0x518, 1),
+	DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
+				0x584, 0),
+	DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
+				0x584, 1),
+	DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK, R9A07G044_CLK_P0,
+				0x584, 2),
+	DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK, R9A07G044_CLK_P0,
+				0x584, 3),
+	DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK, R9A07G044_CLK_P0,
+				0x584, 4),
+	DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
+				0x588, 0),
+};
+
+static struct rzg2l_reset r9a07g044_resets[] = {
+	DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
+	DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A07G044_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A07G044_SCIF1_RST_SYSTEM_N, 0x884, 1),
+	DEF_RST(R9A07G044_SCIF2_RST_SYSTEM_N, 0x884, 2),
+	DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
+	DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
+	DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
-	MOD_CLK_BASE + R9A07G044_CLK_GIC600,
+	MOD_CLK_BASE + R9A07G044_GIC600_GICCLK,
 };
 
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
@@ -128,5 +134,9 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Module Clocks */
 	.mod_clks = r9a07g044_mod_clks,
 	.num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
-	.num_hw_mod_clks = R9A07G044_CLK_MIPI_DSI_PIN + 1,
+	.num_hw_mod_clks = R9A07G044_TSU_PCLK + 1,
+
+	/* Resets */
+	.resets = r9a07g044_resets,
+	.num_resets = ARRAY_SIZE(r9a07g044_resets),
 };
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 892392b9e0b2..9addc9dae31a 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -47,9 +47,9 @@
 #define SDIV(val)		DIV_RSMASK(val, 0, 0x7)
 
 #define CLK_ON_R(reg)		(reg)
-#define CLK_MON_R(reg)		(0x680 - 0x500 + (reg))
-#define CLK_RST_R(reg)		(0x800 - 0x500 + (reg))
-#define CLK_MRST_R(reg)		(0x980 - 0x500 + (reg))
+#define CLK_MON_R(reg)		(0x180 + (reg))
+#define CLK_RST_R(reg)		(reg)
+#define CLK_MRST_R(reg)		(0x180 + (reg))
 
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
 #define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
@@ -78,6 +78,7 @@ struct rzg2l_cpg_priv {
 	struct clk **clks;
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
+	unsigned int num_resets;
 	unsigned int last_dt_core_clk;
 
 	struct raw_notifier_head notifiers;
@@ -308,15 +309,13 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  *
  * @hw: handle between common and hardware-specific interfaces
  * @off: register offset
- * @onoff: ON/MON bits
- * @reset: reset bits
+ * @bit: ON/MON bit
  * @priv: CPG/MSTP private data
  */
 struct mstp_clock {
 	struct clk_hw hw;
 	u16 off;
-	u8 onoff;
-	u8 reset;
+	u8 bit;
 	struct rzg2l_cpg_priv *priv;
 };
 
@@ -330,6 +329,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	struct device *dev = priv->dev;
 	unsigned long flags;
 	unsigned int i;
+	u32 bitmask = BIT(clock->bit);
 	u32 value;
 
 	if (!clock->off) {
@@ -342,9 +342,9 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
 	if (enable)
-		value = (clock->onoff << 16) | clock->onoff;
+		value = (bitmask << 16) | bitmask;
 	else
-		value = clock->onoff << 16;
+		value = bitmask << 16;
 	writel(value, priv->base + CLK_ON_R(reg));
 
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
@@ -353,7 +353,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 		return 0;
 
 	for (i = 1000; i > 0; --i) {
-		if (((readl(priv->base + CLK_MON_R(reg))) & clock->onoff))
+		if (((readl(priv->base + CLK_MON_R(reg))) & bitmask))
 			break;
 		cpu_relax();
 	}
@@ -381,6 +381,7 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 {
 	struct mstp_clock *clock = to_mod_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
+	u32 bitmask = BIT(clock->bit);
 	u32 value;
 
 	if (!clock->off) {
@@ -390,7 +391,7 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 
 	value = readl(priv->base + CLK_MON_R(clock->off));
 
-	return !(value & clock->onoff);
+	return !(value & bitmask);
 }
 
 static const struct clk_ops rzg2l_mod_clock_ops = {
@@ -450,8 +451,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	init.num_parents = 1;
 
 	clock->off = mod->off;
-	clock->onoff = mod->onoff;
-	clock->reset = mod->reset;
+	clock->bit = mod->bit;
 	clock->priv = priv;
 	clock->hw.init = &init;
 
@@ -475,12 +475,11 @@ static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
 {
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->mod_clks[id].off;
-	u32 dis = info->mod_clks[id].reset;
+	unsigned int reg = info->resets[id].off;
+	u32 dis = BIT(info->resets[id].bit);
 	u32 we = dis << 16;
 
-	dev_dbg(rcdev->dev, "reset name:%s id:%ld offset:0x%x\n",
-		info->mod_clks[id].name, id, CLK_RST_R(reg));
+	dev_dbg(rcdev->dev, "reset id:%ld offset:0x%x\n", id, CLK_RST_R(reg));
 
 	/* Reset module */
 	writel(we, priv->base + CLK_RST_R(reg));
@@ -499,11 +498,10 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 {
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->mod_clks[id].off;
-	u32 value = info->mod_clks[id].reset << 16;
+	unsigned int reg = info->resets[id].off;
+	u32 value = BIT(info->resets[id].bit) << 16;
 
-	dev_dbg(rcdev->dev, "assert name:%s id:%ld offset:0x%x\n",
-		info->mod_clks[id].name, id, CLK_RST_R(reg));
+	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, CLK_RST_R(reg));
 
 	writel(value, priv->base + CLK_RST_R(reg));
 	return 0;
@@ -514,12 +512,12 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->mod_clks[id].off;
-	u32 dis = info->mod_clks[id].reset;
+	unsigned int reg = info->resets[id].off;
+	u32 dis = BIT(info->resets[id].bit);
 	u32 value = (dis << 16) | dis;
 
-	dev_dbg(rcdev->dev, "deassert name:%s id:%ld offset:0x%x\n",
-		info->mod_clks[id].name, id, CLK_RST_R(reg));
+	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id,
+		CLK_RST_R(reg));
 
 	writel(value, priv->base + CLK_RST_R(reg));
 	return 0;
@@ -530,8 +528,8 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
 {
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->mod_clks[id].off;
-	u32 bitmask = info->mod_clks[id].reset;
+	unsigned int reg = info->resets[id].off;
+	u32 bitmask = BIT(info->resets[id].bit);
 
 	return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
 }
@@ -546,9 +544,11 @@ static const struct reset_control_ops rzg2l_cpg_reset_ops = {
 static int rzg2l_cpg_reset_xlate(struct reset_controller_dev *rcdev,
 				 const struct of_phandle_args *reset_spec)
 {
+	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzg2l_cpg_info *info = priv->info;
 	unsigned int id = reset_spec->args[0];
 
-	if (id >= rcdev->nr_resets) {
+	if (id >= rcdev->nr_resets || !info->resets[id].off) {
 		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
 		return -EINVAL;
 	}
@@ -563,7 +563,7 @@ static int rzg2l_cpg_reset_controller_register(struct rzg2l_cpg_priv *priv)
 	priv->rcdev.dev = priv->dev;
 	priv->rcdev.of_reset_n_cells = 1;
 	priv->rcdev.of_xlate = rzg2l_cpg_reset_xlate;
-	priv->rcdev.nr_resets = priv->num_mod_clks;
+	priv->rcdev.nr_resets = priv->num_resets;
 
 	return devm_reset_controller_register(priv->dev, &priv->rcdev);
 }
@@ -691,6 +691,7 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	priv->clks = clks;
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
+	priv->num_resets = info->num_resets;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 
 	for (i = 0; i < nclks; i++)
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
index a6a3bade1985..63695280ce8b 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -77,26 +77,40 @@ enum clk_types {
  * @id: clock index in array containing all Core and Module Clocks
  * @parent: id of parent clock
  * @off: register offset
- * @onoff: ON/MON bits
- * @reset: reset bits
+ * @bit: ON/MON bit
  */
 struct rzg2l_mod_clk {
 	const char *name;
 	unsigned int id;
 	unsigned int parent;
 	u16 off;
-	u8 onoff;
-	u8 reset;
+	u8 bit;
 };
 
-#define DEF_MOD(_name, _id, _parent, _off, _onoff, _reset)	\
-	[_id] = { \
+#define DEF_MOD(_name, _id, _parent, _off, _bit)	\
+	{ \
 		.name = _name, \
-		.id = MOD_CLK_BASE + _id, \
+		.id = MOD_CLK_BASE + (_id), \
 		.parent = (_parent), \
 		.off = (_off), \
-		.onoff = (_onoff), \
-		.reset = (_reset) \
+		.bit = (_bit), \
+	}
+
+/**
+ * struct rzg2l_reset - Reset definitions
+ *
+ * @off: register offset
+ * @bit: reset bit
+ */
+struct rzg2l_reset {
+	u16 off;
+	u8 bit;
+};
+
+#define DEF_RST(_id, _off, _bit)	\
+	[_id] = { \
+		.off = (_off), \
+		.bit = (_bit) \
 	}
 
 /**
@@ -127,6 +141,10 @@ struct rzg2l_cpg_info {
 	unsigned int num_mod_clks;
 	unsigned int num_hw_mod_clks;
 
+	/* Resets */
+	const struct rzg2l_reset *resets;
+	unsigned int num_resets;
+
 	/* Critical Module Clocks that should not be disabled */
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
-- 
2.17.1

