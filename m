Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D5750DD4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 11:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiDYJ4f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 05:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240551AbiDYJ43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 05:56:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 65E151A05D;
        Mon, 25 Apr 2022 02:53:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="117911466"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2022 18:53:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3FF9C41D0C94;
        Mon, 25 Apr 2022 18:53:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] clk: renesas: r9a07g043: Add WDT clock and reset entries
Date:   Mon, 25 Apr 2022 10:52:44 +0100
Message-Id: <20220425095244.156720-7-biju.das.jz@bp.renesas.com>
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

Add WDT{0,2} clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index ac2b361efbb6..c7e5efc17965 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -135,6 +135,14 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x534, 1),
 	DEF_MOD("ostm2",	R9A07G043_OSTM2_PCLK, R9A07G043_CLK_P0,
 				0x534, 2),
+	DEF_MOD("wdt0_pclk",	R9A07G043_WDT0_PCLK, R9A07G043_CLK_P0,
+				0x548, 0),
+	DEF_MOD("wdt0_clk",	R9A07G043_WDT0_CLK, R9A07G043_OSCCLK,
+				0x548, 1),
+	DEF_MOD("wdt2_pclk",	R9A07G043_WDT2_PCLK, R9A07G043_CLK_P0,
+				0x548, 4),
+	DEF_MOD("wdt2_clk",	R9A07G043_WDT2_CLK, R9A07G043_OSCCLK,
+				0x548, 5),
 	DEF_MOD("sdhi0_imclk",	R9A07G043_SDHI0_IMCLK, CLK_SD0_DIV4,
 				0x554, 0),
 	DEF_MOD("sdhi0_imclk2",	R9A07G043_SDHI0_IMCLK2, CLK_SD0_DIV4,
@@ -220,6 +228,8 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_OSTM0_PRESETZ, 0x834, 0),
 	DEF_RST(R9A07G043_OSTM1_PRESETZ, 0x834, 1),
 	DEF_RST(R9A07G043_OSTM2_PRESETZ, 0x834, 2),
+	DEF_RST(R9A07G043_WDT0_PRESETN, 0x848, 0),
+	DEF_RST(R9A07G043_WDT2_PRESETN, 0x848, 2),
 	DEF_RST(R9A07G043_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A07G043_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A07G043_SSI0_RST_M2_REG, 0x870, 0),
-- 
2.25.1

