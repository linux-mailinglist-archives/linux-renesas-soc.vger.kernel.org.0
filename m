Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A47164E1B9F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Mar 2022 13:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245069AbiCTMcH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Mar 2022 08:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245074AbiCTMcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Mar 2022 08:32:04 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CC1F2107
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Mar 2022 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=cOh+FE/7aXP82V
        AXBCDrDrgaETK0yZJ/ZA+IAg8TpQs=; b=XnJdXTjiEi9nuEG/QqQ7BTqh5QFMqf
        /hIs6GnrxgJiYUqrx8W0LxnWSjyrCWmnBFYD4cIL4/KFdyET99dMtRla70Db6gst
        vsJKhi3pNRGBmsNmS6nCaWs3aX4qFTfgYmM27fDcAOT/WGMqdiiFHKA8PW4tPT0a
        Muk71ELHoOCSM=
Received: (qmail 461213 invoked from network); 20 Mar 2022 13:30:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 13:30:37 +0100
X-UD-Smtp-Session: l3s3148p1@rK4IjKXahLkgAQnoAFbkANnMMFqLOUjD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 5/6] mmc: renesas_sdhi: make 'fixed_addr_mode' a quirk
Date:   Sun, 20 Mar 2022 13:30:15 +0100
Message-Id: <20220320123016.57991-6-wsa+renesas@sang-engineering.com>
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
we can convert now the 'fixed_addr_mode' from an ugly global flag to a
regular quirk. This makes quirk handling more consistent and easier to
maintain.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 21 ++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 66d308e73e17..e6b1395e99a3 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -41,6 +41,7 @@ struct renesas_sdhi_of_data {
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
+	bool fixed_addr_mode;
 	u32 hs400_bad_taps;
 	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 06204ff94b4f..4d8df61657cd 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -81,9 +81,6 @@ static unsigned long global_flags;
 #define SDHI_INTERNAL_DMAC_ONE_RX_ONLY	0
 #define SDHI_INTERNAL_DMAC_RX_IN_USE	1
 
-/* RZ/A2 does not have the ADRR_MODE bit */
-#define SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY 2
-
 /* Definitions for sampling clocks */
 static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	{
@@ -108,10 +105,6 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.max_segs	= 1,
 };
 
-static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
-	.of_data	= &of_data_rza2,
-};
-
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
@@ -178,6 +171,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 	.hs400_disabled = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_fixed_addr = {
+	.fixed_addr_mode = true,
+};
+
 static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
 	.hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
 };
@@ -248,6 +245,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_nohs400_compat
 	.quirks = &sdhi_quirks_nohs400,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
+	.of_data	= &of_data_rza2,
+	.quirks		= &sdhi_quirks_fixed_addr,
+};
+
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
@@ -358,10 +360,11 @@ static void
 renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 				     struct mmc_data *data)
 {
+	struct renesas_sdhi *priv = host_to_priv(host);
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
 
-	if (!test_bit(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY, &global_flags))
+	if (!priv->quirks->fixed_addr_mode)
 		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
 	if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
@@ -522,8 +525,6 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
 };
 
 static const struct soc_device_attribute soc_dma_quirks[] = {
-	{ .soc_id = "r7s9210",
-	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY) },
 	{ .soc_id = "r8a7795", .revision = "ES1.*",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
 	{ .soc_id = "r8a7796", .revision = "ES1.0",
-- 
2.30.2

