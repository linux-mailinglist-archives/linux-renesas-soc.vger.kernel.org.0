Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB26077F2C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 11:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349309AbjHQJIm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 05:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349315AbjHQJIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 05:08:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24CA913D;
        Thu, 17 Aug 2023 02:08:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,179,1684767600"; 
   d="scan'208";a="173175574"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2023 18:08:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 634B241B6449;
        Thu, 17 Aug 2023 18:08:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] clk: vc3: Fix output clock mapping
Date:   Thu, 17 Aug 2023 10:08:09 +0100
Message-Id: <20230817090810.203900-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Table 3. ("Output Source") in the 5P35023 datasheet,
the output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3,
4=DIFF1, 5=DIFF2. But the code uses inverse. Fix this mapping issue.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com/
Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/clk/clk-versaclock3.c | 68 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 7ab2447bd203..4ee9078f4bf4 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -119,20 +119,20 @@ enum vc3_div {
 };
 
 enum vc3_clk_mux {
-	VC3_DIFF2_MUX,
-	VC3_DIFF1_MUX,
-	VC3_SE3_MUX,
-	VC3_SE2_MUX,
 	VC3_SE1_MUX,
+	VC3_SE2_MUX,
+	VC3_SE3_MUX,
+	VC3_DIFF1_MUX,
+	VC3_DIFF2_MUX,
 };
 
 enum vc3_clk {
-	VC3_DIFF2,
-	VC3_DIFF1,
-	VC3_SE3,
-	VC3_SE2,
-	VC3_SE1,
 	VC3_REF,
+	VC3_SE1,
+	VC3_SE2,
+	VC3_SE3,
+	VC3_DIFF1,
+	VC3_DIFF2,
 };
 
 struct vc3_clk_data {
@@ -897,33 +897,33 @@ static struct vc3_hw_data clk_div[] = {
 };
 
 static struct vc3_hw_data clk_mux[] = {
-	[VC3_DIFF2_MUX] = {
+	[VC3_SE1_MUX] = {
 		.data = &(struct vc3_clk_data) {
-			.offs = VC3_DIFF2_CTRL_REG,
-			.bitmsk = VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL
+			.offs = VC3_SE1_DIV4_CTRL,
+			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
 		},
 		.hw.init = &(struct clk_init_data){
-			.name = "diff2_mux",
+			.name = "se1_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
+				&clk_div[VC3_DIV5].hw,
+				&clk_div[VC3_DIV4].hw
 			},
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
 	},
-	[VC3_DIFF1_MUX] = {
+	[VC3_SE2_MUX] = {
 		.data = &(struct vc3_clk_data) {
-			.offs = VC3_DIFF1_CTRL_REG,
-			.bitmsk = VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL
+			.offs = VC3_SE2_CTRL_REG0,
+			.bitmsk = VC3_SE2_CTRL_REG0_SE2_CLK_SEL
 		},
 		.hw.init = &(struct clk_init_data){
-			.name = "diff1_mux",
+			.name = "se2_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
+				&clk_div[VC3_DIV5].hw,
+				&clk_div[VC3_DIV4].hw
 			},
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
@@ -945,33 +945,33 @@ static struct vc3_hw_data clk_mux[] = {
 			.flags = CLK_SET_RATE_PARENT
 		}
 	},
-	[VC3_SE2_MUX] = {
+	[VC3_DIFF1_MUX] = {
 		.data = &(struct vc3_clk_data) {
-			.offs = VC3_SE2_CTRL_REG0,
-			.bitmsk = VC3_SE2_CTRL_REG0_SE2_CLK_SEL
+			.offs = VC3_DIFF1_CTRL_REG,
+			.bitmsk = VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL
 		},
 		.hw.init = &(struct clk_init_data){
-			.name = "se2_mux",
+			.name = "diff1_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
+				&clk_div[VC3_DIV1].hw,
+				&clk_div[VC3_DIV3].hw
 			},
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
 	},
-	[VC3_SE1_MUX] = {
+	[VC3_DIFF2_MUX] = {
 		.data = &(struct vc3_clk_data) {
-			.offs = VC3_SE1_DIV4_CTRL,
-			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
+			.offs = VC3_DIFF2_CTRL_REG,
+			.bitmsk = VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL
 		},
 		.hw.init = &(struct clk_init_data){
-			.name = "se1_mux",
+			.name = "diff2_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
+				&clk_div[VC3_DIV1].hw,
+				&clk_div[VC3_DIV3].hw
 			},
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
@@ -1110,7 +1110,7 @@ static int vc3_probe(struct i2c_client *client)
 				name, 0, CLK_SET_RATE_PARENT, 1, 1);
 		else
 			clk_out[i] = devm_clk_hw_register_fixed_factor_parent_hw(dev,
-				name, &clk_mux[i].hw, CLK_SET_RATE_PARENT, 1, 1);
+				name, &clk_mux[i - 1].hw, CLK_SET_RATE_PARENT, 1, 1);
 
 		if (IS_ERR(clk_out[i]))
 			return PTR_ERR(clk_out[i]);
-- 
2.25.1

