Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F761A380C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 15:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfH3NuW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 09:50:22 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52314 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfH3NuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 09:50:22 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id vRqJ2000u05gfCL01RqKdp; Fri, 30 Aug 2019 15:50:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIA-0003KX-Ts; Fri, 30 Aug 2019 15:50:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hDK-00037f-Qz; Fri, 30 Aug 2019 15:45:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/8] clk: renesas: rcar-gen3: Absorb cpg_sd_clock_calc_div()
Date:   Fri, 30 Aug 2019 15:45:11 +0200
Message-Id: <20190830134515.11925-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830134515.11925-1-geert+renesas@glider.be>
References: <20190830134515.11925-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

cpg_sd_clock_round_rate() is the sole caller of cpg_sd_clock_calc_div(),
hence absorb the latter into the former.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split off from "clk: renesas: rcar-gen3: Switch SD clocks to
    .determine_rate()".
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 9f457411984b1ca4..12ea5c9a671de788 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -309,15 +309,15 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 				 clock->div_table[clock->cur_div_idx].div);
 }
 
-static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
-					  unsigned long rate,
-					  unsigned long parent_rate)
+static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long *parent_rate)
 {
 	unsigned long calc_rate, diff, diff_min = ULONG_MAX;
+	struct sd_clock *clock = to_sd_clock(hw);
 	unsigned int i, best_div = 0;
 
 	for (i = 0; i < clock->div_num; i++) {
-		calc_rate = DIV_ROUND_CLOSEST(parent_rate,
+		calc_rate = DIV_ROUND_CLOSEST(*parent_rate,
 					      clock->div_table[i].div);
 		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
 		if (diff < diff_min) {
@@ -326,16 +326,7 @@ static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
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
-
-	return DIV_ROUND_CLOSEST(*parent_rate, div);
+	return DIV_ROUND_CLOSEST(*parent_rate, best_div);
 }
 
 static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.17.1

