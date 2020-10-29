Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8919A29E9BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 11:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgJ2KzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 06:55:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:45820 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726025AbgJ2KzZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 06:55:25 -0400
X-IronPort-AV: E=Sophos;i="5.77,429,1596466800"; 
   d="scan'208";a="60942120"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Oct 2020 19:55:23 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 596224279860;
        Thu, 29 Oct 2020 19:55:21 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] clk: renesas: r8a774c0: Add RPC clocks
Date:   Thu, 29 Oct 2020 10:55:15 +0000
Message-Id: <20201029105515.16309-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
driver.

Add new clk type CLK_TYPE_GEN3E3_RPCSRC to handle registering rpcsrc
clock as the source for RPCSRC can be either PLL0/PLL1 and this depends
on MD[1:4] pins where as compared to other R-Car Gen3 SoC's the RPCSRC
clock source is always PLL1.

MD[4] MD[3] MD[2] MD[1]
  0     0     0    1     -> RPCSRC CLK source is PLL1
  0     0     1    1     -> RPCSRC CLK source is PLL1
  0     1     0    0     -> RPCSRC CLK source is PLL1
  1     0     1    1     -> RPCSRC CLK source is PLL1
  x     x     x    x     -> For any other values RPCSRC CLK source is PLL0

R-Car Gen3 manual Rev.2.20 has in-correct information related to
determining the clock source for RPCSRC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,

This patch is part of series of [1], since rest of the patches have been
acked I am just re-sending this single patch.

v1->v2
* Fixed divider table depending on the clk source
* Introduced CLK_TYPE_GEN3E3_RPCSRC for E3/G2E.

CLK output on g2e:

.pll1                          3        6        0  1600000000          0     0  50000
   .rpcsrc                     0        1        0   320000000          0     0  50000
      rpc                      0        1        0    80000000          0     0  50000
         rpcd2                 0        1        0    40000000          0     0  50000
            rpc-if             0        1        0    40000000          0     0  50000

[1] https://lkml.org/lkml/2020/10/16/470

Cheers,
Prabhakar
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  8 ++++++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 37 +++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h     |  1 +
 3 files changed, 46 insertions(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 9fc9fa9e531a..cccb20de4d4b 100644
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
+	DEF_BASE(".rpcsrc",    CLK_RPCSRC, CLK_TYPE_GEN3E3_RPCSRC, (CLK_PLL1 << 16) | CLK_PLL0),
+
+	DEF_BASE("rpc",		R8A774C0_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
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
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 488f8b3980c5..90a30416c9cf 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -441,6 +441,14 @@ static const struct clk_div_table cpg_rpcsrc_div_table[] = {
 	{ 2, 5 }, { 3, 6 }, { 0, 0 },
 };
 
+static const struct clk_div_table cpg_rpcsrc_e3_pll0_div_table[] = {
+	{ 2, 8 }, { 0, 0 },
+};
+
+static const struct clk_div_table cpg_rpcsrc_e3_pll1_div_table[] = {
+	{ 0, 5 }, { 1, 3 }, { 3, 2 }, { 0, 0 },
+};
+
 static const struct clk_div_table cpg_rpc_div_table[] = {
 	{ 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
 };
@@ -515,6 +523,18 @@ static struct clk * __init cpg_rpcd2_clk_register(const char *name,
 	return clk;
 }
 
+static int __init cpg_rpcsrc_e3_get_parent(u32 mode)
+{
+	unsigned int e3_rpcsrc = (mode & GENMASK(4, 1)) >> 1;
+	unsigned int pll1[] = { 0x1, 0x3, 0x4, 0xb, };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pll1); i++)
+		if (e3_rpcsrc == pll1[i])
+			return 1;
+
+	return 0;
+}
 
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
@@ -552,6 +572,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct clk *parent;
 	unsigned int mult = 1;
 	unsigned int div = 1;
+	int e3_rpcsrc_parent;
 	u32 value;
 
 	parent = clks[core->parent & 0xffff];	/* some types use high bits */
@@ -696,6 +717,22 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 						  cpg_rpcsrc_div_table,
 						  &cpg_lock);
 
+	case CLK_TYPE_GEN3E3_RPCSRC:
+		e3_rpcsrc_parent = cpg_rpcsrc_e3_get_parent(cpg_mode);
+		if (e3_rpcsrc_parent) {
+			parent = clks[core->parent >> 16];
+			if (IS_ERR(parent))
+				return ERR_CAST(parent);
+		}
+
+		return clk_register_divider_table(NULL, core->name,
+						  __clk_get_name(parent), 0,
+						  base + CPG_RPCCKCR, 3, 2, 0,
+						  e3_rpcsrc_parent ?
+						  cpg_rpcsrc_e3_pll1_div_table :
+						  cpg_rpcsrc_e3_pll0_div_table,
+						  &cpg_lock);
+
 	case CLK_TYPE_GEN3_RPC:
 		return cpg_rpc_clk_register(core->name, base,
 					    __clk_get_name(parent), notifiers);
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index c4ac80cac6a0..74b95ab64046 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -24,6 +24,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 	CLK_TYPE_GEN3_RPCSRC,
+	CLK_TYPE_GEN3E3_RPCSRC,
 	CLK_TYPE_GEN3_RPC,
 	CLK_TYPE_GEN3_RPCD2,
 
-- 
2.25.1

