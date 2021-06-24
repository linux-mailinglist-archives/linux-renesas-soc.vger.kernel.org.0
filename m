Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A3A3B2F9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 15:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFXNFJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 09:05:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:31250 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229505AbhFXNFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 09:05:09 -0400
X-IronPort-AV: E=Sophos;i="5.83,296,1616425200"; 
   d="scan'208";a="85412601"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jun 2021 22:02:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.59])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0E2F349705B7;
        Thu, 24 Jun 2021 22:02:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 02/11] drivers: clk: renesas: r9a07g044-cpg: Rename divider table
Date:   Thu, 24 Jun 2021 14:02:30 +0100
Message-Id: <20210624130240.17468-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/G2L HW Manual (Rev.0.50), CPG_PL3A_DDIV,CPG_PL3B_DDIV
and CPG_PL2_DDIV(for P0) shares same divider table entries. Rename
clk_div_table dtable_3b to clk_div_table dtable_1_32 so that it
can be reused.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 v2:
  * New patch
---
 drivers/clk/renesas/r9a07g044-cpg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 50b5269586a4..3b6bde487437 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -42,12 +42,13 @@ enum clk_ids {
 };
 
 /* Divider tables */
-static const struct clk_div_table dtable_3b[] = {
+static const struct clk_div_table dtable_common_1_32[] = {
 	{0, 1},
 	{1, 2},
 	{2, 4},
 	{3, 8},
 	{4, 32},
+	{0, 0},
 };
 
 static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
@@ -72,10 +73,10 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	/* Core output clk */
 	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
 	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV16, DIVPL2A,
-		dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+		dtable_common_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
 	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV8,
-		DIVPL3B, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+		DIVPL3B, dtable_common_1_32, CLK_DIVIDER_HIWORD_MASK),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
-- 
2.17.1

