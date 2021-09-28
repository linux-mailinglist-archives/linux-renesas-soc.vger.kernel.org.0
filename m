Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBAB41B80A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 22:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242661AbhI1UKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 16:10:02 -0400
Received: from www.zeus03.de ([194.117.254.33]:60810 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242658AbhI1UKA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 16:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=F1thsflKmOT/E8
        SQOmrJlrSnOmHL/ybqdvsBcndqD9Q=; b=sC/aJdxy0JUYm116Mf6Xf4O1VMD577
        YCkzAYU5SJPxXJ+xfwOchKPifGKz1xZMpmbXpkzw82efe0pdtpsF3uHm//cYIGXW
        fX5Ab9J8I9qUQSrHO0D58wtoqupuj12QUJcJ0rYi8GiC7sxfOUCPfW6Vx4CT04iW
        mMruv9/74UDB4=
Received: (qmail 1377318 invoked from network); 28 Sep 2021 22:08:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 22:08:18 +0200
X-UD-Smtp-Session: l3s3148p1@MjBIxhPNeNIgAwDPXxnDADNsFyRXxb9N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 4/9] clk: renesas: gen3: switch to new SD clock handling
Date:   Tue, 28 Sep 2021 22:07:59 +0200
Message-Id: <20210928200804.50922-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The old SD handling code was huge and could not handle all the details
which showed up on R-Car Gen3 SoCs meanwhile. It is time to switch to
another design. Have SDnH a seperate clock, use the existing divider
clocks and move the errata handling from the clock driver to the SDHI
driver where it belongs.

This patch removes the old SD handling code and switch to the new one.
This updates the SDHI driver at the same time. Because the SDHI driver
can only communitcate with the clock driver via clk_set_rate(), I don't
see an alternative to this flag-day-approach, so we cross subsystems
here.

The patch sadly looks messy for the CPG lib, but it is basically a huge
chunk of code removed and smaller chunks added. It looks much better
when you just view the resulting source file.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c |   6 +-
 drivers/clk/renesas/rcar-cpg-lib.c      | 220 +++---------------------
 drivers/clk/renesas/rcar-cpg-lib.h      |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c     |   5 +-
 drivers/mmc/host/renesas_sdhi.h         |   1 +
 drivers/mmc/host/renesas_sdhi_core.c    |  28 ++-
 6 files changed, 55 insertions(+), 208 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index fb7f0cf2654a..6531f23a4bea 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -303,10 +303,8 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 					   __clk_get_name(parent), notifiers);
 
 	case CLK_TYPE_R8A779A0_SD:
-		return cpg_sd_clk_register(core->name, base, core->offset,
-					   __clk_get_name(parent), notifiers,
-					   false);
-		break;
+		return cpg_sd_clk_register(core->name, base + core->offset,
+					   __clk_get_name(parent));
 
 	case CLK_TYPE_R8A779A0_MDSEL:
 		/*
diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index 351cb9c04f5c..043af5d9239f 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -66,214 +66,46 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
  * SDn Clock
  */
 
-struct clk * __init cpg_sdh_clk_register(const char *name,
-	void __iomem *sdnckcr, const char *parent_name,
-	struct raw_notifier_head *notifiers)
-{
-	/* placeholder during transition */
-	return clk_register_fixed_factor(NULL, name, parent_name, 0, 1, 1);
-}
-
-#define CPG_SD_STP_HCK		BIT(9)
-#define CPG_SD_STP_CK		BIT(8)
-
-#define CPG_SD_STP_MASK		(CPG_SD_STP_HCK | CPG_SD_STP_CK)
-#define CPG_SD_FC_MASK		(0x7 << 2 | 0x3 << 0)
-
-#define CPG_SD_DIV_TABLE_DATA(stp_hck, sd_srcfc, sd_fc, sd_div) \
-{ \
-	.val = ((stp_hck) ? CPG_SD_STP_HCK : 0) | \
-	       ((sd_srcfc) << 2) | \
-	       ((sd_fc) << 0), \
-	.div = (sd_div), \
-}
+#define SDnSRCFC_SHIFT 2
+#define STPnHCK	BIT(9 - SDnSRCFC_SHIFT)
 
-struct sd_div_table {
-	u32 val;
-	unsigned int div;
-};
-
-struct sd_clock {
-	struct clk_hw hw;
-	const struct sd_div_table *div_table;
-	struct cpg_simple_notifier csn;
-	unsigned int div_num;
-	unsigned int cur_div_idx;
-};
-
-/* SDn divider
- *           sd_srcfc   sd_fc   div
- * stp_hck   (div)      (div)     = sd_srcfc x sd_fc
- *---------------------------------------------------------
- *  0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
- *  0         1 (2)      1 (4)      8 : SDR50
- *  1         2 (4)      1 (4)     16 : HS / SDR25
- *  1         3 (8)      1 (4)     32 : NS / SDR12
- *  1         4 (16)     1 (4)     64
- *  0         0 (1)      0 (2)      2
- *  0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
- *  1         2 (4)      0 (2)      8
- *  1         3 (8)      0 (2)     16
- *  1         4 (16)     0 (2)     32
- *
- *  NOTE: There is a quirk option to ignore the first row of the dividers
- *  table when searching for suitable settings. This is because HS400 on
- *  early ES versions of H3 and M3-W requires a specific setting to work.
- */
-static const struct sd_div_table cpg_sd_div_table[] = {
-/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  sd_srcfc,   sd_fc,  sd_div) */
-	CPG_SD_DIV_TABLE_DATA(0,        0,          1,        4),
-	CPG_SD_DIV_TABLE_DATA(0,        1,          1,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        2,          1,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        4,          1,       64),
-	CPG_SD_DIV_TABLE_DATA(0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        1,          0,        4),
-	CPG_SD_DIV_TABLE_DATA(1,        2,          0,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        3,          0,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        4,          0,       32),
+static const struct clk_div_table cpg_sdh_div_table[] = {
+	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
+	{ STPnHCK | 4, 16 }, { 0, 0 },
 };
 
-#define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-
-static int cpg_sd_clock_enable(struct clk_hw *hw)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK,
-		       clock->div_table[clock->cur_div_idx].val &
-		       CPG_SD_STP_MASK);
-
-	return 0;
-}
-
-static void cpg_sd_clock_disable(struct clk_hw *hw)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
-}
-
-static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	return !(readl(clock->csn.reg) & CPG_SD_STP_MASK);
-}
-
-static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
-						unsigned long parent_rate)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	return DIV_ROUND_CLOSEST(parent_rate,
-				 clock->div_table[clock->cur_div_idx].div);
-}
-
-static int cpg_sd_clock_determine_rate(struct clk_hw *hw,
-				       struct clk_rate_request *req)
-{
-	unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
-	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned long calc_rate, diff;
-	unsigned int i;
-
-	for (i = 0; i < clock->div_num; i++) {
-		calc_rate = DIV_ROUND_CLOSEST(req->best_parent_rate,
-					      clock->div_table[i].div);
-		if (calc_rate < req->min_rate || calc_rate > req->max_rate)
-			continue;
-
-		diff = calc_rate > req->rate ? calc_rate - req->rate
-					     : req->rate - calc_rate;
-		if (diff < diff_min) {
-			best_rate = calc_rate;
-			diff_min = diff;
-		}
-	}
-
-	if (best_rate == ULONG_MAX)
-		return -EINVAL;
-
-	req->rate = best_rate;
-	return 0;
-}
-
-static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long parent_rate)
+struct clk * __init cpg_sdh_clk_register(const char *name,
+	void __iomem *sdnckcr, const char *parent_name,
+	struct raw_notifier_head *notifiers)
 {
-	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned int i;
-
-	for (i = 0; i < clock->div_num; i++)
-		if (rate == DIV_ROUND_CLOSEST(parent_rate,
-					      clock->div_table[i].div))
-			break;
+	struct cpg_simple_notifier *csn;
+	struct clk *clk;
 
-	if (i >= clock->div_num)
-		return -EINVAL;
+	csn = kzalloc(sizeof(*csn), GFP_KERNEL);
+	if (!csn)
+		return ERR_PTR(-ENOMEM);
 
-	clock->cur_div_idx = i;
+	csn->reg = sdnckcr;
 
-	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
-		       clock->div_table[i].val &
-		       (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
+	clk = clk_register_divider_table(NULL, name, parent_name, 0, sdnckcr,
+					 SDnSRCFC_SHIFT, 8, 0, cpg_sdh_div_table,
+					 &cpg_lock);
+	if (IS_ERR(clk))
+		return clk;
 
-	return 0;
+	cpg_simple_notifier_register(notifiers, csn);
+	return clk;
 }
 
-static const struct clk_ops cpg_sd_clock_ops = {
-	.enable = cpg_sd_clock_enable,
-	.disable = cpg_sd_clock_disable,
-	.is_enabled = cpg_sd_clock_is_enabled,
-	.recalc_rate = cpg_sd_clock_recalc_rate,
-	.determine_rate = cpg_sd_clock_determine_rate,
-	.set_rate = cpg_sd_clock_set_rate,
+static const struct clk_div_table cpg_sd_div_table[] = {
+	{ 0, 2 }, { 1, 4 }, { 0, 0 },
 };
 
 struct clk * __init cpg_sd_clk_register(const char *name,
-	void __iomem *base, unsigned int offset, const char *parent_name,
-	struct raw_notifier_head *notifiers, bool skip_first)
+	void __iomem *sdnckcr, const char *parent_name)
 {
-	struct clk_init_data init = {};
-	struct sd_clock *clock;
-	struct clk *clk;
-	u32 val;
-
-	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
-	if (!clock)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-	init.ops = &cpg_sd_clock_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
-
-	clock->csn.reg = base + offset;
-	clock->hw.init = &init;
-	clock->div_table = cpg_sd_div_table;
-	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
-
-	if (skip_first) {
-		clock->div_table++;
-		clock->div_num--;
-	}
-
-	val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
-	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
-	writel(val, clock->csn.reg);
-
-	clk = clk_register(NULL, &clock->hw);
-	if (IS_ERR(clk))
-		goto free_clock;
-
-	cpg_simple_notifier_register(notifiers, &clock->csn);
-	return clk;
-
-free_clock:
-	kfree(clock);
-	return clk;
+	return clk_register_divider_table(NULL, name, parent_name, 0, sdnckcr,
+					  0, 2, 0, cpg_sd_div_table, &cpg_lock);
 }
 
 
diff --git a/drivers/clk/renesas/rcar-cpg-lib.h b/drivers/clk/renesas/rcar-cpg-lib.h
index 548cb9562f35..0941c95a3006 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.h
+++ b/drivers/clk/renesas/rcar-cpg-lib.h
@@ -31,7 +31,6 @@ struct clk * __init cpg_sdh_clk_register(const char *name,
 	struct raw_notifier_head *notifiers);
 
 struct clk * __init cpg_sd_clk_register(const char *name,
-	void __iomem *base, unsigned int offset, const char *parent_name,
-	struct raw_notifier_head *notifiers, bool skip_first);
+	void __iomem *sdnckcr, const char *parent_name);
 
 #endif
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 182b189bc8f4..aa0797b98e89 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -491,9 +491,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 					   __clk_get_name(parent), notifiers);
 
 	case CLK_TYPE_GEN3_SD:
-		return cpg_sd_clk_register(core->name, base, core->offset,
-					   __clk_get_name(parent), notifiers,
-					   cpg_quirks & SD_SKIP_FIRST);
+		return cpg_sd_clk_register(core->name, base + core->offset,
+					   __clk_get_name(parent));
 
 	case CLK_TYPE_GEN3_R:
 		if (cpg_quirks & RCKCR_CKSEL) {
diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 0c45e82ff0de..5fb057833fee 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -57,6 +57,7 @@ struct tmio_mmc_dma {
 
 struct renesas_sdhi {
 	struct clk *clk;
+	struct clk *clkh;
 	struct clk *clk_cd;
 	struct tmio_mmc_data mmc_data;
 	struct tmio_mmc_dma dma_priv;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6fc4cf3c9dce..100f86d311ea 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -127,10 +127,12 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 }
 
 static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
-					    unsigned int new_clock)
+					    unsigned int wanted_clock)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct clk *ref_clk = priv->clk;
 	unsigned int freq, diff, best_freq = 0, diff_min = ~0;
+	unsigned int new_clock, clkh_mult = 1;
 	int i;
 
 	/*
@@ -141,6 +143,16 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || mmc_doing_tune(host->mmc))
 		return clk_get_rate(priv->clk);
 
+	if (priv->clkh) {
+		bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+		bool need_slow_clkh = (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) ||
+				      (host->mmc->ios.timing == MMC_TIMING_MMC_HS400);
+		clkh_mult = use_4tap && need_slow_clkh ? 2 : 4;
+		ref_clk = priv->clkh;
+	}
+
+	new_clock = wanted_clock * clkh_mult;
+
 	/*
 	 * We want the bus clock to be as close as possible to, but no
 	 * greater than, new_clock.  As we can divide by 1 << i for
@@ -148,11 +160,10 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 * possible, but no greater than, new_clock << i.
 	 */
 	for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
-		freq = clk_round_rate(priv->clk, new_clock << i);
+		freq = clk_round_rate(ref_clk, new_clock << i);
 		if (freq > (new_clock << i)) {
 			/* Too fast; look for a slightly slower option */
-			freq = clk_round_rate(priv->clk,
-					      (new_clock << i) / 4 * 3);
+			freq = clk_round_rate(ref_clk, (new_clock << i) / 4 * 3);
 			if (freq > (new_clock << i))
 				continue;
 		}
@@ -164,7 +175,10 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 		}
 	}
 
-	clk_set_rate(priv->clk, best_freq);
+	clk_set_rate(ref_clk, best_freq);
+
+	if (ref_clk == priv->clkh)
+		clk_set_rate(priv->clk, best_freq / clkh_mult);
 
 	return clk_get_rate(priv->clk);
 }
@@ -908,6 +922,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		return ret;
 	}
 
+	/* Fallback for old DTs */
+	if (of_device_is_compatible(pdev->dev.of_node, "renesas,rcar-gen3-sdhi"))
+		priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
+
 	/*
 	 * Some controllers provide a 2nd clock just to run the internal card
 	 * detection logic. Unfortunately, the existing driver architecture does
-- 
2.30.2

