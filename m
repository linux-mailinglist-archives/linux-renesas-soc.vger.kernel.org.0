Return-Path: <linux-renesas-soc+bounces-7422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45F938EAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 075A6B2151C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866A516D4C0;
	Mon, 22 Jul 2024 11:59:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDEB16D336
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649561; cv=none; b=tjTmJrZpbswBXuSgIUlhdBBpTvFrKDNZENNyHwSEnssQC+w4G8XCvpJ3Iy5+EHdqxsSTBADZciyFXHitTgv6OuHr1rNsP8xmbBpAanVRiV4/PBG3QSRLvBUE7eH+lQPFtYTHItZvaXHIcyum1mWe84DG0CXkNTqgZzEKf7f/gZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649561; c=relaxed/simple;
	bh=8U3u7BoHRxrPD/0hWwjxR96LqWrmFxBmXeZ9uUtonjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAywkMfpL60Aa5QGhwP6lJ3jIJsH7ZooAirINb+ol4tqarBvXL/8LMl2E3rWp6ve5Y9HdNIUDvr4R2LGmyQjOgfjs6o07GBA0ZtFe+B3bE+SW9ktIQG0tAgDiaqcxNCEFbTDxZNA223qhpcDskXwO5fonBYiWGGQ1121xckcItw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2jvyz4x1mT
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by laurent.telenet-ops.be with bizsmtp
	id qbqc2C00R1wvoRx01bqcR5; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAc-7r;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hu-NH;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 07/15] clk: renesas: rcar-gen4: Add support for fixed variable PLLs
Date: Mon, 22 Jul 2024 13:50:27 +0200
Message-Id: <841fbb63d472c357b3ce291a5991db3b847f96d8.1721648548.git.geert+renesas@glider.be>
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
variable clocks, while PLL1 uses a similar control register layout, but
is read-only.

Extend the existing support to fixed clocks and PLL1, and introduce a
new clock type and helper macro to describe a fixed PLL.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 32 ++++++++++++++++++++---------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ++++
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 7f95231ccee8bd11..1f3dddbd294a572b 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -179,6 +179,10 @@ static int cpg_pll_8_25_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				  val & pll_clk->pllecr_pllst_mask, 0, 1000);
 }
 
+static const struct clk_ops cpg_pll_f8_25_clk_ops = {
+	.recalc_rate = cpg_pll_8_25_clk_recalc_rate,
+};
+
 static const struct clk_ops cpg_pll_v8_25_clk_ops = {
 	.recalc_rate = cpg_pll_8_25_clk_recalc_rate,
 	.determine_rate = cpg_pll_8_25_clk_determine_rate,
@@ -188,13 +192,15 @@ static const struct clk_ops cpg_pll_v8_25_clk_ops = {
 static struct clk * __init cpg_pll_clk_register(const char *name,
 						const char *parent_name,
 						void __iomem *base,
-						unsigned int index)
+						unsigned int index,
+						const struct clk_ops *ops)
 {
 	static const struct { u16 cr0, cr1; } pll_cr_offsets[] __initconst = {
-		[2 - 2] = { CPG_PLL2CR0, CPG_PLL2CR1 },
-		[3 - 2] = { CPG_PLL3CR0, CPG_PLL3CR1 },
-		[4 - 2] = { CPG_PLL4CR0, CPG_PLL4CR1 },
-		[6 - 2] = { CPG_PLL6CR0, CPG_PLL6CR1 },
+		[1 - 1] = { CPG_PLL1CR0, CPG_PLL1CR1 },
+		[2 - 1] = { CPG_PLL2CR0, CPG_PLL2CR1 },
+		[3 - 1] = { CPG_PLL3CR0, CPG_PLL3CR1 },
+		[4 - 1] = { CPG_PLL4CR0, CPG_PLL4CR1 },
+		[6 - 1] = { CPG_PLL6CR0, CPG_PLL6CR1 },
 	};
 	struct clk_init_data init = {};
 	struct cpg_pll_clk *pll_clk;
@@ -205,13 +211,13 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	init.ops = &cpg_pll_v8_25_clk_ops;
+	init.ops = ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
 	pll_clk->hw.init = &init;
-	pll_clk->pllcr0_reg = base + pll_cr_offsets[index - 2].cr0;
-	pll_clk->pllcr1_reg = base + pll_cr_offsets[index - 2].cr1;
+	pll_clk->pllcr0_reg = base + pll_cr_offsets[index - 1].cr0;
+	pll_clk->pllcr1_reg = base + pll_cr_offsets[index - 1].cr1;
 	pll_clk->pllecr_reg = base + CPG_PLLECR;
 	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
 
@@ -413,7 +419,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		 * modes.
 		 */
 		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
-					    base, 2);
+					    base, 2, &cpg_pll_v8_25_clk_ops);
 
 	case CLK_TYPE_GEN4_PLL2:
 		mult = cpg_pll_config->pll2_mult;
@@ -445,9 +451,15 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		mult = (FIELD_GET(CPG_PLLxCR_STC, value) + 1) * 2;
 		break;
 
+	case CLK_TYPE_GEN4_PLL_F8_25:
+		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
+					    base, core->offset,
+					    &cpg_pll_f8_25_clk_ops);
+
 	case CLK_TYPE_GEN4_PLL_V8_25:
 		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
-					    base, core->offset);
+					    base, core->offset,
+					    &cpg_pll_v8_25_clk_ops);
 
 	case CLK_TYPE_GEN4_Z:
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index d02e61911bfc6903..69436309f19dfff2 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -19,6 +19,7 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_PLL4,
 	CLK_TYPE_GEN4_PLL5,
 	CLK_TYPE_GEN4_PLL6,
+	CLK_TYPE_GEN4_PLL_F8_25,	/* Fixed fractional 8.25 PLL */
 	CLK_TYPE_GEN4_PLL_V8_25,	/* Variable fractional 8.25 PLL */
 	CLK_TYPE_GEN4_SDSRC,
 	CLK_TYPE_GEN4_SDH,
@@ -48,6 +49,9 @@ enum rcar_gen4_clk_types {
 #define DEF_GEN4_OSC(_name, _id, _parent, _div)		\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_OSC, _parent, .div = _div)
 
+#define DEF_GEN4_PLL_F8_25(_name, _idx, _id, _parent)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_F8_25, _parent, .offset = _idx)
+
 #define DEF_GEN4_PLL_V8_25(_name, _idx, _id, _parent)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_V8_25, _parent, .offset = _idx)
 
-- 
2.34.1


