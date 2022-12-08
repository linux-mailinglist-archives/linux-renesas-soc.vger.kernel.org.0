Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0361C647080
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Dec 2022 14:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiLHNH6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Dec 2022 08:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiLHNHx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2022 08:07:53 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6608031353
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Dec 2022 05:07:49 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5574:4fdf:a801:888e])
        by laurent.telenet-ops.be with bizsmtp
        id tp7n280032deJRf01p7nsB; Thu, 08 Dec 2022 14:07:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3GIF-002tBF-JX; Thu, 08 Dec 2022 13:46:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3DeN-002fn0-4a; Thu, 08 Dec 2022 10:57:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tho Vu <tho.vu.wh@renesas.com>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: rcar-gen4: Add support for fractional multiplication
Date:   Thu,  8 Dec 2022 10:56:59 +0100
Message-Id: <a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670492384.git.geert+renesas@glider.be>
References: <cover.1670492384.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Gen4 PLLs support fractional multiplication, which can improve
accuracy when configuring a specific frequency.

Add support for fractional multiplication to the custom clock driver
for PLLs, which is currently used only for PLL2 on R-Car V4H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I am not so sure it is worth supporting this.
On R-Car V4H, the following clock rates are seen for PLL2 and the
Cortex-A76 CPU core clock, when using the Normal vs. the
High-Performance mode:

					Multiplication Mode
					Integer         Frational
					----------	----------
    Normal (1.7 GHz):            PLL2   3399999864      3399999997
				 Z0     1699999932      1699999999
    High-Performance (1.8 GHz):  PLL2   3599999856      3599999997
				 Z0     1799999928      1799999999

The improvement is of a similar order of magnitude as the accuracy of
the external crystal, hence insignificant...

With the current implementation, fractional multiplication does not have
any impact on lower performance points, as those rely on changing the Z0
divider (which supports 32 steps only), instead of changing the PLL.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 69 ++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index c68d8b987054131b..54dc3aa82b499725 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -57,10 +57,13 @@ static u32 cpg_mode __initdata;
 #define SSMODE_DITHER		BIT(1)	/* Frequency Dithering */
 #define SSMODE_CENTER		BIT(0)	/* Center (vs. Down) Spread Dithering */
 
+#define CPG_PLLxCR1_NF		GENMASK(24, 0)	/* Fractional mult. factor */
+
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
 	void __iomem *pllcr0_reg;
+	void __iomem *pllcr1_reg;
 	void __iomem *pllecr_reg;
 	u32 pllecr_pllst_mask;
 };
@@ -71,17 +74,26 @@ static unsigned long cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
-	unsigned int mult;
-
-	mult = FIELD_GET(CPG_PLLxCR0_NI, readl(pll_clk->pllcr0_reg)) + 1;
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
+	unsigned int ni, nf;
+	unsigned long rate;
+
+	ni = (FIELD_GET(CPG_PLLxCR0_NI, cr0) + 1) * 2;
+	rate = parent_rate * ni;
+	if (cr0 & CPG_PLLxCR0_SSMODE_FM) {
+		nf = FIELD_GET(CPG_PLLxCR1_NF, readl(pll_clk->pllcr1_reg));
+		rate += ((u64)parent_rate * nf) >> 24;
+	}
 
-	return parent_rate * mult * 2;
+	return rate;
 }
 
 static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
-	unsigned int min_mult, max_mult, mult;
+	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
+	unsigned int min_mult, max_mult, ni, nf;
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
 	unsigned long prate;
 
 	prate = req->best_parent_rate * 2;
@@ -90,10 +102,23 @@ static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
 	if (max_mult < min_mult)
 		return -EINVAL;
 
-	mult = DIV_ROUND_CLOSEST_ULL(req->rate, prate);
-	mult = clamp(mult, min_mult, max_mult);
+	if (cr0 & CPG_PLLxCR0_SSMODE_FM) {
+		ni = div64_ul(req->rate, prate);
+		if (ni < min_mult) {
+			ni = min_mult;
+			nf = 0;
+		} else {
+			ni = min(ni, max_mult);
+			nf = ((u64)(req->rate - prate * ni) << 24) /
+			     req->best_parent_rate;
+		}
+	} else {
+		ni = DIV_ROUND_CLOSEST_ULL(req->rate, prate);
+		ni = clamp(ni, min_mult, max_mult);
+		nf = 0;
+	}
+	req->rate = prate * ni + (((u64)req->best_parent_rate * nf) >> 24);
 
-	req->rate = prate * mult;
 	return 0;
 }
 
@@ -101,17 +126,31 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
-	unsigned int mult;
+	unsigned long prate = parent_rate * 2;
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
+	unsigned int ni, nf;
+	int error;
 	u32 val;
 
-	mult = DIV_ROUND_CLOSEST_ULL(rate, parent_rate * 2);
-	mult = clamp(mult, 1U, 256U);
+	if (cr0 & CPG_PLLxCR0_SSMODE_FM) {
+		ni = div64_ul(rate, prate);
+		if (ni < 1) {
+			ni = 1;
+			nf = 0;
+		} else {
+			ni = min(ni, 256U);
+			nf = ((u64)(rate - prate * ni) << 24) / parent_rate;
+		}
+	} else {
+		ni = DIV_ROUND_CLOSEST_ULL(rate, prate);
+		ni = clamp(ni, 1U, 256U);
+	}
 
 	if (readl(pll_clk->pllcr0_reg) & CPG_PLLxCR0_KICK)
 		return -EBUSY;
 
 	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI,
-		       FIELD_PREP(CPG_PLLxCR0_NI, mult - 1));
+		       FIELD_PREP(CPG_PLLxCR0_NI, ni - 1));
 
 	/*
 	 * Set KICK bit in PLLxCR0 to update hardware setting and wait for
@@ -161,12 +200,12 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 
 	pll_clk->hw.init = &init;
 	pll_clk->pllcr0_reg = base + cr0_offset;
+	pll_clk->pllcr1_reg = base + cr1_offset;
 	pll_clk->pllecr_reg = base + CPG_PLLECR;
 	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
 
-	/* Disable Fractional Multiplication and Frequency Dithering */
-	writel(0, base + cr1_offset);
-	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_SSMODE, 0);
+	/* Enable Fractional Multiplication */
+	cpg_reg_modify(pll_clk->pllcr0_reg, 0, CPG_PLLxCR0_SSMODE_FM);
 
 	clk = clk_register(NULL, &pll_clk->hw);
 	if (IS_ERR(clk))
-- 
2.25.1

