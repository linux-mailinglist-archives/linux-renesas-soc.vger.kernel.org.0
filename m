Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE53AC830
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 11:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhFRKAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 06:00:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12869 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233167AbhFRKAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:00:45 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84638752"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:35 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D80FC4018222;
        Fri, 18 Jun 2021 18:58:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/7] drivers: clk: renesas: r9a07g044-cpg: Update {GIC,IA55,SCIF} clock entries
Date:   Fri, 18 Jun 2021 10:58:19 +0100
Message-Id: <20210618095823.19885-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update {GIC,IA55,SCIF} clock entries to CPG driver to match with
RZ/G2L clock list hardware manual(Rev0.2).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c     | 37 +++++++++++++++++--------
 drivers/clk/renesas/renesas-rzg2l-cpg.h |  1 +
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 50b5269586a4..5c215b6c06e0 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -32,6 +32,7 @@ enum clk_ids {
 	CLK_PLL3_DIV2,
 	CLK_PLL3_DIV4,
 	CLK_PLL3_DIV8,
+	CLK_PLL3_DIV16,
 	CLK_PLL4,
 	CLK_PLL5,
 	CLK_PLL5_DIV2,
@@ -42,6 +43,14 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_3a[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{4, 32},
+};
+
 static const struct clk_div_table dtable_3b[] = {
 	{0, 1},
 	{1, 2},
@@ -68,6 +77,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
 	DEF_FIXED(".pll3_div8", CLK_PLL3_DIV8, CLK_PLL3, 1, 8),
+	DEF_FIXED(".pll3_div16", CLK_PLL3_DIV16, CLK_PLL3, 1, 16),
 
 	/* Core output clk */
 	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
@@ -76,37 +86,42 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
 	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV8,
 		DIVPL3B, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV16,
+		DIVPL3A, dtable_3a, CLK_DIVIDER_HIWORD_MASK),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
-	DEF_MOD("gic",		R9A07G044_CLK_GIC600,
+	DEF_MOD("gic",		R9A07G044_GIC600_GICCLK,
 				R9A07G044_CLK_P1,
 				0x514, BIT(0), (BIT(0) | BIT(1))),
-	DEF_MOD("ia55",		R9A07G044_CLK_IA55,
+	DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK,
+				R9A07G044_CLK_P2,
+				0x518, BIT(0), BIT(0)),
+	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK,
 				R9A07G044_CLK_P1,
-				0x518, (BIT(0) | BIT(1)), BIT(0)),
-	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
+				0x518, BIT(1), BIT(0)),
+	DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK,
 				R9A07G044_CLK_P0,
 				0x584, BIT(0), BIT(0)),
-	DEF_MOD("scif1",	R9A07G044_CLK_SCIF1,
+	DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK,
 				R9A07G044_CLK_P0,
 				0x584, BIT(1), BIT(1)),
-	DEF_MOD("scif2",	R9A07G044_CLK_SCIF2,
+	DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK,
 				R9A07G044_CLK_P0,
 				0x584, BIT(2), BIT(2)),
-	DEF_MOD("scif3",	R9A07G044_CLK_SCIF3,
+	DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK,
 				R9A07G044_CLK_P0,
 				0x584, BIT(3), BIT(3)),
-	DEF_MOD("scif4",	R9A07G044_CLK_SCIF4,
+	DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK,
 				R9A07G044_CLK_P0,
 				0x584, BIT(4), BIT(4)),
-	DEF_MOD("sci0",		R9A07G044_CLK_SCI0,
+	DEF_MOD("sci0",		R9A07G044_SCI0_CLKP,
 				R9A07G044_CLK_P0,
 				0x588, BIT(0), BIT(0)),
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
-	MOD_CLK_BASE + R9A07G044_CLK_GIC600,
+	MOD_CLK_BASE + R9A07G044_GIC600_GICCLK,
 };
 
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
@@ -123,5 +138,5 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Module Clocks */
 	.mod_clks = r9a07g044_mod_clks,
 	.num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
-	.num_hw_mod_clks = R9A07G044_CLK_MIPI_DSI_PIN + 1,
+	.num_hw_mod_clks = R9A07G044_TSU_PCLK + 1,
 };
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
index 3948bdd8afc9..a6a3bade1985 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -21,6 +21,7 @@
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
+#define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 
 /**
-- 
2.17.1

