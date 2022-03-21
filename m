Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E316A4E2CB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350500AbiCUPrX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350498AbiCUPrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:47:18 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 082B957148;
        Mon, 21 Mar 2022 08:45:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="114269496"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2022 00:45:28 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C8F744007539;
        Tue, 22 Mar 2022 00:45:26 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 10/14] clk: renesas: rzg2l: Add support for RZ/V2M reset monitor reg
Date:   Mon, 21 Mar 2022 15:42:28 +0000
Message-Id: <20220321154232.56315-11-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
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

The RZ/V2M doesn't have a matching set of reset monitor regs for each reset
reg like the RZ/G2L. Instead, it has a single CPG_RST_MON reg which has a
single bit per module.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c |  6 +++++-
 drivers/clk/renesas/rzg2l-cpg.h | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c357b0bfa119..220955366538 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -748,8 +748,12 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
 	const struct rzg2l_cpg_info *info = priv->info;
 	unsigned int reg = info->resets[id].off;
 	u32 bitmask = BIT(info->resets[id].bit);
+	u32 monbitmask = BIT(info->resets[id].monbit);
 
-	return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+	if (info->has_clk_mon_regs)
+		return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+	else
+		return !!(readl(priv->base + CPG_RST_MON) & monbitmask);
 }
 
 static const struct reset_control_ops rzg2l_cpg_reset_ops = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index f04671376af5..d1d08669066b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -18,6 +18,7 @@
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
+#define CPG_RST_MON		(0x680)
 
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
@@ -151,17 +152,22 @@ struct rzg2l_mod_clk {
  *
  * @off: register offset
  * @bit: reset bit
+ * @monbit: monitor bit in CPG_RST_MON register, -1 if none
  */
 struct rzg2l_reset {
 	u16 off;
 	u8 bit;
+	s8 monbit;
 };
 
-#define DEF_RST(_id, _off, _bit)	\
+#define DEF_RST_MON(_id, _off, _bit, _monbit)	\
 	[_id] = { \
 		.off = (_off), \
-		.bit = (_bit) \
+		.bit = (_bit), \
+		.monbit = (_monbit) \
 	}
+#define DEF_RST(_id, _off, _bit)	\
+	DEF_RST_MON(_id, _off, _bit, -1)
 
 /**
  * struct rzg2l_cpg_info - SoC-specific CPG Description
-- 
2.32.0

