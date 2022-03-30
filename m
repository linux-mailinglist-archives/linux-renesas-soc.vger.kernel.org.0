Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8017E4EC88D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 17:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346536AbiC3Pnz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 11:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239041AbiC3Pnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 11:43:55 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B33833E0A;
        Wed, 30 Mar 2022 08:42:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,223,1643641200"; 
   d="scan'208";a="116202040"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2022 00:42:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7D8B8400A6C7;
        Thu, 31 Mar 2022 00:42:07 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 08/13] clk: renesas: rzg2l: Make use of CLK_MON registers optional
Date:   Wed, 30 Mar 2022 16:40:19 +0100
Message-Id: <20220330154024.112270-9-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330154024.112270-1-phil.edworthy@renesas.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
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

The rz/v2m SoC doesn't use CLK_MON registers, so make it optional.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c |  4 ++++
 drivers/clk/renesas/rzg2l-cpg.c     | 25 +++++++++++++++----------
 drivers/clk/renesas/rzg2l-cpg.h     |  3 +++
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index b187d9ac47aa..3393754ffb5e 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -374,6 +374,8 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Resets */
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
 };
 
 #ifdef CONFIG_CLK_R9A07G054
@@ -396,5 +398,7 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	/* Resets */
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 486d0656c58a..c357b0bfa119 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -498,16 +498,18 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	if (!enable)
 		return 0;
 
-	for (i = 1000; i > 0; --i) {
-		if (((readl(priv->base + CLK_MON_R(reg))) & bitmask))
-			break;
-		cpu_relax();
-	}
+	if (priv->info->has_clk_mon_regs) {
+		for (i = 1000; i > 0; --i) {
+			if (((readl(priv->base + CLK_MON_R(reg))) & bitmask))
+				break;
+			cpu_relax();
+		}
 
-	if (!i) {
-		dev_err(dev, "Failed to enable CLK_ON %p\n",
-			priv->base + CLK_ON_R(reg));
-		return -ETIMEDOUT;
+		if (!i) {
+			dev_err(dev, "Failed to enable CLK_ON %p\n",
+				priv->base + CLK_ON_R(reg));
+			return -ETIMEDOUT;
+		}
 	}
 
 	return 0;
@@ -568,7 +570,10 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
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
index 592dd9515cfc..f04671376af5 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -181,6 +181,7 @@ struct rzg2l_reset {
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @has_clk_mon_regs: Flag indicating whether the SoC has CLK_MON registers
  */
 struct rzg2l_cpg_info {
 	/* Core Clocks */
@@ -201,6 +202,8 @@ struct rzg2l_cpg_info {
 	/* Critical Module Clocks that should not be disabled */
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
+
+	bool has_clk_mon_regs;
 };
 
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
-- 
2.32.0

