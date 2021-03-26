Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E0B34A6C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 13:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhCZMC6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 08:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhCZMCZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 08:02:25 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C01C0613BB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 05:02:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by michel.telenet-ops.be with bizsmtp
        id l02F2400s53vE1T0602FZt; Fri, 26 Mar 2021 13:02:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAN-00AXLX-FJ; Fri, 26 Mar 2021 13:02:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-006cQj-EM; Fri, 26 Mar 2021 13:02:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] clk: renesas: rcar-gen3: Add custom clock for PLLs
Date:   Fri, 26 Mar 2021 13:00:59 +0100
Message-Id: <20210326120100.1577596-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently the PLLs are modeled as fixed factor clocks, based on initial
settings.  However, enabling CPU boost clock rates requires increasing
the PLL clock rates.

Add a custom clock driver to model the PLL clocks.  This will allow the
Z (CPU) clock driver to request changing the PLL clock rate.

Based on a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 147 ++++++++++++++++++++++++----
 1 file changed, 128 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 6b389c1caca76f07..cc9a116d7d093ce7 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -26,12 +26,127 @@
 #include "rcar-cpg-lib.h"
 #include "rcar-gen3-cpg.h"
 
-#define CPG_PLL0CR		0x00d8
+#define CPG_PLLECR		0x00d0	/* PLL Enable Control Register */
+
+#define CPG_PLLECR_PLLST(n)	BIT(8 + (n))	/* PLLn Circuit Status */
+
+#define CPG_PLL0CR		0x00d8	/* PLLn Control Registers */
 #define CPG_PLL2CR		0x002c
 #define CPG_PLL4CR		0x01f4
 
+#define CPG_PLLnCR_STC_MASK	GENMASK(30, 24)	/* PLL Circuit Mult. Ratio */
+
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+/* PLL Clocks */
+struct cpg_pll_clk {
+	struct clk_hw hw;
+	void __iomem *pllcr_reg;
+	void __iomem *pllecr_reg;
+	unsigned int fixed_mult;
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
+	u32 val;
+
+	val = readl(pll_clk->pllcr_reg) & CPG_PLLnCR_STC_MASK;
+	mult = (val >> __ffs(CPG_PLLnCR_STC_MASK)) + 1;
+
+	return parent_rate * mult * pll_clk->fixed_mult;
+}
+
+static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
+	unsigned int min_mult, max_mult, mult;
+	unsigned long prate;
+
+	prate = req->best_parent_rate * pll_clk->fixed_mult;
+	min_mult = max(div64_ul(req->min_rate, prate), 1ULL);
+	max_mult = min(div64_ul(req->max_rate, prate), 128ULL);
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
+	unsigned int mult, i;
+	u32 val;
+
+	mult = DIV_ROUND_CLOSEST_ULL(rate, parent_rate * pll_clk->fixed_mult);
+	mult = clamp(mult, 1U, 128U);
+
+	val = readl(pll_clk->pllcr_reg);
+	val &= ~CPG_PLLnCR_STC_MASK;
+	val |= (mult - 1) << __ffs(CPG_PLLnCR_STC_MASK);
+	writel(val, pll_clk->pllcr_reg);
+
+	for (i = 1000; i; i--) {
+		if (readl(pll_clk->pllecr_reg) & pll_clk->pllecr_pllst_mask)
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
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
+						unsigned int mult,
+						unsigned int offset,
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
+	pll_clk->pllcr_reg = base + offset;
+	pll_clk->pllecr_reg = base + CPG_PLLECR;
+	pll_clk->fixed_mult = mult;	/* PLL refclk x (setting + 1) x mult */
+	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
+
+	clk = clk_register(NULL, &pll_clk->hw);
+	if (IS_ERR(clk))
+		kfree(pll_clk);
+
+	return clk;
+}
+
 /*
  * Z Clock & Z2 Clock
  *
@@ -314,16 +429,13 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN3_PLL0:
 		/*
-		 * PLL0 is a configurable multiplier clock. Register it as a
-		 * fixed factor clock for now as there's no generic multiplier
-		 * clock implementation and we currently have no need to change
-		 * the multiplier value.
+		 * PLL0 is implemented as a custom clock, to change the
+		 * multiplier when cpufreq changes between normal and boost
+		 * modes.
 		 */
-		value = readl(base + CPG_PLL0CR);
-		mult = (((value >> 24) & 0x7f) + 1) * 2;
-		if (cpg_quirks & PLL_ERRATA)
-			mult *= 2;
-		break;
+		mult = (cpg_quirks & PLL_ERRATA) ? 4 : 2;
+		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
+					    base, mult, CPG_PLL0CR, 0);
 
 	case CLK_TYPE_GEN3_PLL1:
 		mult = cpg_pll_config->pll1_mult;
@@ -332,16 +444,13 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN3_PLL2:
 		/*
-		 * PLL2 is a configurable multiplier clock. Register it as a
-		 * fixed factor clock for now as there's no generic multiplier
-		 * clock implementation and we currently have no need to change
-		 * the multiplier value.
+		 * PLL2 is implemented as a custom clock, to change the
+		 * multiplier when cpufreq changes between normal and boost
+		 * modes.
 		 */
-		value = readl(base + CPG_PLL2CR);
-		mult = (((value >> 24) & 0x7f) + 1) * 2;
-		if (cpg_quirks & PLL_ERRATA)
-			mult *= 2;
-		break;
+		mult = (cpg_quirks & PLL_ERRATA) ? 4 : 2;
+		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
+					    base, mult, CPG_PLL2CR, 2);
 
 	case CLK_TYPE_GEN3_PLL3:
 		mult = cpg_pll_config->pll3_mult;
-- 
2.25.1

