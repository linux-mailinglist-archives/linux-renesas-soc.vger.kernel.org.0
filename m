Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D26A3814
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 15:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfH3NuX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 09:50:23 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:55544 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfH3NuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 09:50:21 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id vRqJ2000u05gfCL01RqJwS; Fri, 30 Aug 2019 15:50:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIA-0003KX-Qq; Fri, 30 Aug 2019 15:50:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hDK-00037o-Ud; Fri, 30 Aug 2019 15:45:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 7/8] clk: renesas: rcar-gen3: Switch Z clocks to .determine_rate()
Date:   Fri, 30 Aug 2019 15:45:14 +0200
Message-Id: <20190830134515.11925-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830134515.11925-1-geert+renesas@glider.be>
References: <20190830134515.11925-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the Z clocks on R-Car Gen3 from the old
.round_rate() callback to the newer .determine_rate() callback, which
does not suffer from this limitation.

This includes implementing range checking.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Use div_u64() for division by unsigned long,
  - Rebased.
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index a612045cba7d97b7..176f908929b3920f 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -114,18 +114,24 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 				     32 * zclk->fixed_div);
 }
 
-static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int cpg_z_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int min_mult, max_mult, mult;
 	unsigned long prate;
-	unsigned int mult;
 
-	prate = *parent_rate / zclk->fixed_div;
-	mult = div64_ul(rate * 32ULL, prate);
-	mult = clamp(mult, 1U, 32U);
+	prate = req->best_parent_rate / zclk->fixed_div;
+	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
+	max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
+	if (max_mult < min_mult)
+		return -EINVAL;
 
-	return div_u64((u64)prate * mult, 32);
+	mult = div64_ul(req->rate * 32ULL, prate);
+	mult = clamp(mult, min_mult, max_mult);
+
+	req->rate = div_u64((u64)prate * mult, 32);
+	return 0;
 }
 
 static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -172,7 +178,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops cpg_z_clk_ops = {
 	.recalc_rate = cpg_z_clk_recalc_rate,
-	.round_rate = cpg_z_clk_round_rate,
+	.determine_rate = cpg_z_clk_determine_rate,
 	.set_rate = cpg_z_clk_set_rate,
 };
 
-- 
2.17.1

