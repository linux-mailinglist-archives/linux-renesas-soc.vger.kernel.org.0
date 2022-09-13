Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFA65B77EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 19:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiIMR10 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 13:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbiIMR0x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 13:26:53 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9A36111830;
        Tue, 13 Sep 2022 09:15:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,313,1654527600"; 
   d="scan'208";a="132709471"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Sep 2022 01:15:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.88])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D85DB40071F6;
        Wed, 14 Sep 2022 01:15:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs clock
Date:   Tue, 13 Sep 2022 17:15:06 +0100
Message-Id: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SDHI high speed clock is 4 times that of the main clock. Currently,
there is no margin added for setting the rate associated with these
clocks. On RZ/G2L platforms, the lack of these margins leads to the
selection of a clock source with a lower clock rate compared to a higher
one.

RZ/G2L example case:
SD0 hs clock is 533333333 Hz and SD0 main clock is 133333333 Hz.
When we set the rate for the main clock 133333333, the request rate for
the parent becomes 533333332 (133333333 * 4) and the SD0 hs clock is
set as 400000000 Hz.

This patch adds a margin of (1/1024) higher hs clock and main clock rate.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is tested on RZ/G2{L,UL} platforms. It will be good to test
this patch on RCar Gen3/Gen4 platforms as I don't have the hardware.

Logs:-

Before the change:
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=4266666656
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=2133333328
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=1066666664
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=533333332
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=400000000
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=400000000

After the patch:
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=4270833320
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=2135416660
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=1067708330
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=533854165
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=533333333
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=533333333
 ####rzg2l_cpg_sd_clk_mux_set_parent####### index=0
 ####rzg2l_cpg_sd_clk_mux_determine_rate####### req->rate=533854164
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6edbf5c161ab..e41fbfc6ab7d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -147,6 +147,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	}
 
 	new_clock = wanted_clock << clkh_shift;
+	new_clock += new_clock >> 10;
 
 	/*
 	 * We want the bus clock to be as close as possible to, but no
@@ -172,6 +173,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
+	best_freq += best_freq >> 10;
 	if (priv->clkh)
 		clk_set_rate(priv->clk, best_freq >> clkh_shift);
 
-- 
2.25.1

