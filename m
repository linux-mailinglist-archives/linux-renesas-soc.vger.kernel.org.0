Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22E73D2553
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jul 2021 16:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhGVNeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jul 2021 09:34:01 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19429 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232321AbhGVNdh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jul 2021 09:33:37 -0400
X-IronPort-AV: E=Sophos;i="5.84,261,1620658800"; 
   d="scan'208";a="88463931"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Jul 2021 23:14:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E8139401224A;
        Thu, 22 Jul 2021 23:14:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 03/18] drivers: clk: renesas: r9a07g044-cpg: Add ethernet clock sources
Date:   Thu, 22 Jul 2021 15:13:36 +0100
Message-Id: <20210722141351.13668-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ethernet reference clock can be sourced from PLL5_2 or PLL6_2. Add support
for ethernet source clock selection using SEL_PLL_6_2 mux.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 17 +++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 9e9e8fb6d00d..c78bea2f6ea8 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -35,8 +35,10 @@ enum clk_ids {
 	CLK_PLL3_DIV4,
 	CLK_PLL4,
 	CLK_PLL5,
+	CLK_PLL5_2,
 	CLK_PLL5_DIV2,
 	CLK_PLL6,
+	CLK_PLL6_DIV2,
 	CLK_P1_DIV2,
 
 	/* Module Clocks */
@@ -53,6 +55,9 @@ static const struct clk_div_table dtable_1_32[] = {
 	{0, 0},
 };
 
+/* Mux clock tables */
+static const char * const sel_pll6_2[]	= { ".pll6_2_div2", ".pll5_2_div2" };
+
 static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal", CLK_EXTAL),
@@ -64,6 +69,11 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 133, 2),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 133, 2),
 
+	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
+	DEF_FIXED(".pll5_2", CLK_PLL5_2, CLK_PLL5, 1, 6),
+
+	DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
+
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll2_div16", CLK_PLL2_DIV16, CLK_PLL2, 1, 16),
 	DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
@@ -73,6 +83,9 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
 	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
 
+	DEF_FIXED(".pll5_2_div2", CLK_PLL5_DIV2, CLK_PLL5_2, 1, 2),
+	DEF_FIXED(".pll6_2_div2", CLK_PLL6_DIV2, CLK_PLL6, 1, 2),
+
 	/* Core output clk */
 	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
 	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV16, DIVPL2A,
@@ -83,6 +96,10 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
 	DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
 		DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("M0", R9A07G044_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
+	DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
+	DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
+		sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 148db5de253b..5202c0512483 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -11,6 +11,7 @@
 
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
+#define CPG_PL6_ETH_SSEL	(0x418)
 
 /* n = 0/1/2 for PLL1/4/6 */
 #define CPG_SAMPLL_CLK1(n)	(0x04 + (16 * n))
@@ -24,6 +25,11 @@
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 
+#define SEL_PLL_PACK(offset, bitpos, size) \
+		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+
+#define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
+
 /**
  * Definitions of CPG Core Clocks
  *
-- 
2.17.1

