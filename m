Return-Path: <linux-renesas-soc+bounces-7411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71411938E58
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9261E1C210DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4540216D32B;
	Mon, 22 Jul 2024 11:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F61016C6B2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649047; cv=none; b=b2Z7f3x7EPy2Egtm+y6YicVqY9TWfw+b+OzhRoV92XTLkv/FX4BkzIiBCz2q5pXIz4DxO7VIRtWsBIbw0hPjDKMZd9hgMtzZqj621y8Izb5bJfCWcOP9PZOaDtg5zTEYi5/OAXxKgSM3yAwNzVZ1fvwxW7xWa7UDSHOQn2fJX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649047; c=relaxed/simple;
	bh=e2Avde2FIJuKz+a2cFf2G8iSNR0ypdypJ/+7Qx6W0AQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FoBzZXzuGv2hExqqxw00+RO9RLKWAEQWK9q1fj02r2VwW3PiZYGaxMkbjSMfWAy0wH1T/IQMFIk1BnN1uji1Gxn2oLLs42aXAOcRyu5okXi9lw/tY8Hu18dgMtldrqmdeIFz1xrQFRDZJ/WWLSwZIi7Myi4/99xda8nJMlx4ZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by xavier.telenet-ops.be with bizsmtp
	id qbqc2C00T1wvoRx01bqc6P; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAO-5X;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hm-M3;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 05/15] clk: renesas: rcar-gen4: Add support for fractional multiplication
Date: Mon, 22 Jul 2024 13:50:25 +0200
Message-Id: <1a58ebef6f54460f49fb81ba9bbf288164de2646.1721648548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721648548.git.geert+renesas@glider.be>
References: <cover.1721648548.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen4 PLLs support fractional multiplication, which can improve
accuracy when configuring a specific frequency.

Add support for fractional multiplication to the custom clock driver
for PLLs, which is currently used only for PLL2 on R-Car V4H.
While at it, add the missing blank line after the function.

Note that Fractional Multiplication is not enabled by the driver,
but used only if the boot loaded enabled it before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by,
  - Use mul_u64_u32_shr() helper,
  - Use div64_ul() for remaining 64-by-unsigned-long divisions to fix
    32-bit compile-test failures.

v1:
  - Drop unused variable error,
  - Add missing register field write of CPG_PLLxCR1_NF in
    cpg_pll_clk_set_rate(),
  - Do not enable Fractional Multiplication unconditionally,
  - Adapt to "8_25" naming,
  - Add missing blank line.

Initial version was "[PATCH 2/3] clk: renesas: rcar-gen4: Add support
for fractional multiplication", which was deemed not useful at that
time, due to the limited accuracy improvements[1].  However, this is
needed for reading the current configuration from the hardware.

[1] https://lore.kernel.org/all/a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be/
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 71 ++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index ae18470d9732ec3a..8bc96f22e41fdfca 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -54,6 +54,7 @@ static u32 cpg_mode __initdata;
 
 /* Fractional 8.25 PLL */
 #define CPG_PLLxCR0_NI8		GENMASK(27, 20)	/* Integer mult. factor */
+#define CPG_PLLxCR1_NF25	GENMASK(24, 0)	/* Fractional mult. factor */
 
 #define CPG_PLLxCR_STC		GENMASK(30, 24)	/* R_Car V3U PLLxCR */
 
@@ -67,6 +68,7 @@ static u32 cpg_mode __initdata;
 struct cpg_pll_clk {
 	struct clk_hw hw;
 	void __iomem *pllcr0_reg;
+	void __iomem *pllcr1_reg;
 	void __iomem *pllecr_reg;
 	u32 pllecr_pllst_mask;
 };
@@ -77,17 +79,26 @@ static unsigned long cpg_pll_8_25_clk_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
-	unsigned int mult;
-
-	mult = FIELD_GET(CPG_PLLxCR0_NI8, readl(pll_clk->pllcr0_reg)) + 1;
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
+	unsigned int ni, nf;
+	unsigned long rate;
+
+	ni = (FIELD_GET(CPG_PLLxCR0_NI8, cr0) + 1) * 2;
+	rate = parent_rate * ni;
+	if (cr0 & CPG_PLLxCR0_SSMODE_FM) {
+		nf = FIELD_GET(CPG_PLLxCR1_NF25, readl(pll_clk->pllcr1_reg));
+		rate += mul_u64_u32_shr(parent_rate, nf, 24);
+	}
 
-	return parent_rate * mult * 2;
+	return rate;
 }
 
 static int cpg_pll_8_25_clk_determine_rate(struct clk_hw *hw,
 					   struct clk_rate_request *req)
 {
-	unsigned int min_mult, max_mult, mult;
+	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
+	unsigned int min_mult, max_mult, ni, nf;
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
 	unsigned long prate;
 
 	prate = req->best_parent_rate * 2;
@@ -96,10 +107,23 @@ static int cpg_pll_8_25_clk_determine_rate(struct clk_hw *hw,
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
+			nf = div64_ul((u64)(req->rate - prate * ni) << 24,
+				      req->best_parent_rate);
+		}
+	} else {
+		ni = DIV_ROUND_CLOSEST_ULL(req->rate, prate);
+		ni = clamp(ni, min_mult, max_mult);
+		nf = 0;
+	}
+	req->rate = prate * ni + mul_u64_u32_shr(req->best_parent_rate, nf, 24);
 
-	req->rate = prate * mult;
 	return 0;
 }
 
@@ -107,17 +131,34 @@ static int cpg_pll_8_25_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
-	unsigned int mult;
+	unsigned long prate = parent_rate * 2;
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
+	unsigned int ni, nf;
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
+			nf = div64_ul((u64)(rate - prate * ni) << 24,
+				      parent_rate);
+		}
+	} else {
+		ni = DIV_ROUND_CLOSEST_ULL(rate, prate);
+		ni = clamp(ni, 1U, 256U);
+	}
 
 	if (readl(pll_clk->pllcr0_reg) & CPG_PLLxCR0_KICK)
 		return -EBUSY;
 
 	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI8,
-		       FIELD_PREP(CPG_PLLxCR0_NI8, mult - 1));
+		       FIELD_PREP(CPG_PLLxCR0_NI8, ni - 1));
+	if (cr0 & CPG_PLLxCR0_SSMODE_FM)
+		cpg_reg_modify(pll_clk->pllcr1_reg, CPG_PLLxCR1_NF25,
+			       FIELD_PREP(CPG_PLLxCR1_NF25, nf));
 
 	/*
 	 * Set KICK bit in PLLxCR0 to update hardware setting and wait for
@@ -167,19 +208,17 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 
 	pll_clk->hw.init = &init;
 	pll_clk->pllcr0_reg = base + cr0_offset;
+	pll_clk->pllcr1_reg = base + cr1_offset;
 	pll_clk->pllecr_reg = base + CPG_PLLECR;
 	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
 
-	/* Disable Fractional Multiplication and Frequency Dithering */
-	writel(0, base + cr1_offset);
-	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_SSMODE, 0);
-
 	clk = clk_register(NULL, &pll_clk->hw);
 	if (IS_ERR(clk))
 		kfree(pll_clk);
 
 	return clk;
 }
+
 /*
  * Z0 Clock & Z1 Clock
  */
-- 
2.34.1


