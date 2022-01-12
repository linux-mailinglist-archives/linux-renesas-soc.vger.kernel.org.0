Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC46C48CA25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355937AbiALRqi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:38 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:21633 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355929AbiALRqg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:36 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106270350"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 929144005E1F;
        Thu, 13 Jan 2022 02:46:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 07/28] clk: renesas: r9a07g044: Add M4 Clock support
Date:   Wed, 12 Jan 2022 17:45:51 +0000
Message-Id: <20220112174612.10773-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for M4 clock which is sourced from pll2_533_div2.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 17 +++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 272f008f9467..eb3f88190156 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -56,6 +56,9 @@ enum clk_ids {
 	CLK_SEL_PLL5_4,
 	CLK_DSI_DIV,
 	CLK_M2_DIV2,
+	CLK_PLL2_533,
+	CLK_PLL2_533_DIV2,
+	CLK_DIV_DSI_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -79,6 +82,14 @@ static const struct clk_div_table dtable_1_32[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll5_4[] = { ".pll5_foutpostdiv", ".pll5_fout1ph0" };
@@ -95,6 +106,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
 	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 133, 2),
+	DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 133, 2),
 	DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
 	DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
@@ -113,6 +125,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
 	DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
 
+	DEF_FIXED(".pll2_533_div2", CLK_PLL2_533_DIV2, CLK_PLL2_533, 1, 2),
+
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
 	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
@@ -130,6 +144,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll5_fout1ph0", CLK_PLL5_FOUT1PH0, CLK_PLL5_FOUTPOSTDIV, 1, 2),
 	DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
 		       sel_pll5_4, ARRAY_SIZE(sel_pll5_4)),
+	DEF_DIV(".div_dsi_lpclk", CLK_DIV_DSI_LPCLK, CLK_PLL2_533_DIV2,
+		DIVDSILPCLK, dtable_16_128, CLK_DIVIDER_HIWORD_MASK),
 
 	/* Core output clk */
 	DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
@@ -162,6 +178,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
 	DEF_DSI_DIV("DSI_DIV", CLK_DSI_DIV, CLK_SEL_PLL5_4, CLK_SET_RATE_PARENT),
 	DEF_FIXED("M3", R9A07G044_CLK_M3, CLK_DSI_DIV, 1, 1),
+	DEF_FIXED("M4", R9A07G044_CLK_M4, CLK_DIV_DSI_LPCLK, 1, 1),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 625bf1c0f396..a49ace07dc2d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -44,6 +44,7 @@
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 #define DIVPL1A		DDIV_PACK(CPG_PL1_DDIV, 0, 2)
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
+#define DIVDSILPCLK	DDIV_PACK(CPG_PL2_DDIV, 12, 2)
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 #define DIVPL3C		DDIV_PACK(CPG_PL3A_DDIV, 8, 3)
-- 
2.17.1

