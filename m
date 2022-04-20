Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B578D5083E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376897AbiDTIqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239358AbiDTIqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:46:01 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F0623B3F4;
        Wed, 20 Apr 2022 01:43:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="117435990"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:59 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 328B1401073D;
        Wed, 20 Apr 2022 17:42:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 12/15] clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
Date:   Wed, 20 Apr 2022 17:42:52 +0900
Message-Id: <20220420084255.375700-13-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car V4H (r8a779g0) has PLL4 so that add CLK_TYPE_GEN4_PLL4.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 18 +++++++++---------
 drivers/clk/renesas/rcar-gen4-cpg.c     |  5 +++++
 drivers/clk/renesas/rcar-gen4-cpg.h     |  3 +++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 08e8d95ce5e7..be9dcc00d3ab 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -142,23 +142,23 @@ static const unsigned int r8a779f0_crit_mod_clks[] __initconst = {
  * CPG Clock Data
  */
 /*
- *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL5	PLL6	OSC
+ *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
  * 14 13 (MHz)
  * ----------------------------------------------------------------
- * 0  0	 16    / 1	x200	x150	x200	x200	x134	/15
- * 0  1	 20    / 1	x160	x120	x160	x160	x106	/19
+ * 0  0	 16    / 1	x200	x150	x200	n/a	x200	x134	/15
+ * 0  1	 20    / 1	x160	x120	x160	n/a	x160	x106	/19
  * 1  0	 Prohibited setting
- * 1  1	 40    / 2	x160	x120	x160	x160	x106	/38
+ * 1  1	 40    / 2	x160	x120	x160	n/a	x160	x106	/38
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
 
 static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
-	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
-	{ 1,		200,	1,	150,	1,	200,	1,	200,	1,	134,	1,	15,	},
-	{ 1,		160,	1,	120,	1,	160,	1,	160,	1,	106,	1,	19,	},
-	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
-	{ 2,		160,	1,	120,	1,	160,	1,	160,	1,	106,	1,	38,	},
+	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
+	{ 1,		200,	1,	150,	1,	200,	1,	0,	0,	200,	1,	134,	1,	15,	},
+	{ 1,		160,	1,	120,	1,	160,	1,	0,	0,	160,	1,	106,	1,	19,	},
+	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
+	{ 2,		160,	1,	120,	1,	160,	1,	0,	0,	160,	1,	106,	1,	38,	},
 };
 
 static int __init r8a779f0_cpg_mssr_init(struct device *dev)
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 54ebf4b3c128..c7ed43d6aa67 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -215,6 +215,11 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll3_div;
 		break;
 
+	case CLK_TYPE_GEN4_PLL4:
+		mult = cpg_pll_config->pll4_mult;
+		div = cpg_pll_config->pll4_div;
+		break;
+
 	case CLK_TYPE_GEN4_PLL5:
 		mult = cpg_pll_config->pll5_mult;
 		div = cpg_pll_config->pll5_div;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index afc8c024d538..0b15dcfdca7b 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -16,6 +16,7 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
 	CLK_TYPE_GEN4_PLL3,
 	CLK_TYPE_GEN4_PLL5,
+	CLK_TYPE_GEN4_PLL4,
 	CLK_TYPE_GEN4_PLL6,
 	CLK_TYPE_GEN4_SDSRC,
 	CLK_TYPE_GEN4_SDH,
@@ -56,6 +57,8 @@ struct rcar_gen4_cpg_pll_config {
 	u8 pll2_div;
 	u8 pll3_mult;
 	u8 pll3_div;
+	u8 pll4_mult;
+	u8 pll4_div;
 	u8 pll5_mult;
 	u8 pll5_div;
 	u8 pll6_mult;
-- 
2.25.1

