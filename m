Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55ACB48CA20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355924AbiALRq3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:29 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59315 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355929AbiALRq2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:28 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824684"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5B01240083E1;
        Thu, 13 Jan 2022 02:46:26 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 04/28] clk: renesas: r9a07g044: Add M1 clock support
Date:   Wed, 12 Jan 2022 17:45:48 +0000
Message-Id: <20220112174612.10773-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for M1 clock which is sourced from FOUTPOSTDIV.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 79042bf46fe8..d24e3c73b2bd 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -39,6 +39,8 @@ enum clk_ids {
 	CLK_DIV_PLL3_C,
 	CLK_PLL4,
 	CLK_PLL5,
+	CLK_PLL5_FOUTPOSTDIV,
+	CLK_PLL5_FOUT1PH0,
 	CLK_PLL5_FOUT3,
 	CLK_PLL5_250,
 	CLK_PLL6,
@@ -51,6 +53,7 @@ enum clk_ids {
 	CLK_SD0_DIV4,
 	CLK_SD1_DIV4,
 	CLK_SEL_GPU2,
+	CLK_SEL_PLL5_4,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -76,6 +79,7 @@ static const struct clk_div_table dtable_1_32[] = {
 
 /* Mux clock tables */
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
+static const char * const sel_pll5_4[] = { ".pll5_foutpostdiv", ".pll5_fout1ph0" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
 static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
@@ -120,6 +124,10 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
 	DEF_MUX(".sel_gpu2", CLK_SEL_GPU2, SEL_GPU2,
 		sel_gpu2, ARRAY_SIZE(sel_gpu2), 0, CLK_MUX_READ_ONLY),
+	DEF_PLL5_FOUTPOSTDIV(".pll5_foutpostdiv", CLK_PLL5_FOUTPOSTDIV, CLK_EXTAL),
+	DEF_FIXED(".pll5_fout1ph0", CLK_PLL5_FOUT1PH0, CLK_PLL5_FOUTPOSTDIV, 1, 2),
+	DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
+		       sel_pll5_4, ARRAY_SIZE(sel_pll5_4)),
 
 	/* Core output clk */
 	DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
@@ -147,6 +155,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
 	DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
 		CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
@@ -353,4 +362,7 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Resets */
 	.resets = r9a07g044_resets,
 	.num_resets = ARRAY_SIZE(r9a07g044_resets),
+
+	/* lcdc mode for PLL5 settings*/
+	.pll5_lcdc_dsi_mode = true,
 };
-- 
2.17.1

