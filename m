Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92B44EFF76
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbiDBHs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbiDBHs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:48:28 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 076B118B261;
        Sat,  2 Apr 2022 00:46:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="116497954"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2022 16:46:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6A5F841E3A6A;
        Sat,  2 Apr 2022 16:46:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] clk: renesas: r9a07g043: Add ethernet clock sources
Date:   Sat,  2 Apr 2022 08:46:24 +0100
Message-Id: <20220402074626.25624-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402074626.25624-1-biju.das.jz@bp.renesas.com>
References: <20220402074626.25624-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ethernet reference clock can be sourced from PLL5_500 or PLL6. Add
support for ethernet source clock selection using SEL_PLL_6_2 mux.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert
---
 drivers/clk/renesas/r9a07g043-cpg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 0c574e153d4d..b9011bc7fe49 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -32,7 +32,10 @@ enum clk_ids {
 	CLK_PLL3_DIV2_4,
 	CLK_PLL3_DIV2_4_2,
 	CLK_PLL5,
+	CLK_PLL5_500,
+	CLK_PLL5_250,
 	CLK_PLL6,
+	CLK_PLL6_250,
 	CLK_P1_DIV2,
 
 	/* Module Clocks */
@@ -57,6 +60,9 @@ static const struct clk_div_table dtable_1_32[] = {
 	{0, 0},
 };
 
+/* Mux clock tables */
+static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
+
 static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal", CLK_EXTAL),
@@ -73,7 +79,10 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
 	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
+	DEF_FIXED(".pll5_500", CLK_PLL5_500, CLK_PLL5, 1, 6),
+	DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_500, 1, 2),
 	DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
+	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
 
 	/* Core output clk */
 	DEF_DIV("I", R9A07G043_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
@@ -85,6 +94,10 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G043_CLK_P1, 1, 2),
 	DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2,
 		DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("M0", R9A07G043_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
+	DEF_FIXED("ZT", R9A07G043_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
+	DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2,
+		sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
 };
 
 static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
-- 
2.17.1

