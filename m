Return-Path: <linux-renesas-soc+bounces-13199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2EA380D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C643F3B5F7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BD4217733;
	Mon, 17 Feb 2025 10:54:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FBD2185B3;
	Mon, 17 Feb 2025 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789696; cv=none; b=KOWtS8MKPsyw9Qh6FOEtPvqhzIoOvLO29Q1jKmiSyomDpECdCDha81oxzM6qjQedzogtH4RccZBdrvfO5eNzLLt5DqDb32s56a4MkJFxZauitI+XW9jqK6cZh4UN/sItYIn2cm3HXQe0U/i/3FJpeeyZEVShTTZIodQIh5hoc6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789696; c=relaxed/simple;
	bh=yfLSsGRCLaq5JG8L+IkUf1zHaiTZfXpc8ugeLDaRO68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbKXbWEPNCL8YelKUFxMkYRpYRgMdyeSkGy7oIiBGR8qFtzgaONx+MSubsymRUJJ6qZ4MxZyQiFQs187WKIVM1cKqttiqldk4dRr4njmCqPy5tzjfUNf7hdopo3KFLNLanHig7f/mRUYaOKps3SWkq1T3j6yf7fKVhk6c8XKc1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 5qJbfFX3R6uQ3IgJUR6zHg==
X-CSE-MsgGUID: nd//RtjiReyx1+sKnb6wCA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Feb 2025 19:54:53 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 54AD0428055D;
	Mon, 17 Feb 2025 19:54:50 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 06/13] clk: renesas: Add support for R9A09G077 SoC
Date: Mon, 17 Feb 2025 11:52:07 +0100
Message-ID: <20250217105354.551788-7-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/T2H has 2 registers blocks at different addresses.

The clock tree has configurable dividers and mux selectors.
Add these new clock types, new register layout type, and
registration code for mux and div in registration callback.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig              |   5 +
 drivers/clk/renesas/Makefile             |   1 +
 drivers/clk/renesas/r9a09g077-cpg-mssr.c | 237 +++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c   |  40 ++++
 drivers/clk/renesas/renesas-cpg-mssr.h   |  23 +++
 5 files changed, 306 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index ff01f5f0ed20..58ea50b0e5b8 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -41,6 +41,7 @@ config CLK_RENESAS
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G057 if ARCH_R9A09G057
+	select CLK_R9A09G077 if ARCH_R9A09G077
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -198,6 +199,10 @@ config CLK_R9A09G057
        bool "RZ/V2H(P) clock support" if COMPILE_TEST
        select CLK_RZV2H
 
+config CLK_R9A09G077
+	bool "RZ/T2H clock support" if COMPILE_TEST
+	select CLK_RZT2H
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 82efaa835ac7..61c95d0e3f7a 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779G0)		+= r8a779g0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779H0)		+= r8a779h0-cpg-mssr.o
+obj-$(CONFIG_CLK_R9A09G077)		+= r9a09g077-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
diff --git a/drivers/clk/renesas/r9a09g077-cpg-mssr.c b/drivers/clk/renesas/r9a09g077-cpg-mssr.c
new file mode 100644
index 000000000000..62a5fb115393
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g077-cpg-mssr.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r9a09g077 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a09g077-cpg-mssr.h>
+#include "renesas-cpg-mssr.h"
+
+#define SCKCR		0x00
+#define SCKCR2		0x04
+#define SCKCR3		0x08
+#define SCKCR4		0x0C
+#define PMSEL		0x10
+#define PMSEL_PLL0	BIT(0)
+#define PMSEL_PLL2	BIT(2)
+#define PMSEL_PLL3	BIT(3)
+#define PLL0EN		BIT(0)
+#define PLL2EN		BIT(0)
+#define PLL3EN		BIT(0)
+#define PLL0MON		0x20
+#define PLL0EN_REG	0x30
+#define PLL0_SSC_CTR	0x34
+#define PLL1MON		0x40
+#define LOCOCR		0x70
+#define HIZCTRLEN	0x80
+#define PLL2MON		0x90
+#define PLL2EN_REG	0xA0
+#define PLL2_SSC_CTR	0xAC
+#define PLL3MON		0xB0
+#define PLL3EN_REG	0xC0
+#define PLL3_VCO_CTR0	0xC4
+#define PLL3_VCO_CTR1	0xC8
+#define PLL4MON		0xD0
+#define PHYSEL		BIT(21)
+
+#define MRCTLA		0x240
+#define MRCTLE		0x250
+#define MRCTLI		0x260
+#define MRCTLM		0x270
+
+#define DDIV_PACK(offset, bitpos, size) \
+		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+
+#define DIVCA55		DDIV_PACK(SCKCR2, 8, 4)
+#define DIVCA55S	DDIV_PACK(SCKCR2, 12, 1)
+#define DIVCR520	DDIV_PACK(SCKCR2, 2, 2)
+#define DIVCR521	DDIV_PACK(SCKCR2, 0, 2)
+#define DIVLCDC		DDIV_PACK(SCKCR3, 20, 3)
+#define DIVCKIO		DDIV_PACK(SCKCR, 16, 3)
+#define DIVETHPHY	DDIV_PACK(SCKCR, 21, 1)
+#define DIVCANFD	DDIV_PACK(SCKCR, 20, 1)
+#define DIVSPI0		DDIV_PACK(SCKCR3, 0, 2)
+#define DIVSPI1		DDIV_PACK(SCKCR3, 2, 2)
+#define DIVSPI2		DDIV_PACK(SCKCR3, 4, 2)
+#define DIVSPI3		DDIV_PACK(SCKCR2, 16, 2)
+
+#define SEL_PLL_PACK(offset, bitpos, size) \
+	(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+
+#define	SEL_PLL		SEL_PLL_PACK(SCKCR, 22, 1)
+
+#define GET_SHIFT(val)		FIELD_GET(GENMASK(19, 12), val)
+#define GET_WIDTH(val)		FIELD_GET(GENMASK(11, 8), val)
+#define GET_REG_OFFSET(val)	FIELD_GET(GENMASK(31, 20), val)
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_LOCO,
+
+	/* Internal Core Clocks */
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL3,
+	CLK_PLL4,
+	CLK_SEL_PLL0,
+	CLK_SEL_CLK_PLL0,
+	CLK_SEL_PLL1,
+	CLK_SEL_CLK_PLL1,
+	CLK_SEL_PLL2,
+	CLK_SEL_CLK_PLL2,
+	CLK_SEL_PLL4,
+	CLK_SEL_CLK_PLL4,
+	CLK_SEL_CLK_SRC,
+	CLK_SEL_EXTAL,
+	CLK_SEL_LOCO,
+	CLK_PLL3_INPUT,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct clk_div_table dtable_1_2[] = {
+	{0, 2},
+	{15, 1},
+	{0, 0},
+};
+
+/* Mux clock tables */
+static const char * const sel_clk_pll0[] = { ".sel_loco", ".sel_pll0" };
+static const char * const sel_clk_pll1[] = { ".sel_loco", ".sel_pll1" };
+static const char * const sel_clk_pll4[] = { ".sel_loco", ".sel_pll4" };
+
+static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+	DEF_INPUT("loco", CLK_LOCO),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 48, 1),
+	DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 40, 1),
+	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 96, 1),
+	DEF_FIXED(".sel_pll0", CLK_SEL_PLL0, CLK_PLL0, 1, 1),
+	DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
+		sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), 0, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".sel_pll1", CLK_SEL_PLL1, CLK_PLL1, 1, 1),
+	DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
+		sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), 0, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".sel_pll4", CLK_SEL_PLL4, CLK_PLL4, 1, 1),
+	DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
+		sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), 0, CLK_MUX_READ_ONLY),
+
+	/* Core output clk */
+	DEF_DIV("CA55", R9A09G077_CA55, CLK_SEL_CLK_PLL0, DIVCA55,
+		dtable_1_2, CLK_DIVIDER_HIWORD_MASK, 1),
+	DEF_FIXED("PCLKM", R9A09G077_PCLKM, CLK_SEL_CLK_PLL1, 1, 8),
+	DEF_FIXED("PCLKGPTL", R9A09G077_PCLKGPTL, CLK_SEL_CLK_PLL1, 1, 2),
+};
+
+static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
+	DEF_MOD("sci0", 108, R9A09G077_PCLKM),
+};
+
+static struct clk * __init
+r9a09g077_cpg_div_clk_register(struct device *dev,
+			       const struct cpg_core_clk *core,
+			       void __iomem *base,
+			       struct cpg_mssr_pub *pub)
+{
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+
+	parent = pub->clks[core->parent];
+
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+
+	if (core->dtable)
+		clk_hw = clk_hw_register_divider_table(dev, core->name,
+						       parent_name, 0,
+						       base + GET_REG_OFFSET(core->conf),
+						       GET_SHIFT(core->conf),
+						       GET_WIDTH(core->conf),
+						       core->flag,
+						       core->dtable,
+						       &pub->rmw_lock);
+	else
+		clk_hw = clk_hw_register_divider(dev, core->name,
+						 parent_name, 0,
+						 base + GET_REG_OFFSET(core->conf),
+						 GET_SHIFT(core->conf),
+						 GET_WIDTH(core->conf),
+						 core->flag, &pub->rmw_lock);
+
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+
+}
+
+static struct clk * __init
+r9a09g077_cpg_mux_clk_register(struct device *dev,
+			       const struct cpg_core_clk *core,
+			       void __iomem *base,
+			       struct cpg_mssr_pub *pub)
+{
+	struct clk_hw *clk_hw;
+
+	clk_hw = devm_clk_hw_register_mux(dev, core->name,
+					  core->parent_names, core->num_parents,
+					  core->flag,
+					  base + GET_REG_OFFSET(core->conf),
+					  GET_SHIFT(core->conf),
+					  GET_WIDTH(core->conf),
+					  core->mux_flags, &pub->rmw_lock);
+	return clk_hw->clk;
+}
+
+static struct clk * __init
+	r9a09g077_cpg_clk_register(struct device *dev,
+				   const struct cpg_core_clk *core,
+				   const struct cpg_mssr_info *info,
+				   struct cpg_mssr_pub *pub)
+{
+	void __iomem *base = core->sel_base ? pub->base1 : pub->base0;
+
+	switch (core->type) {
+	case CLK_TYPE_DIV:
+		return r9a09g077_cpg_div_clk_register(dev, core, base, pub);
+	case CLK_TYPE_MUX:
+		return r9a09g077_cpg_mux_clk_register(dev, core, base, pub);
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
+	/* Core Clocks */
+	.core_clks = r9a09g077_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g077_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r9a09g077_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g077_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	.reg_layout = CLK_REG_LAYOUT_RZ_T2H,
+	.cpg_clk_register = r9a09g077_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7d5fba3aef19..2f5aa796b0c6 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -79,6 +79,15 @@ static const u16 mstpcr_for_gen4[] = {
 	0x2D60, 0x2D64, 0x2D68, 0x2D6C, 0x2D70, 0x2D74,
 };
 
+/* Module Stop Control Register (RZ/T2H)
+ * RZ/T2H has 2 registers blocks. To differentiate them,
+ * 0x1000 is added to offsets of block 2
+ */
+static const u16 mstpcr_for_rzt2h[] = {
+	0x0300, 0x0304, 0x0308, 0x030C, 0x0310, 0x1318, 0x1320, 0x0324,
+	0x0328, 0x032C, 0x0303, 0x1334,
+};
+
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -189,6 +198,14 @@ struct mstp_clock {
 
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+static void *cpg_rzt2h_addr_from_offset(struct clk_hw *hw, u16 offset)
+{
+	struct mstp_clock *clock = to_mstp_clock(hw);
+	struct cpg_mssr_priv *priv = clock->priv;
+
+	return offset + (offset > 0x1000 ? priv->pub.base1 - 0x1000 : priv->pub.base0);
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -260,6 +277,12 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		value = readb(priv->pub.base0 + priv->control_regs[reg]);
+	else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		void __iomem *addr =
+			cpg_rzt2h_addr_from_offset(hw,
+						   priv->control_regs[reg]);
+		value = readw(addr);
+	}
 	else
 		value = readl(priv->pub.base0 + priv->status_regs[reg]);
 
@@ -875,6 +898,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r8a779h0-cpg-mssr",
 		.data = &r8a779h0_cpg_mssr_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G077
+	{
+		.compatible = "renesas,r9a09g077-cpg-mssr",
+		.data = &r9a09g077_cpg_mssr_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
@@ -1072,6 +1101,13 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		error = -ENOMEM;
 		goto out_err;
 	}
+	if (info->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		priv->pub.base1 = of_iomap(np, 1);
+		if (!priv->pub.base1) {
+			error = -ENOMEM;
+			goto out_err;
+		}
+	}
 
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
@@ -1085,6 +1121,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->reset_clear_regs = srstclr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 		priv->control_regs = stbcr;
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		priv->control_regs = mstpcr_for_rzt2h;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
 		priv->status_regs = mstpsr_for_gen4;
 		priv->control_regs = mstpcr_for_gen4;
@@ -1115,6 +1153,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 out_err:
 	if (priv->pub.base0)
 		iounmap(priv->pub.base0);
+	if (priv->pub.base1)
+		iounmap(priv->pub.base1);
 	kfree(priv);
 
 	return error;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index adc8948e6af4..a6e4a96ba036 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -22,6 +22,8 @@
 struct cpg_core_clk {
 	/* Common */
 	const char *name;
+	const char * const *parent_names;
+	const struct clk_div_table *dtable;
 	unsigned int id;
 	unsigned int type;
 	/* Depending on type */
@@ -29,18 +31,26 @@ struct cpg_core_clk {
 	unsigned int div;
 	unsigned int mult;
 	unsigned int offset;
+	unsigned int conf;
+	int flag;
+	int mux_flags;
+	int num_parents;
+	int sel_base;
+};
 
 /**
  * struct cpg_mssr_pub - Private data shared with
  * device-specific clk registration code
  *
  * @base0: CPG/MSSR register block base0 address
+ * @base1: CPG/MSSR register block base1 address
  * @rmw_lock: protects RMW register accesses
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @clks: pointer to clocks
  */
 struct cpg_mssr_pub {
 	void __iomem *base0;
+	void __iomem *base1;
 	struct raw_notifier_head notifiers;
 	spinlock_t rmw_lock;
 	struct clk **clks;
@@ -53,6 +63,8 @@ enum clk_types {
 	CLK_TYPE_DIV6P1,	/* DIV6 Clock with 1 parent clock */
 	CLK_TYPE_DIV6_RO,	/* DIV6 Clock read only with extra divisor */
 	CLK_TYPE_FR,		/* Fixed Rate Clock */
+	CLK_TYPE_DIV,		/* Clock with divider */
+	CLK_TYPE_MUX,		/* Clock with clock source selector */
 
 	/* Custom definitions start here */
 	CLK_TYPE_CUSTOM,
@@ -73,6 +85,15 @@ enum clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_DIV6_RO, _parent, .offset = _offset, .div = _div, .mult = 1)
 #define DEF_RATE(_name, _id, _rate)	\
 	DEF_TYPE(_name, _id, CLK_TYPE_FR, .mult = _rate)
+#define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag, _sel_base) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, .flag = _flag, .sel_base = _sel_base)
+#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
+		_mux_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, .num_parents = _num_parents, \
+		 .flag = _flag, .mux_flags = _mux_flags)
+
 
     /*
      * Definitions of Module Clocks
@@ -106,6 +127,7 @@ enum clk_reg_layout {
 	CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3 = 0,
 	CLK_REG_LAYOUT_RZ_A,
 	CLK_REG_LAYOUT_RCAR_GEN4,
+	CLK_REG_LAYOUT_RZ_T2H,
 };
 
     /**
@@ -198,6 +220,7 @@ extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779f0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779g0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779h0_cpg_mssr_info;
+extern const struct cpg_mssr_info r9a09g077_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.43.0


