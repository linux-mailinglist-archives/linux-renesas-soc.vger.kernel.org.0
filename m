Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D70647078
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Dec 2022 14:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiLHNHt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Dec 2022 08:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiLHNHp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2022 08:07:45 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFE1C61
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Dec 2022 05:07:34 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5574:4fdf:a801:888e])
        by andre.telenet-ops.be with bizsmtp
        id tp7X280022deJRf01p7XxN; Thu, 08 Dec 2022 14:07:32 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3GIF-002tBF-Lc; Thu, 08 Dec 2022 13:46:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3DeN-002fmw-3l; Thu, 08 Dec 2022 10:57:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tho Vu <tho.vu.wh@renesas.com>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: r8a779g0: Add custom clock for PLL2
Date:   Thu,  8 Dec 2022 10:56:58 +0100
Message-Id: <76a5952900a6e15604c640bc8a27762e0e936677.1670492384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670492384.git.geert+renesas@glider.be>
References: <cover.1670492384.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently the PLLs are modeled as fixed factor clocks, based on initial
settings.  However, enabling CPU boost clock rates requires increasing
the PLL clock rates.

Add a custom clock driver to model the PLL clocks on R-Car Gen4, and use
it for PLL2 on R-Car V4H.  This allows the Z clock (Cortex-A76 core
clock) to request PLL rate changes, and enable boost mode for the High
Performance mode.  For now this is limited to integer multiplication
modes.

Note that the definition for CPG_PLLxCR0_NI uses the value for R-Car V4H.
On R-Car S4-8, the integer and fractional multiplication fields are one
bit larger resp. smaller, but R-Car S4-8 does not support High
Performance mode.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  14 +--
 drivers/clk/renesas/rcar-gen4-cpg.c     | 156 ++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h     |   1 +
 3 files changed, 164 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 745ff9214fe8609d..48d9f34bbf37657a 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -66,13 +66,13 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_INPUT("extalr",	CLK_EXTALR),
 
 	/* Internal Core Clocks */
-	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
-	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
-	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2, CLK_MAIN),
-	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3, CLK_MAIN),
-	DEF_BASE(".pll4", CLK_PLL4,	CLK_TYPE_GEN4_PLL4, CLK_MAIN),
-	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
-	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6, CLK_MAIN),
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,     CLK_EXTAL),
+	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1,     CLK_MAIN),
+	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2_VAR, CLK_MAIN),
+	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3,     CLK_MAIN),
+	DEF_BASE(".pll4", CLK_PLL4,	CLK_TYPE_GEN4_PLL4,     CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,     CLK_MAIN),
+	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6,     CLK_MAIN),
 
 	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index e27832e5114fbdf0..c68d8b987054131b 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/slab.h>
 
 #include "renesas-cpg-mssr.h"
@@ -27,6 +28,152 @@ static const struct rcar_gen4_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
 
+#define CPG_PLLECR		0x0820	/* PLL Enable Control Register */
+
+#define CPG_PLLECR_PLLST(n)	BIT(8 + ((n) < 3 ? (n) - 1 : \
+					 (n) > 3 ? (n) + 1 : n)) /* PLLn Circuit Status */
+
+#define CPG_PLL1CR0		0x830	/* PLLn Control Registers */
+#define CPG_PLL1CR1		0x8b0
+#define CPG_PLL2CR0		0x834
+#define CPG_PLL2CR1		0x8b8
+#define CPG_PLL3CR0		0x83c
+#define CPG_PLL3CR1		0x8c0
+#define CPG_PLL4CR0		0x844
+#define CPG_PLL4CR1		0x8c8
+#define CPG_PLL6CR0		0x84c
+#define CPG_PLL6CR1		0x8d8
+
+#define CPG_PLLxCR0_KICK	BIT(31)
+#define CPG_PLLxCR0_NI		GENMASK(27, 20)	/* Integer mult. factor */
+#define CPG_PLLxCR0_SSMODE	GENMASK(18, 16)	/* PLL mode */
+#define CPG_PLLxCR0_SSMODE_FM	BIT(18)	/* Fractional Multiplication */
+#define CPG_PLLxCR0_SSMODE_DITH	BIT(17) /* Frequency Dithering */
+#define CPG_PLLxCR0_SSMODE_CENT	BIT(16)	/* Center (vs. Down) Spread Dithering */
+#define CPG_PLLxCR0_SSFREQ	GENMASK(14, 8)	/* SSCG Modulation Frequency */
+#define CPG_PLLxCR0_SSDEPT	GENMASK(6, 0)	/* SSCG Modulation Depth */
+
+#define SSMODE_FM		BIT(2)	/* Fractional Multiplication */
+#define SSMODE_DITHER		BIT(1)	/* Frequency Dithering */
+#define SSMODE_CENTER		BIT(0)	/* Center (vs. Down) Spread Dithering */
+
+/* PLL Clocks */
+struct cpg_pll_clk {
+	struct clk_hw hw;
+	void __iomem *pllcr0_reg;
+	void __iomem *pllecr_reg;
+	u32 pllecr_pllst_mask;
+};
+
+#define to_pll_clk(_hw)   container_of(_hw, struct cpg_pll_clk, hw)
+
+static unsigned long cpg_pll_clk_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
+	unsigned int mult;
+
+	mult = FIELD_GET(CPG_PLLxCR0_NI, readl(pll_clk->pllcr0_reg)) + 1;
+
+	return parent_rate * mult * 2;
+}
+
+static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	unsigned int min_mult, max_mult, mult;
+	unsigned long prate;
+
+	prate = req->best_parent_rate * 2;
+	min_mult = max(div64_ul(req->min_rate, prate), 1ULL);
+	max_mult = min(div64_ul(req->max_rate, prate), 256ULL);
+	if (max_mult < min_mult)
+		return -EINVAL;
+
+	mult = DIV_ROUND_CLOSEST_ULL(req->rate, prate);
+	mult = clamp(mult, min_mult, max_mult);
+
+	req->rate = prate * mult;
+	return 0;
+}
+
+static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
+	unsigned int mult;
+	u32 val;
+
+	mult = DIV_ROUND_CLOSEST_ULL(rate, parent_rate * 2);
+	mult = clamp(mult, 1U, 256U);
+
+	if (readl(pll_clk->pllcr0_reg) & CPG_PLLxCR0_KICK)
+		return -EBUSY;
+
+	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI,
+		       FIELD_PREP(CPG_PLLxCR0_NI, mult - 1));
+
+	/*
+	 * Set KICK bit in PLLxCR0 to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	cpg_reg_modify(pll_clk->pllcr0_reg, 0, CPG_PLLxCR0_KICK);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~45 µs are needed, independently of the CPU rate.
+	 * Since this value might be dependent on external xtal rate, pll
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	return readl_poll_timeout(pll_clk->pllecr_reg, val,
+				  val & pll_clk->pllecr_pllst_mask, 0, 1000);
+}
+
+static const struct clk_ops cpg_pll_clk_ops = {
+	.recalc_rate = cpg_pll_clk_recalc_rate,
+	.determine_rate = cpg_pll_clk_determine_rate,
+	.set_rate = cpg_pll_clk_set_rate,
+};
+
+static struct clk * __init cpg_pll_clk_register(const char *name,
+						const char *parent_name,
+						void __iomem *base,
+						unsigned int cr0_offset,
+						unsigned int cr1_offset,
+						unsigned int index)
+
+{
+	struct cpg_pll_clk *pll_clk;
+	struct clk_init_data init = {};
+	struct clk *clk;
+
+	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_pll_clk_ops;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	pll_clk->hw.init = &init;
+	pll_clk->pllcr0_reg = base + cr0_offset;
+	pll_clk->pllecr_reg = base + CPG_PLLECR;
+	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
+
+	/* Disable Fractional Multiplication and Frequency Dithering */
+	writel(0, base + cr1_offset);
+	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_SSMODE, 0);
+
+	clk = clk_register(NULL, &pll_clk->hw);
+	if (IS_ERR(clk))
+		kfree(pll_clk);
+
+	return clk;
+}
 /*
  * Z0 Clock & Z1 Clock
  */
@@ -205,6 +352,15 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll1_div;
 		break;
 
+	case CLK_TYPE_GEN4_PLL2_VAR:
+		/*
+		 * PLL2 is implemented as a custom clock, to change the
+		 * multiplier when cpufreq changes between normal and boost
+		 * modes.
+		 */
+		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
+					    base, CPG_PLL2CR0, CPG_PLL2CR1, 2);
+
 	case CLK_TYPE_GEN4_PLL2:
 		mult = cpg_pll_config->pll2_mult;
 		div = cpg_pll_config->pll2_div;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 0a0e3bdb3a664c10..006537e29e4eb10e 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -13,6 +13,7 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
 	CLK_TYPE_GEN4_PLL1,
 	CLK_TYPE_GEN4_PLL2,
+	CLK_TYPE_GEN4_PLL2_VAR,
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
 	CLK_TYPE_GEN4_PLL3,
 	CLK_TYPE_GEN4_PLL4,
-- 
2.25.1

