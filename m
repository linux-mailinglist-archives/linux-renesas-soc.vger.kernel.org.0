Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC4F2B4084
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 11:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgKPKKc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 05:10:32 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:46267 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726611AbgKPKKc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 05:10:32 -0500
X-IronPort-AV: E=Sophos;i="5.77,482,1596466800"; 
   d="scan'208";a="62859650"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2020 19:10:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7E97040078AD;
        Mon, 16 Nov 2020 19:10:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4] clk: renesas: r8a774c0: Add RPC clocks
Date:   Mon, 16 Nov 2020 10:10:02 +0000
Message-Id: <20201116101002.5986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
driver.

Add new clk type CLK_TYPE_GEN3_E3_RPCSRC to register rpcsrc as a fixed
clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
parent and the divider is set based on the register value CPG_RPCCKCR[4:3]
which has been set prior to booting the kernel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4
* Dropped cross verification of clock source
* Changed DEF_FIXED_RPCSRC_E3 macro so that SoC specific div can be passed
  which would make addition of D3 SoC easier
* Renamed CLK_TYPE_GEN3E3_RPCSRC to CLK_TYPE_GEN3_E3_RPCSRC
* Updated the commit message

v2->v3
* Implemented as a fixed clock

v1->v2
* Fixed divider table depending on the clk source
* Introduced CLK_TYPE_GEN3E3_RPCSRC for E3/G2E.

v1: https://lkml.org/lkml/2020/10/16/474
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  9 ++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 28 +++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h     |  5 +++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 9fc9fa9e531a..ed3a2cf0e0bb 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -44,6 +44,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 	CLK_OCO,
 
@@ -74,6 +75,13 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
 	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
 
+	DEF_FIXED_RPCSRC_E3(".rpcsrc", CLK_RPCSRC, CLK_PLL0, CLK_PLL1),
+
+	DEF_BASE("rpc",		R8A774C0_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A774C0_CLK_RPC),
+
 	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
@@ -199,6 +207,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 	DEF_MOD("can-fd",		 914,	R8A774C0_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A774C0_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A774C0_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A774C0_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c-dvfs",		 926,	R8A774C0_CLK_CP),
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 488f8b3980c5..20de135e28ed 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -696,6 +696,34 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 						  cpg_rpcsrc_div_table,
 						  &cpg_lock);
 
+	case CLK_TYPE_GEN3_E3_RPCSRC:
+		/*
+		 * Register RPCSRC as fixed factor clock based on the
+		 * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
+		 * which has been set prior to booting the kernel.
+		 */
+		value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >> 3;
+
+		switch (value) {
+		case 0:
+			div = 5;
+			break;
+		case 1:
+			div = 3;
+			break;
+		case 2:
+			parent = clks[core->parent >> 16];
+			if (IS_ERR(parent))
+				return ERR_CAST(parent);
+			div = core->div;
+			break;
+		case 3:
+		default:
+			div = 2;
+			break;
+		}
+		break;
+
 	case CLK_TYPE_GEN3_RPC:
 		return cpg_rpc_clk_register(core->name, base,
 					    __clk_get_name(parent), notifiers);
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index c4ac80cac6a0..3d949c4a3244 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -24,6 +24,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 	CLK_TYPE_GEN3_RPCSRC,
+	CLK_TYPE_GEN3_E3_RPCSRC,
 	CLK_TYPE_GEN3_RPC,
 	CLK_TYPE_GEN3_RPCD2,
 
@@ -54,6 +55,10 @@ enum rcar_gen3_clk_types {
 #define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _offset)	\
 	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
 
+#define DEF_FIXED_RPCSRC_E3(_name, _id, _parent0, _parent1)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_E3_RPCSRC,	\
+		 (_parent0) << 16 | (_parent1), .div = 8)
+
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
 	u8 pll1_mult;
-- 
2.25.1

