Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F39B2904E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407368AbgJPMRe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 08:17:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:31949 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407354AbgJPMR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 08:17:28 -0400
X-IronPort-AV: E=Sophos;i="5.77,382,1596466800"; 
   d="scan'208";a="59986376"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Oct 2020 21:17:27 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4681743871A0;
        Fri, 16 Oct 2020 21:17:25 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] clk: renesas: r8a774c0: Add RPC clocks
Date:   Fri, 16 Oct 2020 13:17:09 +0100
Message-Id: <20201016121709.8447-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
driver.

Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 9fc9fa9e531a..1615b31c32ee 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -44,6 +44,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 	CLK_OCO,
 
@@ -73,6 +74,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	DEF_FIXED(".s2",       CLK_S2,             CLK_PLL1,       4, 1),
 	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
 	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
+	DEF_BASE(".rpcsrc",    CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
+
+	DEF_BASE("rpc",        R8A774C0_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",      R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A774C0_CLK_RPC),
 
 	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
 
@@ -199,6 +206,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 	DEF_MOD("can-fd",		 914,	R8A774C0_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A774C0_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A774C0_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A774C0_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c-dvfs",		 926,	R8A774C0_CLK_CP),
@@ -275,6 +283,10 @@ static int __init r8a774c0_cpg_mssr_init(struct device *dev)
 	return rcar_gen3_cpg_init(cpg_pll_config, 0, cpg_mode);
 }
 
+static const struct clk_div_table cpg_rpcsrc_div_table[] = {
+	{ 0, 5 }, { 1, 3 }, { 2, 8 }, {3, 2}, {0, 0},
+};
+
 const struct cpg_mssr_info r8a774c0_cpg_mssr_info __initconst = {
 	/* Core Clocks */
 	.core_clks = r8a774c0_core_clks,
@@ -287,6 +299,8 @@ const struct cpg_mssr_info r8a774c0_cpg_mssr_info __initconst = {
 	.num_mod_clks = ARRAY_SIZE(r8a774c0_mod_clks),
 	.num_hw_mod_clks = 12 * 32,
 
+	.cpg_rpcsrc_div_table = cpg_rpcsrc_div_table,
+
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774c0_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774c0_crit_mod_clks),
-- 
2.17.1

