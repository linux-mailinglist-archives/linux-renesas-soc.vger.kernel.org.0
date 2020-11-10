Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4052AD6EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 13:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730326AbgKJM4T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 07:56:19 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:59092 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729787AbgKJM4T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 07:56:19 -0500
X-IronPort-AV: E=Sophos;i="5.77,466,1596466800"; 
   d="scan'208";a="62244176"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2020 21:56:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A74DA4007F41;
        Tue, 10 Nov 2020 21:56:15 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
Date:   Tue, 10 Nov 2020 12:56:09 +0000
Message-Id: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
driver.

Add new clk type CLK_TYPE_GEN3E3_RPCSRC to register rpcsrc as a fixed
clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
parent and the divider is set based on the register value CPG_RPCCKCR[4:3]
(parent is cross verified against MD[4:1] pins) which has been set prior
to booting the kernel.

MD[4] MD[3] MD[2] MD[1]
  0     0     0    1     -> RPCSRC CLK source is PLL1
  0     0     1    1     -> RPCSRC CLK source is PLL1
  0     1     0    0     -> RPCSRC CLK source is PLL1
  1     0     1    1     -> RPCSRC CLK source is PLL1
  x     x     x    x     -> For any other values RPCSRC CLK source is PLL0

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3
* Implemented as a fixed clock

v1->v2
* Fixed divider table depending on the clk source
* Introduced CLK_TYPE_GEN3E3_RPCSRC for E3/G2E.

v1: https://lkml.org/lkml/2020/10/16/474
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  9 +++++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 49 +++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h     |  4 ++
 3 files changed, 62 insertions(+)

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
index 488f8b3980c5..00c3d5570274 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -427,6 +427,19 @@ static struct clk * __init cpg_sd_clk_register(const char *name,
 	return clk;
 }
 
+static bool __init cpg_rpcsrc_e3_parent_is_pll0(u32 mode)
+{
+	unsigned int e3_rpcsrc = (mode & GENMASK(4, 1)) >> 1;
+	unsigned int pll1[] = { 0x1, 0x3, 0x4, 0xb, };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pll1); i++)
+		if (e3_rpcsrc == pll1[i])
+			return false;
+
+	return true;
+}
+
 struct rpc_clock {
 	struct clk_divider div;
 	struct clk_gate gate;
@@ -696,6 +709,42 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 						  cpg_rpcsrc_div_table,
 						  &cpg_lock);
 
+	case CLK_TYPE_GEN3E3_RPCSRC:
+		/*
+		 * Register RPCSRC as fixed factor clock based on the
+		 * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
+		 * which has been set prior to booting the kernel.
+		 */
+
+		value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >> 3;
+		if (cpg_rpcsrc_e3_parent_is_pll0(cpg_mode)) {
+			if (value != 2)
+				return ERR_PTR(-EINVAL);
+		} else {
+			if (value == 2)
+				return ERR_PTR(-EINVAL);
+		}
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
+			div = 8;
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
index c4ac80cac6a0..4d20b2a8bd9f 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -24,6 +24,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 	CLK_TYPE_GEN3_RPCSRC,
+	CLK_TYPE_GEN3E3_RPCSRC,
 	CLK_TYPE_GEN3_RPC,
 	CLK_TYPE_GEN3_RPCD2,
 
@@ -54,6 +55,9 @@ enum rcar_gen3_clk_types {
 #define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _offset)	\
 	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
 
+#define DEF_FIXED_RPCSRC_E3(_name, _id, _parent0, _parent1)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3E3_RPCSRC, (_parent0) << 16 | (_parent1))
+
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
 	u8 pll1_mult;
-- 
2.17.1

