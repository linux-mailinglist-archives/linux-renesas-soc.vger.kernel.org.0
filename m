Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E70351779
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 19:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbhDARmR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Apr 2021 13:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234678AbhDARjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:39:07 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9735FC05BD2A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by xavier.telenet-ops.be with bizsmtp
        id nR1g2400M4A7w6i01R1gp7; Thu, 01 Apr 2021 15:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkH-5F; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mtV-Nj; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] clk: renesas: div6: Implement range checking
Date:   Thu,  1 Apr 2021 15:01:38 +0200
Message-Id: <35ceb262c71f1b2e9864a39bde9dafd78b2981f4.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281699.git.geert+renesas@glider.be>
References: <cover.1617281699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Consider the minimum and maximum clock rates imposed by clock users when
calculating the most appropriate clock rate in the .determine_rate()
callback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index a9ac2a83c1d0daa0..3abd6e5400aded6a 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -106,8 +106,8 @@ static int cpg_div6_clock_determine_rate(struct clk_hw *hw,
 	unsigned long prate, calc_rate, diff, best_rate, best_prate;
 	unsigned int num_parents = clk_hw_get_num_parents(hw);
 	struct clk_hw *parent, *best_parent = NULL;
+	unsigned int i, min_div, max_div, div;
 	unsigned long min_diff = ULONG_MAX;
-	unsigned int i, div;
 
 	for (i = 0; i < num_parents; i++) {
 		parent = clk_hw_get_parent_by_index(hw, i);
@@ -118,7 +118,13 @@ static int cpg_div6_clock_determine_rate(struct clk_hw *hw,
 		if (!prate)
 			continue;
 
+		min_div = max(DIV_ROUND_UP(prate, req->max_rate), 1UL);
+		max_div = req->min_rate ? min(prate / req->min_rate, 64UL) : 64;
+		if (max_div < min_div)
+			continue;
+
 		div = cpg_div6_clock_calc_div(req->rate, prate);
+		div = clamp(div, min_div, max_div);
 		calc_rate = prate / div;
 		diff = calc_rate > req->rate ? calc_rate - req->rate
 					     : req->rate - calc_rate;
-- 
2.25.1

