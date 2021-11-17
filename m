Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5023F453D21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 01:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhKQA3K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 19:29:10 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:58657 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229532AbhKQA3K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 19:29:10 -0500
X-IronPort-AV: E=Sophos;i="5.87,239,1631545200"; 
   d="scan'208";a="100841512"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2021 09:26:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A2BF7400F4EA;
        Wed, 17 Nov 2021 09:26:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a07g044: Add RSPI clock and reset entries
Date:   Wed, 17 Nov 2021 00:26:01 +0000
Message-Id: <20211117002601.17971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add RSPI{0,1,2} clock and reset entries to CPG driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 53c87dac0033..a5a1ff7c2669 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -247,6 +247,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x588, 0),
 	DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
 				0x588, 1),
+	DEF_MOD("rspi0",	R9A07G044_RSPI0_CLKB, R9A07G044_CLK_P0,
+				0x590, 0),
+	DEF_MOD("rspi1",	R9A07G044_RSPI1_CLKB, R9A07G044_CLK_P0,
+				0x590, 1),
+	DEF_MOD("rspi2",	R9A07G044_RSPI2_CLKB, R9A07G044_CLK_P0,
+				0x590, 2),
 	DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
 				0x594, 0),
 	DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
@@ -295,6 +301,9 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
 	DEF_RST(R9A07G044_SCI1_RST, 0x888, 1),
+	DEF_RST(R9A07G044_RSPI0_RST, 0x890, 0),
+	DEF_RST(R9A07G044_RSPI1_RST, 0x890, 1),
+	DEF_RST(R9A07G044_RSPI2_RST, 0x890, 2),
 	DEF_RST(R9A07G044_CANFD_RSTP_N, 0x894, 0),
 	DEF_RST(R9A07G044_CANFD_RSTC_N, 0x894, 1),
 	DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
-- 
2.17.1

