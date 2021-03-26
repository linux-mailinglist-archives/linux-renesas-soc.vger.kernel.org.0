Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518FD34A6BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 13:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhCZMC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 08:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhCZMC0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 08:02:26 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B291C0613BE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 05:02:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by laurent.telenet-ops.be with bizsmtp
        id l02F2400X53vE1T0102FuN; Fri, 26 Mar 2021 13:02:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAN-00AXLa-As; Fri, 26 Mar 2021 13:02:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-006cQo-FX; Fri, 26 Mar 2021 13:02:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] clk: renesas: rcar-gen3: Add boost support to Z clocks
Date:   Fri, 26 Mar 2021 13:01:00 +0100
Message-Id: <20210326120100.1577596-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for switching the Z and Z2 clocks between normal and boost
modes, by requesting clock rate changes to parent PLLs.

Inspired by a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index cc9a116d7d093ce7..558191c99b48d1f1 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -165,6 +165,7 @@ struct cpg_z_clk {
 	struct clk_hw hw;
 	void __iomem *reg;
 	void __iomem *kick_reg;
+	unsigned long max_rate;		/* Maximum rate for normal mode */
 	unsigned int fixed_div;
 	u32 mask;
 };
@@ -190,7 +191,18 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
 {
 	struct cpg_z_clk *zclk = to_z_clk(hw);
 	unsigned int min_mult, max_mult, mult;
-	unsigned long prate;
+	unsigned long rate, prate;
+
+	rate = min(req->rate, req->max_rate);
+	if (rate <= zclk->max_rate) {
+		/* Set parent rate to initial value for normal modes */
+		prate = zclk->max_rate;
+	} else {
+		/* Set increased parent rate for boost modes */
+		prate = rate;
+	}
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
+						  prate * zclk->fixed_div);
 
 	prate = req->best_parent_rate / zclk->fixed_div;
 	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
@@ -198,7 +210,7 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
 	if (max_mult < min_mult)
 		return -EINVAL;
 
-	mult = DIV_ROUND_CLOSEST_ULL(req->rate * 32ULL, prate);
+	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL, prate);
 	mult = clamp(mult, min_mult, max_mult);
 
 	req->rate = DIV_ROUND_CLOSEST_ULL((u64)prate * mult, 32);
@@ -268,7 +280,7 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 
 	init.name = name;
 	init.ops = &cpg_z_clk_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
@@ -279,9 +291,13 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
 
 	clk = clk_register(NULL, &zclk->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
 		kfree(zclk);
+		return clk;
+	}
 
+	zclk->max_rate = clk_hw_get_rate(clk_hw_get_parent(&zclk->hw)) /
+			 zclk->fixed_div;
 	return clk;
 }
 
-- 
2.25.1

