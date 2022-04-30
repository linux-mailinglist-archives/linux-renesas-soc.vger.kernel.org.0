Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECFF515C81
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 13:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238654AbiD3Lpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Apr 2022 07:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238505AbiD3Lps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 07:45:48 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8278F5E769;
        Sat, 30 Apr 2022 04:42:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,187,1647270000"; 
   d="scan'208";a="118460261"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Apr 2022 20:42:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.1])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 201B642325D8;
        Sat, 30 Apr 2022 20:42:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 7/9] clk: renesas: r9a07g044: Add M4 Clock support
Date:   Sat, 30 Apr 2022 12:41:54 +0100
Message-Id: <20220430114156.6260-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220430114156.6260-1-biju.das.jz@bp.renesas.com>
References: <20220430114156.6260-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for M4 clock which is sourced from pll2_533_div2.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V2->V3:
 * No Change
V1->V2:
 * No Change
RFC->V1:
 * Added Rb tag from Geert
---
 drivers/clk/renesas/r9a07g044-cpg.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index cee552bdf3cc..66608696d2e2 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -57,6 +57,9 @@ enum clk_ids {
 	CLK_SEL_GPU2,
 	CLK_SEL_PLL5_4,
 	CLK_DSI_DIV,
+	CLK_PLL2_533,
+	CLK_PLL2_533_DIV2,
+	CLK_DIV_DSI_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -80,6 +83,14 @@ static const struct clk_div_table dtable_1_32[] = {
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
@@ -88,7 +99,7 @@ static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
 
 static const struct {
-	struct cpg_core_clk common[52];
+	struct cpg_core_clk common[56];
 #ifdef CONFIG_CLK_R9A07G054
 	struct cpg_core_clk drp[0];
 #endif
@@ -102,6 +113,7 @@ static const struct {
 		DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
 		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
 		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
+		DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
 		DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 		DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
 		DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
@@ -120,6 +132,8 @@ static const struct {
 		DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
 		DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
 
+		DEF_FIXED(".pll2_533_div2", CLK_PLL2_533_DIV2, CLK_PLL2_533, 1, 2),
+
 		DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 		DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
 		DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
@@ -137,6 +151,8 @@ static const struct {
 		DEF_FIXED(".pll5_fout1ph0", CLK_PLL5_FOUT1PH0, CLK_PLL5_FOUTPOSTDIV, 1, 2),
 		DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
 			       sel_pll5_4, ARRAY_SIZE(sel_pll5_4)),
+		DEF_DIV(".div_dsi_lpclk", CLK_DIV_DSI_LPCLK, CLK_PLL2_533_DIV2,
+			DIVDSILPCLK, dtable_16_128, CLK_DIVIDER_HIWORD_MASK),
 
 		/* Core output clk */
 		DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
@@ -169,6 +185,7 @@ static const struct {
 		DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
 		DEF_DSI_DIV("DSI_DIV", CLK_DSI_DIV, CLK_SEL_PLL5_4, CLK_SET_RATE_PARENT),
 		DEF_FIXED("M3", R9A07G044_CLK_M3, CLK_DSI_DIV, 1, 1),
+		DEF_FIXED("M4", R9A07G044_CLK_M4, CLK_DIV_DSI_LPCLK, 1, 1),
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
-- 
2.25.1

