Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDDB444546
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 17:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhKCQI1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 12:08:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:30912 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232509AbhKCQIV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 12:08:21 -0400
X-IronPort-AV: E=Sophos;i="5.87,206,1631545200"; 
   d="scan'208";a="99375206"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Nov 2021 01:05:43 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 504B040183E2;
        Thu,  4 Nov 2021 01:05:41 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for SCI1
Date:   Wed,  3 Nov 2021 16:05:37 +0000
Message-Id: <20211103160537.32253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock and reset entry for SCI1 interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 47c16265fca9..463b658a0c54 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -217,6 +217,8 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x584, 4),
 	DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
 				0x588, 0),
+	DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
+				0x588, 1),
 	DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
 				0x594, 0),
 	DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
@@ -256,6 +258,7 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
 	DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
+	DEF_RST(R9A07G044_SCI1_RST, 0x888, 1),
 	DEF_RST(R9A07G044_CANFD_RSTP_N, 0x894, 0),
 	DEF_RST(R9A07G044_CANFD_RSTC_N, 0x894, 1),
 	DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
-- 
2.17.1

