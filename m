Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992B441AF94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 15:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240577AbhI1NDU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 09:03:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:35985 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S240300AbhI1NDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 09:03:20 -0400
X-IronPort-AV: E=Sophos;i="5.85,329,1624287600"; 
   d="scan'208";a="95431720"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Sep 2021 22:01:39 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 99D1544703BB;
        Tue, 28 Sep 2021 22:01:37 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a07g044-cpg: Add clock and reset entries for SPI Multi I/O Bus Controller
Date:   Tue, 28 Sep 2021 14:01:32 +0100
Message-Id: <20210928130132.15022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock and reset entries for SPI Multi I/O Bus Controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 18 ++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 3c518b56c5a6..1e331cdb13a5 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -29,10 +29,14 @@ enum clk_ids {
 	CLK_PLL2_DIV16,
 	CLK_PLL2_DIV20,
 	CLK_PLL3,
+	CLK_PLL3_400,
+	CLK_PLL3_533,
 	CLK_PLL3_DIV2,
 	CLK_PLL3_DIV2_4,
 	CLK_PLL3_DIV2_4_2,
 	CLK_PLL3_DIV4,
+	CLK_SEL_PLL3_3,
+	CLK_DIV_PLL3_C,
 	CLK_PLL4,
 	CLK_PLL5,
 	CLK_PLL5_FOUT3,
@@ -56,6 +60,7 @@ static const struct clk_div_table dtable_1_32[] = {
 };
 
 /* Mux clock tables */
+static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
 
 static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
@@ -68,6 +73,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 133, 2),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 133, 2),
+	DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
+	DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
 
 	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
 	DEF_FIXED(".pll5_fout3", CLK_PLL5_FOUT3, CLK_PLL5, 1, 6),
@@ -82,6 +89,10 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
 	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
+	DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
+		sel_pll3_3, ARRAY_SIZE(sel_pll3_3), 0, CLK_MUX_READ_ONLY),
+	DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
+		DIVPL3C, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 
 	DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_FOUT3, 1, 2),
 	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
@@ -101,6 +112,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
 	DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
 		sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
+	DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
+	DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
@@ -114,6 +127,10 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x52c, 0),
 	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
 				0x52c, 1),
+	DEF_MOD("spi_clk2",	R9A07G044_SPI_CLK2, R9A07G044_CLK_SPI1,
+				0x550, 0),
+	DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
+				0x550, 1),
 	DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
 				0x570, 0),
 	DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
@@ -182,6 +199,7 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G044_SPI_RST, 0x850, 0),
 	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 191c403aa52f..dc5b65a4029e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -11,6 +11,7 @@
 
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
+#define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_ETH_SSEL	(0x418)
 
 /* n = 0/1/2 for PLL1/4/6 */
@@ -24,10 +25,12 @@
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
+#define DIVPL3C		DDIV_PACK(CPG_PL3A_DDIV, 8, 3)
 
 #define SEL_PLL_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 
+#define SEL_PLL3_3	SEL_PLL_PACK(CPG_PL3_SSEL, 8, 1)
 #define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
 
 /**
-- 
2.17.1

