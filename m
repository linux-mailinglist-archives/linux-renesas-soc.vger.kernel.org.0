Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87085753476
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jul 2023 10:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbjGNIAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jul 2023 04:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbjGNIAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2023 04:00:15 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25C383ABA;
        Fri, 14 Jul 2023 00:58:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,204,1684767600"; 
   d="scan'208";a="168863201"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Jul 2023 16:56:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.214])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A5CF41AF0BB;
        Fri, 14 Jul 2023 16:56:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a07g043: Add MTU3a clock and reset entry
Date:   Fri, 14 Jul 2023 08:56:49 +0100
Message-Id: <20230714075649.146978-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add MTU3a clock and reset entry to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 99f72bf590fa..1a7a6d60aca4 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -154,6 +154,8 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x534, 1),
 	DEF_MOD("ostm2_pclk",	R9A07G043_OSTM2_PCLK, R9A07G043_CLK_P0,
 				0x534, 2),
+	DEF_MOD("mtu_x_mck",	R9A07G043_MTU_X_MCK_MTU3, R9A07G043_CLK_P0,
+				0x538, 0),
 	DEF_MOD("wdt0_pclk",	R9A07G043_WDT0_PCLK, R9A07G043_CLK_P0,
 				0x548, 0),
 	DEF_MOD("wdt0_clk",	R9A07G043_WDT0_CLK, R9A07G043_OSCCLK,
@@ -264,6 +266,7 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_OSTM0_PRESETZ, 0x834, 0),
 	DEF_RST(R9A07G043_OSTM1_PRESETZ, 0x834, 1),
 	DEF_RST(R9A07G043_OSTM2_PRESETZ, 0x834, 2),
+	DEF_RST(R9A07G043_MTU_X_PRESET_MTU3, 0x838, 0),
 	DEF_RST(R9A07G043_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A07G043_SPI_RST, 0x850, 0),
 	DEF_RST(R9A07G043_SDHI0_IXRST, 0x854, 0),
-- 
2.25.1

