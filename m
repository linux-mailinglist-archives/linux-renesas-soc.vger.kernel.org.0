Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D6E64A5BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiLLR2R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbiLLR2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:16 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C817E0F7;
        Mon, 12 Dec 2022 09:28:15 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="145905854"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3F656406F1D2;
        Tue, 13 Dec 2022 02:28:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 01/16] clk: renesas: r9a09g011: Add USB clock and reset entries
Date:   Mon, 12 Dec 2022 17:27:49 +0000
Message-Id: <20221212172804.1277751-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g011-cpg.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index b32f82860b2b..40c4c1fd8f07 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -23,10 +23,12 @@
 
 #define DIV_A		DDIV_PACK(0x200, 0, 3)
 #define DIV_B		DDIV_PACK(0x204, 0, 2)
+#define DIV_D		DDIV_PACK(0x204, 4, 2)
 #define DIV_E		DDIV_PACK(0x204, 8, 1)
 #define DIV_W		DDIV_PACK(0x328, 0, 3)
 
 #define SEL_B		SEL_PLL_PACK(0x214, 0, 1)
+#define SEL_D		SEL_PLL_PACK(0x214, 1, 1)
 #define SEL_E		SEL_PLL_PACK(0x214, 2, 1)
 #define SEL_W0		SEL_PLL_PACK(0x32C, 0, 1)
 
@@ -50,9 +52,11 @@ enum clk_ids {
 	CLK_PLL4,
 	CLK_DIV_A,
 	CLK_DIV_B,
+	CLK_DIV_D,
 	CLK_DIV_E,
 	CLK_DIV_W,
 	CLK_SEL_B,
+	CLK_SEL_D,
 	CLK_SEL_B_D2,
 	CLK_SEL_E,
 	CLK_SEL_W0,
@@ -81,6 +85,13 @@ static const struct clk_div_table dtable_divb[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_divd[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_divw[] = {
 	{0, 6},
 	{1, 7},
@@ -94,6 +105,7 @@ static const struct clk_div_table dtable_divw[] = {
 
 /* Mux clock tables */
 static const char * const sel_b[] = { ".main", ".divb" };
+static const char * const sel_d[] = { ".main", ".divd" };
 static const char * const sel_e[] = { ".main", ".dive" };
 static const char * const sel_w[] = { ".main", ".divw" };
 
@@ -115,10 +127,12 @@ static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
 
 	DEF_DIV_RO(".diva",	CLK_DIV_A,	CLK_PLL1,	DIV_A,	dtable_diva),
 	DEF_DIV_RO(".divb",	CLK_DIV_B,	CLK_PLL2_400,	DIV_B,	dtable_divb),
+	DEF_DIV_RO(".divd",	CLK_DIV_D,	CLK_PLL2_200,	DIV_D,	dtable_divd),
 	DEF_DIV_RO(".dive",	CLK_DIV_E,	CLK_PLL2_100,	DIV_E,	NULL),
 	DEF_DIV_RO(".divw",	CLK_DIV_W,	CLK_PLL4,	DIV_W,	dtable_divw),
 
 	DEF_MUX_RO(".selb",	CLK_SEL_B,	SEL_B,		sel_b),
+	DEF_MUX_RO(".seld",	CLK_SEL_D,	SEL_D,		sel_d),
 	DEF_MUX_RO(".sele",	CLK_SEL_E,	SEL_E,		sel_e),
 	DEF_MUX(".selw0",	CLK_SEL_W0,	SEL_W0,		sel_w),
 
@@ -131,6 +145,9 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
 	DEF_COUPLED("eth_axi",	R9A09G011_ETH0_CLK_AXI,	 CLK_PLL2_200, 0x40c, 8),
 	DEF_COUPLED("eth_chi",	R9A09G011_ETH0_CLK_CHI,	 CLK_PLL2_100, 0x40c, 8),
 	DEF_MOD("eth_clk_gptp",	R9A09G011_ETH0_GPTP_EXT, CLK_PLL2_100, 0x40c, 9),
+	DEF_MOD("usb_aclk_h",	R9A09G011_USB_ACLK_H,	 CLK_SEL_D,    0x40c, 4),
+	DEF_MOD("usb_aclk_p",	R9A09G011_USB_ACLK_P,	 CLK_SEL_D,    0x40c, 5),
+	DEF_MOD("usb_pclk",	R9A09G011_USB_PCLK,	 CLK_SEL_E,    0x40c, 6),
 	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	 CLK_MAIN_24,  0x41c, 12),
 	DEF_MOD("iic_pclk0",	R9A09G011_IIC_PCLK0,	 CLK_SEL_E,    0x420, 12),
 	DEF_MOD("cperi_grpb",	R9A09G011_CPERI_GRPB_PCLK, CLK_SEL_E,  0x424, 0),
@@ -169,6 +186,10 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
 
 static const struct rzg2l_reset r9a09g011_resets[] = {
 	DEF_RST(R9A09G011_PFC_PRESETN,		0x600, 2),
+	DEF_RST(R9A09G011_USB_PRESET_N,		0x608, 7),
+	DEF_RST(R9A09G011_USB_DRD_RESET,	0x608, 8),
+	DEF_RST(R9A09G011_USB_ARESETN_P,	0x608, 9),
+	DEF_RST(R9A09G011_USB_ARESETN_H,	0x608, 10),
 	DEF_RST_MON(R9A09G011_ETH0_RST_HW_N,	0x608, 11, 11),
 	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
 	DEF_RST(R9A09G011_TIM_GPB_PRESETN,	0x614, 1),
-- 
2.25.1

