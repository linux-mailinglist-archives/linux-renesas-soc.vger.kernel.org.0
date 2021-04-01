Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725CD351774
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 19:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbhDARmQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Apr 2021 13:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbhDARgs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:36:48 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A17C05BD32
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Apr 2021 06:03:29 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by andre.telenet-ops.be with bizsmtp
        id nR3T2400c4A7w6i01R3TwL; Thu, 01 Apr 2021 15:03:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwyt-00CBlT-Ei; Thu, 01 Apr 2021 15:03:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwys-003mwo-TQ; Thu, 01 Apr 2021 15:03:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r9a06g032: Switch to .determine_rate()
Date:   Thu,  1 Apr 2021 15:03:24 +0200
Message-Id: <7a384d02b85cdaac4a0e2b357582c8244b9a6f98.1617282116.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the divider clocks on RZ/N1 from the old
.round_rate() callback to the newer .determine_rate() callback, which
does not suffer from this limitation.

Note that range checking is not yet implemented.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only due to lack of hardware.

To be queued in renesas-clk for v5.14.
---
 drivers/clk/renesas/r9a06g032-clocks.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 71b11443f6fc3801..c99942f0e4d4c751 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -604,20 +604,19 @@ r9a06g032_div_clamp_div(struct r9a06g032_clk_div *clk,
 	return div;
 }
 
-static long
-r9a06g032_div_round_rate(struct clk_hw *hw,
-			 unsigned long rate, unsigned long *prate)
+static int
+r9a06g032_div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct r9a06g032_clk_div *clk = to_r9a06g032_div(hw);
-	u32 div = DIV_ROUND_UP(*prate, rate);
+	u32 div = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 
 	pr_devel("%s %pC %ld (prate %ld) (wanted div %u)\n", __func__,
-		 hw->clk, rate, *prate, div);
+		 hw->clk, req->rate, req->best_parent_rate, div);
 	pr_devel("   min %d (%ld) max %d (%ld)\n",
-		 clk->min, DIV_ROUND_UP(*prate, clk->min),
-		clk->max, DIV_ROUND_UP(*prate, clk->max));
+		 clk->min, DIV_ROUND_UP(req->best_parent_rate, clk->min),
+		 clk->max, DIV_ROUND_UP(req->best_parent_rate, clk->max));
 
-	div = r9a06g032_div_clamp_div(clk, rate, *prate);
+	div = r9a06g032_div_clamp_div(clk, req->rate, req->best_parent_rate);
 	/*
 	 * this is a hack. Currently the serial driver asks for a clock rate
 	 * that is 16 times the baud rate -- and that is wildly outside the
@@ -630,11 +629,13 @@ r9a06g032_div_round_rate(struct clk_hw *hw,
 	if (clk->index == R9A06G032_DIV_UART ||
 	    clk->index == R9A06G032_DIV_P2_PG) {
 		pr_devel("%s div uart hack!\n", __func__);
-		return clk_get_rate(hw->clk);
+		req->rate = clk_get_rate(hw->clk);
+		return 0;
 	}
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
 	pr_devel("%s %pC %ld / %u = %ld\n", __func__, hw->clk,
-		 *prate, div, DIV_ROUND_UP(*prate, div));
-	return DIV_ROUND_UP(*prate, div);
+		 req->best_parent_rate, div, req->rate);
+	return 0;
 }
 
 static int
@@ -663,7 +664,7 @@ r9a06g032_div_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops r9a06g032_clk_div_ops = {
 	.recalc_rate = r9a06g032_div_recalc_rate,
-	.round_rate = r9a06g032_div_round_rate,
+	.determine_rate = r9a06g032_div_determine_rate,
 	.set_rate = r9a06g032_div_set_rate,
 };
 
-- 
2.25.1

