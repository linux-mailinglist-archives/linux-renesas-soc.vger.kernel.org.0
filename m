Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959E63B9E97
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 11:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhGBKAs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 06:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhGBKAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 06:00:45 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75CAC061762
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jul 2021 02:58:12 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:445e:1c3:be41:9e10])
        by michel.telenet-ops.be with bizsmtp
        id Q9y82500E474TTe069y8Nb; Fri, 02 Jul 2021 11:58:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lzFw0-005cXE-36; Fri, 02 Jul 2021 11:58:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lzFvz-0062f9-CJ; Fri, 02 Jul 2021 11:58:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] clk: renesas: r8a779a0: Add Z0 and Z1 clock support
Date:   Fri,  2 Jul 2021 11:58:05 +0200
Message-Id: <2112e3bc870580c623bdecfeff8c74739699c610.1625219713.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Z0 and Z1 (Cortex-A76 Sub-system 0 and 1) clocks,
based on the existing support for Z clocks on R-Car Gen3.

As the offsets of the CPG_FRQCRB and CPG_FRQCRC registers on R-Car V3U
differ from the offsets on other R-Car Gen3 SoCs, we cannot use the
existing R-Car Gen3 support as-is.  For now, just make a copy, and
change the register offsets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Falcon by changing

    -#undef CLOCK_ALLOW_WRITE_DEBUGFS
    +#define CLOCK_ALLOW_WRITE_DEBUGFS

in drivers/clk/clk.c, writing the desired clock rate to
/sys/kernel/debug/clk/z0/clk_rate, and timing shell loops.
The performance/clock rate looks fine over the full range from 56.25 MHz
to 1.8 GHz.

RFC as it is not clear from the R-Car V3U User's Manual Rev. 0.5 if the
CPG_FRQCRB.KICK bit applies to changes to CPG_FRQCRC or not:
  - Section 8.2.12 ("Frequency Control Register B (FRQCRB)") says the
    KICK bit activates the FRQCRB settings, but doesn't mention FRQCRC
    like on R-Car Gen2 and Gen3,
  - Section 8.3 ("CPG Operation") says the KICK bit should be used when
    changing Z0 or Z1.
Setting the KICK bit seems to work, and it is cleared automatically
after 1 or 2 loops.

The handling of Z clocks on R-Car Gen2, Gen3, and V3-U should be
consolidated and moved to rcar-cpg-lib.c, so it can be shared by all
clock drivers.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 158 ++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index f16d125ca009212b..6d0498d7f2806e4f 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -33,6 +33,7 @@ enum rcar_r8a779a0_clk_types {
 	CLK_TYPE_R8A779A0_PLL1,
 	CLK_TYPE_R8A779A0_PLL2X_3X,	/* PLL[23][01] */
 	CLK_TYPE_R8A779A0_PLL5,
+	CLK_TYPE_R8A779A0_Z,
 	CLK_TYPE_R8A779A0_SD,
 	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
 	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
@@ -84,6 +85,10 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define DEF_Z(_name, _id, _parent, _div, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_Z, _parent, .div = _div,	\
+		 .offset = _offset)
+
 #define DEF_SD(_name, _id, _parent, _offset)   \
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SD, _parent, .offset = _offset)
 
@@ -122,6 +127,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_RATE(".oco",		CLK_OCO,	32768),
 
 	/* Core Clock Outputs */
+	DEF_Z("z0",		R8A779A0_CLK_Z0,	CLK_PLL20,	2, 0),
+	DEF_Z("z1",		R8A779A0_CLK_Z1,	CLK_PLL21,	2, 8),
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
 	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
 	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
@@ -259,6 +266,153 @@ static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
 
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
 static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
@@ -293,6 +447,10 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll5_div;
 		break;
 
+	case CLK_TYPE_R8A779A0_Z:
+		return cpg_z_clk_register(core->name, __clk_get_name(parent),
+					  base, core->div, core->offset);
+
 	case CLK_TYPE_R8A779A0_SD:
 		return cpg_sd_clk_register(core->name, base, core->offset,
 					   __clk_get_name(parent), notifiers,
-- 
2.25.1

