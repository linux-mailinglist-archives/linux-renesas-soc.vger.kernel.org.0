Return-Path: <linux-renesas-soc+bounces-15349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C9A7B16D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 23:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3211217F14B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 21:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BF41EF09A;
	Thu,  3 Apr 2025 21:30:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3C31EE001;
	Thu,  3 Apr 2025 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715821; cv=none; b=NspXJ1m8Hit2kilFe7YcaD5VbdC+gMu0M0hunFodXql5tKRT2WtwiE/BZFF8kBw4BXrMyMGwrFqYtAbU4/FYOP6rkTw9yLePTZJIHRfztO4Op2on2KlBui4dxPQWxK4saZjgSAGfb50a+hoLQHh7koWRsnGq0JZVL86odnjsJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715821; c=relaxed/simple;
	bh=zVzYl1Q3PUSTiW19UhO0JlXdOGz2De+DsydMCj1bDCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dk+LLt3iMY5s+yMZTs4rZezrVezyjnfHQ0QBE6Y/q/UPv/BC0Yd1d1xHP7kFgpti3Kttx71xYGEvJJK6rwj9GmHzoUkYbxCYIW3QCzAX8ymGhana3m/Z6Ztl0bZGl8yhYkyQpV0k6UWl7XKDqdj4/BPss1UuXuJ9Ka9i0H50gAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: nkVGn1WwTJC1p2d3bLPGUA==
X-CSE-MsgGUID: auurKormSwCM2/sj0HB04w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Apr 2025 06:30:16 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 91D4440B5151;
	Fri,  4 Apr 2025 06:30:13 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Date: Thu,  3 Apr 2025 23:29:08 +0200
Message-ID: <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v6->v7: none
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4:
   - Add missing #include <bitfield.h> (reported by bot)
   - Add missing __iomem address space in cpg_rzt2h_addr_from_offset and
     return type (reported by bot)
   - fixed clocks: inverted 'mult' and 'div' parameters when using 
     the DEF_FIXED macro
---
 drivers/clk/renesas/Kconfig              |   5 +
 drivers/clk/renesas/Makefile             |   1 +
 drivers/clk/renesas/r9a09g077-cpg-mssr.c | 238 +++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c   |  56 +++++-
 drivers/clk/renesas/renesas-cpg-mssr.h   |  23 +++
 5 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5a4bc3f94d49..3f9c4deb4c25 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -42,6 +42,7 @@ config CLK_RENESAS
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G047 if ARCH_R9A09G047
 	select CLK_R9A09G057 if ARCH_R9A09G057
+	select CLK_R9A09G077 if ARCH_R9A09G077
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -203,6 +204,10 @@ config CLK_R9A09G057
        bool "RZ/V2H(P) clock support" if COMPILE_TEST
        select CLK_RZV2H
 
+config CLK_R9A09G077
+	bool "RZ/T2H clock support" if COMPILE_TEST
+	select CLK_RENESAS_CPG_MSSR
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 2d6e746939c4..3989515dfec3 100644
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
index 000000000000..b67dbf5d59d8
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g077-cpg-mssr.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r9a09g077 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
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
+#define SEL_PLL		SEL_PLL_PACK(SCKCR, 22, 1)
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
+	DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 1, 48),
+	DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 1, 40),
+	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 1, 96),
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
+	DEF_FIXED("PCLKM", R9A09G077_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
+	DEF_FIXED("PCLKGPTL", R9A09G077_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
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
+r9a09g077_cpg_clk_register(struct device *dev,
+			   const struct cpg_core_clk *core,
+			   const struct cpg_mssr_info *info,
+			   struct cpg_mssr_pub *pub)
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
index 4bdfa4f65ab4..123bc1558e53 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -79,6 +79,27 @@ static const u16 mstpcr_for_gen4[] = {
 	0x2D60, 0x2D64, 0x2D68, 0x2D6C, 0x2D70, 0x2D74,
 };
 
+/*
+ * Module Stop Control Register (RZ/T2H)
+ * RZ/T2H has 2 registers blocks,
+ * Bit 12 is used to differentiate them
+ */
+
+#define RZT2H_MSTPCR_BLOCK_SHIFT	12
+#define RZT2H_MSTPCR_OFFSET_MASK	GENMASK(11, 0)
+#define RZT2H_MSTPCR(block, offset)	(((block) << RZT2H_MSTPCR_BLOCK_SHIFT) & \
+					((offset) & RZT2H_MSTPCR_OFFSET_MASK))
+
+#define RZT2H_MSTPCR_BLOCK(x)		((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
+#define RZT2H_MSTPCR_OFFSET(x)		((x) & RZT2H_MSTPCR_OFFSET_MASK)
+
+static const u16 mstpcr_for_rzt2h[] = {
+	RZT2H_MSTPCR(0, 0x300), RZT2H_MSTPCR(0, 0x304), RZT2H_MSTPCR(0, 0x308),
+	RZT2H_MSTPCR(0, 0x30c),	RZT2H_MSTPCR(0, 0x310), RZT2H_MSTPCR(1, 0x318),
+	RZT2H_MSTPCR(1, 0x320), RZT2H_MSTPCR(0, 0x324), RZT2H_MSTPCR(0, 0x328),
+	RZT2H_MSTPCR(0, 0x32c), RZT2H_MSTPCR(0, 0x330), RZT2H_MSTPCR(1, 0x334),
+};
+
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -188,6 +209,15 @@ struct mstp_clock {
 
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+static void __iomem *cpg_rzt2h_addr_from_offset(struct clk_hw *hw, u16 offset)
+{
+	struct mstp_clock *clock = to_mstp_clock(hw);
+	struct cpg_mssr_priv *priv = clock->priv;
+	void __iomem *base = RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
+
+	return base + RZT2H_MSTPCR_OFFSET(offset);
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -227,7 +257,8 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 
-	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
+	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
+		priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
 		return 0;
 
 	error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
@@ -258,6 +289,12 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 
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
 
@@ -868,6 +905,12 @@ static const struct of_device_id cpg_mssr_match[] = {
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
@@ -1065,6 +1108,13 @@ static int __init cpg_mssr_common_init(struct device *dev,
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
@@ -1078,6 +1128,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->reset_clear_regs = srstclr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 		priv->control_regs = stbcr;
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		priv->control_regs = mstpcr_for_rzt2h;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
 		priv->status_regs = mstpsr_for_gen4;
 		priv->control_regs = mstpcr_for_gen4;
@@ -1108,6 +1160,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 out_err:
 	if (priv->pub.base0)
 		iounmap(priv->pub.base0);
+	if (priv->pub.base1)
+		iounmap(priv->pub.base1);
 	kfree(priv);
 
 	return error;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 16337c5ed23e..ccab4c1b216a 100644
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
@@ -197,6 +219,7 @@ extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779f0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779g0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779h0_cpg_mssr_info;
+extern const struct cpg_mssr_info r9a09g077_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.43.0


