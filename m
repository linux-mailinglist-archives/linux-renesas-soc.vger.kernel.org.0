Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C0AA3806
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 15:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfH3NuW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 09:50:22 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52322 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbfH3NuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 09:50:21 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id vRqJ2000l05gfCL01RqJdj; Fri, 30 Aug 2019 15:50:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIA-0003KX-Pv; Fri, 30 Aug 2019 15:50:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hDK-00037r-VO; Fri, 30 Aug 2019 15:45:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 8/8] clk: renesas: rcar-gen3: Switch SD clocks to .determine_rate()
Date:   Fri, 30 Aug 2019 15:45:15 +0200
Message-Id: <20190830134515.11925-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830134515.11925-1-geert+renesas@glider.be>
References: <20190830134515.11925-1-geert+renesas@glider.be>
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

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Extract cpg_sd_clock_calc_div() absorption and best rate calculation
    into their own patches.
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 176f908929b3920f..7b47743097395102 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -315,8 +315,8 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 				 clock->div_table[clock->cur_div_idx].div);
 }
 
-static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cpg_sd_clock_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
 	struct sd_clock *clock = to_sd_clock(hw);
@@ -324,19 +324,24 @@ static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++) {
-		calc_rate = DIV_ROUND_CLOSEST(*parent_rate,
+		calc_rate = DIV_ROUND_CLOSEST(req->best_parent_rate,
 					      clock->div_table[i].div);
-		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
+		if (calc_rate < req->min_rate || calc_rate > req->max_rate)
+			continue;
+
+		diff = calc_rate > req->rate ? calc_rate - req->rate
+					     : req->rate - calc_rate;
 		if (diff < diff_min) {
 			best_rate = calc_rate;
 			diff_min = diff;
 		}
 	}
 
-	if (best_rate > LONG_MAX)
+	if (best_rate == ULONG_MAX)
 		return -EINVAL;
 
-	return best_rate;
+	req->rate = best_rate;
+	return 0;
 }
 
 static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -367,7 +372,7 @@ static const struct clk_ops cpg_sd_clock_ops = {
 	.disable = cpg_sd_clock_disable,
 	.is_enabled = cpg_sd_clock_is_enabled,
 	.recalc_rate = cpg_sd_clock_recalc_rate,
-	.round_rate = cpg_sd_clock_round_rate,
+	.determine_rate = cpg_sd_clock_determine_rate,
 	.set_rate = cpg_sd_clock_set_rate,
 };
 
-- 
2.17.1

