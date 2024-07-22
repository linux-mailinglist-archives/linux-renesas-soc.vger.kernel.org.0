Return-Path: <linux-renesas-soc+bounces-7424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD0938EA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9E2281CBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776DB16D326;
	Mon, 22 Jul 2024 11:59:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9416D32E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649562; cv=none; b=lNwCXK+FPOw++kk6FIU1TK0zX1vMwl7QctBnDDBZIsMlEWIcqrWqjtE8z1hXu5XGy5wmha0WiFTWB5D3tKwHD8wfXo+RJitaSKw0BhUKSNALtYuvJXXdVQItaiz81MdQhvMr2wagMM/GkHmVhi/B3wlxJCtAVP1dm992LAFHDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649562; c=relaxed/simple;
	bh=WhS+e4OTvpdgIKAx5FQ094xqM9rumMs4oRti4M3siUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jmes9QjEadDEcOXPbahBZ/HfcFrtm5KlQy+I/3C0zUaGPvI2JEKbboyOc6GEhcWQOV8mMxbt96mJlCTDa3b2bTh7ITewqI5WKpbL6PQU02x21CAho4f53xpdadGX0Fai2vTLxfNFPPc7l58WKTAiEnc0rHCfsd1wLVVAW6tZo6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2lRpz4x1mb
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by andre.telenet-ops.be with bizsmtp
	id qbqc2C00Z1wvoRx01bqclB; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAV-7j;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hq-Mf;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 06/15] clk: renesas: rcar-gen4: Add support for variable fractional PLLs
Date: Mon, 22 Jul 2024 13:50:26 +0200
Message-Id: <84ead759782560ec5643711e6bdd787a751053ce.1721648548.git.geert+renesas@glider.be>
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

The custom clock driver that models PLL clocks on R-Car Gen4 supports
PLL2 on R-Car V4H/V4M only, while PLL3, PLL4, and PLL6 use the same
control register layout.

Extend the existing support to PLL3, PLL4, and PLL6, and introduce a new
clock type and helper macro to describe these PLLs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 21 ++++++++++++++-------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ++++
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 8bc96f22e41fdfca..7f95231ccee8bd11 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -188,13 +188,16 @@ static const struct clk_ops cpg_pll_v8_25_clk_ops = {
 static struct clk * __init cpg_pll_clk_register(const char *name,
 						const char *parent_name,
 						void __iomem *base,
-						unsigned int cr0_offset,
-						unsigned int cr1_offset,
 						unsigned int index)
-
 {
-	struct cpg_pll_clk *pll_clk;
+	static const struct { u16 cr0, cr1; } pll_cr_offsets[] __initconst = {
+		[2 - 2] = { CPG_PLL2CR0, CPG_PLL2CR1 },
+		[3 - 2] = { CPG_PLL3CR0, CPG_PLL3CR1 },
+		[4 - 2] = { CPG_PLL4CR0, CPG_PLL4CR1 },
+		[6 - 2] = { CPG_PLL6CR0, CPG_PLL6CR1 },
+	};
 	struct clk_init_data init = {};
+	struct cpg_pll_clk *pll_clk;
 	struct clk *clk;
 
 	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
@@ -207,8 +210,8 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 	init.num_parents = 1;
 
 	pll_clk->hw.init = &init;
-	pll_clk->pllcr0_reg = base + cr0_offset;
-	pll_clk->pllcr1_reg = base + cr1_offset;
+	pll_clk->pllcr0_reg = base + pll_cr_offsets[index - 2].cr0;
+	pll_clk->pllcr1_reg = base + pll_cr_offsets[index - 2].cr1;
 	pll_clk->pllecr_reg = base + CPG_PLLECR;
 	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
 
@@ -410,7 +413,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		 * modes.
 		 */
 		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
-					    base, CPG_PLL2CR0, CPG_PLL2CR1, 2);
+					    base, 2);
 
 	case CLK_TYPE_GEN4_PLL2:
 		mult = cpg_pll_config->pll2_mult;
@@ -442,6 +445,10 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		mult = (FIELD_GET(CPG_PLLxCR_STC, value) + 1) * 2;
 		break;
 
+	case CLK_TYPE_GEN4_PLL_V8_25:
+		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
+					    base, core->offset);
+
 	case CLK_TYPE_GEN4_Z:
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
 					  base, core->div, core->offset);
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index a277cf0598c4e667..d02e61911bfc6903 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -19,6 +19,7 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_PLL4,
 	CLK_TYPE_GEN4_PLL5,
 	CLK_TYPE_GEN4_PLL6,
+	CLK_TYPE_GEN4_PLL_V8_25,	/* Variable fractional 8.25 PLL */
 	CLK_TYPE_GEN4_SDSRC,
 	CLK_TYPE_GEN4_SDH,
 	CLK_TYPE_GEN4_SD,
@@ -47,6 +48,9 @@ enum rcar_gen4_clk_types {
 #define DEF_GEN4_OSC(_name, _id, _parent, _div)		\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_OSC, _parent, .div = _div)
 
+#define DEF_GEN4_PLL_V8_25(_name, _idx, _id, _parent)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_V8_25, _parent, .offset = _idx)
+
 #define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)	\
 	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
 
-- 
2.34.1


