Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B403B4978
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 21:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhFYT53 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 15:57:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8739 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229712AbhFYT53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 15:57:29 -0400
X-IronPort-AV: E=Sophos;i="5.83,299,1616425200"; 
   d="scan'208";a="85449044"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 04:55:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3FE7A40E6204;
        Sat, 26 Jun 2021 04:55:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 03/10] drivers: clk: renesas: r9a07g044-cpg: Fix P1 Clock
Date:   Fri, 25 Jun 2021 20:54:48 +0100
Message-Id: <20210625195455.3607-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
References: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/G2L HW Manual(Rev.0.50) P1 is sourced from pll3_div2_4.
So fix the clock definitions for P1.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
 * Added Geert's Rb tag
 * changed divider table to dtable_1_32
v2:
 * New patch
---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d5803fb1242e..d895c1cef1fa 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -30,8 +30,8 @@ enum clk_ids {
 	CLK_PLL2_DIV20,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL3_DIV2_4,
 	CLK_PLL3_DIV4,
-	CLK_PLL3_DIV8,
 	CLK_PLL4,
 	CLK_PLL5,
 	CLK_PLL5_DIV2,
@@ -67,15 +67,15 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
 
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
-	DEF_FIXED(".pll3_div8", CLK_PLL3_DIV8, CLK_PLL3, 1, 8),
 
 	/* Core output clk */
 	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
 	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV16, DIVPL2A,
 		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
-	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV8,
+	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
 		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 };
 
-- 
2.17.1

