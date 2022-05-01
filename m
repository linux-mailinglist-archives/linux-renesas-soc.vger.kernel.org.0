Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD175162CF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 10:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245505AbiEAIid (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 04:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245496AbiEAIib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 04:38:31 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F9061B7A6;
        Sun,  1 May 2022 01:35:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,189,1647270000"; 
   d="scan'208";a="118507045"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 May 2022 17:35:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D77AD4007544;
        Sun,  1 May 2022 17:35:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] clk: renesas: r9a07g043: Add TSU clock and reset entry
Date:   Sun,  1 May 2022 09:34:49 +0100
Message-Id: <20220501083450.26541-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501083450.26541-1-biju.das.jz@bp.renesas.com>
References: <20220501083450.26541-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add TSU clock and reset entry to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 21cf82ad7de3..70b1226cf294 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -27,6 +27,7 @@ enum clk_ids {
 	CLK_PLL2,
 	CLK_PLL2_DIV2,
 	CLK_PLL2_DIV2_8,
+	CLK_PLL2_DIV2_10,
 	CLK_PLL3,
 	CLK_PLL3_400,
 	CLK_PLL3_533,
@@ -90,6 +91,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED(".clk_400", CLK_PLL2_SDHI_400, CLK_PLL2_800, 1, 2),
 	DEF_FIXED(".clk_266", CLK_PLL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
 	DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
+	DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
@@ -112,6 +114,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_DIV("P0", R9A07G043_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
 		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("P0_DIV2", R9A07G043_CLK_P0_DIV2, R9A07G043_CLK_P0, 1, 2),
+	DEF_FIXED("TSU", R9A07G043_CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
 	DEF_DIV("P1", R9A07G043_CLK_P1, CLK_PLL3_DIV2_4,
 		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G043_CLK_P1, 1, 2),
@@ -240,6 +243,8 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x594, 0),
 	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
 				0x598, 0),
+	DEF_MOD("tsu_pclk",	R9A07G043_TSU_PCLK, R9A07G043_CLK_TSU,
+				0x5ac, 0),
 };
 
 static struct rzg2l_reset r9a07g043_resets[] = {
@@ -285,6 +290,7 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A07G043_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A07G043_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A07G043_TSU_PRESETN, 0x8ac, 0),
 };
 
 static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
-- 
2.25.1

