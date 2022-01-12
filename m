Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56B648CA18
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355925AbiALRqX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:23 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:16306 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355922AbiALRqV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:21 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106270323"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 00E844005E1F;
        Thu, 13 Jan 2022 02:46:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 01/28] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
Date:   Wed, 12 Jan 2022 17:45:45 +0000
Message-Id: <20220112174612.10773-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PLL5 generates FOUTPOSTDIV clk and is sourced by LCDC/DSI modules.
The FOUTPOSTDIV is connected to PLL5_4 MUX. Video clock is sourced
from DSI divider which is connected to PLL5_4 MUX.

Added 2 LUT's for generating FOUTPOSTDIV, 1 for DSI mode and other
for DPI mode as it requires different parameters for generating the
video clock. The LUT supports minimal set of frequency used by
commonly used resolutions.

This patch uses the above LUT to generate the required video clock
by matching the frequency value in LUT with FOUTPOSTDIV/DSI_DIV.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 217 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  15 +++
 2 files changed, 232 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index edd0abe34a37..c6f609c9fa6d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -78,6 +78,8 @@ struct sd_hw_data {
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @info: Pointer to platform data
+ * @pll5_table: Table containing a set of pll5 parameters
+ * @num_pll5_entries: Number of entries in pll5 table
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -93,6 +95,9 @@ struct rzg2l_cpg_priv {
 
 	struct raw_notifier_head notifiers;
 	const struct rzg2l_cpg_info *info;
+
+	const struct rzg2l_pll5_param *pll5_table;
+	unsigned int num_pll5_entries;
 };
 
 static void rzg2l_cpg_del_clk_provider(void *data)
@@ -266,6 +271,203 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+struct rzg2l_pll5_param {
+	u64	frequency;
+	u64	pl5_refdiv;
+	u32	pl5_intin;
+	u32	pl5_fracin;
+	u8	pl5_postdiv1;
+	u8	pl5_postdiv2;
+	u8	dsi_div_a;
+	u8	dsi_div_b;
+	u8	dsi_div;
+	u8	clksrc;
+};
+
+static const struct rzg2l_pll5_param dsi_mode_param[] = {
+	{   25175000, 1,  16, 13141593, 1, 1, 2, 3, 16, 0 }, /* VGA 25.175MHz */
+	{   25200000, 1,  16, 13421773, 1, 1, 2, 3, 16, 0 }, /* VGA 25.200MHz */
+	{   27000000, 1,  18,        0, 1, 1, 2, 3, 16, 0 }, /* 480p/576p 27.000MHz */
+	{   27027000, 1,  18,   301990, 1, 1, 2, 3, 16, 0 }, /* 480p 27.027MHz */
+	{   29605000, 1,  19, 12359216, 1, 1, 2, 3, 16, 0 }, /* WVGA 29.605MHz */
+	{   40000000, 2,  80,        0, 2, 1, 1, 2,  6, 0 }, /* SVGA 40.00MHz */
+	{   65000000, 1,  43,  5592405, 1, 1, 2, 3, 16, 0 }, /* XGA 65.00MHz */
+	{   71000000, 2,  71,        0, 1, 1, 1, 2,  6, 0 }, /* WXGA 1280x800 71.0MHz */
+	{   74176000, 1,  49,  7560932, 1, 1, 2, 3, 16, 0 }, /* 720p 74.176MHz */
+	{   74250000, 1,  49,  8388608, 1, 1, 2, 3, 16, 0 }, /* 720p 74.25MHz */
+	{   85500000, 2,  85,  8388608, 1, 1, 1, 2,  6, 0 }, /* FWXGA 1360x768 85.5MHz */
+	{   88750000, 2,  88, 12582912, 1, 1, 1, 2,  6, 1 }, /* WXGA+ 1440x900 88.75MHz */
+	{  108000000, 2, 108,        0, 1, 1, 1, 2,  6, 1 }, /* SXGA 108MHz */
+	{  148500000, 2, 148,  8388608, 1, 1, 1, 2,  6, 1 }, /* 1080p 148.5MHz */
+	{ 3000000000, 1, 125,        0, 1, 1, 0, 0,  0, 0 }, /* 3000 MHz */
+};
+
+static const struct rzg2l_pll5_param dpi_mode_param[] = {
+	{   25175000, 1, 102, 13386820, 7, 7, 1, 0, 2, 0 }, /* VGA 25.175MHz */
+	{   25200000, 1,  73,  8388608, 7, 5, 1, 0, 2, 0 }, /* VGA 25.200MHz */
+	{   27000000, 1,  78, 12582912, 7, 5, 1, 0, 2, 0 }, /* 480p/576p 27.000MHz */
+	{   27027000, 1, 110,  6043992, 7, 7, 1, 0, 2, 0 }, /* 480p 27.027MHz */
+	{   29605000, 1,  88, 13673431, 6, 6, 1, 0, 2, 0 }, /* WVGA 29.605MHz */
+	{   40000000, 1,  70,        0, 7, 3, 1, 0, 2, 0 }, /* SVGA 40.00MHz */
+	{   65000000, 1,  81,  4194304, 5, 3, 1, 0, 2, 0 }, /* XGA 65.00MHz */
+	{   71000000, 2,  71,        0, 6, 2, 1, 0, 2, 0 }, /* WXGA 1280x800 71.0MHz */
+	{   74176000, 1,  74,  2952790, 6, 2, 1, 0, 2, 0 }, /* 720p 74.176MHz */
+	{   74250000, 1,  86, 10485760, 7, 2, 1, 0, 2, 0 }, /* 720p 74.25MHz */
+	{   85500000, 1,  83,  8388608, 6, 2, 1, 0, 2, 0 }, /* WXGA 1280x800 83.5MHz   */
+	{ 3000000000, 1, 125,        0, 1, 1, 0, 0, 0, 0 }, /* 3000 MHz */
+};
+
+static int rzg2l_cpg_sipll5_get_index(unsigned long rate,
+				      const struct rzg2l_pll5_param *pll5tab,
+				      unsigned int n)
+{
+	unsigned int  i;
+
+	for (i = 0; i < n; i++) {
+		if (pll5tab[i].frequency  == rate / pll5tab[i].dsi_div)
+			break;
+	}
+
+	if (i == n)
+		i--;
+
+	return i;
+}
+
+struct sipll5 {
+	struct clk_hw hw;
+	unsigned int conf;
+	unsigned long rate;
+	struct rzg2l_cpg_priv *priv;
+};
+
+#define to_sipll5(_hw)	container_of(_hw, struct sipll5, hw)
+
+static unsigned long rzg2l_cpg_sipll5_get_rate(unsigned long rate,
+					       const struct rzg2l_pll5_param *pll5tab,
+					       unsigned int n)
+{
+	int index = rzg2l_cpg_sipll5_get_index(rate, pll5tab, n);
+
+	return pll5tab[index].frequency * pll5tab[index].dsi_div;
+}
+
+static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct sipll5 *sipll5 = to_sipll5(hw);
+
+	return sipll5->rate;
+}
+
+static long rzg2l_cpg_sipll5_round_rate(struct clk_hw *hw,
+					unsigned long rate,
+					unsigned long *parent_rate)
+{
+	struct sipll5 *sipll5 = to_sipll5(hw);
+	struct rzg2l_cpg_priv *priv = sipll5->priv;
+	const struct rzg2l_pll5_param *pll5tab = priv->pll5_table;
+
+	sipll5->rate = rzg2l_cpg_sipll5_get_rate(rate, pll5tab, priv->num_pll5_entries);
+	return sipll5->rate;
+}
+
+static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct sipll5 *sipll5 = to_sipll5(hw);
+	struct rzg2l_cpg_priv *priv = sipll5->priv;
+	const struct rzg2l_pll5_param *pll5tab = priv->pll5_table;
+	u8 id = rzg2l_cpg_sipll5_get_index(rate, pll5tab, priv->num_pll5_entries);
+	int ret;
+	u32 val;
+
+	/* Put PLL5 into standby mode */
+	writel(0x00050000, priv->base + CPG_SIPLL5_STBY);
+	ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
+				 !(val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
+	if (ret) {
+		dev_err(priv->dev, "failed to release pll5 lock");
+		return ret;
+	}
+
+	/* Output clock setting 1 */
+	writel(0x01110000 |
+	       (pll5tab[id].pl5_postdiv1 << 0) |
+	       (pll5tab[id].pl5_postdiv2 << 4) |
+	       (pll5tab[id].pl5_refdiv << 8),
+	       priv->base + CPG_SIPLL5_CLK1);
+	/* Output clock setting, SSCG modulation value setting 3 */
+	writel((0 << 0) | (pll5tab[id].pl5_fracin << 8), priv->base + CPG_SIPLL5_CLK3);
+	/* Output clock setting 4 */
+	writel(0x000000ff | (pll5tab[id].pl5_intin << 16), priv->base + CPG_SIPLL5_CLK4);
+
+	/* SSCG modulation value setting 5 */
+	writel((0x16 << 0), priv->base + CPG_SIPLL5_CLK5);
+	/* PLL normal mode setting */
+	writel(0x00050001, priv->base + CPG_SIPLL5_STBY);
+
+	/* PLL normal mode transition, output clock stability check */
+	ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
+				 (val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
+	if (ret) {
+		dev_err(priv->dev, "failed to lock pll5");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops rzg2l_cpg_sipll5_ops = {
+	.recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
+	.round_rate = rzg2l_cpg_sipll5_round_rate,
+	.set_rate = rzg2l_cpg_sipll5_set_rate,
+};
+
+static struct clk * __init
+rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
+			  struct clk **clks,
+			  struct rzg2l_cpg_priv *priv)
+{
+	const struct clk *parent;
+	struct clk_init_data init;
+	const char *parent_name;
+	struct sipll5 *sipll5;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = clks[core->parent & 0xffff];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	sipll5 = devm_kzalloc(priv->dev, sizeof(*sipll5), GFP_KERNEL);
+	if (!sipll5)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	parent_name = __clk_get_name(parent);
+	init.ops = &rzg2l_cpg_sipll5_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	sipll5->hw.init = &init;
+	sipll5->conf = core->conf;
+	sipll5->priv = priv;
+
+	writel(0x00050001, priv->base + CPG_SIPLL5_STBY);
+
+	clk_hw = &sipll5->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 struct pll_clk {
 	struct clk_hw hw;
 	unsigned int conf;
@@ -420,6 +622,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		clk = rzg2l_cpg_pll_clk_register(core, priv->clks,
 						 priv->base, priv);
 		break;
+	case CLK_TYPE_SIPLL5:
+		clk = rzg2l_cpg_sipll5_register(core, priv->clks, priv);
+		break;
 	case CLK_TYPE_DIV:
 		clk = rzg2l_cpg_div_clk_register(core, priv->clks,
 						 priv->base, priv);
@@ -918,6 +1123,18 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	priv->num_resets = info->num_resets;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 
+	priv->pll5_table = dpi_mode_param;
+	priv->num_pll5_entries = ARRAY_SIZE(dpi_mode_param);
+	/* Fix me: Selection of the table needs to be overridden by either
+	 * 1) a property in DTS or
+	 * 2) Detecting DSI/DPI mode from dts or
+	 * 3) DSI/DPI mode runtime detection
+	 */
+	if (info->pll5_lcdc_dsi_mode) {
+		priv->pll5_table = dsi_mode_param;
+		priv->num_pll5_entries = ARRAY_SIZE(dsi_mode_param);
+	}
+
 	for (i = 0; i < nclks; i++)
 		clks[i] = ERR_PTR(-ENOENT);
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 5729d102034b..75b3a3bbbb60 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -9,6 +9,12 @@
 #ifndef __RENESAS_RZG2L_CPG_H__
 #define __RENESAS_RZG2L_CPG_H__
 
+#define CPG_SIPLL5_STBY		(0x140)
+#define CPG_SIPLL5_CLK1		(0x144)
+#define CPG_SIPLL5_CLK3		(0x14C)
+#define CPG_SIPLL5_CLK4		(0x150)
+#define CPG_SIPLL5_CLK5		(0x154)
+#define CPG_SIPLL5_MON		(0x15C)
 #define CPG_PL1_DDIV		(0x200)
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
@@ -19,6 +25,8 @@
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
 
+#define CPG_SIPLL5_MON_PLL5_LOCK	BIT(4)
+
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
@@ -86,6 +94,9 @@ enum clk_types {
 
 	/* Clock with SD clock source selector */
 	CLK_TYPE_SD_MUX,
+
+	/* Clock for SIPLL5 */
+	CLK_TYPE_SIPLL5,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -109,6 +120,8 @@ enum clk_types {
 #define DEF_SD_MUX(_name, _id, _conf, _parent_names, _num_parents) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents)
+#define DEF_PLL5_FOUTPOSTDIV(_name, _id, _parent) \
+	DEF_TYPE(_name, _id, CLK_TYPE_SIPLL5, .parent = _parent)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
@@ -200,6 +213,8 @@ struct rzg2l_cpg_info {
 	/* Critical Module Clocks that should not be disabled */
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
+
+	bool pll5_lcdc_dsi_mode;
 };
 
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
-- 
2.17.1

