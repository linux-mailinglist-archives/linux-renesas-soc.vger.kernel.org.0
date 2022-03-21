Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B584E2CB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350514AbiCUPrW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347786AbiCUPrT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:47:19 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E63EA17068;
        Mon, 21 Mar 2022 08:45:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="114269512"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2022 00:45:43 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C2F3C4001960;
        Tue, 22 Mar 2022 00:45:41 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 11/14] clk: renesas: Add RZ/V2M support using the rzg2l driver
Date:   Mon, 21 Mar 2022 15:42:29 +0000
Message-Id: <20220321154232.56315-12-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RZ/V2M SoC is very similar to RZ/G2L, though it doesn't have
any CLK_MON registers.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig         |   5 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g011-cpg.c | 164 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 +
 drivers/clk/renesas/rzg2l-cpg.h     |   7 ++
 5 files changed, 183 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g011-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index c281f3af5716..83c5a9929936 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -35,6 +35,7 @@ config CLK_RENESAS
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_R9A07G054 if ARCH_R9A07G054
+        select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -168,6 +169,10 @@ config CLK_R9A07G054
 	bool "RZ/V2L clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A09G011
+       bool "RZ/V2M clock support" if COMPILE_TEST
+       select CLK_RZG2L
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d5e571699a30..650dbe2bb5c6 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
+obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
new file mode 100644
index 000000000000..47b93c1dec11
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/V2M Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Based on r9a07g044-cpg.c
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a09g011-cpg.h>
+
+#include "rzg2l-cpg.h"
+
+#define RZV2M_SAMPLL4_CLK1	0x104
+#define RZV2M_SAMPLL4_CLK2	0x108
+
+#define PLL4_CONF	(RZV2M_SAMPLL4_CLK1 << 22 | RZV2M_SAMPLL4_CLK2 << 12)
+
+#define DIV_A		DDIV_PACK(0x200, 0, 3)
+#define DIV_B		DDIV_PACK(0x204, 0, 2)
+#define DIV_E		DDIV_PACK(0x204, 8, 1)
+#define DIV_W		DDIV_PACK(0x328, 0, 3)
+
+#define SEL_B		SEL_PLL_PACK(0x214, 0, 1)
+#define SEL_E		SEL_PLL_PACK(0x214, 2, 1)
+#define SEL_W0		SEL_PLL_PACK(0x32C, 0, 1)
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = 0,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_MAIN_24,
+	CLK_MAIN_2,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL2_800,
+	CLK_PLL2_400,
+	CLK_PLL2_200,
+	CLK_PLL2_100,
+	CLK_PLL4,
+	CLK_DIV_A,
+	CLK_DIV_B,
+	CLK_DIV_E,
+	CLK_DIV_W,
+	CLK_SEL_B,
+	CLK_SEL_B_D2,
+	CLK_SEL_E,
+	CLK_SEL_W0,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+/* Divider tables */
+static const struct clk_div_table dtable_diva[] = {
+	{0, 1},
+	{1, 2},
+	{2, 3},
+	{3, 4},
+	{4, 6},
+	{5, 12},
+	{6, 24},
+	{0, 0},
+};
+
+static const struct clk_div_table dtable_divb[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
+static const struct clk_div_table dtable_divw[] = {
+	{0, 6},
+	{1, 7},
+	{2, 8},
+	{3, 9},
+	{4, 10},
+	{5, 11},
+	{6, 12},
+	{0, 0},
+};
+
+/* Mux clock tables */
+static const char * const sel_b[] = { ".main", ".divb" };
+static const char * const sel_e[] = { ".main", ".dive" };
+static const char * const sel_w[] = { ".main", ".divw" };
+
+static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",	CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".main",	CLK_MAIN,	CLK_EXTAL,	1,	1),
+	DEF_FIXED(".main_24",	CLK_MAIN_24,	CLK_MAIN,	1,	2),
+	DEF_FIXED(".main_2",	CLK_MAIN_2,	CLK_MAIN,	1,	24),
+	DEF_FIXED(".pll1",	CLK_PLL1,	CLK_MAIN_2,	498,	1),
+	DEF_FIXED(".pll2",	CLK_PLL2,	CLK_MAIN_2,	800,	1),
+	DEF_FIXED(".pll2_800",	CLK_PLL2_800,	CLK_PLL2,	1,	2),
+	DEF_FIXED(".pll2_400",	CLK_PLL2_400,	CLK_PLL2_800,	1,	2),
+	DEF_FIXED(".pll2_200",	CLK_PLL2_200,	CLK_PLL2_800,	1,	4),
+	DEF_FIXED(".pll2_100",	CLK_PLL2_100,	CLK_PLL2_800,	1,	8),
+	DEF_SAMPLL(".pll4",	CLK_PLL4,	CLK_MAIN_2,	PLL4_CONF),
+
+	DEF_DIV_RO(".diva",	CLK_DIV_A,	CLK_PLL1,	DIV_A,	dtable_diva),
+	DEF_DIV_RO(".divb",	CLK_DIV_B,	CLK_PLL2_400,	DIV_B,	dtable_divb),
+	DEF_DIV_RO(".divw",	CLK_DIV_W,	CLK_PLL4,	DIV_W,	dtable_divw),
+
+	DEF_MUX2_RO(".selb",	CLK_SEL_B,	SEL_B,		sel_b,   0),
+	DEF_MUX2(".selw0",	CLK_SEL_W0,	SEL_W0,		sel_w,   0, 0),
+
+	DEF_FIXED(".selb_d2",	CLK_SEL_B_D2,	CLK_SEL_B,	1,	2),
+};
+
+static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
+	DEF_MOD("gic",		R9A09G011_GIC_CLK,	CLK_SEL_B_D2, 0x400, 5),
+	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	CLK_MAIN_24,  0x41c, 12),
+	DEF_MOD("urt0_clk",	R9A09G011_URT0_CLK,	CLK_SEL_W0,   0x438, 5),
+	DEF_MOD("ca53",		R9A09G011_CA53_CLK,	CLK_DIV_A,    0x448, 0),
+};
+
+static const struct rzg2l_reset r9a09g011_resets[] = {
+	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
+};
+
+static const unsigned int r9a09g011_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A09G011_CA53_CLK,
+	MOD_CLK_BASE + R9A09G011_GIC_CLK,
+	MOD_CLK_BASE + R9A09G011_SYC_CNT_CLK,
+};
+
+const struct rzg2l_cpg_info r9a09g011_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a09g011_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g011_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a09g011_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a09g011_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a09g011_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g011_mod_clks),
+	.num_hw_mod_clks = R9A09G011_CA53_CLK + 1,
+
+	/* Resets */
+	.resets = r9a09g011_resets,
+	.num_resets = ARRAY_SIZE(r9a09g011_resets),
+
+	.has_clk_mon_regs = false,
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 220955366538..04f2cfafe6b3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -967,6 +967,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
 		.compatible = "renesas,r9a07g054-cpg",
 		.data = &r9a07g054_cpg_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G011
+	{
+		.compatible = "renesas,r9a09g011-cpg",
+		.data = &r9a09g011_cpg_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index d1d08669066b..b571d1f1c5f3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -103,11 +103,17 @@ enum clk_types {
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
 		 .flag = CLK_DIVIDER_HIWORD_MASK | _flag)
+#define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
+	DEF_DIV(_name, _id, _parent, _conf, _dtable, CLK_DIVIDER_READ_ONLY)
 #define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
 		_mux_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents, \
 		 .flag = _flag, .mux_flags = CLK_MUX_HIWORD_MASK | _mux_flags)
+#define DEF_MUX2(_name, _id, _conf, _parent_names, _flag, _mux_flags) \
+	DEF_MUX(_name, _id, _conf, _parent_names, 2, _flag, _mux_flags)
+#define DEF_MUX2_RO(_name, _id, _conf, _parent_names, _flag) \
+	DEF_MUX2(_name, _id, _conf, _parent_names, _flag, CLK_MUX_READ_ONLY)
 #define DEF_SD_MUX(_name, _id, _conf, _parent_names, _num_parents) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents)
@@ -214,5 +220,6 @@ struct rzg2l_cpg_info {
 
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
+extern const struct rzg2l_cpg_info r9a09g011_cpg_info;
 
 #endif
-- 
2.32.0

