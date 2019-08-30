Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56894A3811
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 15:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfH3NuX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 09:50:23 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:55532 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfH3NuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 09:50:21 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id vRqK2000305gfCL01RqKwV; Fri, 30 Aug 2019 15:50:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIA-0003KX-Vj; Fri, 30 Aug 2019 15:50:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hDK-00037W-OY; Fri, 30 Aug 2019 15:45:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/8] clk: renesas: rcar-gen2: Improve arithmetic divisions
Date:   Fri, 30 Aug 2019 15:45:08 +0200
Message-Id: <20190830134515.11925-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830134515.11925-1-geert+renesas@glider.be>
References: <20190830134515.11925-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - Use div64_ul() instead of div_u64() if the divisor is unsigned long,
    to avoid truncation to 32-bit on 64-bit platforms,
  - Prefer ULL constant suffixes over casts to u64,
  - Prioritize multiplication over division, to increase accuracy.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/clk/renesas/rcar-gen2-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
index f596a2dafcf4d8d1..c378505830f0bacc 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.c
+++ b/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -72,10 +72,10 @@ static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!prate)
 		prate = 1;
 
-	mult = div_u64((u64)rate * 32, prate);
+	mult = div64_ul(rate * 32ULL, prate);
 	mult = clamp(mult, 1U, 32U);
 
-	return *parent_rate / 32 * mult;
+	return div_u64((u64)*parent_rate * mult, 32);
 }
 
 static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -86,7 +86,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 val, kick;
 	unsigned int i;
 
-	mult = div_u64((u64)rate * 32, parent_rate);
+	mult = div64_ul(rate * 32ULL, parent_rate);
 	mult = clamp(mult, 1U, 32U);
 
 	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
-- 
2.17.1

