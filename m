Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4037A5BC47D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 10:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiISIlY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 04:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiISIlV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 04:41:21 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0FEBE19019;
        Mon, 19 Sep 2022 01:41:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,327,1654527600"; 
   d="scan'208";a="135419401"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Sep 2022 17:41:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.50])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 66C344003FA7;
        Mon, 19 Sep 2022 17:41:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzg2l: Support sd clk mux round operation
Date:   Mon, 19 Sep 2022 09:41:10 +0100
Message-Id: <20220919084110.3065156-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, determine_rate() is not doing any round operation
and due to this it always selects a lower clock source compared
to the closest higher one.

Support sd clk mux round operation by passing
CLK_MUX_ROUND_CLOSEST flag to clk_mux_determine_rate_flags().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3ff6ecd61756..5dfe3624f681 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -182,7 +182,7 @@ rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
 static int rzg2l_cpg_sd_clk_mux_determine_rate(struct clk_hw *hw,
 					       struct clk_rate_request *req)
 {
-	return clk_mux_determine_rate_flags(hw, req, 0);
+	return clk_mux_determine_rate_flags(hw, req, CLK_MUX_ROUND_CLOSEST);
 }
 
 static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
-- 
2.25.1

