Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921DD3E0734
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 20:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239977AbhHDSI2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 14:08:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35947 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238289AbhHDSI2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 14:08:28 -0400
X-IronPort-AV: E=Sophos;i="5.84,295,1620658800"; 
   d="scan'208";a="89837956"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2021 03:08:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.21])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E563740BF1F2;
        Thu,  5 Aug 2021 03:08:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH  2/2] drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock and reset entries
Date:   Wed,  4 Aug 2021 19:08:03 +0100
Message-Id: <20210804180803.29087-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804180803.29087-1-biju.das.jz@bp.renesas.com>
References: <20210804180803.29087-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI{0,1} mux, clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 37 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 1745e363e5a6..f893db47434a 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -41,6 +41,12 @@ enum clk_ids {
 	CLK_PLL6_2,
 	CLK_PLL6_2_DIV2,
 	CLK_P1_DIV2,
+	CLK_800FIX_C,
+	CLK_533FIX_C,
+	CLK_DIV_PLL2_DIV8,
+	CLK_DIV_PLL2_DIV12,
+	CLK_SD0_DIV4,
+	CLK_SD1_DIV4,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -58,6 +64,8 @@ static const struct clk_div_table dtable_1_32[] = {
 
 /* Mux clock tables */
 static const char * const sel_pll6_2[]	= { ".pll6_2_div2", ".pll5_2_div12" };
+static const char * const sel_shdi[] = { ".clk533fix_c", ".div_pll2_div8",
+					 ".div_pll2_div12" };
 
 static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -77,6 +85,11 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll6_2", CLK_PLL6_2, CLK_PLL6, 1, 1),
 
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".clk800fix_c", CLK_800FIX_C, CLK_PLL2, 1, 2),
+	DEF_FIXED(".clk533fix_c", CLK_533FIX_C, CLK_PLL2, 2, 6),
+	DEF_FIXED(".div_pll2_div8", CLK_DIV_PLL2_DIV8, CLK_800FIX_C, 1, 2),
+	DEF_FIXED(".div_pll2_div12", CLK_DIV_PLL2_DIV12, CLK_533FIX_C, 1, 2),
+
 	DEF_FIXED(".pll2_div16", CLK_PLL2_DIV16, CLK_PLL2, 1, 16),
 	DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
 
@@ -103,6 +116,12 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
 	DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
 		sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
+	DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
+		   sel_shdi, ARRAY_SIZE(sel_shdi), 0, 0),
+	DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
+		   sel_shdi, ARRAY_SIZE(sel_shdi), 0, 0),
+	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
+	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
@@ -116,6 +135,22 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x52c, 0),
 	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
 				0x52c, 1),
+	DEF_MOD("sdhi0_imclk",	R9A07G044_SDHI0_IMCLK, CLK_SD0_DIV4,
+				0x554, 0),
+	DEF_MOD("sdhi0_imclk2",	R9A07G044_SDHI0_IMCLK2, CLK_SD0_DIV4,
+				0x554, 1),
+	DEF_MOD("sdhi0_clk_hs",	R9A07G044_SDHI0_CLK_HS, R9A07G044_CLK_SD0,
+				0x554, 2),
+	DEF_MOD("sdhi0_aclk",	R9A07G044_SDHI0_ACLK, R9A07G044_CLK_P1,
+				0x554, 3),
+	DEF_MOD("sdhi1_imclk",	R9A07G044_SDHI1_IMCLK, CLK_SD1_DIV4,
+				0x554, 4),
+	DEF_MOD("sdhi1_imclk2",	R9A07G044_SDHI1_IMCLK2, CLK_SD1_DIV4,
+				0x554, 5),
+	DEF_MOD("sdhi1_clk_hs",	R9A07G044_SDHI1_CLK_HS, R9A07G044_CLK_SD1,
+				0x554, 6),
+	DEF_MOD("sdhi1_aclk",	R9A07G044_SDHI1_ACLK, R9A07G044_CLK_P1,
+				0x554, 7),
 	DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
 				0x570, 0),
 	DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
@@ -184,6 +219,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G044_SDHI0_IXRST, 0x854, 0),
+	DEF_RST(R9A07G044_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 7411e3f365c3..680974fc37bf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -11,6 +11,7 @@
 
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
+#define CPG_PL2SDHI_DSEL	(0x218)
 #define CPG_PL6_ETH_SSEL	(0x418)
 
 /* n = 0/1/2 for PLL1/4/6 */
@@ -30,6 +31,9 @@
 
 #define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
 
+#define SEL_SDHI0	DDIV_PACK(CPG_PL2SDHI_DSEL, 0, 2)
+#define SEL_SDHI1	DDIV_PACK(CPG_PL2SDHI_DSEL, 4, 2)
+
 /**
  * Definitions of CPG Core Clocks
  *
-- 
2.17.1

