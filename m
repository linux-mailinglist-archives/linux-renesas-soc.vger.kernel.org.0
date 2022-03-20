Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3A64E1BA1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Mar 2022 13:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245071AbiCTMcH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Mar 2022 08:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245075AbiCTMcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Mar 2022 08:32:04 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B74F212A
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Mar 2022 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=DaVlooMb92fiVo
        Ol61vn1JinWHg6s1KFn0KnAi/GpGc=; b=wiQulL6bMa/E+46RHRq6ug7V1AGLrs
        WgqL7bHdvWYB2xKmNeUviSCNeNa4peQqjDv63EM7m4Jv+CLewbhblKEKlO07+Pf5
        9mf32I23MlU9JVl7MzYCnywm+JPzTrRk9NoSPSPjgrLjKriDpEO23VU0B+NVGW/j
        epK78J4sXG6Qc=
Received: (qmail 461236 invoked from network); 20 Mar 2022 13:30:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 13:30:38 +0100
X-UD-Smtp-Session: l3s3148p1@kLQPjKXahrkgAQnoAFbkANnMMFqLOUjD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 6/6] mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk
Date:   Sun, 20 Mar 2022 13:30:16 +0100
Message-Id: <20220320123016.57991-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After Shimoda-san's much appreciated refactoring of the quirk handling,
we can convert now 'dmac_only_one_rx' from an ugly global flag to a
regular quirk. This makes quirk handling more consistent and easier to
maintain. After this patch, soc_dma_quirks is completely gone, hooray!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 ++++++++-----------
 2 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index e6b1395e99a3..1a1e3e020a8c 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
 	bool fixed_addr_mode;
+	bool dma_one_rx_only;
 	u32 hs400_bad_taps;
 	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 4d8df61657cd..1497a46260d4 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -78,8 +78,7 @@ static unsigned long global_flags;
  * stored into the system memory even if the DMAC interrupt happened.
  * So, this driver then uses one RX DMAC channel only.
  */
-#define SDHI_INTERNAL_DMAC_ONE_RX_ONLY	0
-#define SDHI_INTERNAL_DMAC_RX_IN_USE	1
+#define SDHI_INTERNAL_DMAC_RX_IN_USE	0
 
 /* Definitions for sampling clocks */
 static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
@@ -162,6 +161,12 @@ static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
 	.hs400_4taps = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400_one_rx = {
+	.hs400_disabled = true,
+	.hs400_4taps = true,
+	.dma_one_rx_only = true,
+};
+
 static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
 	.hs400_4taps = true,
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
@@ -205,9 +210,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
  */
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
-	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400_one_rx },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
-	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
+	{ .soc_id = "r8a7796", .revision = "ES1.[12]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
 	{ /* Sentinel. */ }
 };
@@ -372,7 +378,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
-		if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
+		if (priv->quirks->dma_one_rx_only &&
 		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
 			goto force_pio_with_unmap;
 	} else {
@@ -524,14 +530,6 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
 	.end = renesas_sdhi_internal_dmac_end_dma,
 };
 
-static const struct soc_device_attribute soc_dma_quirks[] = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*",
-	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
-	{ .soc_id = "r8a7796", .revision = "ES1.0",
-	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
-	{ /* sentinel */ }
-};
-
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *attr;
@@ -542,10 +540,6 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 	of_data_quirks = of_device_get_match_data(&pdev->dev);
 	quirks = of_data_quirks->quirks;
 
-	attr = soc_device_match(soc_dma_quirks);
-	if (attr)
-		global_flags |= (unsigned long)attr->data;
-
 	attr = soc_device_match(sdhi_quirks_match);
 	if (attr)
 		quirks = attr->data;
-- 
2.30.2

