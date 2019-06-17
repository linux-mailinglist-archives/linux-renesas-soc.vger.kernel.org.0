Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9F64831A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbfFQMwt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:52:49 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:46344 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbfFQMwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:52:49 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Rosf2000H3XaVaC01osfnN; Mon, 17 Jun 2019 14:52:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0001s2-JU; Mon, 17 Jun 2019 14:52:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0003aw-IW; Mon, 17 Jun 2019 14:52:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] clk: renesas: rcar-gen3: Avoid double table iteration in SD .set_rate()
Date:   Mon, 17 Jun 2019 14:52:37 +0200
Message-Id: <20190617125238.13761-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125238.13761-1-geert+renesas@glider.be>
References: <20190617125238.13761-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The .set_rate() callback for the SD clocks is always called with a valid
clock rate, returned by .round_rate().  Hence there is no need to
iterate through the divider table twice: once to repeat the work done by
.round_rate(), and a second time to find the corresponding divider
entry.

Just iterate once, looking for the divider that matches the passed clock
rate.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 2268f44ccb8fe9bc..387b22f7d1755d02 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -345,14 +345,14 @@ static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long parent_rate)
+				 unsigned long parent_rate)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
-		if (div == clock->div_table[i].div)
+		if (rate == DIV_ROUND_CLOSEST(parent_rate,
+					      clock->div_table[i].div))
 			break;
 
 	if (i >= clock->div_num)
-- 
2.17.1

