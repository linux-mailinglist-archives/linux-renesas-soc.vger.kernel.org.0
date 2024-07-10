Return-Path: <linux-renesas-soc+bounces-7239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224392D279
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 15:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 390ED1F2353A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 13:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253BE192B79;
	Wed, 10 Jul 2024 13:11:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6F192B63
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617060; cv=none; b=KrCuPgv8lJvaUd09rPdO1qDKMq6UuT3vsTHzyi4jIZdmJ39pV0tcb1DOwrjX1sn675i9EfL1ogkas0bOwDEe8OCeNWW0Ipk1H6Ge9qDGPXjYjOByIob9qeTKwAdM20j1SrCRG56WudufITE4iQuwLLh8VDrKgZ40YphWngda3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617060; c=relaxed/simple;
	bh=b6b51GNmHQ67yEjUMAeommEH52CiC+SLkLfXplZnMTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkKMce1gK3gjmk3rtdMt50M2oUuDazhpRZ4JHGOpWMYTjT4YYQU3b55i3H93LfL1H24OGy3GPml1vXdAvyPajKCkTWMTDcj1i4Bc+CI/akhfPCFpd4ID7tFxFu7JF+GmeovE15QAsnEKFXxOxtNp+JQ/Yb46B5yIM25jGmAYc2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by michel.telenet-ops.be with bizsmtp
	id lpAp2C00K4znMfS06pApkQ; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cTO-TP;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQBz-GP;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/14] clk: renesas: rcar-gen4: Add support for variable fractional PLLs
Date: Wed, 10 Jul 2024 15:10:40 +0200
Message-Id: <f99715c0c1cd92ab8e735def06a1f5456c6405aa.1720616233.git.geert+renesas@glider.be>
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

The custom clock driver that models PLL clocks on R-Car Gen4 supports
PLL2 on R-Car V4H/V4M only, while PLL3, PLL4, and PLL6 use the same
control register layout.

Extend the existing support to PLL3, PLL4, and PLL6, and introduce a new
clock type and helper macro to describe these PLLs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 21 ++++++++++++++-------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ++++
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 7232c81bfcc7a5b7..a9a53f3d22afbb50 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -187,13 +187,16 @@ static const struct clk_ops cpg_pll_v8_25_clk_ops = {
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
@@ -206,8 +209,8 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 	init.num_parents = 1;
 
 	pll_clk->hw.init = &init;
-	pll_clk->pllcr0_reg = base + cr0_offset;
-	pll_clk->pllcr1_reg = base + cr1_offset;
+	pll_clk->pllcr0_reg = base + pll_cr_offsets[index - 2].cr0;
+	pll_clk->pllcr1_reg = base + pll_cr_offsets[index - 2].cr1;
 	pll_clk->pllecr_reg = base + CPG_PLLECR;
 	pll_clk->pllecr_pllst_mask = CPG_PLLECR_PLLST(index);
 
@@ -409,7 +412,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		 * modes.
 		 */
 		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
-					    base, CPG_PLL2CR0, CPG_PLL2CR1, 2);
+					    base, 2);
 
 	case CLK_TYPE_GEN4_PLL2:
 		mult = cpg_pll_config->pll2_mult;
@@ -441,6 +444,10 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
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
index 748c69240dae755f..4b2516def5b41385 100644
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


