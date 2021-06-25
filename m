Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F5A3B497A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 21:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhFYT5d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 15:57:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30108 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229712AbhFYT5c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 15:57:32 -0400
X-IronPort-AV: E=Sophos;i="5.83,299,1616425200"; 
   d="scan'208";a="85555141"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2021 04:55:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D276E40E685F;
        Sat, 26 Jun 2021 04:55:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 04/10] drivers: clk: renesas: r9a07g044-cpg: Add P2 Clock support
Date:   Fri, 25 Jun 2021 20:54:49 +0100
Message-Id: <20210625195455.3607-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
References: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for P2 clock which is sourced from pll3_div2_4_2.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
  * Added Geert's Rb tag
  * Changed dtable name to dtable_1_32
v1->v2:
  * Changed the divider name.
---
 drivers/clk/renesas/r9a07g044-cpg.c     | 4 ++++
 drivers/clk/renesas/renesas-rzg2l-cpg.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d895c1cef1fa..70df4feda417 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -31,6 +31,7 @@ enum clk_ids {
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
 	CLK_PLL3_DIV2_4,
+	CLK_PLL3_DIV2_4_2,
 	CLK_PLL3_DIV4,
 	CLK_PLL4,
 	CLK_PLL5,
@@ -68,6 +69,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
+	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
 	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
 
 	/* Core output clk */
@@ -77,6 +79,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
 	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
 		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
+		DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
index 3948bdd8afc9..a6a3bade1985 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -21,6 +21,7 @@
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
+#define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 
 /**
-- 
2.17.1

