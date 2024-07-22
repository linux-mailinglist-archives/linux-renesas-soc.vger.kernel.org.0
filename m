Return-Path: <linux-renesas-soc+bounces-7426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4272A938EAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22321F21DBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1EA16D4C8;
	Mon, 22 Jul 2024 11:59:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F359B16D4C2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649563; cv=none; b=DmI/TMAkBTA6DMS0+QnXBTAqWqVfb81erXdHAYpeTbburgoSzvVAW4QHoCUMXup2U3blDItQszBgqAzUMdlvxaM0ye3ShR27Y8AxL/RL2L3NvbRsG6+tLgcIDR+wnr752EtxqReOH2cAE8sxzTuICkGGhWsHEYiclm87A90pfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649563; c=relaxed/simple;
	bh=cpkPdZg+A+KYO3FY+yO1ed9F4coFyxL8qqcUTSIzXXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IFouMJkd85i8VE3DMFfCiCUwXWw2gBJMsH8finPZXjOpXejS6aUOMJjr53hn8tApOPDQoltnzj+MHpkZuJQa8RGwNtSkkm+ivLc9pxNEwZcHWS5YVz+CYM5EpKSf2j35CvK5vMlg+yslh80QkKN2diFZmMN9l3u7aAJ3LLR8jpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS1sNHz4x1pB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by michel.telenet-ops.be with bizsmtp
	id qbqc2C00H1wvoRx06bqcKl; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAg-8h;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hz-Oq;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 08/15] clk: renesas: rcar-gen4: Add support for fractional 9.24 PLLs
Date: Mon, 22 Jul 2024 13:50:28 +0200
Message-Id: <5684eda1260435c8eceabc274e0b18cb280a6341.1721648548.git.geert+renesas@glider.be>
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
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by,
  - Use mul_u64_u32_shr() helper.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 36 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h |  8 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 1f3dddbd294a572b..d3db602d7c5ec617 100644
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
@@ -189,6 +193,30 @@ static const struct clk_ops cpg_pll_v8_25_clk_ops = {
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
+		rate += mul_u64_u32_shr(parent_rate, nf, 24);
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
@@ -461,6 +489,14 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
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
index 69436309f19dfff2..80a455e62cc1321e 100644
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


