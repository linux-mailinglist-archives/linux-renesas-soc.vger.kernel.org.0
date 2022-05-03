Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5885183D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbiECMFt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235089AbiECMFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:05:47 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F2D43206A;
        Tue,  3 May 2022 05:02:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="119861819"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 May 2022 21:02:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 924584226AFC;
        Tue,  3 May 2022 21:02:12 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 09/12] clk: renesas: rzg2l: Add support for RZ/V2M reset monitor reg
Date:   Tue,  3 May 2022 12:55:54 +0100
Message-Id: <20220503115557.53370-10-phil.edworthy@renesas.com>
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

The RZ/V2M doesn't have a matching set of reset monitor regs for each reset
reg like the RZ/G2L. Instead, it has a single CPG_RST_MON reg which has a
single bit per module.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 - If no clk mon regs and no clk monitor bit specified, return an error
---
 drivers/clk/renesas/rzg2l-cpg.c | 10 +++++++++-
 drivers/clk/renesas/rzg2l-cpg.h | 10 ++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index eaa7c9186163..89f63c09f089 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1177,8 +1177,16 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
 	const struct rzg2l_cpg_info *info = priv->info;
 	unsigned int reg = info->resets[id].off;
 	u32 bitmask = BIT(info->resets[id].bit);
+	s8 monbit = info->resets[id].monbit;
 
-	return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+	if (info->has_clk_mon_regs) {
+		return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+	} else if (monbit >= 0) {
+		u32 monbitmask = BIT(monbit);
+
+		return !!(readl(priv->base + CPG_RST_MON) & monbitmask);
+	}
+	return -ENOTSUPP;
 }
 
 static const struct reset_control_ops rzg2l_cpg_reset_ops = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 43ce319a477f..6fbb431fb331 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -25,6 +25,7 @@
 #define CPG_PL6_SSEL		(0x414)
 #define CPG_PL6_ETH_SSEL	(0x418)
 #define CPG_PL5_SDIV		(0x420)
+#define CPG_RST_MON		(0x680)
 #define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_STBY_RESETB		BIT(0)
@@ -206,17 +207,22 @@ struct rzg2l_mod_clk {
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

