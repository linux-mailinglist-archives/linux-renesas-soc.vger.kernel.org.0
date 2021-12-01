Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7714648C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347766AbhLAHgr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:47 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:23247 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1347669AbhLAHgn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:43 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102003008"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:17 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A52A441FE2A9;
        Wed,  1 Dec 2021 16:33:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 08/14] clk: renesas: rcar-gen4-cpg: Introduce R-Car Gen4 CPG driver
Date:   Wed,  1 Dec 2021 16:33:02 +0900
Message-Id: <20211201073308.1003945-9-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the official website [1], the R-Car V3U SoC is based
on the R-Car Gen4 architecture. So, introduce R-Car Gen4 CPG
driver.

[1]
https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v3u-asil-d-system-chip-automated-driving

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 350 ++----------------------
 drivers/clk/renesas/rcar-gen4-cpg.c     | 307 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h     |  76 +++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |  36 ++-
 drivers/clk/renesas/renesas-cpg-mssr.h  |   2 +-
 6 files changed, 433 insertions(+), 339 deletions(-)
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.h

diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 7d018700d08b..7270e8df29b3 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+= rcar-cpg-lib.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
+obj-$(CONFIG_CLK_RCAR_GEN4_CPG)		+= rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
 
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 68afc55d03c0..1c09d4ebe90f 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -10,47 +10,19 @@
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
 
-#include <linux/bug.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
 #include <linux/soc/renesas/rcar-rst.h>
 
 #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
 
-#include "rcar-cpg-lib.h"
 #include "renesas-cpg-mssr.h"
-
-enum rcar_r8a779a0_clk_types {
-	CLK_TYPE_R8A779A0_MAIN = CLK_TYPE_CUSTOM,
-	CLK_TYPE_R8A779A0_PLL1,
-	CLK_TYPE_R8A779A0_PLL2X_3X,	/* PLL[23][01] */
-	CLK_TYPE_R8A779A0_PLL5,
-	CLK_TYPE_R8A779A0_Z,
-	CLK_TYPE_R8A779A0_SDH,
-	CLK_TYPE_R8A779A0_SD,
-	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
-	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
-	CLK_TYPE_R8A779A0_RPCSRC,
-	CLK_TYPE_R8A779A0_RPC,
-	CLK_TYPE_R8A779A0_RPCD2,
-};
-
-struct rcar_r8a779a0_cpg_pll_config {
-	u8 extal_div;
-	u8 pll1_mult;
-	u8 pll1_div;
-	u8 pll5_mult;
-	u8 pll5_div;
-	u8 osc_prediv;
-};
+#include "rcar-gen4-cpg.h"
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
@@ -86,36 +58,18 @@ enum clk_ids {
 };
 
 #define DEF_PLL(_name, _id, _offset)	\
-	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
-		 .offset = _offset)
-
-#define DEF_Z(_name, _id, _parent, _div, _offset)	\
-	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_Z, _parent, .div = _div,	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
-#define DEF_SDH(_name, _id, _parent, _offset)   \
-	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SDH, _parent, .offset = _offset)
-
-#define DEF_SD(_name, _id, _parent, _offset)   \
-	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SD, _parent, .offset = _offset)
-
-#define DEF_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
-	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_MDSEL,	\
-		 (_parent0) << 16 | (_parent1),		\
-		 .div = (_div0) << 16 | (_div1), .offset = _md)
-
-#define DEF_OSC(_name, _id, _parent, _div)		\
-	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_OSC, _parent, .div = _div)
-
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
 	DEF_INPUT("extalr", CLK_EXTALR),
 
 	/* Internal Core Clocks */
-	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_R8A779A0_MAIN, CLK_EXTAL),
-	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_R8A779A0_PLL1, CLK_MAIN),
-	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_R8A779A0_PLL5, CLK_MAIN),
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
 	DEF_PLL(".pll20", CLK_PLL20,	0x0834),
 	DEF_PLL(".pll21", CLK_PLL21,	0x0838),
 	DEF_PLL(".pll30", CLK_PLL30,	0x083c),
@@ -132,14 +86,14 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED(".s3",		CLK_S3,		CLK_PLL1_DIV2,	4, 1),
 	DEF_FIXED(".sdsrc",		CLK_SDSRC,	CLK_PLL5_DIV4,	1, 1),
 	DEF_RATE(".oco",		CLK_OCO,	32768),
-	DEF_BASE(".rpcsrc",	 CLK_RPCSRC,	   CLK_TYPE_R8A779A0_RPCSRC, CLK_PLL5),
-	DEF_BASE("rpc",		 R8A779A0_CLK_RPC, CLK_TYPE_R8A779A0_RPC, CLK_RPCSRC),
-	DEF_BASE("rpcd2",	 R8A779A0_CLK_RPCD2, CLK_TYPE_R8A779A0_RPCD2,
+	DEF_BASE(".rpcsrc",	 CLK_RPCSRC,	   CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
+	DEF_BASE("rpc",		 R8A779A0_CLK_RPC, CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
+	DEF_BASE("rpcd2",	 R8A779A0_CLK_RPCD2, CLK_TYPE_GEN4_RPCD2,
 		 R8A779A0_CLK_RPC),
 
 	/* Core Clock Outputs */
-	DEF_Z("z0",		R8A779A0_CLK_Z0,	CLK_PLL20,	2, 0),
-	DEF_Z("z1",		R8A779A0_CLK_Z1,	CLK_PLL21,	2, 8),
+	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, 0),
+	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL21,	2, 8),
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
 	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
 	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
@@ -163,16 +117,16 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cl16mck",	R8A779A0_CLK_CL16MCK,	CLK_PLL1_DIV2,	64, 1),
 
-	DEF_SDH("sdh0",		R8A779A0_CLK_SD0H,	CLK_SDSRC,	   0x870),
-	DEF_SD( "sd0",		R8A779A0_CLK_SD0,	R8A779A0_CLK_SD0H, 0x870),
+	DEF_GEN4_SDH("sdh0",	R8A779A0_CLK_SD0H,	CLK_SDSRC,	   0x870),
+	DEF_GEN4_SD("sd0",	R8A779A0_CLK_SD0,	R8A779A0_CLK_SD0H, 0x870),
 
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
 	DEF_DIV6P1("dsi",	R8A779A0_CLK_DSI,	CLK_PLL5_DIV4,	0x884),
 
-	DEF_OSC("osc",		R8A779A0_CLK_OSC,	CLK_EXTAL,	8),
-	DEF_MDSEL("r",		R8A779A0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
+	DEF_GEN4_OSC("osc",	R8A779A0_CLK_OSC,	CLK_EXTAL,	8),
+	DEF_GEN4_MDSEL("r",	R8A779A0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
@@ -276,258 +230,6 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vspx3",	1031,	R8A779A0_CLK_S1D1),
 };
 
-static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
-static unsigned int cpg_clk_extalr __initdata;
-static u32 cpg_mode __initdata;
-
-/*
- * Z0 Clock & Z1 Clock
- */
-#define CPG_FRQCRB			0x00000804
-#define CPG_FRQCRB_KICK			BIT(31)
-#define CPG_FRQCRC			0x00000808
-
-struct cpg_z_clk {
-	struct clk_hw hw;
-	void __iomem *reg;
-	void __iomem *kick_reg;
-	unsigned long max_rate;		/* Maximum rate for normal mode */
-	unsigned int fixed_div;
-	u32 mask;
-};
-
-#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
-
-static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
-					   unsigned long parent_rate)
-{
-	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int mult;
-	u32 val;
-
-	val = readl(zclk->reg) & zclk->mask;
-	mult = 32 - (val >> __ffs(zclk->mask));
-
-	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult,
-				     32 * zclk->fixed_div);
-}
-
-static int cpg_z_clk_determine_rate(struct clk_hw *hw,
-				    struct clk_rate_request *req)
-{
-	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int min_mult, max_mult, mult;
-	unsigned long rate, prate;
-
-	rate = min(req->rate, req->max_rate);
-	if (rate <= zclk->max_rate) {
-		/* Set parent rate to initial value for normal modes */
-		prate = zclk->max_rate;
-	} else {
-		/* Set increased parent rate for boost modes */
-		prate = rate;
-	}
-	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
-						  prate * zclk->fixed_div);
-
-	prate = req->best_parent_rate / zclk->fixed_div;
-	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
-	max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
-	if (max_mult < min_mult)
-		return -EINVAL;
-
-	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL, prate);
-	mult = clamp(mult, min_mult, max_mult);
-
-	req->rate = DIV_ROUND_CLOSEST_ULL((u64)prate * mult, 32);
-	return 0;
-}
-
-static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long parent_rate)
-{
-	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int mult;
-	unsigned int i;
-
-	mult = DIV64_U64_ROUND_CLOSEST(rate * 32ULL * zclk->fixed_div,
-				       parent_rate);
-	mult = clamp(mult, 1U, 32U);
-
-	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
-		return -EBUSY;
-
-	cpg_reg_modify(zclk->reg, zclk->mask, (32 - mult) << __ffs(zclk->mask));
-
-	/*
-	 * Set KICK bit in FRQCRB to update hardware setting and wait for
-	 * clock change completion.
-	 */
-	cpg_reg_modify(zclk->kick_reg, 0, CPG_FRQCRB_KICK);
-
-	/*
-	 * Note: There is no HW information about the worst case latency.
-	 *
-	 * Using experimental measurements, it seems that no more than
-	 * ~10 iterations are needed, independently of the CPU rate.
-	 * Since this value might be dependent on external xtal rate, pll1
-	 * rate or even the other emulation clocks rate, use 1000 as a
-	 * "super" safe value.
-	 */
-	for (i = 1000; i; i--) {
-		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
-			return 0;
-
-		cpu_relax();
-	}
-
-	return -ETIMEDOUT;
-}
-
-static const struct clk_ops cpg_z_clk_ops = {
-	.recalc_rate = cpg_z_clk_recalc_rate,
-	.determine_rate = cpg_z_clk_determine_rate,
-	.set_rate = cpg_z_clk_set_rate,
-};
-
-static struct clk * __init cpg_z_clk_register(const char *name,
-					      const char *parent_name,
-					      void __iomem *reg,
-					      unsigned int div,
-					      unsigned int offset)
-{
-	struct clk_init_data init = {};
-	struct cpg_z_clk *zclk;
-	struct clk *clk;
-
-	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
-	if (!zclk)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-	init.ops = &cpg_z_clk_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
-
-	zclk->reg = reg + CPG_FRQCRC;
-	zclk->kick_reg = reg + CPG_FRQCRB;
-	zclk->hw.init = &init;
-	zclk->mask = GENMASK(offset + 4, offset);
-	zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
-
-	clk = clk_register(NULL, &zclk->hw);
-	if (IS_ERR(clk)) {
-		kfree(zclk);
-		return clk;
-	}
-
-	zclk->max_rate = clk_hw_get_rate(clk_hw_get_parent(&zclk->hw)) /
-			 zclk->fixed_div;
-	return clk;
-}
-
-/*
- * RPC Clocks
- */
-#define CPG_RPCCKCR 0x874
-
-static const struct clk_div_table cpg_rpcsrc_div_table[] = {
-	{ 0, 4 }, { 1, 6 }, { 2, 5 }, { 3, 6 }, { 0, 0 },
-};
-
-static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
-	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-	struct clk **clks, void __iomem *base,
-	struct raw_notifier_head *notifiers)
-{
-	const struct clk *parent;
-	unsigned int mult = 1;
-	unsigned int div = 1;
-	u32 value;
-
-	parent = clks[core->parent & 0xffff];	/* some types use high bits */
-	if (IS_ERR(parent))
-		return ERR_CAST(parent);
-
-	switch (core->type) {
-	case CLK_TYPE_R8A779A0_MAIN:
-		div = cpg_pll_config->extal_div;
-		break;
-
-	case CLK_TYPE_R8A779A0_PLL1:
-		mult = cpg_pll_config->pll1_mult;
-		div = cpg_pll_config->pll1_div;
-		break;
-
-	case CLK_TYPE_R8A779A0_PLL2X_3X:
-		value = readl(base + core->offset);
-		mult = (((value >> 24) & 0x7f) + 1) * 2;
-		break;
-
-	case CLK_TYPE_R8A779A0_PLL5:
-		mult = cpg_pll_config->pll5_mult;
-		div = cpg_pll_config->pll5_div;
-		break;
-
-	case CLK_TYPE_R8A779A0_Z:
-		return cpg_z_clk_register(core->name, __clk_get_name(parent),
-					  base, core->div, core->offset);
-
-	case CLK_TYPE_R8A779A0_SDH:
-		return cpg_sdh_clk_register(core->name, base + core->offset,
-					   __clk_get_name(parent), notifiers);
-
-	case CLK_TYPE_R8A779A0_SD:
-		return cpg_sd_clk_register(core->name, base + core->offset,
-					   __clk_get_name(parent));
-
-	case CLK_TYPE_R8A779A0_MDSEL:
-		/*
-		 * Clock selectable between two parents and two fixed dividers
-		 * using a mode pin
-		 */
-		if (cpg_mode & BIT(core->offset)) {
-			div = core->div & 0xffff;
-		} else {
-			parent = clks[core->parent >> 16];
-			if (IS_ERR(parent))
-				return ERR_CAST(parent);
-			div = core->div >> 16;
-		}
-		mult = 1;
-		break;
-
-	case CLK_TYPE_R8A779A0_OSC:
-		/*
-		 * Clock combining OSC EXTAL predivider and a fixed divider
-		 */
-		div = cpg_pll_config->osc_prediv * core->div;
-		break;
-
-	case CLK_TYPE_R8A779A0_RPCSRC:
-		return clk_register_divider_table(NULL, core->name,
-						  __clk_get_name(parent), 0,
-						  base + CPG_RPCCKCR, 3, 2, 0,
-						  cpg_rpcsrc_div_table,
-						  &cpg_lock);
-
-	case CLK_TYPE_R8A779A0_RPC:
-		return cpg_rpc_clk_register(core->name, base + CPG_RPCCKCR,
-					    __clk_get_name(parent), notifiers);
-
-	case CLK_TYPE_R8A779A0_RPCD2:
-		return cpg_rpcd2_clk_register(core->name, base + CPG_RPCCKCR,
-					      __clk_get_name(parent));
-
-	default:
-		return ERR_PTR(-EINVAL);
-	}
-
-	return clk_register_fixed_factor(NULL, core->name,
-					 __clk_get_name(parent), 0, mult, div);
-}
-
 static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(907),	/* RWDT */
 };
@@ -546,17 +248,19 @@ static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
-
-static const struct rcar_r8a779a0_cpg_pll_config cpg_pll_configs[4] = {
-	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
-	{ 1,		128,	1,	192,	1,	16,	},
-	{ 1,		106,	1,	160,	1,	19,	},
-	{ 0,		0,	0,	0,	0,	0,	},
-	{ 2,		128,	1,	192,	1,	32,	},
+static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
+	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
+	{ 1,		128,	1,	0,	0,	0,	0,	192,	1,	0,	0,	16,	},
+	{ 1,		106,	1,	0,	0,	0,	0,	160,	1,	0,	0,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
+	{ 2,		128,	1,	0,	0,	0,	0,	192,	1,	0,	0,	32,	},
 };
 
+
 static int __init r8a779a0_cpg_mssr_init(struct device *dev)
 {
+	const struct rcar_gen4_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
 	int error;
 
 	error = rcar_rst_read_mode_pins(&cpg_mode);
@@ -564,10 +268,8 @@ static int __init r8a779a0_cpg_mssr_init(struct device *dev)
 		return error;
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
-	cpg_clk_extalr = CLK_EXTALR;
-	spin_lock_init(&cpg_lock);
 
-	return 0;
+	return rcar_gen4_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
 }
 
 const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
@@ -588,7 +290,7 @@ const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
 
 	/* Callbacks */
 	.init = r8a779a0_cpg_mssr_init,
-	.cpg_clk_register = rcar_r8a779a0_cpg_clk_register,
+	.cpg_clk_register = rcar_gen4_cpg_clk_register,
 
-	.reg_layout = CLK_REG_LAYOUT_RCAR_V3U,
+	.reg_layout = CLK_REG_LAYOUT_RCAR_GEN4,
 };
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
new file mode 100644
index 000000000000..6e6f6b085a33
--- /dev/null
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -0,0 +1,307 @@
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
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen4-cpg.h"
+#include "rcar-cpg-lib.h"
+
+static const struct rcar_gen4_cpg_pll_config *cpg_pll_config __initconst;
+static unsigned int cpg_clk_extalr __initdata;
+static u32 cpg_mode __initdata;
+
+/*
+ * Z0 Clock & Z1 Clock
+ */
+#define CPG_FRQCRB			0x00000804
+#define CPG_FRQCRB_KICK			BIT(31)
+#define CPG_FRQCRC			0x00000808
+
+struct cpg_z_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+	void __iomem *kick_reg;
+	unsigned long max_rate;		/* Maximum rate for normal mode */
+	unsigned int fixed_div;
+	u32 mask;
+};
+
+#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
+
+static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	u32 val;
+
+	val = readl(zclk->reg) & zclk->mask;
+	mult = 32 - (val >> __ffs(zclk->mask));
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult,
+				     32 * zclk->fixed_div);
+}
+
+static int cpg_z_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int min_mult, max_mult, mult;
+	unsigned long rate, prate;
+
+	rate = min(req->rate, req->max_rate);
+	if (rate <= zclk->max_rate) {
+		/* Set parent rate to initial value for normal modes */
+		prate = zclk->max_rate;
+	} else {
+		/* Set increased parent rate for boost modes */
+		prate = rate;
+	}
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
+						  prate * zclk->fixed_div);
+
+	prate = req->best_parent_rate / zclk->fixed_div;
+	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
+	max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
+	if (max_mult < min_mult)
+		return -EINVAL;
+
+	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL, prate);
+	mult = clamp(mult, min_mult, max_mult);
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)prate * mult, 32);
+	return 0;
+}
+
+static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	unsigned int i;
+
+	mult = DIV64_U64_ROUND_CLOSEST(rate * 32ULL * zclk->fixed_div,
+				       parent_rate);
+	mult = clamp(mult, 1U, 32U);
+
+	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+		return -EBUSY;
+
+	cpg_reg_modify(zclk->reg, zclk->mask, (32 - mult) << __ffs(zclk->mask));
+
+	/*
+	 * Set KICK bit in FRQCRB to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	cpg_reg_modify(zclk->kick_reg, 0, CPG_FRQCRB_KICK);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~10 iterations are needed, independently of the CPU rate.
+	 * Since this value might be dependent on external xtal rate, pll1
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	for (i = 1000; i; i--) {
+		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct clk_ops cpg_z_clk_ops = {
+	.recalc_rate = cpg_z_clk_recalc_rate,
+	.determine_rate = cpg_z_clk_determine_rate,
+	.set_rate = cpg_z_clk_set_rate,
+};
+
+static struct clk * __init cpg_z_clk_register(const char *name,
+					      const char *parent_name,
+					      void __iomem *reg,
+					      unsigned int div,
+					      unsigned int offset)
+{
+	struct clk_init_data init = {};
+	struct cpg_z_clk *zclk;
+	struct clk *clk;
+
+	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
+	if (!zclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_z_clk_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	zclk->reg = reg + CPG_FRQCRC;
+	zclk->kick_reg = reg + CPG_FRQCRB;
+	zclk->hw.init = &init;
+	zclk->mask = GENMASK(offset + 4, offset);
+	zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
+
+	clk = clk_register(NULL, &zclk->hw);
+	if (IS_ERR(clk)) {
+		kfree(zclk);
+		return clk;
+	}
+
+	zclk->max_rate = clk_hw_get_rate(clk_hw_get_parent(&zclk->hw)) /
+			 zclk->fixed_div;
+	return clk;
+}
+
+/*
+ * RPC Clocks
+ */
+#define CPG_RPCCKCR 0x874
+
+static const struct clk_div_table cpg_rpcsrc_div_table[] = {
+	{ 0, 4 }, { 1, 6 }, { 2, 5 }, { 3, 6 }, { 0, 0 },
+};
+
+struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
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
+	case CLK_TYPE_GEN4_PLL2X_3X:
+		value = readl(base + core->offset);
+		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		break;
+
+	case CLK_TYPE_GEN4_Z:
+		return cpg_z_clk_register(core->name, __clk_get_name(parent),
+					  base, core->div, core->offset);
+
+	case CLK_TYPE_GEN4_SDSRC:
+		div = ((readl(base + SD0CKCR1) >> 29) & 0x03) + 4;
+		break;
+
+	case CLK_TYPE_GEN4_SDH:
+		return cpg_sdh_clk_register(core->name, base + core->offset,
+					   __clk_get_name(parent), notifiers);
+
+	case CLK_TYPE_GEN4_SD:
+		return cpg_sd_clk_register(core->name, base + core->offset,
+					   __clk_get_name(parent));
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
index 000000000000..afc8c024d538
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
+	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
+	CLK_TYPE_GEN4_PLL3,
+	CLK_TYPE_GEN4_PLL5,
+	CLK_TYPE_GEN4_PLL6,
+	CLK_TYPE_GEN4_SDSRC,
+	CLK_TYPE_GEN4_SDH,
+	CLK_TYPE_GEN4_SD,
+	CLK_TYPE_GEN4_MDSEL,	/* Select parent/divider using mode pin */
+	CLK_TYPE_GEN4_Z,
+	CLK_TYPE_GEN4_OSC,	/* OSC EXTAL predivider and fixed divider */
+	CLK_TYPE_GEN4_RPCSRC,
+	CLK_TYPE_GEN4_RPC,
+	CLK_TYPE_GEN4_RPCD2,
+
+	/* SoC specific definitions start here */
+	CLK_TYPE_GEN4_SOC_BASE,
+};
+
+#define DEF_GEN4_SDH(_name, _id, _parent, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_SDH, _parent, .offset = _offset)
+
+#define DEF_GEN4_SD(_name, _id, _parent, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_SD, _parent, .offset = _offset)
+
+#define DEF_GEN4_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_MDSEL,	\
+		 (_parent0) << 16 | (_parent1),		\
+		 .div = (_div0) << 16 | (_div1), .offset = _md)
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
+#define SD0CKCR1	0x8a4
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
index 21f762aa2131..ffb515b29b7e 100644
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
@@ -970,11 +978,11 @@ static int __init cpg_mssr_common_init(struct device *dev,
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
index 6b2a0ade482e..4d770763d1c2 100644
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
-- 
2.25.1

