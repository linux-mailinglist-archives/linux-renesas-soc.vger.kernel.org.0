Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1A4515C83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 13:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238828AbiD3LqE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Apr 2022 07:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbiD3LqC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 07:46:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD7F45F251;
        Sat, 30 Apr 2022 04:42:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,187,1647270000"; 
   d="scan'208";a="118460285"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Apr 2022 20:42:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.1])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 681314232068;
        Sat, 30 Apr 2022 20:42:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 9/9] clk: renesas: r9a07g044: Add DSI clock and reset entries
Date:   Sat, 30 Apr 2022 12:41:56 +0100
Message-Id: <20220430114156.6260-10-biju.das.jz@bp.renesas.com>
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

Add DSI clock and reset entries to CPG driver.

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
 drivers/clk/renesas/r9a07g044-cpg.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index b5ddc5058670..57ec50659bb3 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -194,7 +194,7 @@ static const struct {
 };
 
 static const struct {
-	struct rzg2l_mod_clk common[65];
+	struct rzg2l_mod_clk common[71];
 #ifdef CONFIG_CLK_R9A07G054
 	struct rzg2l_mod_clk drp[0];
 #endif
@@ -254,6 +254,18 @@ static const struct {
 					0x558, 1),
 		DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
 					0x558, 2),
+		DEF_MOD("dsi_pll_clk",	R9A07G044_MIPI_DSI_PLLCLK, R9A07G044_CLK_M1,
+					0x568, 0),
+		DEF_MOD("dsi_sys_clk",	R9A07G044_MIPI_DSI_SYSCLK, CLK_M2_DIV2,
+					0x568, 1),
+		DEF_MOD("dsi_aclk",	R9A07G044_MIPI_DSI_ACLK, R9A07G044_CLK_P1,
+					0x568, 2),
+		DEF_MOD("dsi_pclk",	R9A07G044_MIPI_DSI_PCLK, R9A07G044_CLK_P2,
+					0x568, 3),
+		DEF_MOD("dsi_vclk",	R9A07G044_MIPI_DSI_VCLK, R9A07G044_CLK_M3,
+					0x568, 4),
+		DEF_MOD("dsi_lpclk",	R9A07G044_MIPI_DSI_LPCLK, R9A07G044_CLK_M4,
+					0x568, 5),
 		DEF_COUPLED("lcdc_a",	R9A07G044_LCDC_CLK_A, R9A07G044_CLK_M0,
 					0x56c, 0),
 		DEF_COUPLED("lcdc_p",	R9A07G044_LCDC_CLK_P, R9A07G044_CLK_ZT,
@@ -355,6 +367,9 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_GPU_RESETN, 0x858, 0),
 	DEF_RST(R9A07G044_GPU_AXI_RESETN, 0x858, 1),
 	DEF_RST(R9A07G044_GPU_ACE_RESETN, 0x858, 2),
+	DEF_RST(R9A07G044_MIPI_DSI_CMN_RSTB, 0x868, 0),
+	DEF_RST(R9A07G044_MIPI_DSI_ARESET_N, 0x868, 1),
+	DEF_RST(R9A07G044_MIPI_DSI_PRESET_N, 0x868, 2),
 	DEF_RST(R9A07G044_LCDC_RESET_N, 0x86c, 0),
 	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
-- 
2.25.1

