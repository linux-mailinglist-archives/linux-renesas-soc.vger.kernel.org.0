Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF965183C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbiECMFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiECMFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:05:19 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89F7E3057C;
        Tue,  3 May 2022 05:01:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="118643163"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2022 21:01:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 92CA24226AEF;
        Tue,  3 May 2022 21:01:44 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 06/12] clk: renesas: rzg2l: Add read only versions of the clk macros
Date:   Tue,  3 May 2022 12:55:51 +0100
Message-Id: <20220503115557.53370-7-phil.edworthy@renesas.com>
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

This just makes the clk tables easier to read.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v3:
 - New patch inserted
---
 drivers/clk/renesas/r9a07g043-cpg.c | 3 +--
 drivers/clk/renesas/r9a07g044-cpg.c | 6 ++----
 drivers/clk/renesas/rzg2l-cpg.h     | 9 +++++++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 8241f5972de1..fde934151b57 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -98,8 +98,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
 	DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
 	DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
-	DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
-		sel_pll3_3, 0, CLK_MUX_READ_ONLY),
+	DEF_MUX_RO(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3, sel_pll3_3),
 	DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
 		DIVPL3C, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 43c4d6b8ccf4..ee442684453b 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -138,15 +138,13 @@ static const struct {
 		DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
 		DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 		DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
-		DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
-			sel_pll3_3, 0, CLK_MUX_READ_ONLY),
+		DEF_MUX_RO(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3, sel_pll3_3),
 		DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
 			DIVPL3C, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 
 		DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_FOUT3, 1, 2),
 		DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
-		DEF_MUX(".sel_gpu2", CLK_SEL_GPU2, SEL_GPU2,
-			sel_gpu2, 0, CLK_MUX_READ_ONLY),
+		DEF_MUX_RO(".sel_gpu2", CLK_SEL_GPU2, SEL_GPU2, sel_gpu2),
 		DEF_PLL5_FOUTPOSTDIV(".pll5_foutpostdiv", CLK_PLL5_FOUTPOSTDIV, CLK_EXTAL),
 		DEF_FIXED(".pll5_fout1ph0", CLK_PLL5_FOUT1PH0, CLK_PLL5_FOUTPOSTDIV, 1, 2),
 		DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4, sel_pll5_4),
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index dfef1e2792fa..a6004f0b415a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -138,11 +138,20 @@ enum clk_types {
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, .flag = _flag)
+#define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, \
+		 .flag = CLK_DIVIDER_READ_ONLY)
 #define DEF_MUX(_name, _id, _conf, _parent_names, _flag, _mux_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .flag = _flag, .mux_flags = _mux_flags)
+#define DEF_MUX_RO(_name, _id, _conf, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .mux_flags = CLK_MUX_READ_ONLY)
 #define DEF_SD_MUX(_name, _id, _conf, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, \
-- 
2.32.0

