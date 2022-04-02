Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A0D4EFF63
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243734AbiDBHcn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243030AbiDBHck (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:32:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB32A173B2B;
        Sat,  2 Apr 2022 00:30:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="115483264"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2022 16:30:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6D8A84001944;
        Sat,  2 Apr 2022 16:30:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/5] clk: renesas: Add support for RZ/G2UL SoC
Date:   Sat,  2 Apr 2022 08:30:35 +0100
Message-Id: <20220402073037.23947-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
References: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clock structure for RZ/G2UL is almost identical to RZ/G2L SoC with
fewer IP blocks. The IP blocks such as WDT1, GPT, H264, GPU and POEG are
not present on RZ/G2UL.

This patch adds minimal clock and reset entries required to boot the
system on Renesas RZ/G2UL SMARC EVK and binds it with the RZ/G2L CPG core
driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Added Rb tag from Geert
 * Updated num_hw_mod_clks and num_resets.
v2->v3:
 * Replaced R9A07G043U->R9A07G043 and r9a07g043u->r9a07g043
v1->v2:
 * No change
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a07g043-cpg.c | 157 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 ++
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r9a07g043-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index c281f3af5716..a95ed8f310da 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -33,6 +33,7 @@ config CLK_RENESAS
 	select CLK_R8A779A0 if ARCH_R8A779A0
 	select CLK_R8A779F0 if ARCH_R8A779F0
 	select CLK_R9A06G032 if ARCH_R9A06G032
+	select CLK_R9A07G043 if ARCH_R9A07G043
 	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_SH73A0 if ARCH_SH73A0
@@ -160,6 +161,10 @@ config CLK_R8A779F0
 config CLK_R9A06G032
 	bool "RZ/N1D clock support" if COMPILE_TEST
 
+config CLK_R9A07G043
+	bool "RZ/G2UL clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_R9A07G044
 	bool "RZ/G2L clock support" if COMPILE_TEST
 	select CLK_RZG2L
@@ -200,7 +205,7 @@ config CLK_RCAR_USB2_CLOCK_SEL
 	  This is a driver for R-Car USB2 clock selector
 
 config CLK_RZG2L
-	bool "Renesas RZ/{G2L,V2L} family clock support" if COMPILE_TEST
+	bool "Renesas RZ/{G2L,G2UL,V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
 # Generic
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d5e571699a30..ca3a9bbcf27a 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
+obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
new file mode 100644
index 000000000000..81409ff37e2e
--- /dev/null
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G2UL CPG driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a07g043-cpg.h>
+
+#include "rzg2l-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A07G043_CLK_P0_DIV2,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_OSC_DIV1000,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL2_DIV2,
+	CLK_PLL2_DIV2_8,
+	CLK_PLL3,
+	CLK_PLL3_DIV2,
+	CLK_PLL3_DIV2_4,
+	CLK_PLL3_DIV2_4_2,
+	CLK_PLL5,
+	CLK_PLL6,
+	CLK_P1_DIV2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+/* Divider tables */
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
+static const struct clk_div_table dtable_1_32[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{4, 32},
+	{0, 0},
+};
+
+static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".osc", R9A07G043_OSCCLK, CLK_EXTAL, 1, 1),
+	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
+	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
+	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
+	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
+	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
+	DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
+
+	/* Core output clk */
+	DEF_DIV("I", R9A07G043_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
+		CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("P0", R9A07G043_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
+		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("P1", R9A07G043_CLK_P1, CLK_PLL3_DIV2_4,
+		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G043_CLK_P1, 1, 2),
+	DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2,
+		DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+};
+
+static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
+	DEF_MOD("gic",		R9A07G043_GIC600_GICCLK, R9A07G043_CLK_P1,
+				0x514, 0),
+	DEF_MOD("ia55_pclk",	R9A07G043_IA55_PCLK, R9A07G043_CLK_P2,
+				0x518, 0),
+	DEF_MOD("ia55_clk",	R9A07G043_IA55_CLK, R9A07G043_CLK_P1,
+				0x518, 1),
+	DEF_MOD("dmac_aclk",	R9A07G043_DMAC_ACLK, R9A07G043_CLK_P1,
+				0x52c, 0),
+	DEF_MOD("dmac_pclk",	R9A07G043_DMAC_PCLK, CLK_P1_DIV2,
+				0x52c, 1),
+	DEF_MOD("scif0",	R9A07G043_SCIF0_CLK_PCK, R9A07G043_CLK_P0,
+				0x584, 0),
+	DEF_MOD("scif1",	R9A07G043_SCIF1_CLK_PCK, R9A07G043_CLK_P0,
+				0x584, 1),
+	DEF_MOD("scif2",	R9A07G043_SCIF2_CLK_PCK, R9A07G043_CLK_P0,
+				0x584, 2),
+	DEF_MOD("scif3",	R9A07G043_SCIF3_CLK_PCK, R9A07G043_CLK_P0,
+				0x584, 3),
+	DEF_MOD("scif4",	R9A07G043_SCIF4_CLK_PCK, R9A07G043_CLK_P0,
+				0x584, 4),
+	DEF_MOD("sci0",		R9A07G043_SCI0_CLKP, R9A07G043_CLK_P0,
+				0x588, 0),
+	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
+				0x588, 1),
+};
+
+static struct rzg2l_reset r9a07g043_resets[] = {
+	DEF_RST(R9A07G043_GIC600_GICRESET_N, 0x814, 0),
+	DEF_RST(R9A07G043_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A07G043_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A07G043_DMAC_ARESETN, 0x82c, 0),
+	DEF_RST(R9A07G043_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G043_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A07G043_SCIF1_RST_SYSTEM_N, 0x884, 1),
+	DEF_RST(R9A07G043_SCIF2_RST_SYSTEM_N, 0x884, 2),
+	DEF_RST(R9A07G043_SCIF3_RST_SYSTEM_N, 0x884, 3),
+	DEF_RST(R9A07G043_SCIF4_RST_SYSTEM_N, 0x884, 4),
+	DEF_RST(R9A07G043_SCI0_RST, 0x888, 0),
+	DEF_RST(R9A07G043_SCI1_RST, 0x888, 1),
+};
+
+static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A07G043_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A07G043_IA55_CLK,
+	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
+};
+
+const struct rzg2l_cpg_info r9a07g043_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a07g043_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a07g043_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a07g043_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a07g043_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a07g043_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a07g043_mod_clks),
+	.num_hw_mod_clks = R9A07G043_TSU_PCLK + 1,
+
+	/* Resets */
+	.resets = r9a07g043_resets,
+	.num_resets = R9A07G043_TSU_PRESETN + 1, /* Last reset ID + 1 */
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b3a1533970e5..41a31aae7a4b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -945,6 +945,12 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzg2l_cpg_match[] = {
+#ifdef CONFIG_CLK_R9A07G043
+	{
+		.compatible = "renesas,r9a07g043-cpg",
+		.data = &r9a07g043_cpg_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R9A07G044
 	{
 		.compatible = "renesas,r9a07g044-cpg",
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index ce657beaf160..92c88f42ca7f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -202,6 +202,7 @@ struct rzg2l_cpg_info {
 	unsigned int num_crit_mod_clks;
 };
 
+extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
 
-- 
2.17.1

