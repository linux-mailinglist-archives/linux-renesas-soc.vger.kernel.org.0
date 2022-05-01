Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4D5162CD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 10:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245461AbiEAIi1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 04:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245078AbiEAIi0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 04:38:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7DC351BE99;
        Sun,  1 May 2022 01:35:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,189,1647270000"; 
   d="scan'208";a="118507036"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 May 2022 17:35:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 64E5F4006CD0;
        Sun,  1 May 2022 17:34:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] clk: renesas: r9a07g043: Add RSPI clock and reset entries
Date:   Sun,  1 May 2022 09:34:48 +0100
Message-Id: <20220501083450.26541-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501083450.26541-1-biju.das.jz@bp.renesas.com>
References: <20220501083450.26541-1-biju.das.jz@bp.renesas.com>
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

Add RSPI{0,1,2} clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 57b9eb9e0d2b..21cf82ad7de3 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -230,6 +230,12 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x588, 0),
 	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
 				0x588, 1),
+	DEF_MOD("rspi0",	R9A07G043_RSPI0_CLKB, R9A07G043_CLK_P0,
+				0x590, 0),
+	DEF_MOD("rspi1",	R9A07G043_RSPI1_CLKB, R9A07G043_CLK_P0,
+				0x590, 1),
+	DEF_MOD("rspi2",	R9A07G043_RSPI2_CLKB, R9A07G043_CLK_P0,
+				0x590, 2),
 	DEF_MOD("canfd",	R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
 				0x594, 0),
 	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
@@ -271,6 +277,9 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A07G043_SCI0_RST, 0x888, 0),
 	DEF_RST(R9A07G043_SCI1_RST, 0x888, 1),
+	DEF_RST(R9A07G043_RSPI0_RST, 0x890, 0),
+	DEF_RST(R9A07G043_RSPI1_RST, 0x890, 1),
+	DEF_RST(R9A07G043_RSPI2_RST, 0x890, 2),
 	DEF_RST(R9A07G043_CANFD_RSTP_N, 0x894, 0),
 	DEF_RST(R9A07G043_CANFD_RSTC_N, 0x894, 1),
 	DEF_RST(R9A07G043_GPIO_RSTN, 0x898, 0),
-- 
2.25.1

