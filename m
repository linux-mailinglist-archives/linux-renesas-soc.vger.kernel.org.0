Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAF17B780D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Oct 2023 08:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbjJDGm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 02:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjJDGm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 02:42:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04BBCAF;
        Tue,  3 Oct 2023 23:42:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,199,1694703600"; 
   d="scan'208";a="178128218"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Oct 2023 15:42:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.187])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 844AB4004BD6;
        Wed,  4 Oct 2023 15:42:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] clk: vc3: Use clamp() instead of min_t()
Date:   Wed,  4 Oct 2023 07:42:19 +0100
Message-Id: <20231004064220.31452-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The min_t() is often used as a shortcut for clamp(). Secondly, the
BIT(16) - 1 is specifically used as the value related to the bits in the
hardware and u16 is a software type that coincidentally has the same
maximum as the above mentioned bitfield.

Replace min_t()->clamp() in vc3_pll_round_rate().

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 3d7de355f8f6..50772f61096f 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -402,7 +402,7 @@ static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		div_frc = rate % *parent_rate;
 		div_frc *= BIT(16) - 1;
 
-		vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);
+		vc3->div_frc = clamp(div64_ul(div_frc, *parent_rate), 0, BIT(16) - 1);
 		rate = (*parent_rate *
 			(vc3->div_int * VC3_2_POW_16 + vc3->div_frc) / VC3_2_POW_16);
 	} else {
-- 
2.25.1

