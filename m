Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C3C48CA1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240289AbiALRqZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:25 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:16306 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355924AbiALRqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:24 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106270329"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8044340083E1;
        Thu, 13 Jan 2022 02:46:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 02/28] clk: renesas: rzg2l: Add PLL5_4 clk mux support
Date:   Wed, 12 Jan 2022 17:45:46 +0000
Message-Id: <20220112174612.10773-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PLL5_4 clk mux support to select clock from different clock
sources FOUTPOSTDIV and FOUT1PH0.

This patch uses the LUT to select the source based on DSI/DPI mode
and frequencies.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 86 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  8 +++
 2 files changed, 94 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c6f609c9fa6d..0d652f26cc2f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -334,6 +334,89 @@ static int rzg2l_cpg_sipll5_get_index(unsigned long rate,
 	return i;
 }
 
+struct pll5_mux_hw_data {
+	struct clk_hw hw;
+	u32 conf;
+	unsigned long rate;
+	struct rzg2l_cpg_priv *priv;
+};
+
+#define to_pll5_mux_hw_data(_hw)	container_of(_hw, struct pll5_mux_hw_data, hw)
+
+static int rzg2l_cpg_pll5_4_clk_mux_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
+{
+	struct clk_hw *parent;
+	struct pll5_mux_hw_data *hwdata = to_pll5_mux_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = hwdata->priv;
+	const struct rzg2l_pll5_param *s_table = priv->pll5_table;
+	int index = rzg2l_cpg_sipll5_get_index(req->rate, s_table, priv->num_pll5_entries);
+
+	parent = clk_hw_get_parent_by_index(hw, s_table[index].clksrc);
+	req->best_parent_hw = parent;
+	req->best_parent_rate = req->rate;
+	if (s_table[index].clksrc)
+		req->best_parent_rate /= 2;
+
+	return 0;
+}
+
+static int rzg2l_cpg_pll5_4_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct pll5_mux_hw_data *hwdata = to_pll5_mux_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = hwdata->priv;
+
+	writel(index ? 0x10001 : 0x10000, priv->base + CPG_OTHERFUNC1_REG);
+
+	return 0;
+}
+
+static u8 rzg2l_cpg_pll5_4_clk_mux_get_parent(struct clk_hw *hw)
+{
+	struct pll5_mux_hw_data *hwdata = to_pll5_mux_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = hwdata->priv;
+
+	return readl(priv->base + GET_REG_OFFSET(hwdata->conf));
+}
+
+static const struct clk_ops rzg2l_cpg_pll5_4_clk_mux_ops = {
+	.determine_rate = rzg2l_cpg_pll5_4_clk_mux_determine_rate,
+	.set_parent	= rzg2l_cpg_pll5_4_clk_mux_set_parent,
+	.get_parent	= rzg2l_cpg_pll5_4_clk_mux_get_parent,
+};
+
+static struct clk * __init
+rzg2l_cpg_pll5_4_mux_clk_register(const struct cpg_core_clk *core,
+				  struct rzg2l_cpg_priv *priv)
+{
+	struct pll5_mux_hw_data *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->conf = core->conf;
+
+	init.name = core->name;
+	init.ops = &rzg2l_cpg_pll5_4_clk_mux_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.num_parents = core->num_parents;
+	init.parent_names = core->parent_names;
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
 struct sipll5 {
 	struct clk_hw hw;
 	unsigned int conf;
@@ -635,6 +718,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SD_MUX:
 		clk = rzg2l_cpg_sd_mux_clk_register(core, priv->base, priv);
 		break;
+	case CLK_TYPE_PLL5_4_MUX:
+		clk = rzg2l_cpg_pll5_4_mux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 75b3a3bbbb60..4315d7ceb87d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -24,6 +24,7 @@
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
+#define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_MON_PLL5_LOCK	BIT(4)
 
@@ -51,6 +52,7 @@
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 
 #define SEL_PLL3_3	SEL_PLL_PACK(CPG_PL3_SSEL, 8, 1)
+#define SEL_PLL5_4	SEL_PLL_PACK(CPG_OTHERFUNC1_REG, 0, 1)
 #define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
 #define SEL_GPU2	SEL_PLL_PACK(CPG_PL6_SSEL, 12, 1)
 
@@ -97,6 +99,9 @@ enum clk_types {
 
 	/* Clock for SIPLL5 */
 	CLK_TYPE_SIPLL5,
+
+	/* Clock for PLL5_4 clock source selector */
+	CLK_TYPE_PLL5_4_MUX,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -122,6 +127,9 @@ enum clk_types {
 		 .parent_names = _parent_names, .num_parents = _num_parents)
 #define DEF_PLL5_FOUTPOSTDIV(_name, _id, _parent) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SIPLL5, .parent = _parent)
+#define DEF_PLL5_4_MUX(_name, _id, _conf, _parent_names, _num_parents) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLL5_4_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, .num_parents = _num_parents)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.17.1

