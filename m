Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BD458993E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Aug 2022 10:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238262AbiHDI0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Aug 2022 04:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiHDI0N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Aug 2022 04:26:13 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 300A7B85C;
        Thu,  4 Aug 2022 01:26:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,215,1654527600"; 
   d="scan'208";a="130308726"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Aug 2022 17:26:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3A93840184A6;
        Thu,  4 Aug 2022 17:26:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>
Subject: [PATCH] clk: renesas: r9a07g044: Add conditional compilation for r9a07g044_cpg_info
Date:   Thu,  4 Aug 2022 09:26:05 +0100
Message-Id: <20220804082605.157269-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add conditional compilation for struct r9a07g044_cpg_info, as
the compiler won't allocate any memory for this variable in case
CONFIG_CLK_R9A07G044 is disabled.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index fd7c4eecd398..02a4fc41bb6e 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -414,6 +414,7 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+#ifdef CONFIG_CLK_R9A07G044
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Core Clocks */
 	.core_clks = core_clks.common,
@@ -436,6 +437,7 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 
 	.has_clk_mon_regs = true,
 };
+#endif
 
 #ifdef CONFIG_CLK_R9A07G054
 const struct rzg2l_cpg_info r9a07g054_cpg_info = {
-- 
2.25.1

