Return-Path: <linux-renesas-soc+bounces-7238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99792D278
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 15:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745CD1F2391B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 13:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D95192B83;
	Wed, 10 Jul 2024 13:10:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2E192B61
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617059; cv=none; b=SBog/2LBU447q7EbIP8lTweMl1MEYznNusb5m3FdPUy+HxqnMSUmmI57AVOw+4YPvB27hjlUr8w1FRd4SUC+ln9gGLOhUPvUiv50n8/J9gWlmcDr5jJJ9ZIWMFwulb2l/8jNDFTpvz6IVnzO22nKPgZswiR2d27pkjpQhhupowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617059; c=relaxed/simple;
	bh=xyE5298Fmw9GhLXSSQITyN/4JKUWljBmdjAFpdpNRcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nj1ErhKacW+bzKJZNrzaXQFK5g2j7PfA3CeX0iISEO2ir4v/OH77R8wubRqzQHqeGgFL+aN25mCAfOGITIO4YkIK9YDYt0fH59Au9/QbqvqTpcjlGhjtboCOjuHOjs0jaS61D53WVQViYYa1YxtRFlkbhF5QLb40Rw3F01L409c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by baptiste.telenet-ops.be with bizsmtp
	id lpAp2C00W4znMfS01pApdB; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cTX-Vj;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQC9-I5;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/14] clk: renesas: rcar-gen4: Add support for fractional 9.24 PLLs
Date: Wed, 10 Jul 2024 15:10:42 +0200
Message-Id: <0ecbaeea3bb77c6cd0d3cffd940ced9268906c13.1720616233.git.geert+renesas@glider.be>
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

The custom clock driver that models the PLL clocks on R-Car Gen4
supports only fractional 8.25 PLLs, as used on R-Car V4H/V4M.
R-Car S4-8 uses integer and fractional multiplication fields that are
one bit larger resp. smaller, and a slightly different formula.

Extend the existing support to fractional 9.24 PLL, and introduce new
clock types and helper macros to describe these PLLs.

Note that there is no use case for variable fractional 9.24 PLLs yet, as
the Cortex-A55 cores on R-Car S4-8 do not support High Performance mode.
Hence the PLL is always modeled as a fixed PLL, regardless of the
description,

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 36 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h |  8 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index b547d2c782446d50..440d930dd84c9b49 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -56,6 +56,10 @@ static u32 cpg_mode __initdata;
 #define CPG_PLLxCR0_NI8		GENMASK(27, 20)	/* Integer mult. factor */
 #define CPG_PLLxCR1_NF25	GENMASK(24, 0)	/* Fractional mult. factor */
 
+/* Fractional 9.24 PLL */
+#define CPG_PLLxCR0_NI9		GENMASK(28, 20)	/* Integer mult. factor */
+#define CPG_PLLxCR1_NF24	GENMASK(23, 0)	/* Fractional mult. factor */
+
 #define CPG_PLLxCR_STC		GENMASK(30, 24)	/* R_Car V3U PLLxCR */
 
 #define CPG_RPCCKCR		0x874	/* RPC Clock Freq. Control Register */
@@ -188,6 +192,30 @@ static const struct clk_ops cpg_pll_v8_25_clk_ops = {
 	.set_rate = cpg_pll_8_25_clk_set_rate,
 };
 
+static unsigned long cpg_pll_9_24_clk_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
+	u32 cr0 = readl(pll_clk->pllcr0_reg);
+	unsigned int ni, nf;
+	unsigned long rate;
+
+	ni = FIELD_GET(CPG_PLLxCR0_NI9, cr0) + 1;
+	rate = parent_rate * ni;
+	if (cr0 & CPG_PLLxCR0_SSMODE_FM) {
+		nf = FIELD_GET(CPG_PLLxCR1_NF24, readl(pll_clk->pllcr1_reg));
+		rate += ((u64)parent_rate * nf) >> 24;
+	} else {
+		rate *= 2;
+	}
+
+	return rate;
+}
+
+static const struct clk_ops cpg_pll_f9_24_clk_ops = {
+	.recalc_rate = cpg_pll_9_24_clk_recalc_rate,
+};
+
 static struct clk * __init cpg_pll_clk_register(const char *name,
 						const char *parent_name,
 						void __iomem *base,
@@ -460,6 +488,14 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 					    base, core->offset,
 					    &cpg_pll_v8_25_clk_ops);
 
+	case CLK_TYPE_GEN4_PLL_V9_24:
+		/* Variable fractional 9.24 is not yet supported, using fixed */
+		fallthrough;
+	case CLK_TYPE_GEN4_PLL_F9_24:
+		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
+					    base, core->offset,
+					    &cpg_pll_f9_24_clk_ops);
+
 	case CLK_TYPE_GEN4_Z:
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
 					  base, core->div, core->offset);
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index ec0c650e0f66a625..a4b972fb85ce73ca 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -21,6 +21,8 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_PLL6,
 	CLK_TYPE_GEN4_PLL_F8_25,	/* Fixed fractional 8.25 PLL */
 	CLK_TYPE_GEN4_PLL_V8_25,	/* Variable fractional 8.25 PLL */
+	CLK_TYPE_GEN4_PLL_F9_24,	/* Fixed fractional 9.24 PLL */
+	CLK_TYPE_GEN4_PLL_V9_24,	/* Variable fractional 9.24 PLL */
 	CLK_TYPE_GEN4_SDSRC,
 	CLK_TYPE_GEN4_SDH,
 	CLK_TYPE_GEN4_SD,
@@ -55,6 +57,12 @@ enum rcar_gen4_clk_types {
 #define DEF_GEN4_PLL_V8_25(_name, _idx, _id, _parent)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_V8_25, _parent, .offset = _idx)
 
+#define DEF_GEN4_PLL_F9_24(_name, _idx, _id, _parent)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_F9_24, _parent, .offset = _idx)
+
+#define DEF_GEN4_PLL_V9_24(_name, _idx, _id, _parent)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_V9_24, _parent, .offset = _idx)
+
 #define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)	\
 	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
 
-- 
2.34.1


