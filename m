Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC448321
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfFQMw7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:52:59 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:40256 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfFQMw7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:52:59 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Rosg2000Z3XaVaC06osgLM; Mon, 17 Jun 2019 14:52:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0001s4-KC; Mon, 17 Jun 2019 14:52:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0003az-JE; Mon, 17 Jun 2019 14:52:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] clk: renesas: rcar-gen3: Switch SD clocks to .determine_rate()
Date:   Mon, 17 Jun 2019 14:52:38 +0200
Message-Id: <20190617125238.13761-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125238.13761-1-geert+renesas@glider.be>
References: <20190617125238.13761-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the SD clocks on R-Car Gen3 from the old
.round_rate() callback to the newer .determine_rate() callback, which
does not suffer from this limitation.

This includes implementing range checking.

Absorb cpg_sd_clock_calc_div() into cpg_sd_clock_determine_rate(), and
replace the best divider by the best rate to avoid repeating one
division.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 387b22f7d1755d02..9592e6e47ef330b5 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -315,33 +315,33 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 				 clock->div_table[clock->cur_div_idx].div);
 }
 
-static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
-					  unsigned long rate,
-					  unsigned long parent_rate)
+static int cpg_sd_clock_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	unsigned long calc_rate, diff, diff_min = ULONG_MAX;
-	unsigned int i, best_div = 0;
+	unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
+	unsigned long calc_rate, diff;
+	struct sd_clock *clock = to_sd_clock(hw);
+	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++) {
-		calc_rate = DIV_ROUND_CLOSEST(parent_rate,
+		calc_rate = DIV_ROUND_CLOSEST(req->best_parent_rate,
 					      clock->div_table[i].div);
-		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
+		if (calc_rate < req->min_rate || calc_rate > req->max_rate)
+			continue;
+
+		diff = calc_rate > req->rate ? calc_rate - req->rate
+					     : req->rate - calc_rate;
 		if (diff < diff_min) {
-			best_div = clock->div_table[i].div;
+			best_rate = calc_rate;
 			diff_min = diff;
 		}
 	}
 
-	return best_div;
-}
-
-static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned int div = cpg_sd_clock_calc_div(clock, rate, *parent_rate);
+	if (best_rate == ULONG_MAX)
+		return -EINVAL;
 
-	return DIV_ROUND_CLOSEST(*parent_rate, div);
+	req->rate = best_rate;
+	return 0;
 }
 
 static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -372,7 +372,7 @@ static const struct clk_ops cpg_sd_clock_ops = {
 	.disable = cpg_sd_clock_disable,
 	.is_enabled = cpg_sd_clock_is_enabled,
 	.recalc_rate = cpg_sd_clock_recalc_rate,
-	.round_rate = cpg_sd_clock_round_rate,
+	.determine_rate = cpg_sd_clock_determine_rate,
 	.set_rate = cpg_sd_clock_set_rate,
 };
 
-- 
2.17.1

