Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DC262FF90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 22:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiKRVqJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 16:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiKRVqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 16:46:09 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5C685165
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=oKtlR9xbtPDkzW
        Cey1yzbX5Cx/EadRJ8DZ7PdfrA4JY=; b=GvP0HsCKzfi+zTlcELow+TSopkfTZw
        wGjdg1WMG2xi8yWahahlFFy2dfnWgYJL4rO1U0lzXt2d1yhB1b7vOvS21tq9FACD
        +UNN+NFjP2sNHtEB0Tm+jUrgMTGC0Inn8z5MEoVe5I5+a5gymANZqWrKY1/VRamV
        mTc8ig7Hbf2mY=
Received: (qmail 1916286 invoked from network); 18 Nov 2022 22:46:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2022 22:46:06 +0100
X-UD-Smtp-Session: l3s3148p1@SzEEosXtYIdehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] mmc: renesas_sdhi: add helper to access quirks
Date:   Fri, 18 Nov 2022 22:45:55 +0100
Message-Id: <20221118214556.81763-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118214556.81763-1-wsa+renesas@sang-engineering.com>
References: <20221118214556.81763-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a macro to check for a quirk because it a) ensures that the check
for non-empty 'quirks' struct is not forgotten and b) is easier to read.
Convert existing quirk access as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 16 ++++++++--------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 ++++----
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 8f96457c9739..ea2a85174a09 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -38,6 +38,8 @@ struct renesas_sdhi_of_data {
 
 #define SDHI_CALIB_TABLE_MAX 32
 
+#define sdhi_has_quirk(p, q) ((p)->quirks && (p)->quirks->q)
+
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b93ab11f112a..af6aa637bd49 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -141,7 +141,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	if (priv->clkh) {
 		/* HS400 with 4TAP needs different clock settings */
-		bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+		bool use_4tap = sdhi_has_quirk(priv, hs400_4taps);
 		bool need_slow_clkh = host->mmc->ios.timing == MMC_TIMING_MMC_HS400;
 		clkh_shift = use_4tap && need_slow_clkh ? 1 : 2;
 		ref_clk = priv->clkh;
@@ -383,7 +383,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 	struct renesas_sdhi *priv = host_to_priv(host);
 	u32 bad_taps = priv->quirks ? priv->quirks->hs400_bad_taps : 0;
-	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+	bool use_4tap = sdhi_has_quirk(priv, hs400_4taps);
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -395,7 +395,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
 		       priv->scc_tappos_hs400);
 
-	if (priv->quirks && priv->quirks->manual_tap_correction)
+	if (sdhi_has_quirk(priv, manual_tap_correction))
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
 			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
 			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
@@ -732,7 +732,7 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
 	/* Change TAP position according to correction status */
-	if (priv->quirks && priv->quirks->manual_tap_correction &&
+	if (sdhi_has_quirk(priv, manual_tap_correction) &&
 	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
 		u32 bad_taps = priv->quirks ? priv->quirks->hs400_bad_taps : 0;
 		/*
@@ -796,7 +796,7 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host,
 					 struct mmc_request *mrq)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
-	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+	bool use_4tap = sdhi_has_quirk(priv, hs400_4taps);
 	bool ret = false;
 
 	/*
@@ -990,7 +990,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	host->multi_io_quirk	= renesas_sdhi_multi_io_quirk;
 	host->dma_ops		= dma_ops;
 
-	if (quirks && quirks->hs400_disabled)
+	if (sdhi_has_quirk(priv, hs400_disabled))
 		host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
 
 	/* For some SoC, we disable internal WP. GPIO may override this */
@@ -1055,7 +1055,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ver == SDHI_VER_GEN2_SDR50)
 		mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
 
-	if (ver == SDHI_VER_GEN3_SDMMC && quirks && quirks->hs400_calib_table) {
+	if (ver == SDHI_VER_GEN3_SDMMC && sdhi_has_quirk(priv, hs400_calib_table)) {
 		host->fixup_request = renesas_sdhi_fixup_request;
 		priv->adjust_hs400_calib_table = *(
 			res->start == SDHI_GEN3_MMC0_ADDR ?
@@ -1073,7 +1073,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	     host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
 				 MMC_CAP2_HS400_1_8V))) {
 		const struct renesas_sdhi_scc *taps = of_data->taps;
-		bool use_4tap = quirks && quirks->hs400_4taps;
+		bool use_4tap = sdhi_has_quirk(priv, hs400_4taps);
 		bool hit = false;
 
 		for (i = 0; i < of_data->taps_num; i++) {
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index f6d1e04a627f..29f562115c66 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -285,7 +285,7 @@ renesas_sdhi_internal_dmac_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	u32 dma_irqs = INFO1_DTRANEND0 |
-			(priv->quirks && priv->quirks->old_info1_layout ?
+			(sdhi_has_quirk(priv, old_info1_layout) ?
 			INFO1_DTRANEND1_OLD : INFO1_DTRANEND1);
 
 	if (!host->chan_tx || !host->chan_rx)
@@ -318,7 +318,7 @@ static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
 	struct renesas_sdhi_dma *dma_priv = &priv->dma_priv;
 
 	u32 dma_irqs = INFO1_DTRANEND0 |
-			(priv->quirks && priv->quirks->old_info1_layout ?
+			(sdhi_has_quirk(priv, old_info1_layout) ?
 			INFO1_DTRANEND1_OLD : INFO1_DTRANEND1);
 	u32 status = readl(host->ctl + DM_CM_INFO1);
 
@@ -396,7 +396,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
 
-	if (!(priv->quirks && priv->quirks->fixed_addr_mode))
+	if (!sdhi_has_quirk(priv, fixed_addr_mode))
 		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
 	if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
@@ -404,7 +404,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
-		if (priv->quirks && priv->quirks->dma_one_rx_only &&
+		if (sdhi_has_quirk(priv, dma_one_rx_only) &&
 		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
 			goto force_pio_with_unmap;
 	} else {
-- 
2.30.2

