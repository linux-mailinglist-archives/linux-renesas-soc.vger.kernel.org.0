Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA315431A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240471AbiFHNlf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240477AbiFHNlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:41:25 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7365A1DE8C1
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:41:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by albert.telenet-ops.be with bizsmtp
        id gdhH2700z1qF9lr06dhH0H; Wed, 08 Jun 2022 15:41:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvx-003D7e-70; Wed, 08 Jun 2022 15:41:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-008KoA-Bc; Wed, 08 Jun 2022 15:41:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] clk: renesas: r8a7740: Remove r8a7740_cpg.reg
Date:   Wed,  8 Jun 2022 15:41:11 +0200
Message-Id: <7ec676bcc36ef1eda02c2db328c527fc5fd44e99.1654694831.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654694831.git.geert+renesas@glider.be>
References: <cover.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The register block base pointer as stored in the reg member of the
r8a7740_cpg structure is only used during initialization.  Hence move
it to a local variable, and pass it as a parameter to
r8a7740_cpg_register_clock().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-r8a7740.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index d8190f007a81c212..3ee3f57e4e9aec41 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -18,7 +18,6 @@
 struct r8a7740_cpg {
 	struct clk_onecell_data data;
 	spinlock_t lock;
-	void __iomem *reg;
 };
 
 #define CPG_FRQCRA	0x00
@@ -61,7 +60,7 @@ static u32 cpg_mode __initdata;
 
 static struct clk * __init
 r8a7740_cpg_register_clock(struct device_node *np, struct r8a7740_cpg *cpg,
-			     const char *name)
+			   void __iomem *base, const char *name)
 {
 	const struct clk_div_table *table = NULL;
 	const char *parent_name;
@@ -96,20 +95,20 @@ r8a7740_cpg_register_clock(struct device_node *np, struct r8a7740_cpg *cpg,
 		 * clock implementation and we currently have no need to change
 		 * the multiplier value.
 		 */
-		u32 value = readl(cpg->reg + CPG_FRQCRC);
+		u32 value = readl(base + CPG_FRQCRC);
 		parent_name = "system";
 		mult = ((value >> 24) & 0x7f) + 1;
 	} else if (!strcmp(name, "pllc1")) {
-		u32 value = readl(cpg->reg + CPG_FRQCRA);
+		u32 value = readl(base + CPG_FRQCRA);
 		parent_name = "system";
 		mult = ((value >> 24) & 0x7f) + 1;
 		div = 2;
 	} else if (!strcmp(name, "pllc2")) {
-		u32 value = readl(cpg->reg + CPG_PLLC2CR);
+		u32 value = readl(base + CPG_PLLC2CR);
 		parent_name = "system";
 		mult = ((value >> 24) & 0x3f) + 1;
 	} else if (!strcmp(name, "usb24s")) {
-		u32 value = readl(cpg->reg + CPG_USBCKCR);
+		u32 value = readl(base + CPG_USBCKCR);
 		if (value & BIT(7))
 			/* extal2 */
 			parent_name = of_clk_get_parent_name(np, 1);
@@ -137,7 +136,7 @@ r8a7740_cpg_register_clock(struct device_node *np, struct r8a7740_cpg *cpg,
 						 mult, div);
 	} else {
 		return clk_register_divider_table(NULL, name, parent_name, 0,
-						  cpg->reg + reg, shift, 4, 0,
+						  base + reg, shift, 4, 0,
 						  table, &cpg->lock);
 	}
 }
@@ -145,6 +144,7 @@ r8a7740_cpg_register_clock(struct device_node *np, struct r8a7740_cpg *cpg,
 static void __init r8a7740_cpg_clocks_init(struct device_node *np)
 {
 	struct r8a7740_cpg *cpg;
+	void __iomem *base;
 	struct clk **clks;
 	unsigned int i;
 	int num_clks;
@@ -172,8 +172,8 @@ static void __init r8a7740_cpg_clocks_init(struct device_node *np)
 	cpg->data.clks = clks;
 	cpg->data.clk_num = num_clks;
 
-	cpg->reg = of_iomap(np, 0);
-	if (WARN_ON(cpg->reg == NULL))
+	base = of_iomap(np, 0);
+	if (WARN_ON(base == NULL))
 		return;
 
 	for (i = 0; i < num_clks; ++i) {
@@ -183,7 +183,7 @@ static void __init r8a7740_cpg_clocks_init(struct device_node *np)
 		of_property_read_string_index(np, "clock-output-names", i,
 					      &name);
 
-		clk = r8a7740_cpg_register_clock(np, cpg, name);
+		clk = r8a7740_cpg_register_clock(np, cpg, base, name);
 		if (IS_ERR(clk))
 			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
 			       __func__, np, name, PTR_ERR(clk));
-- 
2.25.1

