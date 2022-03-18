Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439A44DE080
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 18:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236760AbiCRRxA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 13:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239495AbiCRRw6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 13:52:58 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D05D193148;
        Fri, 18 Mar 2022 10:51:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,192,1643641200"; 
   d="scan'208";a="114099397"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2022 02:51:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.159])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 794B040165BF;
        Sat, 19 Mar 2022 02:51:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Date:   Fri, 18 Mar 2022 17:51:07 +0000
Message-Id: <20220318175113.8956-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)

This patch add support for DSI divider clk by combaining
DSIDIVA and DSIDIVB .

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->V1
 * Removed LUT and added an equation for computing VCLK.
---
 drivers/clk/renesas/rzg2l-cpg.c | 114 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  13 ++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f8e177ef3f93..6e52cdd1cffe 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -27,6 +27,7 @@
 #include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -72,6 +73,8 @@ struct rzg2l_pll5_param {
 	u8 pl5_postdiv1;
 	u8 pl5_postdiv2;
 	u8 clksrc;
+	u8 dsi_div_a;
+	u8 dsi_div_b;
 };
 
 /**
@@ -279,6 +282,114 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
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
+
+	return dsi_div->rate;
+}
+
+static long rzg2l_cpg_dsi_div_round_rate(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long *parent_rate)
+
+{
+	struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+
+	dsi_div->rate = rate;
+
+	priv->pll5_params.pl5_intin = rate / MEGA;
+	priv->pll5_params.pl5_fracin = ((rate % MEGA) << 24) / MEGA;
+	priv->pll5_params.pl5_refdiv = 2;
+	priv->pll5_params.pl5_postdiv1 = 1;
+	priv->pll5_params.pl5_postdiv2 = 1;
+	priv->pll5_params.clksrc = 1;
+	priv->pll5_params.dsi_div_a = 1;
+	priv->pll5_params.dsi_div_b = 2;
+
+	priv->pll5_params.frequency =
+		EXTAL_FREQ_IN_MEGA_HZ * MEGA / priv->pll5_params.pl5_refdiv *
+		((((priv->pll5_params.pl5_intin << 24) + priv->pll5_params.pl5_fracin)) >> 24) /
+		(priv->pll5_params.pl5_postdiv1 * priv->pll5_params.pl5_postdiv2);
+
+	if (priv->pll5_params.clksrc)
+		priv->pll5_params.frequency /= 2;
+
+	*parent_rate = priv->pll5_params.frequency;
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
+
+	writel(CPG_PL5_SDIV_DIV_DSI_A_WEN | CPG_PL5_SDIV_DIV_DSI_B_WEN |
+	       (priv->pll5_params.dsi_div_a << 0) | (priv->pll5_params.dsi_div_b << 8),
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
 struct pll5_mux_hw_data {
 	struct clk_hw hw;
 	u32 conf;
@@ -654,6 +765,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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
index a4bdc1d7b5aa..c75db039b444 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -24,6 +24,7 @@
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
+#define CPG_PL5_SDIV		(0x420)
 #define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_STBY_RESETB		BIT(0)
@@ -37,6 +38,11 @@
 
 #define CPG_OTHERFUNC1_REG_RES0_ON_WEN	BIT(16)
 
+#define CPG_PL5_SDIV_DIV_DSI_A_WEN	BIT(16)
+#define CPG_PL5_SDIV_DIV_DSI_B_WEN	BIT(24)
+
+#define EXTAL_FREQ_IN_MEGA_HZ		(24)
+
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
@@ -52,6 +58,7 @@
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 #define DIVPL1A		DDIV_PACK(CPG_PL1_DDIV, 0, 2)
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
+#define DIVDSILPCLK	DDIV_PACK(CPG_PL2_DDIV, 12, 2)
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 #define DIVPL3C		DDIV_PACK(CPG_PL3A_DDIV, 8, 3)
@@ -111,6 +118,10 @@ enum clk_types {
 
 	/* Clock for PLL5_4 clock source selector */
 	CLK_TYPE_PLL5_4_MUX,
+
+	/* Clock for DSI divider */
+	CLK_TYPE_DSI_DIV,
+
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -139,6 +150,8 @@ enum clk_types {
 #define DEF_PLL5_4_MUX(_name, _id, _conf, _parent_names, _num_parents) \
 	DEF_TYPE(_name, _id, CLK_TYPE_PLL5_4_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents)
+#define DEF_DSI_DIV(_name, _id, _parent, _flag) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .flag = _flag)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.17.1

