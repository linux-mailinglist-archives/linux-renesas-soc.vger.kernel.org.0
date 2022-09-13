Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C185B69C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 10:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiIMIox (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 04:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbiIMIon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 04:44:43 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E68C610FCB;
        Tue, 13 Sep 2022 01:44:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,312,1654527600"; 
   d="scan'208";a="134733866"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Sep 2022 17:44:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.88])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5FCAC424B0EA;
        Tue, 13 Sep 2022 17:44:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock multiplier and divider values
Date:   Tue, 13 Sep 2022 09:44:34 +0100
Message-Id: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per the HW manual (Rev.1.10 Apr, 2022) clock rate for 533MHz PLL2 and
PLL3 clocks should be 533 MHz, but with current multiplier and divider
values this resulted to 533.333333 MHz.

This patch updates the multiplier and divider values for 533 MHz PLL2 and
PLL3 clocks so that we get the exact (533 MHz) values.

Fixes: 373bd6f487562e ("clk: renesas: r9a07g044: Add SDHI clock and reset entries")
Fixes: f294a0ea9d12a6 ("clk: renesas: r9a07g044: Add clock and reset entries for SPI Multi I/O Bus Controller")
Fixes: 31d5ef2f565d23 ("clk: renesas: r9a07g044: Add M4 Clock support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 02a4fc41bb6e..bed41ed2c9ee 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -113,10 +113,10 @@ static const struct {
 		DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
 		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
 		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
-		DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
+		DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 533, 1600),
 		DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 		DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
-		DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
+		DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 533, 1600),
 
 		DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
 		DEF_FIXED(".pll5_fout3", CLK_PLL5_FOUT3, CLK_PLL5, 1, 6),
@@ -125,7 +125,7 @@ static const struct {
 
 		DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 		DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
-		DEF_FIXED(".clk_533", CLK_PLL2_SDHI_533, CLK_PLL2, 1, 3),
+		DEF_FIXED(".clk_533", CLK_PLL2_SDHI_533, CLK_PLL2, 533, 1600),
 		DEF_FIXED(".clk_400", CLK_PLL2_SDHI_400, CLK_PLL2_800, 1, 2),
 		DEF_FIXED(".clk_266", CLK_PLL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
 
-- 
2.25.1

