Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DFB515C7F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 13:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbiD3Lpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Apr 2022 07:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238196AbiD3Lpp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 07:45:45 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 359295DE78;
        Sat, 30 Apr 2022 04:42:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,187,1647270000"; 
   d="scan'208";a="119661329"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Apr 2022 20:42:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.1])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9B67F4232068;
        Sat, 30 Apr 2022 20:42:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 6/9] clk: renesas: r9a07g044: Add M3 Clock support
Date:   Sat, 30 Apr 2022 12:41:53 +0100
Message-Id: <20220430114156.6260-7-biju.das.jz@bp.renesas.com>
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

Add support for M3 clock which is sourced from DSI divider connected
to PLL5_4 mux.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V2->V3:
 * No change
V1->V2:
 * No change
RFC->V1:
 * Added Rb tag from Geert
---
 drivers/clk/renesas/r9a07g044-cpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d350d6dce4b1..cee552bdf3cc 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -56,6 +56,7 @@ enum clk_ids {
 	CLK_SD1_DIV4,
 	CLK_SEL_GPU2,
 	CLK_SEL_PLL5_4,
+	CLK_DSI_DIV,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -87,7 +88,7 @@ static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
 
 static const struct {
-	struct cpg_core_clk common[50];
+	struct cpg_core_clk common[52];
 #ifdef CONFIG_CLK_R9A07G054
 	struct cpg_core_clk drp[0];
 #endif
@@ -166,6 +167,8 @@ static const struct {
 		DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
 		DEF_FIXED("M2", R9A07G044_CLK_M2, CLK_PLL3_533, 1, 2),
 		DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
+		DEF_DSI_DIV("DSI_DIV", CLK_DSI_DIV, CLK_SEL_PLL5_4, CLK_SET_RATE_PARENT),
+		DEF_FIXED("M3", R9A07G044_CLK_M3, CLK_DSI_DIV, 1, 1),
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
-- 
2.25.1

