Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E044676C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380582AbhLCLz0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:55:26 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:36104 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231944AbhLCLz0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:55:26 -0500
X-IronPort-AV: E=Sophos;i="5.87,284,1631545200"; 
   d="scan'208";a="102706756"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2021 20:52:01 +0900
Received: from localhost.localdomain (unknown [10.226.93.66])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E603C40158E3;
        Fri,  3 Dec 2021 20:51:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/6] clk: renesas: r9a07g044: Rename CLK_PLL3_DIV4 macro
Date:   Fri,  3 Dec 2021 11:51:49 +0000
Message-Id: <20211203115154.31864-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename the macro CLK_PLL3_DIV4->CLK_PLL3_DIV2_2 to match the clock tree
mentioned in the hardware manual(Rev.1.00 Sep, 2021).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index a91ccad6329b..0962f25cd3f0 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -32,9 +32,9 @@ enum clk_ids {
 	CLK_PLL3_400,
 	CLK_PLL3_533,
 	CLK_PLL3_DIV2,
+	CLK_PLL3_DIV2_2,
 	CLK_PLL3_DIV2_4,
 	CLK_PLL3_DIV2_4_2,
-	CLK_PLL3_DIV4,
 	CLK_SEL_PLL3_3,
 	CLK_DIV_PLL3_C,
 	CLK_PLL4,
@@ -106,9 +106,9 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
 
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
 	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
-	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
 	DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
 		sel_pll3_3, ARRAY_SIZE(sel_pll3_3), 0, CLK_MUX_READ_ONLY),
 	DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
-- 
2.17.1

