Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D35A3BA1AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 15:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbhGBNwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 09:52:54 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:53181 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232563AbhGBNwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 09:52:54 -0400
X-IronPort-AV: E=Sophos;i="5.83,317,1616425200"; 
   d="scan'208";a="86361989"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2021 22:50:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 052C24006189;
        Fri,  2 Jul 2021 22:50:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/9] drivers: clk: renesas: r9a07g044-cpg: Add SSIF-2 clock and reset entries
Date:   Fri,  2 Jul 2021 14:50:03 +0100
Message-Id: <20210702135010.5937-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SSIF-2 clock and reset entries in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 7af4b39a0953..ed5f5c11ac12 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -96,6 +96,22 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x52c, 0),
 	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
 				0x52c, 1),
+	DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
+				0x570, 0),
+	DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
+				0x570, 1),
+	DEF_MOD("ssi1_pclk",	R9A07G044_SSI1_PCLK2, R9A07G044_CLK_P0,
+				0x570, 2),
+	DEF_MOD("ssi1_sfr",	R9A07G044_SSI1_PCLK_SFR, R9A07G044_CLK_P0,
+				0x570, 3),
+	DEF_MOD("ssi2_pclk",	R9A07G044_SSI2_PCLK2, R9A07G044_CLK_P0,
+				0x570, 4),
+	DEF_MOD("ssi2_sfr",	R9A07G044_SSI2_PCLK_SFR, R9A07G044_CLK_P0,
+				0x570, 5),
+	DEF_MOD("ssi3_pclk",	R9A07G044_SSI3_PCLK2, R9A07G044_CLK_P0,
+				0x570, 6),
+	DEF_MOD("ssi3_sfr",	R9A07G044_SSI3_PCLK_SFR, R9A07G044_CLK_P0,
+				0x570, 7),
 	DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
 				0x578, 0),
 	DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
@@ -132,6 +148,10 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
+	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
+	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
+	DEF_RST(R9A07G044_SSI3_RST_M2_REG, 0x870, 3),
 	DEF_RST(R9A07G044_USB_U2H0_HRESETN, 0x878, 0),
 	DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
 	DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
-- 
2.17.1

