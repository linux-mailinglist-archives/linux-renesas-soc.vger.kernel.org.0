Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52B150DD48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 11:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbiDYJ4h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 05:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240524AbiDYJ4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 05:56:24 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C6153DA44;
        Mon, 25 Apr 2022 02:53:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="117911446"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2022 18:53:03 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4EEFA423EE47;
        Mon, 25 Apr 2022 18:52:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] clk: renesas: r9a07g043: Add clock and reset entries for CANFD
Date:   Mon, 25 Apr 2022 10:52:42 +0100
Message-Id: <20220425095244.156720-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock and reset entries for CANFD in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index ea826f000d8d..59d5405474a5 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -100,6 +100,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 		CLK_DIVIDER_HIWORD_MASK),
 	DEF_DIV("P0", R9A07G043_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
 		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("P0_DIV2", R9A07G043_CLK_P0_DIV2, R9A07G043_CLK_P0, 1, 2),
 	DEF_DIV("P1", R9A07G043_CLK_P1, CLK_PLL3_DIV2_4,
 		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G043_CLK_P1, 1, 2),
@@ -198,6 +199,8 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x588, 0),
 	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
 				0x588, 1),
+	DEF_MOD("canfd",	R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
+				0x594, 0),
 	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
 				0x598, 0),
 };
@@ -231,6 +234,8 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A07G043_SCI0_RST, 0x888, 0),
 	DEF_RST(R9A07G043_SCI1_RST, 0x888, 1),
+	DEF_RST(R9A07G043_CANFD_RSTP_N, 0x894, 0),
+	DEF_RST(R9A07G043_CANFD_RSTC_N, 0x894, 1),
 	DEF_RST(R9A07G043_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A07G043_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A07G043_GPIO_SPARE_RESETN, 0x898, 2),
-- 
2.25.1

