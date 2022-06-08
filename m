Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 912F75431A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240463AbiFHNlc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240386AbiFHNlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:41:25 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730EA1DE2C6
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:41:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by michel.telenet-ops.be with bizsmtp
        id gdhH270091qF9lr06dhHUq; Wed, 08 Jun 2022 15:41:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-003D7i-Vt; Wed, 08 Jun 2022 15:41:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-008Koc-EY; Wed, 08 Jun 2022 15:41:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] clk: renesas: rza1: Remove struct rz_cpg
Date:   Wed,  8 Jun 2022 15:41:15 +0200
Message-Id: <2380285576edaa4ad3dc5eca7e0ca418f068c6ef.1654694831.git.geert+renesas@glider.be>
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
rz_cpg structure is only used during initialization.  Hence move
it to a local variable, and pass it as a parameter to
rz_cpg_register_clock().

After this, the data member is the only remaining member of the rz_cpg
structure, so the whole structure can be replaced by the data member.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-rz.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index 7b703f14e20bb7f1..e770f09a27ed7758 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -15,11 +15,6 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 
-struct rz_cpg {
-	struct clk_onecell_data data;
-	void __iomem *reg;
-};
-
 #define CPG_FRQCR	0x10
 #define CPG_FRQCR2	0x14
 
@@ -49,7 +44,8 @@ static u16 __init rz_cpg_read_mode_pins(void)
 }
 
 static struct clk * __init
-rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *name)
+rz_cpg_register_clock(struct device_node *np, void __iomem *base,
+		      const char *name)
 {
 	u32 val;
 	unsigned mult;
@@ -65,7 +61,7 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	}
 
 	/* If mapping regs failed, skip non-pll clocks. System will boot anyhow */
-	if (!cpg->reg)
+	if (!base)
 		return ERR_PTR(-ENXIO);
 
 	/* FIXME:"i" and "g" are variable clocks with non-integer dividers (e.g. 2/3)
@@ -73,9 +69,9 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	 * let them run at fixed current speed and implement the details later.
 	 */
 	if (strcmp(name, "i") == 0)
-		val = (readl(cpg->reg + CPG_FRQCR) >> 8) & 3;
+		val = (readl(base + CPG_FRQCR) >> 8) & 3;
 	else if (strcmp(name, "g") == 0)
-		val = readl(cpg->reg + CPG_FRQCR2) & 3;
+		val = readl(base + CPG_FRQCR2) & 3;
 	else
 		return ERR_PTR(-EINVAL);
 
@@ -85,8 +81,9 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 
 static void __init rz_cpg_clocks_init(struct device_node *np)
 {
-	struct rz_cpg *cpg;
+	struct clk_onecell_data *data;
 	struct clk **clks;
+	void __iomem *base;
 	unsigned i;
 	int num_clks;
 
@@ -94,14 +91,14 @@ static void __init rz_cpg_clocks_init(struct device_node *np)
 	if (WARN(num_clks <= 0, "can't count CPG clocks\n"))
 		return;
 
-	cpg = kzalloc(sizeof(*cpg), GFP_KERNEL);
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	clks = kcalloc(num_clks, sizeof(*clks), GFP_KERNEL);
-	BUG_ON(!cpg || !clks);
+	BUG_ON(!data || !clks);
 
-	cpg->data.clks = clks;
-	cpg->data.clk_num = num_clks;
+	data->clks = clks;
+	data->clk_num = num_clks;
 
-	cpg->reg = of_iomap(np, 0);
+	base = of_iomap(np, 0);
 
 	for (i = 0; i < num_clks; ++i) {
 		const char *name;
@@ -109,15 +106,15 @@ static void __init rz_cpg_clocks_init(struct device_node *np)
 
 		of_property_read_string_index(np, "clock-output-names", i, &name);
 
-		clk = rz_cpg_register_clock(np, cpg, name);
+		clk = rz_cpg_register_clock(np, base, name);
 		if (IS_ERR(clk))
 			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
 			       __func__, np, name, PTR_ERR(clk));
 		else
-			cpg->data.clks[i] = clk;
+			data->clks[i] = clk;
 	}
 
-	of_clk_add_provider(np, of_clk_src_onecell_get, &cpg->data);
+	of_clk_add_provider(np, of_clk_src_onecell_get, data);
 
 	cpg_mstp_add_clk_domain(np);
 }
-- 
2.25.1

