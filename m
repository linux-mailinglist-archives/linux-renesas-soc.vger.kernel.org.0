Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226B85431AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240362AbiFHNle (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240459AbiFHNlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:41:25 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731CC1DE2CB
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:41:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by michel.telenet-ops.be with bizsmtp
        id gdhH270041qF9lr06dhHUp; Wed, 08 Jun 2022 15:41:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-003D7d-Oe; Wed, 08 Jun 2022 15:41:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-008Ko3-Au; Wed, 08 Jun 2022 15:41:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/6] clk: renesas: r8a73a4: Remove r8a73a4_cpg.reg
Date:   Wed,  8 Jun 2022 15:41:10 +0200
Message-Id: <f835f3dfcf3bf754065e5002663952cc6341caac.1654694831.git.geert+renesas@glider.be>
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
r8a73a4_cpg structure is only used during initialization.  Hence move
it to a local variable, and pass it as a parameter to
r8a73a4_cpg_register_clock().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-r8a73a4.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index cfed11c659d91c73..f45c2c45808be0b5 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -18,7 +18,6 @@
 struct r8a73a4_cpg {
 	struct clk_onecell_data data;
 	spinlock_t lock;
-	void __iomem *reg;
 };
 
 #define CPG_CKSCR	0xc0
@@ -59,7 +58,7 @@ static const struct clk_div_table div4_div_table[] = {
 
 static struct clk * __init
 r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
-			     const char *name)
+			   void __iomem *base, const char *name)
 {
 	const struct clk_div_table *table = NULL;
 	const char *parent_name;
@@ -69,7 +68,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 
 
 	if (!strcmp(name, "main")) {
-		u32 ckscr = readl(cpg->reg + CPG_CKSCR);
+		u32 ckscr = readl(base + CPG_CKSCR);
 
 		switch ((ckscr >> 28) & 3) {
 		case 0:	/* extal1 */
@@ -93,14 +92,14 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 		 * clock implementation and we currently have no need to change
 		 * the multiplier value.
 		 */
-		u32 value = readl(cpg->reg + CPG_PLL0CR);
+		u32 value = readl(base + CPG_PLL0CR);
 
 		parent_name = "main";
 		mult = ((value >> 24) & 0x7f) + 1;
 		if (value & BIT(20))
 			div = 2;
 	} else if (!strcmp(name, "pll1")) {
-		u32 value = readl(cpg->reg + CPG_PLL1CR);
+		u32 value = readl(base + CPG_PLL1CR);
 
 		parent_name = "main";
 		/* XXX: enable bit? */
@@ -123,7 +122,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 		default:
 			return ERR_PTR(-EINVAL);
 		}
-		value = readl(cpg->reg + cr);
+		value = readl(base + cr);
 		switch ((value >> 5) & 7) {
 		case 0:
 			parent_name = "main";
@@ -159,7 +158,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 			shift = 0;
 		}
 		div *= 32;
-		mult = 0x20 - ((readl(cpg->reg + CPG_FRQCRC) >> shift) & 0x1f);
+		mult = 0x20 - ((readl(base + CPG_FRQCRC) >> shift) & 0x1f);
 	} else {
 		struct div4_clk *c;
 
@@ -181,7 +180,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 						 mult, div);
 	} else {
 		return clk_register_divider_table(NULL, name, parent_name, 0,
-						  cpg->reg + reg, shift, 4, 0,
+						  base + reg, shift, 4, 0,
 						  table, &cpg->lock);
 	}
 }
@@ -189,6 +188,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 static void __init r8a73a4_cpg_clocks_init(struct device_node *np)
 {
 	struct r8a73a4_cpg *cpg;
+	void __iomem *base;
 	struct clk **clks;
 	unsigned int i;
 	int num_clks;
@@ -213,8 +213,8 @@ static void __init r8a73a4_cpg_clocks_init(struct device_node *np)
 	cpg->data.clks = clks;
 	cpg->data.clk_num = num_clks;
 
-	cpg->reg = of_iomap(np, 0);
-	if (WARN_ON(cpg->reg == NULL))
+	base = of_iomap(np, 0);
+	if (WARN_ON(base == NULL))
 		return;
 
 	for (i = 0; i < num_clks; ++i) {
@@ -224,7 +224,7 @@ static void __init r8a73a4_cpg_clocks_init(struct device_node *np)
 		of_property_read_string_index(np, "clock-output-names", i,
 					      &name);
 
-		clk = r8a73a4_cpg_register_clock(np, cpg, name);
+		clk = r8a73a4_cpg_register_clock(np, cpg, base, name);
 		if (IS_ERR(clk))
 			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
 			       __func__, np, name, PTR_ERR(clk));
-- 
2.25.1

