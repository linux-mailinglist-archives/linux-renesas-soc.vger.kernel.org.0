Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D265A5BC4AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 10:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiISIst (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 04:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiISIsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 04:48:46 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DCEFD220E9;
        Mon, 19 Sep 2022 01:48:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,327,1654527600"; 
   d="scan'208";a="133266331"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Sep 2022 17:48:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.50])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3CD2640071FA;
        Mon, 19 Sep 2022 17:48:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] mmc: renesas_sdhi: Add clk margin for sdhi hs clock
Date:   Mon, 19 Sep 2022 09:48:38 +0100
Message-Id: <20220919084838.3066429-1-biju.das.jz@bp.renesas.com>
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

The SDHI high speed clock is 4 times that of the main clock. Currently,
there is no margin added for setting the rate associated with this
clock. On RZ/G2L platforms, due to lack of this margin leads to the
selection of a clock source with a lower clock rate compared to a higher
one.

This patch adds a margin of (1/1024) higher to hs clock rate and there
by avoid looking for a smaller clock option.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Add a comment explaining why margin is needed and set it to
   that particular value.
---
 drivers/mmc/host/renesas_sdhi_core.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6edbf5c161ab..14f41398d3a0 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -128,6 +128,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	struct clk *ref_clk = priv->clk;
 	unsigned int freq, diff, best_freq = 0, diff_min = ~0;
 	unsigned int new_clock, clkh_shift = 0;
+	unsigned int new_clock_margin;
 	int i;
 
 	/*
@@ -156,7 +157,16 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 */
 	for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
 		freq = clk_round_rate(ref_clk, new_clock << i);
-		if (freq > (new_clock << i)) {
+		/*
+		 * Add a margin of 1/1024 rate higher to the clock rate in order
+		 * to avoid looking for a slower clock on boundary cases (eg:
+		 * RZ/G2L has 3 clk sources 533.333333 MHz, 400 MHz and
+		 * 266.666666 MHz. The request for 533.333332 MHz will look for
+		 * slower option and it selects a slower 400 MHz source clock
+		 * instead of 533.333333 MHz).
+		 */
+		new_clock_margin = (new_clock << i) + ((new_clock << i) >> 10);
+		if (freq > new_clock_margin) {
 			/* Too fast; look for a slightly slower option */
 			freq = clk_round_rate(ref_clk, (new_clock << i) / 4 * 3);
 			if (freq > (new_clock << i))
@@ -181,6 +191,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
+	unsigned int clk_margin;
 	u32 clk = 0, clock;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
@@ -194,7 +205,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
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

