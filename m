Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB946B583C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 00:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfIQWud (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 18:50:33 -0400
Received: from sauhun.de ([88.99.104.3]:58550 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbfIQWud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 18:50:33 -0400
Received: from localhost (p54B331E4.dip0.t-ipconnect.de [84.179.49.228])
        by pokefinder.org (Postfix) with ESMTPSA id C82402C0489;
        Wed, 18 Sep 2019 00:50:29 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: fix hang up in HS400 timing mode selection
Date:   Wed, 18 Sep 2019 00:50:23 +0200
Message-Id: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

In HS400 timing mode selection, SD clock is switched like:

1) HS200 (200MHz) for tuning
2) High Speed (<= 52MHz) for select HS400 mode (card)
3) HS400 (200MHz)

The SDHI controller needs its internal SCC component for HS400 and other
modes which need tuning. However, SCC gets only fed a clock when the
module clk is > 100MHz. Make sure the SCC is always active with tuning
by enforcing at least 100MHz. Note that we only change the module clock.
An internal divider ensures that we will still talk to the card at
52MHz.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: don't overwrite 'new_freq', use 'mmc_doing_retune', improve docs]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Shimoda-san: can you forward this patch to the BSP team to have a look,
too? I needed to change their version of checking various MMC_TIMING_*
constants because this approach did not work with current mainline for
me. After some testing and researching, I think the solution with
'mmc_doing_retune' is not only working again, but also more future
proof, in general.

 drivers/mmc/host/renesas_sdhi.h               | 2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 8 +++++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index c0504aa90857..33a1acc67cb4 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -27,6 +27,7 @@ struct renesas_sdhi_of_data {
 	dma_addr_t dma_rx_offset;
 	unsigned int bus_shift;
 	int scc_offset;
+	unsigned int scc_base_f_min;
 	struct renesas_sdhi_scc *taps;
 	int taps_num;
 	unsigned int max_blk_count;
@@ -49,6 +50,7 @@ struct renesas_sdhi {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default, *pins_uhs;
 	void __iomem *scc_ctl;
+	unsigned int scc_base_f_min;
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 4a2872f49a60..82a492567016 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -120,16 +120,21 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 }
 
 static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
-					    unsigned int new_clock)
+					    unsigned int req_clock)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	unsigned int freq, diff, best_freq = 0, diff_min = ~0;
+	unsigned int new_clock = req_clock;
 	int i, ret;
 
 	/* tested only on R-Car Gen2+ currently; may work for others */
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
 		return clk_get_rate(priv->clk);
 
+	/* When SCC is needed, make sure it gets a proper clock */
+	if (mmc_doing_retune(host->mmc) && new_clock < priv->scc_base_f_min)
+		new_clock = priv->scc_base_f_min;
+
 	/*
 	 * We want the bus clock to be as close as possible to, but no
 	 * greater than, new_clock.  As we can divide by 1 << i for
@@ -709,6 +714,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
+		priv->scc_base_f_min = of_data->scc_base_f_min;
 	}
 
 	host->write16_hook	= renesas_sdhi_write16_hook;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 751fe91c7571..7010c524b180 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -109,6 +109,8 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 	.bus_shift	= 2,
 	.scc_offset	= 0x1000,
+	/* SCC module clock (SDnH) is enabled at 100MHz or more */
+	.scc_base_f_min = 100000000,
 	.taps		= rcar_gen3_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
 	/* DMAC can handle 32bit blk count but only 1 segment */
-- 
2.20.1

