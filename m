Return-Path: <linux-renesas-soc+bounces-17446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C9AC24F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 16:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 298B7A42EB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4A7296D1B;
	Fri, 23 May 2025 14:24:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E66129553F;
	Fri, 23 May 2025 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010287; cv=none; b=rtbh5QwYZknQYF6bw41zIdstGU9txtdPcNlpj637Oo7dZR84Ez5Qn2fbk8PFlpiibzKzmaz83HuvJsD41tL00ok4XVOTQen60WJzD6VTCxGg9Lc+RZH5UTe7VaJBMKaYfs/26aeAJNZU+rM1/CG/14SXiXLAI1v3B3IYdfBzrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010287; c=relaxed/simple;
	bh=7/b0pZEuZ6yUsT6Bplu4Uf3/5vVJzApjV/5dQBjYkzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRMjWLdufLRBL/ZTBBWLU7MKmC8+syRhufh/TluB+iE8tqchcq4J1sL+0pJQ7mEO7mtcweWihdwXRYggB7/C7QaEvPSox9begxXI69i/GbC+B6W973a7Etvmr+KIlNNhEwlvIKyc75P4ttS1k7uN3jhBtxD8YZ5SShAtNxJjtBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: SEkC/6JkQFS//bhjODpKqA==
X-CSE-MsgGUID: z3YccjNgThekXtpjz71luw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 May 2025 23:24:43 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 719AD4017D95;
	Fri, 23 May 2025 23:24:40 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 05/10] clk: renesas: Add support for R9A09G077 SoC
Date: Fri, 23 May 2025 16:24:09 +0200
Message-ID: <20250523142417.2840797-6-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/T2H has 2 register blocks at different addresses.

The clock tree has configurable dividers and mux selectors.
Add these new clock types, new register layout type, and
registration code for mux and div in registration callback.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v9->v10:
 - Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Changes v8->v9:
 - Renamed r9a09g077-cpg-mssr.c to r9a09g077-cpg.c
 - Makefile: keep alphabetical order
 - Fixed DIVSCI0ASYNC
 - Removed unused CLK_MAIN
 - Simplified the clock tree, removing CLK_SEL_PLL0, CLK_SEL_PLL1 & CLK_SEL_PLL4
 - Renamed loco to .loco
 - Fixed the register bits in dtable_24_25_30_32, re-ordered the table
 - DEF_DIV & DEF_MUX: set flag to zero always (might change in a future commit)
 - Do not set CLK_DIVIDER_HIWORD_MASK
 - Uses '8' as value of removed R9A09G077_PCLK_SCI0 definition
 - Fixed addr calculation with RZT2H_REG_OFFSET in r9a09g077_cpg_clk_register
 - struct cpg_core_clk: moved union in specific section
 - Renamed cpg_read_rzt2h_mstp to cpg_rzt2h_mstp_read
 - Renamed cpg_write_rzt2h_mstp to cpg_rzt2h_mstp_write
Changes v7->v8:
 - Makefile: keep ordered list
 - r9a09g077-cpg-mssr.c: use high bit instead of sel_base,
   same macro for DIV and MUX
 - removed unused clocks
 - CLK_LOCO is internal with a DEF_RATE definition
 - added CLK_PLL4D1 & CLK_SCI0ASYNC
 - added per-CA55 clocks
 - added missing error check in r9a09g077_cpg_mux_clk_register
 - fixed num_hw_mod_clks to 14
 - added missing 2 holes in mstpcr_for_rzt2h
 - renamed cpg_read_rzt2h_mstp_from_offset to cpg_read_rzt2h_mstp,
   directly reads at calculated address
 - added cpg_write_rzt2h_mstp and call in cpg_mstp_clock_endisable
 - do not register reset controller in case of CLK_REG_LAYOUT_RZ_T2H
 - moved CLK_DIV & CLK_MUX definitions to RZT2H specifics
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
 drivers/clk/renesas/Kconfig            |   5 +
 drivers/clk/renesas/Makefile           |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c    | 243 +++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |  89 ++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.h |  12 ++
 5 files changed, 348 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 50c20119d12a..45f9ae5b6ef1 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -43,6 +43,7 @@ config CLK_RENESAS
 	select CLK_R9A09G047 if ARCH_R9A09G047
 	select CLK_R9A09G056 if ARCH_R9A09G056
 	select CLK_R9A09G057 if ARCH_R9A09G057
+	select CLK_R9A09G077 if ARCH_R9A09G077
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -208,6 +209,10 @@ config CLK_R9A09G057
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
index f9075bca6e95..d8d894a15d24 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
 obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
+obj-$(CONFIG_CLK_R9A09G077)		+= r9a09g077-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
new file mode 100644
index 000000000000..ba084514127a
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -0,0 +1,243 @@
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
+#define RZT2H_REG_BLOCK_SHIFT	11
+#define RZT2H_REG_OFFSET_MASK	GENMASK(10, 0)
+#define RZT2H_REG_CONF(block, offset)	(((block) << RZT2H_REG_BLOCK_SHIFT) | \
+					((offset) & RZT2H_REG_OFFSET_MASK))
+
+#define RZT2H_REG_BLOCK(x)		((x) >> RZT2H_REG_BLOCK_SHIFT)
+#define RZT2H_REG_OFFSET(x)		((x) & RZT2H_REG_OFFSET_MASK)
+
+#define SCKCR		RZT2H_REG_CONF(0, 0x00)
+#define SCKCR2		RZT2H_REG_CONF(1, 0x04)
+#define SCKCR3		RZT2H_REG_CONF(0, 0x08)
+
+#define OFFSET_MASK	GENMASK(31, 20)
+#define SHIFT_MASK	GENMASK(19, 12)
+#define WIDTH_MASK	GENMASK(11, 8)
+
+#define CONF_PACK(offset, shift, width)  \
+	(FIELD_PREP_CONST(OFFSET_MASK, (offset)) | \
+	FIELD_PREP_CONST(SHIFT_MASK, (shift)) | \
+	FIELD_PREP_CONST(WIDTH_MASK, (width)))
+
+#define GET_SHIFT(val)         FIELD_GET(SHIFT_MASK, val)
+#define GET_WIDTH(val)         FIELD_GET(WIDTH_MASK, val)
+#define GET_REG_OFFSET(val)    FIELD_GET(OFFSET_MASK, val)
+
+#define DIVCA55C0	CONF_PACK(SCKCR2, 8, 1)
+#define DIVCA55C1	CONF_PACK(SCKCR2, 9, 1)
+#define DIVCA55C2	CONF_PACK(SCKCR2, 10, 1)
+#define DIVCA55C3	CONF_PACK(SCKCR2, 11, 1)
+#define DIVCA55S	CONF_PACK(SCKCR2, 12, 1)
+
+#define DIVSCI0ASYNC	CONF_PACK(SCKCR3, 6, 2)
+
+#define SEL_PLL		CONF_PACK(SCKCR, 22, 1)
+
+
+enum rzt2h_clk_types {
+	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
+	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
+};
+
+#define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, .flag = 0)
+#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, \
+		_mux_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, .num_parents = _num_parents, \
+		 .flag = 0, .mux_flags = _mux_flags)
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G077_CLK_PCLKM,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_LOCO,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL4,
+	CLK_SEL_CLK_PLL0,
+	CLK_SEL_CLK_PLL1,
+	CLK_SEL_CLK_PLL4,
+	CLK_PLL4D1,
+	CLK_SCI0ASYNC,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct clk_div_table dtable_1_2[] = {
+	{0, 2},
+	{1, 1},
+	{0, 0},
+};
+
+static const struct clk_div_table dtable_24_25_30_32[] = {
+	{0, 32},
+	{1, 30},
+	{2, 25},
+	{3, 24},
+	{0, 0},
+};
+
+/* Mux clock tables */
+
+static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
+static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
+static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
+
+static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_RATE(".loco", CLK_LOCO, 1000 * 1000),
+	DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 1, 48),
+	DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 1, 40),
+	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 1, 96),
+
+	DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
+		sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
+		sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
+		sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
+
+	DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
+	DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
+		dtable_24_25_30_32),
+
+	/* Core output clk */
+	DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
+		dtable_1_2),
+	DEF_DIV("CA55C1", R9A09G077_CLK_CA55C1, CLK_SEL_CLK_PLL0, DIVCA55C1,
+		dtable_1_2),
+	DEF_DIV("CA55C2", R9A09G077_CLK_CA55C2, CLK_SEL_CLK_PLL0, DIVCA55C2,
+		dtable_1_2),
+	DEF_DIV("CA55C3", R9A09G077_CLK_CA55C3, CLK_SEL_CLK_PLL0, DIVCA55C3,
+		dtable_1_2),
+	DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55S,
+		dtable_1_2),
+	DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
+	DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
+};
+
+static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
+	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
+};
+
+static struct clk * __init
+r9a09g077_cpg_div_clk_register(struct device *dev,
+			       const struct cpg_core_clk *core,
+			       void __iomem *addr, struct cpg_mssr_pub *pub)
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
+						       addr,
+						       GET_SHIFT(core->conf),
+						       GET_WIDTH(core->conf),
+						       core->flag,
+						       core->dtable,
+						       &pub->rmw_lock);
+	else
+		clk_hw = clk_hw_register_divider(dev, core->name,
+						 parent_name, 0,
+						 addr,
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
+			       void __iomem *addr, struct cpg_mssr_pub *pub)
+{
+	struct clk_hw *clk_hw;
+
+	clk_hw = devm_clk_hw_register_mux(dev, core->name,
+					  core->parent_names, core->num_parents,
+					  core->flag,
+					  addr,
+					  GET_SHIFT(core->conf),
+					  GET_WIDTH(core->conf),
+					  core->mux_flags, &pub->rmw_lock);
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
+static struct clk * __init
+r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
+			   const struct cpg_mssr_info *info,
+			   struct cpg_mssr_pub *pub)
+{
+	u32 offset = GET_REG_OFFSET(core->conf);
+	void __iomem *base = RZT2H_REG_BLOCK(offset) ? pub->base1 : pub->base0;
+	void __iomem *addr = base + RZT2H_REG_OFFSET(offset);
+
+	switch (core->type) {
+	case CLK_TYPE_RZT2H_DIV:
+		return r9a09g077_cpg_div_clk_register(dev, core, addr, pub);
+	case CLK_TYPE_RZT2H_MUX:
+		return r9a09g077_cpg_mux_clk_register(dev, core, addr, pub);
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
+	.num_hw_mod_clks = 14 * 32,
+
+	.reg_layout = CLK_REG_LAYOUT_RZ_T2H,
+	.cpg_clk_register = r9a09g077_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f102a1dd9694..4a5ac9eef9cc 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -80,6 +80,37 @@ static const u16 mstpcr_for_gen4[] = {
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
+#define RZT2H_MSTPCR(block, offset)	(((block) << RZT2H_MSTPCR_BLOCK_SHIFT) | \
+					((offset) & RZT2H_MSTPCR_OFFSET_MASK))
+
+#define RZT2H_MSTPCR_BLOCK(x)		((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
+#define RZT2H_MSTPCR_OFFSET(x)		((x) & RZT2H_MSTPCR_OFFSET_MASK)
+
+static const u16 mstpcr_for_rzt2h[] = {
+	RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
+	RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
+	RZT2H_MSTPCR(0, 0x308), /* MSTPCRC */
+	RZT2H_MSTPCR(0, 0x30c),	/* MSTPCRD */
+	RZT2H_MSTPCR(0, 0x310), /* MSTPCRE */
+	0,
+	RZT2H_MSTPCR(1, 0x318), /* MSTPCRG */
+	0,
+	RZT2H_MSTPCR(1, 0x320), /* MSTPCRI */
+	RZT2H_MSTPCR(0, 0x324), /* MSTPCRJ */
+	RZT2H_MSTPCR(0, 0x328), /* MSTPCRK */
+	RZT2H_MSTPCR(0, 0x32c), /* MSTPCRL */
+	RZT2H_MSTPCR(0, 0x330), /* MSTPCRM */
+	RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
+};
+
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -188,6 +219,26 @@ struct mstp_clock {
 
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+static u32 cpg_rzt2h_mstp_read(struct clk_hw *hw, u16 offset)
+{
+	struct mstp_clock *clock = to_mstp_clock(hw);
+	struct cpg_mssr_priv *priv = clock->priv;
+	void __iomem *base =
+		RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
+
+	return readl(base + RZT2H_MSTPCR_OFFSET(offset));
+}
+
+static void cpg_rzt2h_mstp_write(struct clk_hw *hw, u16 offset, u32 value)
+{
+	struct mstp_clock *clock = to_mstp_clock(hw);
+	struct cpg_mssr_priv *priv = clock->priv;
+	void __iomem *base =
+		RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
+
+	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -216,6 +267,18 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		readb(priv->pub.base0 + priv->control_regs[reg]);
 		barrier_data(priv->pub.base0 + priv->control_regs[reg]);
 
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		value = cpg_rzt2h_mstp_read(hw,
+					    priv->control_regs[reg]);
+
+		if (enable)
+			value &= ~bitmask;
+		else
+			value |= bitmask;
+
+		cpg_rzt2h_mstp_write(hw,
+				     priv->control_regs[reg],
+				     value);
 	} else {
 		value = readl(priv->pub.base0 + priv->control_regs[reg]);
 		if (enable)
@@ -227,7 +290,8 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 
-	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
+	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
+	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
 		return 0;
 
 	error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
@@ -258,6 +322,9 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		value = readb(priv->pub.base0 + priv->control_regs[reg]);
+	else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+		value = cpg_rzt2h_mstp_read(hw,
+					    priv->control_regs[reg]);
 	else
 		value = readl(priv->pub.base0 + priv->status_regs[reg]);
 
@@ -868,6 +935,12 @@ static const struct of_device_id cpg_mssr_match[] = {
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
@@ -1065,6 +1138,13 @@ static int __init cpg_mssr_common_init(struct device *dev,
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
@@ -1078,6 +1158,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->reset_clear_regs = srstclr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 		priv->control_regs = stbcr;
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		priv->control_regs = mstpcr_for_rzt2h;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
 		priv->status_regs = mstpsr_for_gen4;
 		priv->control_regs = mstpcr_for_gen4;
@@ -1108,6 +1190,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 out_err:
 	if (priv->pub.base0)
 		iounmap(priv->pub.base0);
+	if (priv->pub.base1)
+		iounmap(priv->pub.base1);
 	kfree(priv);
 
 	return error;
@@ -1172,7 +1256,8 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 		goto reserve_exit;
 
 	/* Reset Controller not supported for Standby Control SoCs */
-	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
+	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
 		goto reserve_exit;
 
 	error = cpg_mssr_reset_controller_register(priv);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 7ce3cc9a64c1..ad11ab5f0069 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -29,18 +29,28 @@ struct cpg_core_clk {
 	unsigned int div;
 	unsigned int mult;
 	unsigned int offset;
+	union {
+		const char * const *parent_names;
+		const struct clk_div_table *dtable;
+	};
+	u32 conf;
+	u16 flag;
+	u8 mux_flags;
+	u8 num_parents;
 };
 
 /**
  * struct cpg_mssr_pub - data shared with device-specific clk registration code
  *
  * @base0: CPG/MSSR register block base0 address
+ * @base1: CPG/MSSR register block base1 address
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @rmw_lock: protects RMW register accesses
  * @clks: pointer to clocks
  */
 struct cpg_mssr_pub {
 	void __iomem *base0;
+	void __iomem *base1;
 	struct raw_notifier_head notifiers;
 	spinlock_t rmw_lock;
 	struct clk **clks;
@@ -106,6 +116,7 @@ enum clk_reg_layout {
 	CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3 = 0,
 	CLK_REG_LAYOUT_RZ_A,
 	CLK_REG_LAYOUT_RCAR_GEN4,
+	CLK_REG_LAYOUT_RZ_T2H,
 };
 
     /**
@@ -197,6 +208,7 @@ extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779f0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779g0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779h0_cpg_mssr_info;
+extern const struct cpg_mssr_info r9a09g077_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.43.0


