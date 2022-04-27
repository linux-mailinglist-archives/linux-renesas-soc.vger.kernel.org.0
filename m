Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430E0511489
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 11:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiD0J5p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiD0J5o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 05:57:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9567401D3F;
        Wed, 27 Apr 2022 02:53:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,292,1643641200"; 
   d="scan'208";a="119361572"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Apr 2022 18:48:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.29])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B50F4265643;
        Wed, 27 Apr 2022 18:48:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Date:   Wed, 27 Apr 2022 10:48:17 +0100
Message-Id: <20220427094823.3319-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)

This patch add support for DSI divider clk by combining
DSIDIVA and DSIDIVB .

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V1->V2:
 * Replaced round_rate with determine_rate
 * Update rate variable during set_rate
 * Added get_vclk_parent_rate helper function
 * Replaced pll5_params with mux_dsi_div_params for dsi div values.
RFC->V1
 * Removed LUT and added an equation for computing VCLK
---
 drivers/clk/renesas/rzg2l-cpg.c | 121 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  11 +++
 2 files changed, 132 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 0120f239c94d..e0485d206d71 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -304,6 +304,124 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
 	return foutpostdiv_rate;
 }
 
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
+	unsigned long rate = dsi_div->rate;
+
+	if (!rate)
+		rate = parent_rate;
+
+	return rate;
+}
+
+static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
+						    unsigned long rate)
+{
+	unsigned long parent_rate;
+
+	struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	struct rzg2l_pll5_param params;
+
+	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
+
+	if (priv->mux_dsi_div_params.clksrc)
+		parent_rate /= 2;
+
+	return parent_rate;
+}
+
+static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	req->best_parent_rate = rzg2l_cpg_get_vclk_parent_rate(hw, req->rate);
+
+	return 0;
+}
+
+static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
+				      unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+
+	/*
+	 * MUX -->DIV_DSI_{A,B} -->M3 -->VCLK
+	 *
+	 * Based on the dot clock, the DSI divider clock sets the divider value,
+	 * calculates the pll parameters for generating FOUTPOSTDIV and the clk
+	 * source for the MUX and propagates that info to the parents.
+	 */
+
+	if (!rate)
+		return -EINVAL;
+
+	dsi_div->rate = rate;
+	writel(CPG_PL5_SDIV_DIV_DSI_A_WEN | CPG_PL5_SDIV_DIV_DSI_B_WEN |
+	       (priv->mux_dsi_div_params.dsi_div_a << 0) |
+	       (priv->mux_dsi_div_params.dsi_div_b << 8),
+	       priv->base + CPG_PL5_SDIV);
+
+	return 0;
+}
+
+static const struct clk_ops rzg2l_cpg_dsi_div_ops = {
+	.recalc_rate = rzg2l_cpg_dsi_div_recalc_rate,
+	.determine_rate = rzg2l_cpg_dsi_div_determine_rate,
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
 struct pll5_mux_hw_data {
 	struct clk_hw hw;
 	u32 conf;
@@ -733,6 +851,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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
index 2503251cb18f..1be29cec0cb2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -24,6 +24,7 @@
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
+#define CPG_PL5_SDIV		(0x420)
 #define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_STBY_RESETB		BIT(0)
@@ -38,6 +39,9 @@
 
 #define CPG_OTHERFUNC1_REG_RES0_ON_WEN	BIT(16)
 
+#define CPG_PL5_SDIV_DIV_DSI_A_WEN	BIT(16)
+#define CPG_PL5_SDIV_DIV_DSI_B_WEN	BIT(24)
+
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
@@ -53,6 +57,7 @@
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 #define DIVPL1A		DDIV_PACK(CPG_PL1_DDIV, 0, 2)
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
+#define DIVDSILPCLK	DDIV_PACK(CPG_PL2_DDIV, 12, 2)
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 #define DIVPL3C		DDIV_PACK(CPG_PL3A_DDIV, 8, 3)
@@ -114,6 +119,10 @@ enum clk_types {
 
 	/* Clock for PLL5_4 clock source selector */
 	CLK_TYPE_PLL5_4_MUX,
+
+	/* Clock for DSI divider */
+	CLK_TYPE_DSI_DIV,
+
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -142,6 +151,8 @@ enum clk_types {
 #define DEF_PLL5_4_MUX(_name, _id, _conf, _parent_names, _num_parents) \
 	DEF_TYPE(_name, _id, CLK_TYPE_PLL5_4_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents)
+#define DEF_DSI_DIV(_name, _id, _parent, _flag) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .flag = _flag)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.25.1

