Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6660063C5D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Nov 2022 17:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbiK2Q7O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Nov 2022 11:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236268AbiK2Q6w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2022 11:58:52 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1404E6B386
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2022 08:53:32 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id qGtW2800Z4C55Sk06GtWfJ; Tue, 29 Nov 2022 17:53:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p03rO-0023T6-3O; Tue, 29 Nov 2022 17:53:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p03rN-003MCp-KN; Tue, 29 Nov 2022 17:53:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779g0: Fix OSC predividers
Date:   Tue, 29 Nov 2022 17:53:25 +0100
Message-Id: <dcd572acc584c237f70d2309e038f25040236a87.1669740722.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the table in Note 5 for the OSC clock in Table 8.1.4e
("Lists of CPG clocks generated from PLL5") of the R-Car V4H Series
Hardware User's Manual Rev. 0.54, the predividers for the OSC clock are
16 resp. 32 when using a 16.66 resp. 33.33 MHz external crystal.

Fixes: 0ab55cf1834177a2 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v6.3.

Presumably this was copied from r8a779f0-cpg-mssr.c, as R-Car S4-8 does
support dividers of 15 and 19 with a 16.00 resp. 40.00 MHz external
crystal.
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 9863f1a51f4b36e2..2feb97fc37759267 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -212,20 +212,20 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
  *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
  * 14 13 (MHz)
  * ------------------------------------------------------------------------
- * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/15
+ * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/16
  * 0  1	 20    / 1	x160	x170	x160	x120	x160	x140	/19
  * 1  0	 Prohibited setting
- * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/38
+ * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/32
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
 
 static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
 	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
-	{ 1,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	15,	},
+	{ 1,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	16,	},
 	{ 1,		160,	1,	170,	1,	160,	1,	120,	1,	160,	1,	140,	1,	19,	},
 	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
-	{ 2,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	38,	},
+	{ 2,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	32,	},
 };
 
 static int __init r8a779g0_cpg_mssr_init(struct device *dev)
-- 
2.25.1

