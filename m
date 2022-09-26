Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABD25EAE64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 19:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiIZRm5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 13:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbiIZRmZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 13:42:25 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7732399C6;
        Mon, 26 Sep 2022 10:10:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,346,1654527600"; 
   d="scan'208";a="136218120"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Sep 2022 02:10:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0889E400547B;
        Tue, 27 Sep 2022 02:10:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Date:   Mon, 26 Sep 2022 18:10:02 +0100
Message-Id: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
with a lower clock rate compared to a higher one.
For eg: The rounding error (533333333 Hz / 4 * 4 = 533333332 Hz < 5333333
33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.

This patch fixes this issue by adding a margin of (1/1024) higher to
the clock rate.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
 * Added Tested-by tag from Wolfram.
 * Updated commit description and code comment with real example.
v2->v3:
 * Renamed the variable new_clock_margin->new_upper_limit in renesas_sdhi_clk_
   update()
 * Moved setting of new_upper_limit outside for loop.
 * Updated the comment section to mention the rounding errors and merged with
   existing comment out side the for loop.
 * Updated commit description. 
v1->v2:
 * Add a comment explaining why margin is needed and set it to
   that particular value.
---
 drivers/mmc/host/renesas_sdhi_core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6edbf5c161ab..d1b8130ee37f 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -128,6 +128,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	struct clk *ref_clk = priv->clk;
 	unsigned int freq, diff, best_freq = 0, diff_min = ~0;
 	unsigned int new_clock, clkh_shift = 0;
+	unsigned int new_upper_limit;
 	int i;
 
 	/*
@@ -153,10 +154,17 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 * greater than, new_clock.  As we can divide by 1 << i for
 	 * any i in [0, 9] we want the input clock to be as close as
 	 * possible, but no greater than, new_clock << i.
+	 *
+	 * Add an upper limit of 1/1024 rate higher to the clock rate to fix
+	 * clk rate jumping to lower rate due to rounding error (eg: RZ/G2L has
+	 * 3 clk sources 533.333333 MHz, 400 MHz and 266.666666 MHz. The request
+	 * for 533.333333 MHz will selects a slower 400 MHz due to rounding
+	 * error (533333333 Hz / 4 * 4 = 533333332 Hz < 533333333 Hz)).
 	 */
+	new_upper_limit = (new_clock << i) + ((new_clock << i) >> 10);
 	for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
 		freq = clk_round_rate(ref_clk, new_clock << i);
-		if (freq > (new_clock << i)) {
+		if (freq > new_upper_limit) {
 			/* Too fast; look for a slightly slower option */
 			freq = clk_round_rate(ref_clk, (new_clock << i) / 4 * 3);
 			if (freq > (new_clock << i))
@@ -181,6 +189,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
+	unsigned int clk_margin;
 	u32 clk = 0, clock;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
@@ -194,7 +203,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
 	clock = host->mmc->actual_clock / 512;
 
-	for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
+	/*
+	 * Add a margin of 1/1024 rate higher to the clock rate in order
+	 * to avoid clk variable setting a value of 0 due to the margin
+	 * provided for actual_clock in renesas_sdhi_clk_update().
+	 */
+	clk_margin = new_clock >> 10;
+	for (clk = 0x80000080; new_clock + clk_margin >= (clock << 1); clk >>= 1)
 		clock <<= 1;
 
 	/* 1/1 clock is option */
-- 
2.25.1

