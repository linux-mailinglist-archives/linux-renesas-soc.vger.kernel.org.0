Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD59A351AC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 20:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236903AbhDASDK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Apr 2021 14:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbhDAR5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:57:36 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73870C05BD24
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by baptiste.telenet-ops.be with bizsmtp
        id nR1h240024A7w6i01R1haH; Thu, 01 Apr 2021 15:01:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkF-Lr; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mtL-LA; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] clk: renesas: div6: Switch to .determine_rate()
Date:   Thu,  1 Apr 2021 15:01:36 +0200
Message-Id: <7fd8c45cd8bf5c6d928ca69c8b669be35b93de09.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281699.git.geert+renesas@glider.be>
References: <cover.1617281699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the DIV6 clocks on SH/R-Mobile and R-Car
SoCs from the old .round_rate() callback to the newer .determine_rate()
callback, which does not suffer from this limitation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 2920bec49bce0eb8..3af65ef5690e3d84 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -100,12 +100,14 @@ static unsigned int cpg_div6_clock_calc_div(unsigned long rate,
 	return clamp(div, 1U, 64U);
 }
 
-static long cpg_div6_clock_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cpg_div6_clock_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	unsigned int div = cpg_div6_clock_calc_div(rate, *parent_rate);
+	unsigned int div = cpg_div6_clock_calc_div(req->rate,
+						   req->best_parent_rate);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static int cpg_div6_clock_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -166,7 +168,7 @@ static const struct clk_ops cpg_div6_clock_ops = {
 	.get_parent = cpg_div6_clock_get_parent,
 	.set_parent = cpg_div6_clock_set_parent,
 	.recalc_rate = cpg_div6_clock_recalc_rate,
-	.round_rate = cpg_div6_clock_round_rate,
+	.determine_rate = cpg_div6_clock_determine_rate,
 	.set_rate = cpg_div6_clock_set_rate,
 };
 
-- 
2.25.1

