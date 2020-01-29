Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DB314D1FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 21:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgA2Uh1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 15:37:27 -0500
Received: from sauhun.de ([88.99.104.3]:41358 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgA2Uh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 15:37:27 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id CB3322C28AC;
        Wed, 29 Jan 2020 21:37:23 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/6] mmc: tmio: refactor tuning execution into SDHI driver
Date:   Wed, 29 Jan 2020 21:37:04 +0100
Message-Id: <20200129203709.30493-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move Renesas specific code for executing the tuning with a SCC into the
SDHI driver and leave only a generic call in the TMIO driver. Simplify
the code a little by removing init_tuning() and prepare_tuning()
callbacks. The latter is directly folded into the new execute_tuning()
callbacks.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 45 ++++++++++++++++++++--------
 drivers/mmc/host/tmio_mmc.h          |  3 +-
 drivers/mmc/host/tmio_mmc_core.c     | 33 +++-----------------
 3 files changed, 37 insertions(+), 44 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6a112454ca26..b3ab66f963f8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -321,17 +321,6 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 		SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_MASK;
 }
 
-static void renesas_sdhi_prepare_tuning(struct tmio_mmc_host *host,
-					unsigned long tap)
-{
-	struct renesas_sdhi *priv = host_to_priv(host);
-
-	priv->doing_tune = true;
-
-	/* Set sampling clock position */
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, tap);
-}
-
 static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
@@ -500,6 +489,37 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	return 0;
 }
 
+static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	int i, ret;
+
+	host->tap_num = renesas_sdhi_init_tuning(host);
+	if (!host->tap_num)
+		return 0; /* Tuning is not supported */
+
+	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
+		dev_warn_once(&host->pdev->dev,
+			"Too many taps, skipping tuning. Please consider updating size of taps field of tmio_mmc_host\n");
+		return 0;
+	}
+
+	priv->doing_tune = true;
+	bitmap_zero(host->taps, host->tap_num * 2);
+
+	/* Issue CMD19 twice for each tap */
+	for (i = 0; i < 2 * host->tap_num; i++) {
+		/* Set sampling clock position */
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % host->tap_num);
+
+		ret = mmc_send_tuning(host->mmc, opcode, NULL);
+		if (ret == 0)
+			set_bit(i, host->taps);
+	}
+
+	return renesas_sdhi_select_tuning(host);
+}
+
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
@@ -877,8 +897,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (!hit)
 			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
 
-		host->init_tuning = renesas_sdhi_init_tuning;
-		host->prepare_tuning = renesas_sdhi_prepare_tuning;
+		host->execute_tuning = renesas_sdhi_execute_tuning;
 		host->select_tuning = renesas_sdhi_select_tuning;
 		host->check_scc_error = renesas_sdhi_check_scc_error;
 		host->prepare_hs400_tuning =
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index c5ba13fae399..bfebbe368f02 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -176,14 +176,13 @@ struct tmio_mmc_host {
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host);
 	void (*hw_reset)(struct tmio_mmc_host *host);
-	void (*prepare_tuning)(struct tmio_mmc_host *host, unsigned long tap);
 	bool (*check_scc_error)(struct tmio_mmc_host *host);
 
 	/*
 	 * Mandatory callback for tuning to occur which is optional for SDR50
 	 * and mandatory for SDR104.
 	 */
-	unsigned int (*init_tuning)(struct tmio_mmc_host *host);
+	int (*execute_tuning)(struct tmio_mmc_host *host, u32 opcode);
 	int (*select_tuning)(struct tmio_mmc_host *host);
 
 	/* Tuning values: 1 for success, 0 for failure */
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index c4a1d49fbea4..593f88cafb6e 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -718,38 +718,13 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
 static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
-	int i, ret = 0;
-
-	if (!host->init_tuning || !host->select_tuning)
-		/* Tuning is not supported */
-		goto out;
-
-	host->tap_num = host->init_tuning(host);
-	if (!host->tap_num)
-		/* Tuning is not supported */
-		goto out;
-
-	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
-		dev_warn_once(&host->pdev->dev,
-			"Too many taps, skipping tuning. Please consider updating size of taps field of tmio_mmc_host\n");
-		goto out;
-	}
-
-	bitmap_zero(host->taps, host->tap_num * 2);
-
-	/* Issue CMD19 twice for each tap */
-	for (i = 0; i < 2 * host->tap_num; i++) {
-		if (host->prepare_tuning)
-			host->prepare_tuning(host, i % host->tap_num);
+	int ret;
 
-		ret = mmc_send_tuning(mmc, opcode, NULL);
-		if (ret == 0)
-			set_bit(i, host->taps);
-	}
+	if (!host->execute_tuning)
+		return 0;
 
-	ret = host->select_tuning(host);
+	ret = host->execute_tuning(host, opcode);
 
-out:
 	if (ret < 0) {
 		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
 		tmio_mmc_hw_reset(mmc);
-- 
2.20.1

