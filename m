Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707BF48328
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbfFQMxA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:53:00 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:40270 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfFQMw7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:52:59 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Rosg2000a3XaVaC06osgLH; Mon, 17 Jun 2019 14:52:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0001rv-Ho; Mon, 17 Jun 2019 14:52:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0003an-Gk; Mon, 17 Jun 2019 14:52:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] clk: renesas: rcar-gen2-legacy: Switch Z clock to .determine_rate()
Date:   Mon, 17 Jun 2019 14:52:34 +0200
Message-Id: <20190617125238.13761-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125238.13761-1-geert+renesas@glider.be>
References: <20190617125238.13761-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the Z clock on R-Car Gen2 from the old
.round_rate() callback to the newer .determine_rate() callback, which
does not suffer from this limitation.

This includes implementing range checking.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-rcar-gen2.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index da9fe3f032eb2a0d..f85837716d2840cf 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -66,19 +66,22 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 	return div_u64((u64)parent_rate * mult, 32);
 }
 
-static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int cpg_z_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	unsigned long prate  = *parent_rate;
-	unsigned int mult;
+	unsigned long prate = req->best_parent_rate;
+	unsigned int min_mult, max_mult, mult;
 
-	if (!prate)
-		prate = 1;
+	min_mult = max(div_u64(req->min_rate * 32ULL, prate), 1ULL);
+	max_mult = min(div_u64(req->max_rate * 32ULL, prate), 32ULL);
+	if (max_mult < min_mult)
+		return -EINVAL;
 
-	mult = div_u64((u64)rate * 32, prate);
-	mult = clamp(mult, 1U, 32U);
+	mult = div_u64(req->rate * 32ULL, prate);
+	mult = clamp(mult, min_mult, max_mult);
 
-	return *parent_rate / 32 * mult;
+	req->rate = prate / 32 * mult;
+	return 0;
 }
 
 static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -129,7 +132,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops cpg_z_clk_ops = {
 	.recalc_rate = cpg_z_clk_recalc_rate,
-	.round_rate = cpg_z_clk_round_rate,
+	.determine_rate = cpg_z_clk_determine_rate,
 	.set_rate = cpg_z_clk_set_rate,
 };
 
-- 
2.17.1

