Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5164F3B4983
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 21:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFYT5m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 15:57:42 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8739 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229741AbhFYT5m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 15:57:42 -0400
X-IronPort-AV: E=Sophos;i="5.83,299,1616425200"; 
   d="scan'208";a="85449078"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 04:55:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BB9F840E685A;
        Sat, 26 Jun 2021 04:55:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 08/10] drivers: clk: renesas: r9a07g044-cpg: Add I2C clocks/resets
Date:   Fri, 25 Jun 2021 20:54:53 +0100
Message-Id: <20210625195455.3607-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
References: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add I2C{0,1,2,3} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Geert's Rb tag.
v1->v2:
 * Updated reset entries.
---
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index ae24e0397d3c..b39a36b317fd 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -90,6 +90,14 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x518, 0),
 	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
 				0x518, 1),
+	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
+				0x580, 0),
+	DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
+				0x580, 1),
+	DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK, R9A07G044_CLK_P0,
+				0x580, 2),
+	DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK, R9A07G044_CLK_P0,
+				0x580, 3),
 	DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
 				0x584, 0),
 	DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
@@ -108,6 +116,10 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
+	DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
+	DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
+	DEF_RST(R9A07G044_I2C3_MRST, 0x880, 3),
 	DEF_RST(R9A07G044_SCIF0_RST_SYSTEM_N, 0x884, 0),
 	DEF_RST(R9A07G044_SCIF1_RST_SYSTEM_N, 0x884, 1),
 	DEF_RST(R9A07G044_SCIF2_RST_SYSTEM_N, 0x884, 2),
-- 
2.17.1

