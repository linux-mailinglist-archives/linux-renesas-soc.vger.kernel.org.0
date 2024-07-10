Return-Path: <linux-renesas-soc+bounces-7226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A3F92D261
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 15:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 261412802A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871D2192B71;
	Wed, 10 Jul 2024 13:10:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B019248A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617054; cv=none; b=SPOS0Th8xIYHjyPsqOvI2LlTF2Err58J6RS+xCeXFFtqh9DGa9ACXXyhyatMXqRfPcg8TH/RECIvPxV5apHUkvJuMRP+kN/Y3h1Lb/Gf8XV1983Jj9aetuQ7Ioc3Zf0ZtWMlZMgKQkQ89cbcVJD+8Gs2CY9hRSmuLAvTsDo2QsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617054; c=relaxed/simple;
	bh=KsuUndYJ7Itbt5bOzufgL1SLDka5p03JjfsGb7E9M54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWdcKddm5ALER8R//ycaRYs3JD8SsTkxcKXFxN6x/1xsaV5qXsQYGKw/HQ4adnV9JJk6EPQ3UOI/FDYXtLjq6oZEyCKraiVUH4tMDvEWAK+I++c03mS+AWeTCDf3vu8vn7IJLTf3K9BLVR/nyer+Vb0qXTb0q4KsJ9UNuNmBQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by xavier.telenet-ops.be with bizsmtp
	id lpAp2C00J4znMfS01pApdw; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cTJ-ST;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQBt-Fa;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/14] clk: renesas: rcar-gen4: Add support for fractional multiplication
Date: Wed, 10 Jul 2024 15:10:39 +0200
Message-Id: <3b3e769977dba9c487ec12cf9594e99af4eaceb7.1720616233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720616233.git.geert+renesas@glider.be>
References: <cover.1720616233.git.geert+renesas@glider.be>
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
---
This is v2 of "[PATCH 2/3] clk: renesas: rcar-gen4: Add support for
fractional multiplication", which was deemed not useful at that time,
due to the limited accuracy improvements[1].  However, this is needed
for using the current configuration from the hardware.

v2:
  - Drop unused variable error,
  - Add missing register field write of CPG_PLLxCR1_NF in
    cpg_pll_clk_set_rate(),
  - Do not enable Fractional Multiplication unconditionally,
  - Adapt to "8_25" naming,
  - Add missing blank line.

[1] https://lore.kernel.org/all/a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be/
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 70 ++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index ae18470d9732ec3a..7232c81bfcc7a5b7 100644
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
+		rate += ((u64)parent_rate * nf) >> 24;
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
 
@@ -107,17 +131,33 @@ static int cpg_pll_8_25_clk_set_rate(struct clk_hw *hw, unsigned long rate,
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
+			nf = ((u64)(rate - prate * ni) << 24) / parent_rate;
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
@@ -167,19 +207,17 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 
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


