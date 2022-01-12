Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F7548CA1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355927AbiALRq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:28 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59315 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355923AbiALRq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:27 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824678"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E71CD4005E1F;
        Thu, 13 Jan 2022 02:46:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 03/28] clk: renesas: rzg2l: Add DSI divider clk support
Date:   Wed, 12 Jan 2022 17:45:47 +0000
Message-Id: <20220112174612.10773-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

M3 clock is sourced from DSI Dividers(DSIDIVA and DSIDIVB)

This patch uses the LUT to set the divider values for DSI/DPI mode
on various frequencies defined in LUT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 123 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   7 ++
 2 files changed, 130 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 0d652f26cc2f..3f79973b1e45 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -317,6 +317,126 @@ static const struct rzg2l_pll5_param dpi_mode_param[] = {
 	{ 3000000000, 1, 125,        0, 1, 1, 0, 0, 0, 0 }, /* 3000 MHz */
 };
 
+static int rzg2l_cpg_pll5_param_get_index(unsigned long rate,
+					  const struct rzg2l_pll5_param *pll5tab,
+					  unsigned int n)
+{
+	unsigned int  i;
+	int index = 0, prev_index = 0;
+
+	for (i = 0; i < n; i++) {
+		if (pll5tab[i].frequency == rate) {
+			index = i;
+			break;
+		}
+		if (pll5tab[i].frequency > rate) {
+			if ((pll5tab[i].frequency - rate) > (rate - pll5tab[prev_index].frequency))
+				index = prev_index;
+			else
+				index = i;
+			break;
+		}
+		prev_index = i;
+	}
+
+	if (i == n)
+		index = i - 1;
+
+	return index;
+}
+
+struct dsi_div_hw_data {
+	struct clk_hw hw;
+	u32 conf;
+	unsigned long rate;
+	struct rzg2l_cpg_priv *priv;
+};
+
+#define to_dsi_div_hw_data(_hw)	container_of(_hw, struct dsi_div_hw_data, hw)
+
+static unsigned long rzg2l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
+
+	return dsi_div->rate;
+}
+
+static long rzg2l_cpg_dsi_div_round_rate(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long *parent_rate)
+{
+	struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	const struct rzg2l_pll5_param *dtable = priv->pll5_table;
+	int index = rzg2l_cpg_pll5_param_get_index(rate, dtable, priv->num_pll5_entries);
+
+	dsi_div->rate = dtable[index].frequency;
+	*parent_rate = dtable[index].dsi_div * dsi_div->rate;
+
+	return dsi_div->rate;
+}
+
+static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
+				      unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	const struct rzg2l_pll5_param *dtable = priv->pll5_table;
+	int id = rzg2l_cpg_pll5_param_get_index(rate, dtable, priv->num_pll5_entries);
+
+	writel(0x01010000 | (dtable[id].dsi_div_a << 0) | (dtable[id].dsi_div_b << 8),
+	       priv->base + CPG_PL5_SDIV);
+
+	return 0;
+}
+
+static const struct clk_ops rzg2l_cpg_dsi_div_ops = {
+	.recalc_rate = rzg2l_cpg_dsi_div_recalc_rate,
+	.round_rate = rzg2l_cpg_dsi_div_round_rate,
+	.set_rate = rzg2l_cpg_dsi_div_set_rate,
+};
+
+static struct clk * __init
+rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
+			       struct clk **clks,
+			       struct rzg2l_cpg_priv *priv)
+{
+	struct dsi_div_hw_data *clk_hw_data;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = clks[core->parent & 0xffff];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzg2l_cpg_dsi_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clk_hw = &clk_hw_data->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzg2l_cpg_sipll5_get_index(unsigned long rate,
 				      const struct rzg2l_pll5_param *pll5tab,
 				      unsigned int n)
@@ -721,6 +841,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLL5_4_MUX:
 		clk = rzg2l_cpg_pll5_4_mux_clk_register(core, priv);
 		break;
+	case CLK_TYPE_DSI_DIV:
+		clk = rzg2l_cpg_dsi_div_clk_register(core, priv->clks, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 4315d7ceb87d..625bf1c0f396 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -24,6 +24,7 @@
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
+#define CPG_PL5_SDIV		(0x420)
 #define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_MON_PLL5_LOCK	BIT(4)
@@ -102,6 +103,10 @@ enum clk_types {
 
 	/* Clock for PLL5_4 clock source selector */
 	CLK_TYPE_PLL5_4_MUX,
+
+	/* Clock for DSI divider */
+	CLK_TYPE_DSI_DIV,
+
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -130,6 +135,8 @@ enum clk_types {
 #define DEF_PLL5_4_MUX(_name, _id, _conf, _parent_names, _num_parents) \
 	DEF_TYPE(_name, _id, CLK_TYPE_PLL5_4_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents)
+#define DEF_DSI_DIV(_name, _id, _parent, _flag) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .flag = _flag)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.17.1

