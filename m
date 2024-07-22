Return-Path: <linux-renesas-soc+bounces-7410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57599938E57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A87281DE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C65016D31F;
	Mon, 22 Jul 2024 11:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65316C85E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649047; cv=none; b=PNyWCcgj/ycOSC+7hNAfguMCl5cXvMC1SBsiycmKRjTgNTR4cTZhBmoIjlAzR2cU2rbtgWWo2lhjDDjgwGzKWqkdv9u751HebhGjt5cYCup5FcbgrjF58rRQhYwQJrGPLfeXRxGmyNJExGsheaYjKIkJaM4i2mzTcEDfKsxmvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649047; c=relaxed/simple;
	bh=ZX3grEU+tt+E//XYL2SwJpwtQjk9lDIb14yvI9TBuK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AKOuMai+HwEBSMBISKPrCYLdhbt0uevR1JiwSnuImbW6c8l86+kjJf2JF0oIoPGFmN5NggNA1fJaT5vJTSc4Tx9aMb86JcoiCSMGkENj0uDYBAPUfXQMW0xUlzVgbo17SgpICv3Ir2agpEG7TfSQblbeLGuyb9X6pjxuXnu7hyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by xavier.telenet-ops.be with bizsmtp
	id qbqc2C00S1wvoRx01bqc6M; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAH-3n;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hZ-JJ;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 02/15] clk: renesas: rcar-gen4: Clarify custom PLL clock support
Date: Mon, 22 Jul 2024 13:50:22 +0200
Message-Id: <2ce9f9c75bfb6312129d416672f9691bbd11c0e7.1721648548.git.geert+renesas@glider.be>
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

The custom clock driver that models the PLL clocks on R-Car Gen4 assumes
the integer and fractional[*] multiplication field sizes as used on
R-Car V4H and V4M, representing a fractional 8.25 number.

Rename the related definitions, functions, and structures to clarify
this, and to prepare for the advent of support for the different field
sizes on R-Car S4-8.

[*] The fractional part is not yet supported.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 32 +++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 72c740f18ac9b370..cd8799e04b37556e 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -45,7 +45,6 @@ static u32 cpg_mode __initdata;
 #define CPG_PLL6CR1		0x8d8
 
 #define CPG_PLLxCR0_KICK	BIT(31)
-#define CPG_PLLxCR0_NI		GENMASK(27, 20)	/* Integer mult. factor */
 #define CPG_PLLxCR0_SSMODE	GENMASK(18, 16)	/* PLL mode */
 #define CPG_PLLxCR0_SSMODE_FM	BIT(18)	/* Fractional Multiplication */
 #define CPG_PLLxCR0_SSMODE_DITH	BIT(17) /* Frequency Dithering */
@@ -53,6 +52,9 @@ static u32 cpg_mode __initdata;
 #define CPG_PLLxCR0_SSFREQ	GENMASK(14, 8)	/* SSCG Modulation Frequency */
 #define CPG_PLLxCR0_SSDEPT	GENMASK(6, 0)	/* SSCG Modulation Depth */
 
+/* Fractional 8.25 PLL */
+#define CPG_PLLxCR0_NI8		GENMASK(27, 20)	/* Integer mult. factor */
+
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
@@ -63,19 +65,19 @@ struct cpg_pll_clk {
 
 #define to_pll_clk(_hw)   container_of(_hw, struct cpg_pll_clk, hw)
 
-static unsigned long cpg_pll_clk_recalc_rate(struct clk_hw *hw,
-					     unsigned long parent_rate)
+static unsigned long cpg_pll_8_25_clk_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
 	unsigned int mult;
 
-	mult = FIELD_GET(CPG_PLLxCR0_NI, readl(pll_clk->pllcr0_reg)) + 1;
+	mult = FIELD_GET(CPG_PLLxCR0_NI8, readl(pll_clk->pllcr0_reg)) + 1;
 
 	return parent_rate * mult * 2;
 }
 
-static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
+static int cpg_pll_8_25_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	unsigned int min_mult, max_mult, mult;
 	unsigned long prate;
@@ -93,8 +95,8 @@ static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long parent_rate)
+static int cpg_pll_8_25_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
 	unsigned int mult;
@@ -106,8 +108,8 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (readl(pll_clk->pllcr0_reg) & CPG_PLLxCR0_KICK)
 		return -EBUSY;
 
-	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI,
-		       FIELD_PREP(CPG_PLLxCR0_NI, mult - 1));
+	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI8,
+		       FIELD_PREP(CPG_PLLxCR0_NI8, mult - 1));
 
 	/*
 	 * Set KICK bit in PLLxCR0 to update hardware setting and wait for
@@ -128,10 +130,10 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				  val & pll_clk->pllecr_pllst_mask, 0, 1000);
 }
 
-static const struct clk_ops cpg_pll_clk_ops = {
-	.recalc_rate = cpg_pll_clk_recalc_rate,
-	.determine_rate = cpg_pll_clk_determine_rate,
-	.set_rate = cpg_pll_clk_set_rate,
+static const struct clk_ops cpg_pll_v8_25_clk_ops = {
+	.recalc_rate = cpg_pll_8_25_clk_recalc_rate,
+	.determine_rate = cpg_pll_8_25_clk_determine_rate,
+	.set_rate = cpg_pll_8_25_clk_set_rate,
 };
 
 static struct clk * __init cpg_pll_clk_register(const char *name,
@@ -151,7 +153,7 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	init.ops = &cpg_pll_clk_ops;
+	init.ops = &cpg_pll_v8_25_clk_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-- 
2.34.1


