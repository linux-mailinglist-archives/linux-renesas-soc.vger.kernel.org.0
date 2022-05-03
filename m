Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1F35183C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiECMFk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbiECMFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:05:39 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C05D30F45;
        Tue,  3 May 2022 05:02:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="118643186"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2022 21:02:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AA8CA4226AEF;
        Tue,  3 May 2022 21:02:03 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 08/12] clk: renesas: rzg2l: Make use of CLK_MON registers optional
Date:   Tue,  3 May 2022 12:55:53 +0100
Message-Id: <20220503115557.53370-9-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503115557.53370-1-phil.edworthy@renesas.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/V2M SoC doesn't use CLK_MON registers, so make them optional.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 - Add has_clk_mon_regs to r9a07g043-cpg.c
 - Improve commit msg.
 - Return early if no clk mon regs to simply the code
---
 drivers/clk/renesas/r9a07g043-cpg.c | 2 ++
 drivers/clk/renesas/r9a07g044-cpg.c | 4 ++++
 drivers/clk/renesas/rzg2l-cpg.c     | 8 +++++++-
 drivers/clk/renesas/rzg2l-cpg.h     | 3 +++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 53a58034bef4..33c2bd8df2e5 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -315,4 +315,6 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	/* Resets */
 	.resets = r9a07g043_resets,
 	.num_resets = R9A07G043_TSU_PRESETN + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 8255b39dc147..b288897852c7 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -418,6 +418,8 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Resets */
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
 };
 
 #ifdef CONFIG_CLK_R9A07G054
@@ -440,5 +442,7 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	/* Resets */
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 15412cc58337..eaa7c9186163 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -926,6 +926,9 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	if (!enable)
 		return 0;
 
+	if (!priv->info->has_clk_mon_regs)
+		return 0;
+
 	for (i = 1000; i > 0; --i) {
 		if (((readl(priv->base + CLK_MON_R(reg))) & bitmask))
 			break;
@@ -996,7 +999,10 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 	if (clock->sibling)
 		return clock->enabled;
 
-	value = readl(priv->base + CLK_MON_R(clock->off));
+	if (priv->info->has_clk_mon_regs)
+		value = readl(priv->base + CLK_MON_R(clock->off));
+	else
+		value = readl(priv->base + clock->off);
 
 	return value & bitmask;
 }
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 59bbc8942e1d..43ce319a477f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -236,6 +236,7 @@ struct rzg2l_reset {
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @has_clk_mon_regs: Flag indicating whether the SoC has CLK_MON registers
  */
 struct rzg2l_cpg_info {
 	/* Core Clocks */
@@ -256,6 +257,8 @@ struct rzg2l_cpg_info {
 	/* Critical Module Clocks that should not be disabled */
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
+
+	bool has_clk_mon_regs;
 };
 
 extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
-- 
2.32.0

