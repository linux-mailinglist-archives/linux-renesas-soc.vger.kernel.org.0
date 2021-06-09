Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4348F3A19CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238377AbhFIPfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:35:37 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:33258 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237318AbhFIPfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:35:22 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83733823"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 00:33:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 884394009102;
        Thu, 10 Jun 2021 00:33:23 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 09/11] clk: renesas: Add support for R9A07G044 SoC
Date:   Wed,  9 Jun 2021 16:32:28 +0100
Message-Id: <20210609153230.6967-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define the clock outputs supported by RZ/G2L (R9A07G044) SoC
and bind it with RZ/G2L CPG core.

Based on a patch in the BSP by Binh Nguyen
<binh.nguyen.jz@renesas.com>.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c     | 127 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.c |   6 ++
 drivers/clk/renesas/renesas-rzg2l-cpg.h |   2 +
 5 files changed, 141 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a07g044-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index a067428cb7af..916c7d227e25 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -32,6 +32,7 @@ config CLK_RENESAS
 	select CLK_R8A77995 if ARCH_R8A77995
 	select CLK_R8A779A0 if ARCH_R8A779A0
 	select CLK_R9A06G032 if ARCH_R9A06G032
+	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -156,6 +157,10 @@ config CLK_R9A06G032
 	help
 	  This is a driver for R9A06G032 clocks
 
+config CLK_R9A07G044
+	bool "RZ/G2L clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index a9c299686b4a..5c6c5c721d98 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_R8A77990)		+= r8a77990-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
+obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
new file mode 100644
index 000000000000..50b5269586a4
--- /dev/null
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G2L CPG driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a07g044-cpg.h>
+
+#include "renesas-rzg2l-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A07G044_OSCCLK,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_OSC_DIV1000,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL2_DIV2,
+	CLK_PLL2_DIV16,
+	CLK_PLL2_DIV20,
+	CLK_PLL3,
+	CLK_PLL3_DIV2,
+	CLK_PLL3_DIV4,
+	CLK_PLL3_DIV8,
+	CLK_PLL4,
+	CLK_PLL5,
+	CLK_PLL5_DIV2,
+	CLK_PLL6,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+/* Divider tables */
+static const struct clk_div_table dtable_3b[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{4, 32},
+};
+
+static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_EXTAL, 1, 1),
+	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
+	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 133, 2),
+	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 133, 2),
+
+	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".pll2_div16", CLK_PLL2_DIV16, CLK_PLL2, 1, 16),
+	DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
+
+	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
+	DEF_FIXED(".pll3_div8", CLK_PLL3_DIV8, CLK_PLL3, 1, 8),
+
+	/* Core output clk */
+	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
+	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV16, DIVPL2A,
+		dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
+	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV8,
+		DIVPL3B, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+};
+
+static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
+	DEF_MOD("gic",		R9A07G044_CLK_GIC600,
+				R9A07G044_CLK_P1,
+				0x514, BIT(0), (BIT(0) | BIT(1))),
+	DEF_MOD("ia55",		R9A07G044_CLK_IA55,
+				R9A07G044_CLK_P1,
+				0x518, (BIT(0) | BIT(1)), BIT(0)),
+	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
+				R9A07G044_CLK_P0,
+				0x584, BIT(0), BIT(0)),
+	DEF_MOD("scif1",	R9A07G044_CLK_SCIF1,
+				R9A07G044_CLK_P0,
+				0x584, BIT(1), BIT(1)),
+	DEF_MOD("scif2",	R9A07G044_CLK_SCIF2,
+				R9A07G044_CLK_P0,
+				0x584, BIT(2), BIT(2)),
+	DEF_MOD("scif3",	R9A07G044_CLK_SCIF3,
+				R9A07G044_CLK_P0,
+				0x584, BIT(3), BIT(3)),
+	DEF_MOD("scif4",	R9A07G044_CLK_SCIF4,
+				R9A07G044_CLK_P0,
+				0x584, BIT(4), BIT(4)),
+	DEF_MOD("sci0",		R9A07G044_CLK_SCI0,
+				R9A07G044_CLK_P0,
+				0x588, BIT(0), BIT(0)),
+};
+
+static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A07G044_CLK_GIC600,
+};
+
+const struct rzg2l_cpg_info r9a07g044_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a07g044_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a07g044_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a07g044_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a07g044_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
+	.num_hw_mod_clks = R9A07G044_CLK_MIPI_DSI_PIN + 1,
+};
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 9e860d55c916..ef308cb2368f 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -723,6 +723,12 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzg2l_cpg_match[] = {
+#ifdef CONFIG_CLK_R9A07G044
+	{
+		.compatible = "renesas,r9a07g044-cpg",
+		.data = &r9a07g044_cpg_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
index 8ff0047ffeb9..3948bdd8afc9 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -131,4 +131,6 @@ struct rzg2l_cpg_info {
 	unsigned int num_crit_mod_clks;
 };
 
+extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
+
 #endif
-- 
2.17.1

