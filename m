Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13772642AD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 16:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiLEPAI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 10:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiLEPAH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 10:00:07 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 74D05BE3A;
        Mon,  5 Dec 2022 07:00:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,219,1665414000"; 
   d="scan'208";a="145045877"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2022 00:00:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.127])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1467C4009BCB;
        Tue,  6 Dec 2022 00:00:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 1/6] clk: renesas: r9a09g011: Add TIM clock and reset entries
Date:   Mon,  5 Dec 2022 14:59:50 +0000
Message-Id: <20221205145955.391526-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205145955.391526-1-biju.das.jz@bp.renesas.com>
References: <20221205145955.391526-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Compare-Match Timer (TIM) clock and reset entries to CPG
driver.

The TIM IP on the RZ/V2M comes with 32 channels, but the ISP has
full control of channels 0 to 7, and channels 24 to 31. Therefore
Linux is only allowed to use channels 8 to 23.

The TIM has shared peripheral clock with other modules, so mark it
as critical clock.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g011-cpg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index dd5e442ec4a9..b32f82860b2b 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -133,7 +133,25 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
 	DEF_MOD("eth_clk_gptp",	R9A09G011_ETH0_GPTP_EXT, CLK_PLL2_100, 0x40c, 9),
 	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	 CLK_MAIN_24,  0x41c, 12),
 	DEF_MOD("iic_pclk0",	R9A09G011_IIC_PCLK0,	 CLK_SEL_E,    0x420, 12),
+	DEF_MOD("cperi_grpb",	R9A09G011_CPERI_GRPB_PCLK, CLK_SEL_E,  0x424, 0),
+	DEF_MOD("tim_clk_8",	R9A09G011_TIM8_CLK,	 CLK_MAIN_2,   0x424, 4),
+	DEF_MOD("tim_clk_9",	R9A09G011_TIM9_CLK,	 CLK_MAIN_2,   0x424, 5),
+	DEF_MOD("tim_clk_10",	R9A09G011_TIM10_CLK,	 CLK_MAIN_2,   0x424, 6),
+	DEF_MOD("tim_clk_11",	R9A09G011_TIM11_CLK,	 CLK_MAIN_2,   0x424, 7),
+	DEF_MOD("tim_clk_12",	R9A09G011_TIM12_CLK,	 CLK_MAIN_2,   0x424, 8),
+	DEF_MOD("tim_clk_13",	R9A09G011_TIM13_CLK,	 CLK_MAIN_2,   0x424, 9),
+	DEF_MOD("tim_clk_14",	R9A09G011_TIM14_CLK,	 CLK_MAIN_2,   0x424, 10),
+	DEF_MOD("tim_clk_15",	R9A09G011_TIM15_CLK,	 CLK_MAIN_2,   0x424, 11),
 	DEF_MOD("iic_pclk1",	R9A09G011_IIC_PCLK1,	 CLK_SEL_E,    0x424, 12),
+	DEF_MOD("cperi_grpc",	R9A09G011_CPERI_GRPC_PCLK, CLK_SEL_E,  0x428, 0),
+	DEF_MOD("tim_clk_16",	R9A09G011_TIM16_CLK,	 CLK_MAIN_2,   0x428, 4),
+	DEF_MOD("tim_clk_17",	R9A09G011_TIM17_CLK,	 CLK_MAIN_2,   0x428, 5),
+	DEF_MOD("tim_clk_18",	R9A09G011_TIM18_CLK,	 CLK_MAIN_2,   0x428, 6),
+	DEF_MOD("tim_clk_19",	R9A09G011_TIM19_CLK,	 CLK_MAIN_2,   0x428, 7),
+	DEF_MOD("tim_clk_20",	R9A09G011_TIM20_CLK,	 CLK_MAIN_2,   0x428, 8),
+	DEF_MOD("tim_clk_21",	R9A09G011_TIM21_CLK,	 CLK_MAIN_2,   0x428, 9),
+	DEF_MOD("tim_clk_22",	R9A09G011_TIM22_CLK,	 CLK_MAIN_2,   0x428, 10),
+	DEF_MOD("tim_clk_23",	R9A09G011_TIM23_CLK,	 CLK_MAIN_2,   0x428, 11),
 	DEF_MOD("wdt0_pclk",	R9A09G011_WDT0_PCLK,	 CLK_SEL_E,    0x428, 12),
 	DEF_MOD("wdt0_clk",	R9A09G011_WDT0_CLK,	 CLK_MAIN,     0x428, 13),
 	DEF_MOD("cperi_grpf",	R9A09G011_CPERI_GRPF_PCLK, CLK_SEL_E,  0x434, 0),
@@ -153,6 +171,8 @@ static const struct rzg2l_reset r9a09g011_resets[] = {
 	DEF_RST(R9A09G011_PFC_PRESETN,		0x600, 2),
 	DEF_RST_MON(R9A09G011_ETH0_RST_HW_N,	0x608, 11, 11),
 	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
+	DEF_RST(R9A09G011_TIM_GPB_PRESETN,	0x614, 1),
+	DEF_RST(R9A09G011_TIM_GPC_PRESETN,	0x614, 2),
 	DEF_RST(R9A09G011_IIC_GPA_PRESETN,	0x614, 8),
 	DEF_RST(R9A09G011_IIC_GPB_PRESETN,	0x614, 9),
 	DEF_RST_MON(R9A09G011_PWM_GPF_PRESETN,	0x614, 5, 23),
@@ -161,6 +181,8 @@ static const struct rzg2l_reset r9a09g011_resets[] = {
 
 static const unsigned int r9a09g011_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A09G011_CA53_CLK,
+	MOD_CLK_BASE + R9A09G011_CPERI_GRPB_PCLK,
+	MOD_CLK_BASE + R9A09G011_CPERI_GRPC_PCLK,
 	MOD_CLK_BASE + R9A09G011_CPERI_GRPF_PCLK,
 	MOD_CLK_BASE + R9A09G011_GIC_CLK,
 	MOD_CLK_BASE + R9A09G011_SYC_CNT_CLK,
-- 
2.25.1

