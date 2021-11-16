Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1652452C12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhKPHqa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:46:30 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:6142 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231426AbhKPHpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:49 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100767153"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7DE9140083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 12/16] clk: renesas: cpg-mssr: Add support for R-Car S4-8
Date:   Tue, 16 Nov 2021 16:41:26 +0900
Message-Id: <20211116074130.107554-13-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial support for R-Car S4-8 (r8a779f0), including core, module
clocks, resets, and register access, because register specification
differs from R-Car Gen2/3. The register layout of V3U is a similar
with R-Car S4-8 so that renames CLK_REG_LAYOUT_RCAR_V3U as
CLK_REG_LAYOUT_RCAR_GEN4. However, PLL names differ between V3U
and S4-8.

Inspired by patches in the BSP by LUU HOAI.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/Kconfig             |  10 ++
 drivers/clk/renesas/Makefile            |   2 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c |   2 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 188 ++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c     | 141 ++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h     |  76 ++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |  42 ++++--
 drivers/clk/renesas/renesas-cpg-mssr.h  |   3 +-
 8 files changed, 448 insertions(+), 16 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779f0-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 6d0280751bb1..0927fa963ca6 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -31,6 +31,7 @@ config CLK_RENESAS
 	select CLK_R8A77990 if ARCH_R8A77990
 	select CLK_R8A77995 if ARCH_R8A77995
 	select CLK_R8A779A0 if ARCH_R8A779A0
+	select CLK_R8A779F0 if ARCH_R8A779F0
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_SH73A0 if ARCH_SH73A0
@@ -152,6 +153,10 @@ config CLK_R8A779A0
 	select CLK_RCAR_CPG_LIB
 	select CLK_RENESAS_CPG_MSSR
 
+config CLK_R8A779F0
+	bool "R-Car S4-8 clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN4_CPG
+
 config CLK_R9A06G032
 	bool "RZ/N1D clock support" if COMPILE_TEST
 
@@ -178,6 +183,11 @@ config CLK_RCAR_GEN3_CPG
 	select CLK_RCAR_CPG_LIB
 	select CLK_RENESAS_CPG_MSSR
 
+config CLK_RCAR_GEN4_CPG
+	bool "R-Car Gen4 clock support" if COMPILE_TEST
+	select CLK_RCAR_CPG_LIB
+	select CLK_RENESAS_CPG_MSSR
+
 config CLK_RCAR_USB2_CLOCK_SEL
 	bool "Renesas R-Car USB2 clock selector support"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 7d018700d08b..1cd461b8fa7b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_R8A77980)		+= r8a77980-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77990)		+= r8a77990-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A779F0)              += r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
@@ -36,6 +37,7 @@ obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+= rcar-cpg-lib.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
+obj-$(CONFIG_CLK_RCAR_GEN4_CPG)         += rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
 
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index fbd7454f2beb..8aab3957c23d 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -583,5 +583,5 @@ const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
 	.init = r8a779a0_cpg_mssr_init,
 	.cpg_clk_register = rcar_r8a779a0_cpg_clk_register,
 
-	.reg_layout = CLK_REG_LAYOUT_RCAR_V3U,
+	.reg_layout = CLK_REG_LAYOUT_RCAR_GEN4,
 };
diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
new file mode 100644
index 000000000000..ebec32008bc6
--- /dev/null
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a779f0 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Based on r8a779a0-cpg-mssr.c
+ */
+
+#include <linux/bug.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen4-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A779F0_CLK_R,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL3,
+	CLK_PLL5,
+	CLK_PLL6,
+	CLK_PLL1_DIV2,
+	CLK_PLL2_DIV2,
+	CLK_PLL3_DIV2,
+	CLK_PLL5_DIV2,
+	CLK_PLL5_DIV4,
+	CLK_PLL6_DIV2,
+	CLK_S0,
+	CLK_SDSRC,
+	CLK_RPCSRC,
+	CLK_OCO,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",      CLK_EXTAL),
+	DEF_INPUT("extalr",     CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
+	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3, CLK_MAIN),
+	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2, CLK_MAIN),
+	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6, CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,     CLK_TYPE_GEN4_PLL5, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
+	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
+	DEF_FIXED(".pll3_div2",	CLK_PLL3_DIV2,	CLK_PLL3,	2, 1),
+	DEF_FIXED(".pll5_div2",	CLK_PLL5_DIV2,	CLK_PLL5,	2, 1),
+	DEF_FIXED(".pll5_div4",	CLK_PLL5_DIV4,	CLK_PLL5_DIV2,	2, 1),
+	DEF_FIXED(".pll6_div2",	CLK_PLL6_DIV2,	CLK_PLL6,	2, 1),
+	DEF_FIXED(".s0",	CLK_S0,		CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".sdsrc",	CLK_SDSRC,	CLK_PLL5_DIV2,	2, 1),
+	DEF_RATE(".oco",	CLK_OCO,	32768),
+
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC,		CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
+	DEF_BASE(".rpc",	R8A779F0_CLK_RPC,	CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A779F0_CLK_RPCD2,	CLK_TYPE_GEN4_RPCD2, R8A779F0_CLK_RPC),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("s0d2",	R8A779F0_CLK_S0D2,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3",	R8A779F0_CLK_S0D3,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d4",	R8A779F0_CLK_S0D4,	CLK_S0,		4, 1),
+	DEF_FIXED("cl16m",	R8A779F0_CLK_CL16M,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d2_mm",	R8A779F0_CLK_S0D2_MM,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3_mm",	R8A779F0_CLK_S0D3_MM,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d4_mm",	R8A779F0_CLK_S0D4_MM,	CLK_S0,		4, 1),
+	DEF_FIXED("cl16m_mm",	R8A779F0_CLK_CL16M_MM,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d2_rt",	R8A779F0_CLK_S0D2_RT,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3_rt",	R8A779F0_CLK_S0D3_RT,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d4_rt",	R8A779F0_CLK_S0D4_RT,	CLK_S0,		4, 1),
+	DEF_FIXED("s0d6_rt",	R8A779F0_CLK_S0D6_RT,	CLK_S0,		6, 1),
+	DEF_FIXED("cl16m_rt",	R8A779F0_CLK_CL16M_RT,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d3_per",	R8A779F0_CLK_S0D3_PER,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d6_per",	R8A779F0_CLK_S0D6_PER,	CLK_S0,		6, 1),
+	DEF_FIXED("s0d12_per",	R8A779F0_CLK_S0D12_PER,	CLK_S0,		12, 1),
+	DEF_FIXED("s0d24_per",	R8A779F0_CLK_S0D24_PER,	CLK_S0,		24, 1),
+	DEF_FIXED("cl16m_per",	R8A779F0_CLK_CL16M_PER,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d2_hsc",	R8A779F0_CLK_S0D2_HSC,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3_hsc",	R8A779F0_CLK_S0D3_HSC,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d4_hsc",	R8A779F0_CLK_S0D4_HSC,	CLK_S0,		4, 1),
+	DEF_FIXED("s0d6_hsc",	R8A779F0_CLK_S0D6_HSC,	CLK_S0,		6, 1),
+	DEF_FIXED("s0d12_hsc",	R8A779F0_CLK_S0D12_HSC,	CLK_S0,		12, 1),
+	DEF_FIXED("cl16m_hsc",	R8A779F0_CLK_CL16M_HSC,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d2_cc",	R8A779F0_CLK_S0D2_CC,	CLK_S0,		2, 1),
+	DEF_FIXED("rsw",	R8A779F0_CLK_RSW2,	CLK_PLL5,	2, 1),
+	DEF_FIXED("cbfusa",	R8A779F0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
+	DEF_FIXED("cpex",	R8A779F0_CLK_CPEX,	CLK_EXTAL,	2, 1),
+
+	DEF_GEN4_SD("sd0",	R8A779F0_CLK_SD0,	CLK_SDSRC,	0x870),
+	DEF_DIV6P1("mso",       R8A779F0_CLK_MSO,       CLK_PLL5_DIV4, 0x087C),
+
+	DEF_GEN4_OSC("osc",	R8A779F0_CLK_OSC,	CLK_EXTAL,	8),
+	DEF_GEN4_MDSEL("r",	R8A779F0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
+};
+
+static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
+	DEF_MOD("scif0",	702,	R8A779F0_CLK_S0D12_PER),
+	DEF_MOD("scif1",	703,	R8A779F0_CLK_S0D12_PER),
+	DEF_MOD("scif3",	704,	R8A779F0_CLK_S0D12_PER),
+	DEF_MOD("scif4",	705,	R8A779F0_CLK_S0D12_PER),
+};
+
+/*
+ * CPG Clock Data
+ */
+/*
+ *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL5	PLL6	OSC
+ * 14 13 (MHz)
+ * ----------------------------------------------------------------
+ * 0  0	 16.66 / 1	x200	x150	x200	x200	x134	/15
+ * 0  1	 20    / 1	x160	x120	x160	x160	x106	/19
+ * 1  0	 Prohibited setting
+ * 1  1	 40    / 2	x160	x120	x160	x160	x106	/38
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
+					 (((md) & BIT(13)) >> 13))
+
+static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
+	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
+	{ 1,		200,	1,	150,	1,	200,	1,	200,	1,	134,	1,	16,	},
+	{ 1,		160,	1,	120,	1,	160,	1,	160,	1,	106,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
+	{ 2,		160,	1,	120,	1,	160,	1,	160,	1,	106,	1,	38,	},
+};
+
+static int __init r8a779f0_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen4_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	if (!cpg_pll_config->extal_div) {
+		dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
+		return -EINVAL;
+	}
+
+	return rcar_gen4_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a779f0_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a779f0_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a779f0_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a779f0_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a779f0_mod_clks),
+	.num_hw_mod_clks = 28 * 32,
+
+	/* Callbacks */
+	.init = r8a779f0_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen4_cpg_clk_register,
+
+	.reg_layout = CLK_REG_LAYOUT_RCAR_GEN4,
+};
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
new file mode 100644
index 000000000000..930ac767c1d5
--- /dev/null
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car Gen4 Clock Pulse Generator
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Based on rcar-gen3-cpg.c
+ *
+ * Copyright (C) 2015-2018 Glider bvba
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include <linux/bug.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen4-cpg.h"
+#include "rcar-cpg-lib.h"
+
+static const struct clk_div_table cpg_rpcsrc_div_table[] = {
+	{ 2, 5 }, { 3, 6 }, { 0, 0 },
+};
+
+static const struct rcar_gen4_cpg_pll_config *cpg_pll_config __initconst;
+static unsigned int cpg_clk_extalr __initdata;
+static u32 cpg_mode __initdata;
+
+struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	const struct clk *parent;
+	unsigned int mult = 1;
+	unsigned int div = 1;
+
+	parent = clks[core->parent & 0xffff];	/* some types use high bits */
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	switch (core->type) {
+	case CLK_TYPE_GEN4_MAIN:
+		div = cpg_pll_config->extal_div;
+		break;
+
+	case CLK_TYPE_GEN4_PLL1:
+		mult = cpg_pll_config->pll1_mult;
+		div = cpg_pll_config->pll1_div;
+		break;
+
+	case CLK_TYPE_GEN4_PLL2:
+		mult = cpg_pll_config->pll2_mult;
+		div = cpg_pll_config->pll2_div;
+		break;
+
+	case CLK_TYPE_GEN4_PLL3:
+		mult = cpg_pll_config->pll3_mult;
+		div = cpg_pll_config->pll3_div;
+		break;
+
+	case CLK_TYPE_GEN4_PLL5:
+		mult = cpg_pll_config->pll5_mult;
+		div = cpg_pll_config->pll5_div;
+		break;
+
+	case CLK_TYPE_GEN4_PLL6:
+		mult = cpg_pll_config->pll6_mult;
+		div = cpg_pll_config->pll6_div;
+		break;
+
+	case CLK_TYPE_GEN4_MDSEL:
+		/*
+		 * Clock selectable between two parents and two fixed dividers
+		 * using a mode pin
+		 */
+		if (cpg_mode & BIT(core->offset)) {
+			div = core->div & 0xffff;
+		} else {
+			parent = clks[core->parent >> 16];
+			if (IS_ERR(parent))
+				return ERR_CAST(parent);
+			div = core->div >> 16;
+		}
+		mult = 1;
+		break;
+
+	case CLK_TYPE_GEN4_OSC:
+		/*
+		 * Clock combining OSC EXTAL predivider and a fixed divider
+		 */
+		div = cpg_pll_config->osc_prediv * core->div;
+		break;
+
+	case CLK_TYPE_GEN4_RPCSRC:
+		return clk_register_divider_table(NULL, core->name,
+						  __clk_get_name(parent), 0,
+						  base + CPG_RPCCKCR, 3, 2, 0,
+						  cpg_rpcsrc_div_table,
+						  &cpg_lock);
+
+	case CLK_TYPE_GEN4_RPC:
+		return cpg_rpc_clk_register(core->name, base + CPG_RPCCKCR,
+					    __clk_get_name(parent), notifiers);
+
+	case CLK_TYPE_GEN4_RPCD2:
+		return cpg_rpcd2_clk_register(core->name, base + CPG_RPCCKCR,
+					      __clk_get_name(parent));
+
+	case CLK_TYPE_GEN4_SD:
+		return cpg_sd_clk_register(core->name, base, core->offset,
+					   __clk_get_name(parent), notifiers,
+					   0);
+
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	return clk_register_fixed_factor(NULL, core->name,
+					 __clk_get_name(parent), 0, mult, div);
+}
+
+int __init rcar_gen4_cpg_init(const struct rcar_gen4_cpg_pll_config *config,
+			      unsigned int clk_extalr, u32 mode)
+{
+	cpg_pll_config = config;
+	cpg_clk_extalr = clk_extalr;
+	cpg_mode = mode;
+
+	spin_lock_init(&cpg_lock);
+
+	return 0;
+}
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
new file mode 100644
index 000000000000..d6e40b51743b
--- /dev/null
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * R-Car Gen4 Clock Pulse Generator
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __CLK_RENESAS_RCAR_GEN4_CPG_H__
+#define __CLK_RENESAS_RCAR_GEN4_CPG_H__
+
+enum rcar_gen4_clk_types {
+	CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
+	CLK_TYPE_GEN4_PLL1,
+	CLK_TYPE_GEN4_PLL2,
+	CLK_TYPE_GEN4_PLL3,
+	CLK_TYPE_GEN4_PLL5,
+	CLK_TYPE_GEN4_PLL6,
+	CLK_TYPE_GEN4_SD,
+	CLK_TYPE_GEN4_R,
+	CLK_TYPE_GEN4_MDSEL,	/* Select parent/divider using mode pin */
+	CLK_TYPE_GEN4_Z,
+	CLK_TYPE_GEN4_ZG,
+	CLK_TYPE_GEN4_OSC,	/* OSC EXTAL predivider and fixed divider */
+	CLK_TYPE_GEN4_RPCSRC,
+	CLK_TYPE_GEN4_RPC,
+	CLK_TYPE_GEN4_RPCD2,
+
+	/* SoC specific definitions start here */
+	CLK_TYPE_GEN4_SOC_BASE,
+};
+
+#define DEF_GEN4_SD(_name, _id, _parent, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_SD, _parent, .offset = _offset)
+
+#define DEF_GEN4_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_MDSEL,	\
+		 (_parent0) << 16 | (_parent1),		\
+		 .div = (_div0) << 16 | (_div1), .offset = _md)
+
+#define DEF_GEN4_PE(_name, _id, _parent_clean, _div_clean, _parent_sscg, \
+		    _div_sscg) \
+	DEF_GEN4_MDSEL(_name, _id, 12, _parent_clean, _div_clean,	\
+		       _parent_sscg, _div_sscg)
+
+#define DEF_GEN4_OSC(_name, _id, _parent, _div)		\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_OSC, _parent, .div = _div)
+
+#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)	\
+	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
+
+struct rcar_gen4_cpg_pll_config {
+	u8 extal_div;
+	u8 pll1_mult;
+	u8 pll1_div;
+	u8 pll2_mult;
+	u8 pll2_div;
+	u8 pll3_mult;
+	u8 pll3_div;
+	u8 pll5_mult;
+	u8 pll5_div;
+	u8 pll6_mult;
+	u8 pll6_div;
+	u8 osc_prediv;
+};
+
+#define CPG_RPCCKCR	0x874
+
+struct clk *rcar_gen4_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers);
+int rcar_gen4_cpg_init(const struct rcar_gen4_cpg_pll_config *config,
+		       unsigned int clk_extalr, u32 mode);
+
+#endif
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 21f762aa2131..ccde338b9fed 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -57,9 +57,11 @@ static const u16 mstpsr[] = {
 	0x9A0, 0x9A4, 0x9A8, 0x9AC,
 };
 
-static const u16 mstpsr_for_v3u[] = {
+static const u16 mstpsr_for_gen4[] = {
 	0x2E00, 0x2E04, 0x2E08, 0x2E0C, 0x2E10, 0x2E14, 0x2E18, 0x2E1C,
-	0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38,
+	0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38, 0x2E3C,
+	0x2E40, 0x2E44, 0x2E48, 0x2E4C, 0x2E50, 0x2E54, 0x2E58, 0x2E5C,
+	0x2E60, 0x2E64, 0x2E68, 0x2E6C,
 };
 
 /*
@@ -71,9 +73,11 @@ static const u16 smstpcr[] = {
 	0x990, 0x994, 0x998, 0x99C,
 };
 
-static const u16 mstpcr_for_v3u[] = {
+static const u16 mstpcr_for_gen4[] = {
 	0x2D00, 0x2D04, 0x2D08, 0x2D0C, 0x2D10, 0x2D14, 0x2D18, 0x2D1C,
-	0x2D20, 0x2D24, 0x2D28, 0x2D2C, 0x2D30, 0x2D34, 0x2D38,
+	0x2D20, 0x2D24, 0x2D28, 0x2D2C, 0x2D30, 0x2D34, 0x2D38, 0x2D3C,
+	0x2D40, 0x2D44, 0x2D48, 0x2D4C, 0x2D50, 0x2D54, 0x2D58, 0x2D5C,
+	0x2D60, 0x2D64, 0x2D68, 0x2D6C,
 };
 
 /*
@@ -95,9 +99,11 @@ static const u16 srcr[] = {
 	0x920, 0x924, 0x928, 0x92C,
 };
 
-static const u16 srcr_for_v3u[] = {
+static const u16 srcr_for_gen4[] = {
 	0x2C00, 0x2C04, 0x2C08, 0x2C0C, 0x2C10, 0x2C14, 0x2C18, 0x2C1C,
-	0x2C20, 0x2C24, 0x2C28, 0x2C2C, 0x2C30, 0x2C34, 0x2C38,
+	0x2C20, 0x2C24, 0x2C28, 0x2C2C, 0x2C30, 0x2C34, 0x2C38, 0x2C3C,
+	0x2C40, 0x2C44, 0x2C48, 0x2C4C, 0x2C50, 0x2C54, 0x2C58, 0x2C5C,
+	0x2C60, 0x2C64, 0x2C68, 0x2C6C,
 };
 
 /*
@@ -109,9 +115,11 @@ static const u16 srstclr[] = {
 	0x960, 0x964, 0x968, 0x96C,
 };
 
-static const u16 srstclr_for_v3u[] = {
+static const u16 srstclr_for_gen4[] = {
 	0x2C80, 0x2C84, 0x2C88, 0x2C8C, 0x2C90, 0x2C94, 0x2C98, 0x2C9C,
-	0x2CA0, 0x2CA4, 0x2CA8, 0x2CAC, 0x2CB0, 0x2CB4, 0x2CB8,
+	0x2CA0, 0x2CA4, 0x2CA8, 0x2CAC, 0x2CB0, 0x2CB4, 0x2CB8, 0x2CBC,
+	0x2CC0, 0x2CC4, 0x2CC8, 0x2CCC, 0x2CD0, 0x2CD4, 0x2CD8, 0x2CDC,
+	0x2CE0, 0x2CE4, 0x2CE8, 0x2CEC,
 };
 
 /**
@@ -158,7 +166,7 @@ struct cpg_mssr_priv {
 	struct {
 		u32 mask;
 		u32 val;
-	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_v3u)];
+	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_gen4)];
 
 	struct clk *clks[];
 };
@@ -827,6 +835,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r8a779a0-cpg-mssr",
 		.data = &r8a779a0_cpg_mssr_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R8A779F0
+	{
+		.compatible = "renesas,r8a779f0-cpg-mssr",
+		.data = &r8a779f0_cpg_mssr_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
@@ -970,11 +984,11 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->reset_clear_regs = srstclr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 		priv->control_regs = stbcr;
-	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_V3U) {
-		priv->status_regs = mstpsr_for_v3u;
-		priv->control_regs = mstpcr_for_v3u;
-		priv->reset_regs = srcr_for_v3u;
-		priv->reset_clear_regs = srstclr_for_v3u;
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
+		priv->status_regs = mstpsr_for_gen4;
+		priv->control_regs = mstpcr_for_gen4;
+		priv->reset_regs = srcr_for_gen4;
+		priv->reset_clear_regs = srstclr_for_gen4;
 	} else {
 		error = -EINVAL;
 		goto out_err;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 6b2a0ade482e..16810dd4e6ac 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -88,7 +88,7 @@ struct device_node;
 enum clk_reg_layout {
 	CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3 = 0,
 	CLK_REG_LAYOUT_RZ_A,
-	CLK_REG_LAYOUT_RCAR_V3U,
+	CLK_REG_LAYOUT_RCAR_GEN4,
 };
 
     /**
@@ -178,6 +178,7 @@ extern const struct cpg_mssr_info r8a77980_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a779f0_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.25.1

