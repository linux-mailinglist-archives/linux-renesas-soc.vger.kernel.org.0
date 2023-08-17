Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32577F8BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 16:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351818AbjHQOXB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 10:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351839AbjHQOW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 10:22:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6943B2D77;
        Thu, 17 Aug 2023 07:22:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; 
   d="scan'208";a="176882443"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2023 23:22:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B01C34270482;
        Thu, 17 Aug 2023 23:22:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v3 2/4] clk: vc3: Fix 64 by 64 division
Date:   Thu, 17 Aug 2023 15:22:09 +0100
Message-Id: <20230817142211.311366-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
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

Fix the below cocci warnings by replacing do_div()->div64_ul() and
bound the result with a max value of U16_MAX.

cocci warnings:
	drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
	64-by-32 division, please consider using div64_ul instead.

Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202307270841.yr5HxYIl-lkp@intel.com/
Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added to this patch series.
v1->v2:
 * Added fixes tag.
---
 drivers/clk/clk-versaclock3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 7ab2447bd203..3ded616a0d15 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -401,9 +401,8 @@ static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		/* Determine best fractional part, which is 16 bit wide */
 		div_frc = rate % *parent_rate;
 		div_frc *= BIT(16) - 1;
-		do_div(div_frc, *parent_rate);
 
-		vc3->div_frc = (u32)div_frc;
+		vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);
 		rate = (*parent_rate *
 			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
 	} else {
-- 
2.25.1

