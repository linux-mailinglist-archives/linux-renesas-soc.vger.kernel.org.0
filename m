Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3450348CA26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355940AbiALRql (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:41 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59315 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355932AbiALRqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:38 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824699"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFEE14005E1F;
        Thu, 13 Jan 2022 02:46:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 08/28] clk: renesas: r9a07g044: Add LCDC clock and reset entries
Date:   Wed, 12 Jan 2022 17:45:52 +0000
Message-Id: <20220112174612.10773-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add LCDC clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index eb3f88190156..fae09b7b71e4 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -236,6 +236,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x558, 1),
 	DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
 				0x558, 2),
+	DEF_COUPLED("lcdc_a",	R9A07G044_LCDC_CLK_A, R9A07G044_CLK_M0,
+				0x56c, 0),
+	DEF_COUPLED("lcdc_p",	R9A07G044_LCDC_CLK_P, R9A07G044_CLK_ZT,
+				0x56c, 0),
+	DEF_MOD("lcdc_clk_d",	R9A07G044_LCDC_CLK_D, R9A07G044_CLK_M3,
+				0x56c, 1),
 	DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
 				0x570, 0),
 	DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
@@ -326,6 +332,7 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_GPU_RESETN, 0x858, 0),
 	DEF_RST(R9A07G044_GPU_AXI_RESETN, 0x858, 1),
 	DEF_RST(R9A07G044_GPU_ACE_RESETN, 0x858, 2),
+	DEF_RST(R9A07G044_LCDC_RESET_N, 0x86c, 0),
 	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
-- 
2.17.1

