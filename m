Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF8E44E2D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 09:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbhKLINE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 03:13:04 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6127 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233351AbhKLINE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 03:13:04 -0500
X-IronPort-AV: E=Sophos;i="5.87,228,1631545200"; 
   d="scan'208";a="100048275"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Nov 2021 17:10:13 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A67B542247E1;
        Fri, 12 Nov 2021 17:10:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] clk: renesas: r9a07g044: Change core clock "I" from DEF_FIXED->DEF_DIV
Date:   Fri, 12 Nov 2021 08:10:01 +0000
Message-Id: <20211112081003.15453-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112081003.15453-1-biju.das.jz@bp.renesas.com>
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Core clock "I" is sourced from CPG_PL1_DDIV divider as per HW manual
Rev.1.00.

This patch adds clock divider table "dtable_1_8" and switches to
DEF_DIV for "I" clock.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
V1->V2:
 * No change
---
 drivers/clk/renesas/r9a07g044-cpg.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 91643b4e1c9c..4893815cddd8 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -56,6 +56,14 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_1_32[] = {
 	{0, 1},
 	{1, 2},
@@ -110,7 +118,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
 
 	/* Core output clk */
-	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
+	DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
+		CLK_DIVIDER_HIWORD_MASK),
 	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
 		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("P0_DIV2", R9A07G044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
-- 
2.17.1

