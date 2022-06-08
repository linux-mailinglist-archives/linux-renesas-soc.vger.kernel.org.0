Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A297A5431A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240333AbiFHNlg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240462AbiFHNlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:41:25 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7355F1DE2F7
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:41:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by laurent.telenet-ops.be with bizsmtp
        id gdhH2700K1qF9lr01dhHpS; Wed, 08 Jun 2022 15:41:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-003D7f-T5; Wed, 08 Jun 2022 15:41:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-008KoH-CF; Wed, 08 Jun 2022 15:41:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/6] clk: renesas: sh73a0: Remove sh73a0_cpg.reg
Date:   Wed,  8 Jun 2022 15:41:12 +0200
Message-Id: <5423e43d0cf518691965412fb510097d23ac5955.1654694831.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654694831.git.geert+renesas@glider.be>
References: <cover.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The register block base pointer as stored in the reg member of the
sh73a0_cpg structure is only used during initialization.  Hence move
it to a local variable, and pass it as a parameter to
sh73a0_cpg_register_clock().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-sh73a0.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index 4146c1d717b96f93..8c51090f13e13b31 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -18,7 +18,6 @@
 struct sh73a0_cpg {
 	struct clk_onecell_data data;
 	spinlock_t lock;
-	void __iomem *reg;
 };
 
 #define CPG_FRQCRA	0x00
@@ -73,7 +72,7 @@ static const struct clk_div_table z_div_table[] = {
 
 static struct clk * __init
 sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
-			     const char *name)
+			  void __iomem *base, const char *name)
 {
 	const struct clk_div_table *table = NULL;
 	unsigned int shift, reg, width;
@@ -83,12 +82,12 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 
 	if (!strcmp(name, "main")) {
 		/* extal1, extal1_div2, extal2, extal2_div2 */
-		u32 parent_idx = (readl(cpg->reg + CPG_CKSCR) >> 28) & 3;
+		u32 parent_idx = (readl(base + CPG_CKSCR) >> 28) & 3;
 
 		parent_name = of_clk_get_parent_name(np, parent_idx >> 1);
 		div = (parent_idx & 1) + 1;
 	} else if (!strncmp(name, "pll", 3)) {
-		void __iomem *enable_reg = cpg->reg;
+		void __iomem *enable_reg = base;
 		u32 enable_bit = name[3] - '0';
 
 		parent_name = "main";
@@ -108,7 +107,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 		default:
 			return ERR_PTR(-EINVAL);
 		}
-		if (readl(cpg->reg + CPG_PLLECR) & BIT(enable_bit)) {
+		if (readl(base + CPG_PLLECR) & BIT(enable_bit)) {
 			mult = ((readl(enable_reg) >> 24) & 0x3f) + 1;
 			/* handle CFG bit for PLL1 and PLL2 */
 			if (enable_bit == 1 || enable_bit == 2)
@@ -117,7 +116,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 		}
 	} else if (!strcmp(name, "dsi0phy") || !strcmp(name, "dsi1phy")) {
 		u32 phy_no = name[3] - '0';
-		void __iomem *dsi_reg = cpg->reg +
+		void __iomem *dsi_reg = base +
 			(phy_no ? CPG_DSI1PHYCR : CPG_DSI0PHYCR);
 
 		parent_name = phy_no ? "dsi1pck" : "dsi0pck";
@@ -154,7 +153,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 						 mult, div);
 	} else {
 		return clk_register_divider_table(NULL, name, parent_name, 0,
-						  cpg->reg + reg, shift, width, 0,
+						  base + reg, shift, width, 0,
 						  table, &cpg->lock);
 	}
 }
@@ -162,6 +161,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 static void __init sh73a0_cpg_clocks_init(struct device_node *np)
 {
 	struct sh73a0_cpg *cpg;
+	void __iomem *base;
 	struct clk **clks;
 	unsigned int i;
 	int num_clks;
@@ -186,14 +186,14 @@ static void __init sh73a0_cpg_clocks_init(struct device_node *np)
 	cpg->data.clks = clks;
 	cpg->data.clk_num = num_clks;
 
-	cpg->reg = of_iomap(np, 0);
-	if (WARN_ON(cpg->reg == NULL))
+	base = of_iomap(np, 0);
+	if (WARN_ON(base == NULL))
 		return;
 
 	/* Set SDHI clocks to a known state */
-	writel(0x108, cpg->reg + CPG_SD0CKCR);
-	writel(0x108, cpg->reg + CPG_SD1CKCR);
-	writel(0x108, cpg->reg + CPG_SD2CKCR);
+	writel(0x108, base + CPG_SD0CKCR);
+	writel(0x108, base + CPG_SD1CKCR);
+	writel(0x108, base + CPG_SD2CKCR);
 
 	for (i = 0; i < num_clks; ++i) {
 		const char *name;
@@ -202,7 +202,7 @@ static void __init sh73a0_cpg_clocks_init(struct device_node *np)
 		of_property_read_string_index(np, "clock-output-names", i,
 					      &name);
 
-		clk = sh73a0_cpg_register_clock(np, cpg, name);
+		clk = sh73a0_cpg_register_clock(np, cpg, base, name);
 		if (IS_ERR(clk))
 			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
 			       __func__, np, name, PTR_ERR(clk));
-- 
2.25.1

