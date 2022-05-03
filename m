Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9203D5183D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbiECMGW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbiECMGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:06:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BDAC32EEF;
        Tue,  3 May 2022 05:02:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="118643201"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2022 21:02:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 52D614226AFC;
        Tue,  3 May 2022 21:02:22 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 10/12] clk: renesas: Add RZ/V2M support using the rzg2l driver
Date:   Tue,  3 May 2022 12:55:55 +0100
Message-Id: <20220503115557.53370-11-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503115557.53370-1-phil.edworthy@renesas.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
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
v3:
 - Replace DEF_MUX2 with DEF_MUX
 - Add URT_PCLK, it depends on CLK_SEL_E
---
 drivers/clk/renesas/Kconfig         |   5 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g011-cpg.c | 168 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 +
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 181 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g011-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 7e9b9a5bb5b7..cacaf9b87d26 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -37,6 +37,7 @@ config CLK_RENESAS
 	select CLK_R9A07G043 if ARCH_R9A07G043
 	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_R9A07G054 if ARCH_R9A07G054
+	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -178,6 +179,10 @@ config CLK_R9A07G054
 	bool "RZ/V2L clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A09G011
+	bool "RZ/V2M clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index b83062af090c..de907623fe3f 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
+obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
new file mode 100644
index 000000000000..7f16a617dc8c
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -0,0 +1,168 @@
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
+	DEF_DIV_RO(".dive",	CLK_DIV_E,	CLK_PLL2_100,	DIV_E,	0),
+	DEF_DIV_RO(".divw",	CLK_DIV_W,	CLK_PLL4,	DIV_W,	dtable_divw),
+
+	DEF_MUX_RO(".selb",	CLK_SEL_B,	SEL_B,		sel_b),
+	DEF_MUX_RO(".sele",	CLK_SEL_E,	SEL_E,		sel_e),
+	DEF_MUX(".selw0",	CLK_SEL_W0,	SEL_W0,		sel_w),
+
+	DEF_FIXED(".selb_d2",	CLK_SEL_B_D2,	CLK_SEL_B,	1,	2),
+};
+
+static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
+	DEF_MOD("gic",		R9A09G011_GIC_CLK,	CLK_SEL_B_D2, 0x400, 5),
+	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	CLK_MAIN_24,  0x41c, 12),
+	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	CLK_SEL_E,    0x438, 4),
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
+	MOD_CLK_BASE + R9A09G011_URT_PCLK,
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
index 89f63c09f089..d41db915616b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1406,6 +1406,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
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
index 6fbb431fb331..cecbdf5e4f93 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -270,5 +270,6 @@ struct rzg2l_cpg_info {
 extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
+extern const struct rzg2l_cpg_info r9a09g011_cpg_info;
 
 #endif
-- 
2.32.0

