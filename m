Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56CA4251D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 13:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240848AbhJGLQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 07:16:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:13699 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232680AbhJGLQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 07:16:38 -0400
X-IronPort-AV: E=Sophos;i="5.85,354,1624287600"; 
   d="scan'208";a="96435185"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Oct 2021 20:14:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BDE144011429;
        Thu,  7 Oct 2021 20:14:41 +0900 (JST)
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
Subject: [PATCH v2 2/2] drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock and reset entries
Date:   Thu,  7 Oct 2021 12:14:34 +0100
Message-Id: <20211007111434.8665-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007111434.8665-1-biju.das.jz@bp.renesas.com>
References: <20211007111434.8665-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI{0,1} mux, clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Renamed the clk source names as per latest HW manual
 * Removed .flag and .mux_flags from DEF_SD_MUX
 * Changed the mult/divider values for 533MHz clock
---
 drivers/clk/renesas/r9a07g044-cpg.c | 36 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 1e331cdb13a5..47c16265fca9 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -44,6 +44,12 @@ enum clk_ids {
 	CLK_PLL6,
 	CLK_PLL6_250,
 	CLK_P1_DIV2,
+	CLK_PLL2_800,
+	CLK_PLL2_SDHI_533,
+	CLK_PLL2_SDHI_400,
+	CLK_PLL2_SDHI_266,
+	CLK_SD0_DIV4,
+	CLK_SD1_DIV4,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -62,6 +68,7 @@ static const struct clk_div_table dtable_1_32[] = {
 /* Mux clock tables */
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
+static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
 
 static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -82,6 +89,11 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
 
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
+	DEF_FIXED(".clk_533", CLK_PLL2_SDHI_533, CLK_PLL2, 1, 3),
+	DEF_FIXED(".clk_400", CLK_PLL2_SDHI_400, CLK_PLL2_800, 1, 2),
+	DEF_FIXED(".clk_266", CLK_PLL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
+
 	DEF_FIXED(".pll2_div16", CLK_PLL2_DIV16, CLK_PLL2, 1, 16),
 	DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
 
@@ -114,6 +126,12 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 		sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
 	DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 	DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
+	DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
+		   sel_shdi, ARRAY_SIZE(sel_shdi)),
+	DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
+		   sel_shdi, ARRAY_SIZE(sel_shdi)),
+	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
+	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
@@ -131,6 +149,22 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x550, 0),
 	DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
 				0x550, 1),
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
@@ -200,6 +234,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
 	DEF_RST(R9A07G044_SPI_RST, 0x850, 0),
+	DEF_RST(R9A07G044_SDHI0_IXRST, 0x854, 0),
+	DEF_RST(R9A07G044_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 952fca98ba71..7fb6b4030f72 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -11,6 +11,7 @@
 
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
+#define CPG_PL2SDHI_DSEL	(0x218)
 #define CPG_CLKSTATUS		(0x280)
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_ETH_SSEL	(0x418)
@@ -39,6 +40,9 @@
 #define SEL_PLL3_3	SEL_PLL_PACK(CPG_PL3_SSEL, 8, 1)
 #define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
 
+#define SEL_SDHI0	DDIV_PACK(CPG_PL2SDHI_DSEL, 0, 2)
+#define SEL_SDHI1	DDIV_PACK(CPG_PL2SDHI_DSEL, 4, 2)
+
 /**
  * Definitions of CPG Core Clocks
  *
-- 
2.17.1

