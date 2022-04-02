Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0644EFF75
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiDBHs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbiDBHs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:48:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3106118DAB7;
        Sat,  2 Apr 2022 00:46:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="115483888"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2022 16:46:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F344641E3A7B;
        Sat,  2 Apr 2022 16:46:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] clk: renesas: r9a07g043: Add GPIO clock and reset entries
Date:   Sat,  2 Apr 2022 08:46:23 +0100
Message-Id: <20220402074626.25624-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402074626.25624-1-biju.das.jz@bp.renesas.com>
References: <20220402074626.25624-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add GPIO clock and reset entries in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert
---
 drivers/clk/renesas/r9a07g043-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 81409ff37e2e..0c574e153d4d 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -112,6 +112,8 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x588, 0),
 	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
 				0x588, 1),
+	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
+				0x598, 0),
 };
 
 static struct rzg2l_reset r9a07g043_resets[] = {
@@ -127,6 +129,9 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A07G043_SCI0_RST, 0x888, 0),
 	DEF_RST(R9A07G043_SCI1_RST, 0x888, 1),
+	DEF_RST(R9A07G043_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A07G043_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A07G043_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
-- 
2.17.1

