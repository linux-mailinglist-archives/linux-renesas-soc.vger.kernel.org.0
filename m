Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8606313B3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Nov 2022 12:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiKTLfN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Nov 2022 06:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiKTLfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 06:35:10 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729544F1AA
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=SfxH5kfDYiWpij
        V3/I80igjkgHDekjUlTby7BoTLayQ=; b=1/roHNcc7+gIdF4Z+IS55739mRVEj9
        XRVhVLXTGUIYiD3BBwjgs71r23qiQmf0Pf8ufrhtGlMwiflWQFfKJJwo89wmx1uU
        V8W5lF5Cjc+Xcwp7lXhwM5coWDtBlVnO40iIngJht6P2mv4/9jL96oSUVJv6njJB
        q1pL9/dspYmJc=
Received: (qmail 2515294 invoked from network); 20 Nov 2022 12:35:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2022 12:35:04 +0100
X-UD-Smtp-Session: l3s3148p1@jcR3VOXtRplehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/4] mmc: renesas_sdhi: add helper to access quirks
Date:   Sun, 20 Nov 2022 12:34:56 +0100
Message-Id: <20221120113457.42010-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
References: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
 drivers/mmc/host/renesas_sdhi_core.c          | 18 +++++++++---------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 ++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

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
index d2521cf1411d..ad8f79fe01b2 100644
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
@@ -546,7 +546,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
-	if (priv->quirks && (priv->quirks->hs400_calib_table || priv->quirks->hs400_bad_taps))
+	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
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
@@ -1076,7 +1076,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
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

