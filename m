Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358F25114A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 12:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiD0J7q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 05:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiD0J7p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 05:59:45 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B5023FD24E;
        Wed, 27 Apr 2022 02:53:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,292,1643641200"; 
   d="scan'208";a="118179383"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Apr 2022 18:48:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.29])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1360D4264DAF;
        Wed, 27 Apr 2022 18:48:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/9] clk: renesas: rzg2l: Add PLL5_4 clk mux support
Date:   Wed, 27 Apr 2022 10:48:16 +0100
Message-Id: <20220427094823.3319-3-biju.das.jz@bp.renesas.com>
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

Add PLL5_4 clk mux support to select clock from clock
sources FOUTPOSTDIV and FOUT1PH0.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1->V2:
 * Added Rb tag from Geert
 * Added code comments for mux clock handling
 * Replace pll5_params with mux_dsi_div_params for clksrc.
RFC->V1:
 * Removed LUT.
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-3-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 93 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h | 10 ++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 69e0cef0b058..0120f239c94d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -304,6 +304,96 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
 	return foutpostdiv_rate;
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
+
+	parent = clk_hw_get_parent_by_index(hw, priv->mux_dsi_div_params.clksrc);
+	req->best_parent_hw = parent;
+	req->best_parent_rate = req->rate;
+
+	return 0;
+}
+
+static int rzg2l_cpg_pll5_4_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct pll5_mux_hw_data *hwdata = to_pll5_mux_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = hwdata->priv;
+
+	/*
+	 * FOUTPOSTDIV--->|
+	 *  |             | -->MUX -->DIV_DSIA_B -->M3 -->VCLK
+	 *  |--FOUT1PH0-->|
+	 *
+	 * Based on the dot clock, the DSI divider clock calculates the parent
+	 * rate and clk source for the MUX. It propagates that info to
+	 * pll5_4_clk_mux which sets the clock source for DSI divider clock.
+	 */
+
+	writel(CPG_OTHERFUNC1_REG_RES0_ON_WEN | index,
+	       priv->base + CPG_OTHERFUNC1_REG);
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
 	u32 conf;
@@ -640,6 +730,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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
index c39c0ca8d155..2503251cb18f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -24,6 +24,7 @@
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
+#define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_STBY_RESETB		BIT(0)
 #define CPG_SIPLL5_STBY_RESETB_WEN	BIT(16)
@@ -35,6 +36,8 @@
 #define CPG_SIPLL5_CLK4_RESV_LSB	(0xFF)
 #define CPG_SIPLL5_MON_PLL5_LOCK	BIT(4)
 
+#define CPG_OTHERFUNC1_REG_RES0_ON_WEN	BIT(16)
+
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
@@ -59,6 +62,7 @@
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 
 #define SEL_PLL3_3	SEL_PLL_PACK(CPG_PL3_SSEL, 8, 1)
+#define SEL_PLL5_4	SEL_PLL_PACK(CPG_OTHERFUNC1_REG, 0, 1)
 #define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
 #define SEL_GPU2	SEL_PLL_PACK(CPG_PL6_SSEL, 12, 1)
 
@@ -107,6 +111,9 @@ enum clk_types {
 
 	/* Clock for SIPLL5 */
 	CLK_TYPE_SIPLL5,
+
+	/* Clock for PLL5_4 clock source selector */
+	CLK_TYPE_PLL5_4_MUX,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -132,6 +139,9 @@ enum clk_types {
 		 .parent_names = _parent_names, .num_parents = _num_parents)
 #define DEF_PLL5_FOUTPOSTDIV(_name, _id, _parent) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SIPLL5, .parent = _parent)
+#define DEF_PLL5_4_MUX(_name, _id, _conf, _parent_names, _num_parents) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLL5_4_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, .num_parents = _num_parents)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.25.1

