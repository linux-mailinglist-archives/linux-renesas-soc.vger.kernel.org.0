Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906E93B2FA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 15:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhFXNF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 09:05:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:9268 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229505AbhFXNF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 09:05:27 -0400
X-IronPort-AV: E=Sophos;i="5.83,296,1616425200"; 
   d="scan'208";a="85412655"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jun 2021 22:03:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.59])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E617A49705B6;
        Thu, 24 Jun 2021 22:03:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 09/11] drivers: clk: renesas: r9a07g044-cpg: Add I2C clocks/resets
Date:   Thu, 24 Jun 2021 14:02:37 +0100
Message-Id: <20210624130240.17468-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add I2C{0,1,2,3} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Updated reset entries.
---
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 7bcf373494e0..f363efd9e841 100644
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

