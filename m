Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664B64DE05D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 18:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236328AbiCRRwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 13:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbiCRRww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 13:52:52 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 45C7B193B7F;
        Fri, 18 Mar 2022 10:51:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,192,1643641200"; 
   d="scan'208";a="115031011"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Mar 2022 02:51:20 +0900
Received: from localhost.localdomain (unknown [10.226.93.159])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 99C19400E8E2;
        Sat, 19 Mar 2022 02:51:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/9] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
Date:   Fri, 18 Mar 2022 17:51:05 +0000
Message-Id: <20220318175113.8956-2-biju.das.jz@bp.renesas.com>
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

PLL5 generates FOUTPOSTDIV clk and is sourced by LCDC/DSI modules.
The FOUTPOSTDIV is connected to PLL5_4 MUX. Video clock is sourced
from DSI divider which is connected to PLL5_4 MUX.

This patch adds support for generating FOUTPOSTDIV clk.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->V1:
 * Removed LUT.
 * Replaced magic numbers with macros.
RFC:
 *https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-2-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 140 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  20 +++++
 2 files changed, 160 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 486d0656c58a..4d18699852fb 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -64,6 +64,15 @@ struct sd_hw_data {
 
 #define to_sd_hw_data(_hw)	container_of(_hw, struct sd_hw_data, hw)
 
+struct rzg2l_pll5_param {
+	u32 frequency;
+	u32 pl5_fracin;
+	u8 pl5_refdiv;
+	u8 pl5_intin;
+	u8 pl5_postdiv1;
+	u8 pl5_postdiv2;
+};
+
 /**
  * struct rzg2l_cpg_priv - Clock Pulse Generator Private Data
  *
@@ -78,6 +87,7 @@ struct sd_hw_data {
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @info: Pointer to platform data
+ * @pll5_params: pll5 parameters
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -93,6 +103,8 @@ struct rzg2l_cpg_priv {
 
 	struct raw_notifier_head notifiers;
 	const struct rzg2l_cpg_info *info;
+
+	struct rzg2l_pll5_param pll5_params;
 };
 
 static void rzg2l_cpg_del_clk_provider(void *data)
@@ -266,6 +278,131 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+struct sipll5 {
+	struct clk_hw hw;
+	u32 conf;
+	struct rzg2l_cpg_priv *priv;
+};
+
+#define to_sipll5(_hw)	container_of(_hw, struct sipll5, hw)
+
+static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct sipll5 *sipll5 = to_sipll5(hw);
+	struct rzg2l_cpg_priv *priv = sipll5->priv;
+
+	return priv->pll5_params.frequency;
+}
+
+static long rzg2l_cpg_sipll5_round_rate(struct clk_hw *hw,
+					unsigned long rate,
+					unsigned long *parent_rate)
+{
+	struct sipll5 *sipll5 = to_sipll5(hw);
+	struct rzg2l_cpg_priv *priv = sipll5->priv;
+
+	return priv->pll5_params.frequency;
+}
+
+static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct sipll5 *sipll5 = to_sipll5(hw);
+	struct rzg2l_cpg_priv *priv = sipll5->priv;
+	int ret;
+	u32 val;
+
+	/* Put PLL5 into standby mode */
+	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
+	ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
+				 !(val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
+	if (ret) {
+		dev_err(priv->dev, "failed to release pll5 lock");
+		return ret;
+	}
+
+	/* Output clock setting 1 */
+	writel(CPG_SIPLL5_CLK1_POSTDIV1_WEN | CPG_SIPLL5_CLK1_REFDIV_WEN |
+	       CPG_SIPLL5_CLK1_REFDIV_WEN  |
+	       (priv->pll5_params.pl5_postdiv1 << 0) |
+	       (priv->pll5_params.pl5_postdiv2 << 4) |
+	       (priv->pll5_params.pl5_refdiv << 8),
+	       priv->base + CPG_SIPLL5_CLK1);
+
+	/* Output clock setting, SSCG modulation value setting 3 */
+	writel((priv->pll5_params.pl5_fracin << 8), priv->base + CPG_SIPLL5_CLK3);
+
+	/* Output clock setting 4 */
+	writel(CPG_SIPLL5_CLK4_RESV_LSB | (priv->pll5_params.pl5_intin << 16),
+	       priv->base + CPG_SIPLL5_CLK4);
+
+	/* PLL normal mode setting */
+	writel(CPG_SIPLL5_STBY_SSCG_EN_WEN | CPG_SIPLL5_STBY_RESETB_WEN |
+	       CPG_SIPLL5_STBY_RESETB, priv->base + CPG_SIPLL5_STBY);
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
+	writel(CPG_SIPLL5_STBY_SSCG_EN_WEN | CPG_SIPLL5_STBY_RESETB_WEN |
+	       CPG_SIPLL5_STBY_RESETB, priv->base + CPG_SIPLL5_STBY);
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
@@ -420,6 +557,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		clk = rzg2l_cpg_pll_clk_register(core, priv->clks,
 						 priv->base, priv);
 		break;
+	case CLK_TYPE_SIPLL5:
+		clk = rzg2l_cpg_sipll5_register(core, priv->clks, priv);
+		break;
 	case CLK_TYPE_DIV:
 		clk = rzg2l_cpg_div_clk_register(core, priv->clks,
 						 priv->base, priv);
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index ce657beaf160..40f61db902b2 100644
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
@@ -19,6 +25,15 @@
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
 
+#define CPG_SIPLL5_STBY_RESETB		BIT(0)
+#define CPG_SIPLL5_STBY_RESETB_WEN	BIT(16)
+#define CPG_SIPLL5_STBY_SSCG_EN_WEN	BIT(18)
+#define CPG_SIPLL5_CLK1_POSTDIV1_WEN	BIT(16)
+#define CPG_SIPLL5_CLK1_POSTDIV2_WEN	BIT(20)
+#define CPG_SIPLL5_CLK1_REFDIV_WEN	BIT(24)
+#define CPG_SIPLL5_CLK4_RESV_LSB	(0xFF)
+#define CPG_SIPLL5_MON_PLL5_LOCK	BIT(4)
+
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
@@ -86,6 +101,9 @@ enum clk_types {
 
 	/* Clock with SD clock source selector */
 	CLK_TYPE_SD_MUX,
+
+	/* Clock for SIPLL5 */
+	CLK_TYPE_SIPLL5,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -109,6 +127,8 @@ enum clk_types {
 #define DEF_SD_MUX(_name, _id, _conf, _parent_names, _num_parents) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents)
+#define DEF_PLL5_FOUTPOSTDIV(_name, _id, _parent) \
+	DEF_TYPE(_name, _id, CLK_TYPE_SIPLL5, .parent = _parent)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.17.1

