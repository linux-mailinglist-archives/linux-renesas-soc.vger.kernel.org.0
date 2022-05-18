Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0FC52BD63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 16:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238249AbiERNwV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 09:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238245AbiERNwU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 09:52:20 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF3691A8E3B;
        Wed, 18 May 2022 06:52:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,235,1647270000"; 
   d="scan'208";a="121389377"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 May 2022 22:52:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B9DAE436E6EA;
        Wed, 18 May 2022 22:52:14 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a09g011: Add PFC clock and reset entries
Date:   Wed, 18 May 2022 14:52:08 +0100
Message-Id: <20220518135208.39885-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
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

Add PFC clock/reset entries to CPG driver.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g011-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index 40693bb85b80..b01d79a73dd8 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -126,6 +126,7 @@ static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
 };
 
 static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
+	DEF_MOD("pfc",		R9A09G011_PFC_PCLK,	 CLK_MAIN,     0x400, 2),
 	DEF_MOD("gic",		R9A09G011_GIC_CLK,	 CLK_SEL_B_D2, 0x400, 5),
 	DEF_COUPLED("eth_axi",	R9A09G011_ETH0_CLK_AXI,	 CLK_PLL2_200, 0x40c, 8),
 	DEF_COUPLED("eth_chi",	R9A09G011_ETH0_CLK_CHI,	 CLK_PLL2_100, 0x40c, 8),
@@ -137,6 +138,7 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
 };
 
 static const struct rzg2l_reset r9a09g011_resets[] = {
+	DEF_RST(R9A09G011_PFC_PRESETN,		0x600, 2),
 	DEF_RST_MON(R9A09G011_ETH0_RST_HW_N,	0x608, 11, 11),
 	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
 };
-- 
2.34.1

