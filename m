Return-Path: <linux-renesas-soc+bounces-7412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDDE938E60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3889B21325
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728BD16C6B2;
	Mon, 22 Jul 2024 11:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5E616D318
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649047; cv=none; b=AMSyBKDGfGZbg6B6g7mDXfDOLrbBbJBY56MfVwOsb6uhTkd6UZEY2PCbQlcagjzpkUoIRqHB5CTm7q2IQZCda9RDEPaUCULYoZ0+1Y1uqu7PcAd+Oahs98/XkKNH7xcLQb8d+ZEtso3BfLzI+Eg5MAyNersYgnwXbDjPz7C8dJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649047; c=relaxed/simple;
	bh=ufDf9sUJqnKGCfA7UHR+T+raR9P7V2MQBxiJU+xPtvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K9stlLsxjY9g+C3Ug1Et3sbmc5NeuGxcn3vB852hIzZJy0ySRFy8IMd7/Y/5ilzIHkgIF5n4AalnO2LBb9fkcXcAtbCL7G2LL+pSGeWj5pwYEad8Jk9M5IyX4ZVvQta0rWoej7upvwwU9SBD4AwUit8cUeomAR4jXJ59ghb4Yw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by albert.telenet-ops.be with bizsmtp
	id qbqd2C0091wvoRx06bqdvh; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zB9-FK;
	Mon, 22 Jul 2024 13:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020ib-Vg;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 15/15] clk: renesas: rcar-gen4: Remove unused default PLL2/3/4/6 configs
Date: Mon, 22 Jul 2024 13:50:35 +0200
Message-Id: <d13526a86066992d6afdf9bee7c1a18da72f914f.1721648548.git.geert+renesas@glider.be>
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

The default PLL2/3/4/6 multiplier and divider configurations are no
longer used after the conversion to fixed or variable fractional PLL
clock types.

Note that the default configurations are still documented in the
comments above the individual rcar_gen4_cpg_pll_config instances.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 10 +++++-----
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 10 +++++-----
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 10 +++++-----
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 10 +++++-----
 drivers/clk/renesas/rcar-gen4-cpg.h     |  8 --------
 5 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index e6e2c3c16c8d5bef..4c8e4c69c1bfaaa0 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -259,11 +259,11 @@ static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
 static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
-	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
-	{ 1,		128,	1,	0,	0,	0,	0,	144,	1,	192,	1,	0,	0,	16,	},
-	{ 1,		106,	1,	0,	0,	0,	0,	120,	1,	160,	1,	0,	0,	19,	},
-	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
-	{ 2,		128,	1,	0,	0,	0,	0,	144,	1,	192,	1,	0,	0,	32,	},
+	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
+	{ 1,		128,	1,	192,	1,	16,	},
+	{ 1,		106,	1,	160,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	},
+	{ 2,		128,	1,	192,	1,	32,	},
 };
 
 
diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index b6b6012f71238627..f33342314b2ef99e 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -188,11 +188,11 @@ static const unsigned int r8a779f0_crit_mod_clks[] __initconst = {
 					 (((md) & BIT(13)) >> 13))
 
 static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
-	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
-	{ 1,		200,	1,	150,	1,	200,	1,	0,	0,	200,	1,	134,	1,	15,	},
-	{ 1,		160,	1,	120,	1,	160,	1,	0,	0,	160,	1,	106,	1,	19,	},
-	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
-	{ 2,		160,	1,	120,	1,	160,	1,	0,	0,	160,	1,	106,	1,	38,	},
+	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
+	{ 1,		200,	1,	200,	1,	15,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	},
+	{ 2,		160,	1,	160,	1,	38,	},
 };
 
 static int __init r8a779f0_cpg_mssr_init(struct device *dev)
diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 901a86c6432298ed..55c8dd032fc325c6 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -259,11 +259,11 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 					 (((md) & BIT(13)) >> 13))
 
 static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
-	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
-	{ 1,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	16,	},
-	{ 1,		160,	1,	170,	1,	160,	1,	120,	1,	160,	1,	140,	1,	19,	},
-	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
-	{ 2,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	32,	},
+	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	},
+	{ 2,		192,	1,	192,	1,	32,	},
 };
 
 static int __init r8a779g0_cpg_mssr_init(struct device *dev)
diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 389d4054a514e00d..67c45d14218411f5 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -255,11 +255,11 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 					 (((md) & BIT(13)) >> 13))
 
 static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
-	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
-	{ 1,		192,	1,	240,	1,	192,	1,	240,	1,	192,	1,	168,	1,	16,	},
-	{ 1,		160,	1,	200,	1,	160,	1,	200,	1,	160,	1,	140,	1,	19,	},
-	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
-	{ 2,		192,	1,	240,	1,	192,	1,	240,	1,	192,	1,	168,	1,	32,	},
+	/* EXTAL div	PLL1 mult/div	PLL5 mult/div	OSC prediv */
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	},
+	{ 2,		192,	1,	192,	1,	32,	},
 };
 
 static int __init r8a779h0_cpg_mssr_init(struct device *dev)
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index fccc3090c7c34b70..717fd148464fed96 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -65,16 +65,8 @@ struct rcar_gen4_cpg_pll_config {
 	u8 extal_div;
 	u8 pll1_mult;
 	u8 pll1_div;
-	u8 pll2_mult;
-	u8 pll2_div;
-	u8 pll3_mult;
-	u8 pll3_div;
-	u8 pll4_mult;
-	u8 pll4_div;
 	u8 pll5_mult;
 	u8 pll5_div;
-	u8 pll6_mult;
-	u8 pll6_div;
 	u8 osc_prediv;
 };
 
-- 
2.34.1


