Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91540457FF9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Nov 2021 19:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhKTSHu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Nov 2021 13:07:50 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:8695 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229576AbhKTSHu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Nov 2021 13:07:50 -0500
X-IronPort-AV: E=Sophos;i="5.87,250,1631545200"; 
   d="scan'208";a="101261654"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2021 03:04:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1727C40083C6;
        Sun, 21 Nov 2021 03:04:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] clk: renesas: r9a07g044: Add TSU clock and reset entry
Date:   Sat, 20 Nov 2021 18:04:38 +0000
Message-Id: <20211120180438.8351-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add TSU clock and reset entry to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * No change, rebased to latest renesas-clk
---
 drivers/clk/renesas/r9a07g044-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index c0ca021136fa..a91ccad6329b 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -260,6 +260,8 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x5a8, 0),
 	DEF_MOD("adc_pclk",	R9A07G044_ADC_PCLK, R9A07G044_CLK_P0,
 				0x5a8, 1),
+	DEF_MOD("tsu_pclk",	R9A07G044_TSU_PCLK, R9A07G044_CLK_TSU,
+				0x5ac, 0),
 };
 
 static struct rzg2l_reset r9a07g044_resets[] = {
@@ -308,6 +310,7 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_GPIO_SPARE_RESETN, 0x898, 2),
 	DEF_RST(R9A07G044_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A07G044_ADC_ADRST_N, 0x8a8, 1),
+	DEF_RST(R9A07G044_TSU_PRESETN, 0x8ac, 0),
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
-- 
2.17.1

