Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECE0265AAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 09:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgIKHoJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 03:44:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16957 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725616AbgIKHoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:44:05 -0400
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; 
   d="scan'208";a="57016561"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Sep 2020 16:44:03 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A0BCA41DEF06;
        Fri, 11 Sep 2020 16:44:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 3/4] clk: renesas: cpg-mssr: Add support for R-Car V3U
Date:   Fri, 11 Sep 2020 16:43:51 +0900
Message-Id: <1599810232-29035-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial support for R-Car V3U (r8a779a0), including core, module
clocks and register access, because register specification differs
from R-Car Gen2/3.

Inspired by patches in the BSP by LUU HOAI.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 276 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |  33 +++-
 drivers/clk/renesas/renesas-cpg-mssr.h  |   2 +
 5 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r8a779a0-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 28e8730..37d59c2 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -30,6 +30,7 @@ config CLK_RENESAS
 	select CLK_R8A77980 if ARCH_R8A77980
 	select CLK_R8A77990 if ARCH_R8A77990
 	select CLK_R8A77995 if ARCH_R8A77995
+	select CLK_R8A779A0 if ARCH_R8A779A0
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_SH73A0 if ARCH_SH73A0
 
@@ -145,6 +146,10 @@ config CLK_R8A77995
 	bool "R-Car D3 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A779A0
+	bool "R-Car V3U clock support" if COMPILE_TEST
+	select CLK_RENESAS_CPG_MSSR
+
 config CLK_R9A06G032
 	bool "Renesas R9A06G032 clock driver"
 	help
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index c7c03ab..c803912 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_CLK_R8A77970)		+= r8a77970-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77980)		+= r8a77980-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77990)		+= r8a77990-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
new file mode 100644
index 0000000..17ebbac
--- /dev/null
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a779a0 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ *
+ * Based on r8a7795-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ * Copyright (C) 2015 Renesas Electronics Corp.
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
+#include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen3-cpg.h"
+
+enum rcar_r8a779a0_clk_types {
+	CLK_TYPE_R8A779A0_MAIN = CLK_TYPE_CUSTOM,
+	CLK_TYPE_R8A779A0_PLL1,
+	CLK_TYPE_R8A779A0_PLL2X_3X,	/* PLL[23][01] */
+	CLK_TYPE_R8A779A0_PLL5,
+	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
+	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
+};
+
+struct rcar_r8a779a0_cpg_pll_config {
+	u8 extal_div;
+	u8 pll1_mult;
+	u8 pll1_div;
+	u8 pll5_mult;
+	u8 pll5_div;
+	u8 osc_prediv;
+};
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A779A0_CLK_OSC,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL1,
+	CLK_PLL20,
+	CLK_PLL21,
+	CLK_PLL30,
+	CLK_PLL31,
+	CLK_PLL5,
+	CLK_PLL1_DIV2,
+	CLK_PLL20_DIV2,
+	CLK_PLL21_DIV2,
+	CLK_PLL30_DIV2,
+	CLK_PLL31_DIV2,
+	CLK_PLL5_DIV2,
+	CLK_PLL5_DIV4,
+	CLK_S1,
+	CLK_S2,
+	CLK_S3,
+	CLK_SDSRC,
+	CLK_RPCSRC,
+	CLK_OCO,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+#define DEF_PLL(_name, _id, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
+		 .offset = _offset)
+
+static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",  CLK_EXTAL),
+	DEF_INPUT("extalr", CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_R8A779A0_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_R8A779A0_PLL1, CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_R8A779A0_PLL5, CLK_MAIN),
+	DEF_PLL(".pll20", CLK_PLL20,	0x0834),
+	DEF_PLL(".pll21", CLK_PLL21,	0x0838),
+	DEF_PLL(".pll30", CLK_PLL30,	0x083c),
+	DEF_PLL(".pll31", CLK_PLL31,	0x0840),
+
+	DEF_FIXED(".pll1_div2",		CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
+	DEF_FIXED(".pll20_div2",	CLK_PLL20_DIV2,	CLK_PLL20,	2, 1),
+	DEF_FIXED(".pll21_div2",	CLK_PLL21_DIV2,	CLK_PLL21,	2, 1),
+	DEF_FIXED(".pll30_div2",	CLK_PLL30_DIV2,	CLK_PLL30,	2, 1),
+	DEF_FIXED(".pll31_div2",	CLK_PLL31_DIV2,	CLK_PLL31,	2, 1),
+	DEF_FIXED(".pll5_div2",		CLK_PLL5_DIV2,	CLK_PLL5,	2, 1),
+	DEF_FIXED(".pll5_div4",		CLK_PLL5_DIV4,	CLK_PLL5_DIV2,	2, 1),
+	DEF_FIXED(".s1",		CLK_S1,		CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".s3",		CLK_S3,		CLK_PLL1_DIV2,	4, 1),
+	DEF_RATE(".oco",		CLK_OCO,	32768),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
+	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
+	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
+	DEF_FIXED("s1d4",	R8A779A0_CLK_S1D4,	CLK_S1,		4, 1),
+	DEF_FIXED("s1d8",	R8A779A0_CLK_S1D8,	CLK_S1,		8, 1),
+	DEF_FIXED("s1d12",	R8A779A0_CLK_S1D12,	CLK_S1,		12, 1),
+	DEF_FIXED("s3d1",	R8A779A0_CLK_S3D1,	CLK_S3,		1, 1),
+	DEF_FIXED("s3d2",	R8A779A0_CLK_S3D2,	CLK_S3,		2, 1),
+	DEF_FIXED("s3d4",	R8A779A0_CLK_S3D4,	CLK_S3,		4, 1),
+	DEF_FIXED("zs",		R8A779A0_CLK_ZS,	CLK_PLL1_DIV2,	4, 1),
+	DEF_FIXED("zt",		R8A779A0_CLK_ZT,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED("ztr",	R8A779A0_CLK_ZTR,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED("zr",		R8A779A0_CLK_ZR,	CLK_PLL1_DIV2,	1, 1),
+	DEF_FIXED("dsi",	R8A779A0_CLK_DSI,	CLK_PLL5_DIV4,	1, 1),
+	DEF_FIXED("cnndsp",	R8A779A0_CLK_CNNDSP,	CLK_PLL5_DIV4,	1, 1),
+	DEF_FIXED("vip",	R8A779A0_CLK_VIP,	CLK_PLL5,	5, 1),
+	DEF_FIXED("adgh",	R8A779A0_CLK_ADGH,	CLK_PLL5_DIV4,	1, 1),
+	DEF_FIXED("icu",	R8A779A0_CLK_ICU,	CLK_PLL5_DIV4,	2, 1),
+	DEF_FIXED("icud2",	R8A779A0_CLK_ICUD2,	CLK_PLL5_DIV4,	4, 1),
+	DEF_FIXED("vcbus",	R8A779A0_CLK_VCBUS,	CLK_PLL5_DIV4,	1, 1),
+	DEF_FIXED("cbfusa",	R8A779A0_CLK_CBFUSA,	CLK_MAIN,	2, 1),
+
+	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
+	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
+	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
+
+	DEF_GEN3_OSC("osc",	R8A779A0_CLK_OSC,	CLK_EXTAL,	8),
+	DEF_GEN3_MDSEL("r",	R8A779A0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
+};
+
+static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
+	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
+	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
+	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
+};
+
+static spinlock_t cpg_lock;
+
+static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
+static unsigned int cpg_clk_extalr __initdata;
+static u32 cpg_mode __initdata;
+
+struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	const struct clk *parent;
+	unsigned int mult = 1;
+	unsigned int div = 1;
+	u32 value;
+
+	parent = clks[core->parent & 0xffff];	/* some types use high bits */
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	switch (core->type) {
+	case CLK_TYPE_R8A779A0_MAIN:
+		div = cpg_pll_config->extal_div;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL1:
+		mult = cpg_pll_config->pll1_mult;
+		div = cpg_pll_config->pll1_div;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL2X_3X:
+		value = readl(base + core->offset);
+		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		break;
+
+	case CLK_TYPE_R8A779A0_PLL5:
+		mult = cpg_pll_config->pll5_mult;
+		div = cpg_pll_config->pll5_div;
+		break;
+
+	case CLK_TYPE_R8A779A0_MDSEL:
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
+	case CLK_TYPE_R8A779A0_OSC:
+		/*
+		 * Clock combining OSC EXTAL predivider and a fixed divider
+		 */
+		div = cpg_pll_config->osc_prediv * core->div;
+		break;
+
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	return clk_register_fixed_factor(NULL, core->name,
+					 __clk_get_name(parent), 0, mult, div);
+}
+
+/*
+ * CPG Clock Data
+ */
+/*
+ *   MD	 EXTAL		PLL1	PLL20	PLL30	PLL4	PLL5	OSC
+ * 14 13 (MHz)			   21	   31
+ * --------------------------------------------------------
+ * 0  0	 16.66 x 1	x128	x216	x128	x144	x192	/16
+ * 0  1	 20    x 1	x106	x180	x106	x120	x160	/19
+ * 1  0	 Prohibited setting
+ * 1  1	 33.33 / 2	x128	x216	x128	x144	x192	/32
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
+					 (((md) & BIT(13)) >> 13))
+
+static const struct rcar_r8a779a0_cpg_pll_config cpg_pll_configs[4] = {
+	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
+	{ 1,		128,	1,	192,	1,	16,	},
+	{ 1,		106,	1,	160,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	},
+	{ 2,		128,	1,	192,	1,	32,	},
+};
+
+static int __init r8a779a0_cpg_mssr_init(struct device *dev)
+{
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	cpg_clk_extalr = CLK_EXTALR;
+	spin_lock_init(&cpg_lock);
+
+	return 0;
+}
+
+const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a779a0_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a779a0_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a779a0_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a779a0_mod_clks),
+	.num_hw_mod_clks = 15 * 32,
+
+	/* Callbacks */
+	.init = r8a779a0_cpg_mssr_init,
+	.cpg_clk_register = rcar_r8a779a0_cpg_clk_register,
+
+	.reg_layout = CLK_REG_LAYOUT_RCAR_V3U,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index d74223e..bb4f5f8 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -57,6 +57,11 @@ static const u16 mstpsr[] = {
 	0x9A0, 0x9A4, 0x9A8, 0x9AC,
 };
 
+static const u16 mstpsr_for_v3u[] = {
+	0x2E00, 0x2E04, 0x2E08, 0x2E0C, 0x2E10, 0x2E14, 0x2E18, 0x2E1C,
+	0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38,
+};
+
 /*
  * System Module Stop Control Register offsets
  */
@@ -66,6 +71,11 @@ static const u16 smstpcr[] = {
 	0x990, 0x994, 0x998, 0x99C,
 };
 
+static const u16 mstpcr_for_v3u[] = {
+	0x2D00, 0x2D04, 0x2D08, 0x2D0C, 0x2D10, 0x2D14, 0x2D18, 0x2D1C,
+	0x2D20, 0x2D24, 0x2D28, 0x2D2C, 0x2D30, 0x2D34, 0x2D38,
+};
+
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -85,6 +95,11 @@ static const u16 srcr[] = {
 	0x920, 0x924, 0x928, 0x92C,
 };
 
+static const u16 srcr_for_v3u[] = {
+	0xC00, 0xC04, 0xC08, 0xC0C, 0xC10, 0xC14, 0xC18, 0xC1C,
+	0xC20, 0xC24, 0xC28, 0xC2C, 0xC30, 0xC34, 0xC38,
+};
+
 /* Realtime Module Stop Control Register offsets */
 #define RMSTPCR(i)	(smstpcr[i] - 0x20)
 
@@ -98,6 +113,11 @@ static const u16 srstclr[] = {
 	0x960, 0x964, 0x968, 0x96C,
 };
 
+static const u16 srstclr_for_v3u[] = {
+	0xC80, 0xC84, 0xC88, 0xC8C, 0xC90, 0xC94, 0xC98, 0xC9C,
+	0xCA0, 0xCA4, 0xCA8, 0xCAC, 0xCB0, 0xCB4, 0xCB8,
+};
+
 /**
  * Clock Pulse Generator / Module Standby and Software Reset Private Data
  *
@@ -141,7 +161,7 @@ struct cpg_mssr_priv {
 	struct {
 		u32 mask;
 		u32 val;
-	} smstpcr_saved[ARRAY_SIZE(smstpcr)];
+	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_v3u)];
 
 	struct clk *clks[];
 };
@@ -805,6 +825,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a77995_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A779A0
+	{
+		.compatible = "renesas,r8a779a0-cpg-mssr",
+		.data = &r8a779a0_cpg_mssr_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
@@ -947,6 +973,11 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->reset_clear_regs = srstclr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 		priv->control_regs = stbcr;
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_V3U) {
+		priv->status_regs = mstpsr_for_v3u;
+		priv->control_regs = mstpcr_for_v3u;
+		priv->reset_regs = srcr_for_v3u;
+		priv->reset_clear_regs = srstclr_for_v3u;
 	} else {
 		error = -EINVAL;
 		goto out_err;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index f369b06..6b2a0ade 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -88,6 +88,7 @@ struct device_node;
 enum clk_reg_layout {
 	CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3 = 0,
 	CLK_REG_LAYOUT_RZ_A,
+	CLK_REG_LAYOUT_RCAR_V3U,
 };
 
     /**
@@ -176,6 +177,7 @@ extern const struct cpg_mssr_info r8a77970_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77980_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.7.4

