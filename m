Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 089C15431A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240459AbiFHNlf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240520AbiFHNl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:41:28 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B311DF120
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:41:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by albert.telenet-ops.be with bizsmtp
        id gdhH2700E1qF9lr06dhHzt; Wed, 08 Jun 2022 15:41:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-003D7h-Uq; Wed, 08 Jun 2022 15:41:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-008KoV-Dt; Wed, 08 Jun 2022 15:41:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/6] clk: renesas: r8a7779: Remove struct r8a7779_cpg
Date:   Wed,  8 Jun 2022 15:41:14 +0200
Message-Id: <eb94c0f6c54a4f3a7e0e07f12781333a700c0a05.1654694831.git.geert+renesas@glider.be>
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

All but the data member of the r8a7779_cpg structure are unused, so the
whole structure can be replaced by the single member used.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-r8a7779.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a7779.c b/drivers/clk/renesas/clk-r8a7779.c
index 9f3b5522eef59a12..9a2fea8cf4d7fe1e 100644
--- a/drivers/clk/renesas/clk-r8a7779.c
+++ b/drivers/clk/renesas/clk-r8a7779.c
@@ -21,12 +21,6 @@
 
 #define CPG_NUM_CLOCKS			(R8A7779_CLK_OUT + 1)
 
-struct r8a7779_cpg {
-	struct clk_onecell_data data;
-	spinlock_t lock;
-	void __iomem *reg;
-};
-
 /* -----------------------------------------------------------------------------
  * CPG Clock Data
  */
@@ -87,7 +81,7 @@ static const unsigned int cpg_plla_mult[4] __initconst = { 42, 48, 56, 64 };
  */
 
 static struct clk * __init
-r8a7779_cpg_register_clock(struct device_node *np, struct r8a7779_cpg *cpg,
+r8a7779_cpg_register_clock(struct device_node *np,
 			   const struct cpg_clk_config *config,
 			   unsigned int plla_mult, const char *name)
 {
@@ -119,7 +113,7 @@ r8a7779_cpg_register_clock(struct device_node *np, struct r8a7779_cpg *cpg,
 static void __init r8a7779_cpg_clocks_init(struct device_node *np)
 {
 	const struct cpg_clk_config *config;
-	struct r8a7779_cpg *cpg;
+	struct clk_onecell_data *data;
 	struct clk **clks;
 	unsigned int i, plla_mult;
 	int num_clks;
@@ -134,19 +128,17 @@ static void __init r8a7779_cpg_clocks_init(struct device_node *np)
 		return;
 	}
 
-	cpg = kzalloc(sizeof(*cpg), GFP_KERNEL);
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	clks = kcalloc(CPG_NUM_CLOCKS, sizeof(*clks), GFP_KERNEL);
-	if (cpg == NULL || clks == NULL) {
+	if (data == NULL || clks == NULL) {
 		/* We're leaking memory on purpose, there's no point in cleaning
 		 * up as the system won't boot anyway.
 		 */
 		return;
 	}
 
-	spin_lock_init(&cpg->lock);
-
-	cpg->data.clks = clks;
-	cpg->data.clk_num = num_clks;
+	data->clks = clks;
+	data->clk_num = num_clks;
 
 	config = &cpg_clk_configs[CPG_CLK_CONFIG_INDEX(mode)];
 	plla_mult = cpg_plla_mult[CPG_PLLA_MULT_INDEX(mode)];
@@ -158,16 +150,15 @@ static void __init r8a7779_cpg_clocks_init(struct device_node *np)
 		of_property_read_string_index(np, "clock-output-names", i,
 					      &name);
 
-		clk = r8a7779_cpg_register_clock(np, cpg, config,
-						 plla_mult, name);
+		clk = r8a7779_cpg_register_clock(np, config, plla_mult, name);
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

