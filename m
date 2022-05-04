Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBDC51A2B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 16:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbiEDO7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 10:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351557AbiEDO7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 10:59:16 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E4D42250C;
        Wed,  4 May 2022 07:55:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,198,1647270000"; 
   d="scan'208";a="119939347"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 May 2022 23:55:39 +0900
Received: from localhost.localdomain (unknown [10.226.93.27])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 335584250F05;
        Wed,  4 May 2022 23:55:36 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/9] clk: renesas: r9a09g011: Add eth clock and reset entries
Date:   Wed,  4 May 2022 15:54:46 +0100
Message-Id: <20220504145454.71287-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504145454.71287-1-phil.edworthy@renesas.com>
References: <20220504145454.71287-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add ethernet clock/reset entries to CPG driver.

Note that the AXI and CHI clocks are both enabled and disabled using
the same register bit.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g011-cpg.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index 7f16a617dc8c..f0a958497f47 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -126,14 +126,18 @@ static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
 };
 
 static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
-	DEF_MOD("gic",		R9A09G011_GIC_CLK,	CLK_SEL_B_D2, 0x400, 5),
-	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	CLK_MAIN_24,  0x41c, 12),
-	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	CLK_SEL_E,    0x438, 4),
-	DEF_MOD("urt0_clk",	R9A09G011_URT0_CLK,	CLK_SEL_W0,   0x438, 5),
-	DEF_MOD("ca53",		R9A09G011_CA53_CLK,	CLK_DIV_A,    0x448, 0),
+	DEF_MOD("gic",		R9A09G011_GIC_CLK,	 CLK_SEL_B_D2, 0x400, 5),
+	DEF_COUPLED("eth_axi",	R9A09G011_ETH0_CLK_AXI,  CLK_PLL2_200, 0x40c, 8),
+	DEF_COUPLED("eth_chi",	R9A09G011_ETH0_CLK_CHI,  CLK_PLL2_100, 0x40c, 8),
+	DEF_MOD("eth_clk_gptp",	R9A09G011_ETH0_GPTP_EXT, CLK_PLL2_100, 0x40c, 9),
+	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	 CLK_MAIN_24,  0x41c, 12),
+	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	 CLK_SEL_E,    0x438, 4),
+	DEF_MOD("urt0_clk",	R9A09G011_URT0_CLK,	 CLK_SEL_W0,   0x438, 5),
+	DEF_MOD("ca53",		R9A09G011_CA53_CLK,	 CLK_DIV_A,    0x448, 0),
 };
 
 static const struct rzg2l_reset r9a09g011_resets[] = {
+	DEF_RST_MON(R9A09G011_ETH0_RST_HW_N,	0x608, 11, 11),
 	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
 };
 
-- 
2.32.0

