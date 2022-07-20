Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188A657B1C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 09:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiGTH3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 03:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239968AbiGTH3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 03:29:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE9368735
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 00:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=oaJHvdbw8M5yoJc+zmPgn3MtoGz
        b8mj7nFiSf6IEwGs=; b=wR6KNpWkhLZMsmOAlDJARjZZK2KsS3t/RynZ2Gjivko
        q7guRVMdcUm+rZZf0lXm+ALAkf6Agd4cPzLj4jNGjm7xIBQWutET+7KWGZkhSaeJ
        cdg9wg8MY4USVs2fh+LlfM0nq1sTi5ybivPqPMT0AUkKPZZkZpVFfw22C+lMA4bg
        =
Received: (qmail 535688 invoked from network); 20 Jul 2022 09:29:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jul 2022 09:29:18 +0200
X-UD-Smtp-Session: l3s3148p1@4w3GjjfkH1dZzIq6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: newer SoCs don't need manual tap correction
Date:   Wed, 20 Jul 2022 09:29:01 +0200
Message-Id: <20220720072901.1266-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
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

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

The newest Gen3 SoCs and Gen4 SoCs do not need manual tap correction
with HS400 anymore. So, instead of checking the SDHI version, add a
quirk flag and set manual tap correction only for affected SoCs.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: rebased, renamed the quirk variable, removed stale comment]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 5 ++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 ++++++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 1a1e3e020a8c..c4abfee1ebae 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -43,6 +43,7 @@ struct renesas_sdhi_quirks {
 	bool hs400_4taps;
 	bool fixed_addr_mode;
 	bool dma_one_rx_only;
+	bool manual_tap_correction;
 	u32 hs400_bad_taps;
 	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 55f7b27c3de7..6edbf5c161ab 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -380,8 +380,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
 		       priv->scc_tappos_hs400);
 
-	/* Gen3 can't do automatic tap correction with HS400, so disable it */
-	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN3_SDMMC)
+	if (priv->quirks && priv->quirks->manual_tap_correction)
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
 			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
 			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
@@ -718,7 +717,7 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
 	/* Change TAP position according to correction status */
-	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN3_SDMMC &&
+	if (priv->quirks && priv->quirks->manual_tap_correction &&
 	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
 		u32 bad_taps = priv->quirks ? priv->quirks->hs400_bad_taps : 0;
 		/*
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 0ccdbe3010ee..42937596c4c4 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -170,6 +170,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400_one_rx = {
 static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
 	.hs400_4taps = true,
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+	.manual_tap_correction = true,
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
@@ -182,25 +183,30 @@ static const struct renesas_sdhi_quirks sdhi_quirks_fixed_addr = {
 
 static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
 	.hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
+	.manual_tap_correction = true,
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+	.manual_tap_correction = true,
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
 	.hs400_4taps = true,
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
 	.hs400_calib_table = r8a7796_es13_calib_table,
+	.manual_tap_correction = true,
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
 	.hs400_calib_table = r8a77965_calib_table,
+	.manual_tap_correction = true,
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
 	.hs400_calib_table = r8a77990_calib_table,
+	.manual_tap_correction = true,
 };
 
 /*
-- 
2.35.1

