Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC414D1FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 21:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgA2Uh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 15:37:28 -0500
Received: from sauhun.de ([88.99.104.3]:41402 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgA2Uh2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 15:37:28 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id E95902C06AB;
        Wed, 29 Jan 2020 21:37:26 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 5/6] mmc: tmio: factor out TAP usage
Date:   Wed, 29 Jan 2020 21:37:08 +0100
Message-Id: <20200129203709.30493-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

TAPs are Renesas SDHI specific. Now that we moved all handling to the
SDHI core, we can also move the definitions from the TMIO struct to the
SDHI one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  5 ++++
 drivers/mmc/host/renesas_sdhi_core.c | 38 ++++++++++++++--------------
 drivers/mmc/host/tmio_mmc.h          |  5 ----
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 11a0b2bca3aa..7a1a741547f2 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -58,6 +58,11 @@ struct renesas_sdhi {
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
 	bool doing_tune;
+
+	/* Tuning values: 1 for success, 0 for failure */
+	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
+	unsigned int tap_num;
+	unsigned long tap_set;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 0c9e5e010bda..22eaabe513d0 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -354,7 +354,7 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
 
 	if (priv->quirks && priv->quirks->hs400_4taps)
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
-			       host->tap_set / 2);
+			       priv->tap_set / 2);
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
 		       SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
@@ -438,11 +438,11 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	 * result requiring the tap to be good in both runs before
 	 * considering it for tuning selection.
 	 */
-	for (i = 0; i < host->tap_num * 2; i++) {
-		int offset = host->tap_num * (i < host->tap_num ? 1 : -1);
+	for (i = 0; i < priv->tap_num * 2; i++) {
+		int offset = priv->tap_num * (i < priv->tap_num ? 1 : -1);
 
-		if (!test_bit(i, host->taps))
-			clear_bit(i + offset, host->taps);
+		if (!test_bit(i, priv->taps))
+			clear_bit(i + offset, priv->taps);
 	}
 
 	/*
@@ -454,8 +454,8 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	ntap = 0;
 	tap_start = 0;
 	tap_end = 0;
-	for (i = 0; i < host->tap_num * 2; i++) {
-		if (test_bit(i, host->taps)) {
+	for (i = 0; i < priv->tap_num * 2; i++) {
+		if (test_bit(i, priv->taps)) {
 			ntap++;
 		} else {
 			if (ntap > tap_cnt) {
@@ -474,12 +474,12 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	}
 
 	if (tap_cnt >= SH_MOBILE_SDHI_MAX_TAP)
-		host->tap_set = (tap_start + tap_end) / 2 % host->tap_num;
+		priv->tap_set = (tap_start + tap_end) / 2 % priv->tap_num;
 	else
 		return -EIO;
 
 	/* Set SCC */
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, host->tap_set);
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, priv->tap_set);
 
 	/* Enable auto re-tuning */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
@@ -494,27 +494,27 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 	struct renesas_sdhi *priv = host_to_priv(host);
 	int i, ret;
 
-	host->tap_num = renesas_sdhi_init_tuning(host);
-	if (!host->tap_num)
+	priv->tap_num = renesas_sdhi_init_tuning(host);
+	if (!priv->tap_num)
 		return 0; /* Tuning is not supported */
 
-	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
+	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
 		dev_err(&host->pdev->dev,
 			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
 		return -EINVAL;
 	}
 
 	priv->doing_tune = true;
-	bitmap_zero(host->taps, host->tap_num * 2);
+	bitmap_zero(priv->taps, priv->tap_num * 2);
 
 	/* Issue CMD19 twice for each tap */
-	for (i = 0; i < 2 * host->tap_num; i++) {
+	for (i = 0; i < 2 * priv->tap_num; i++) {
 		/* Set sampling clock position */
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % host->tap_num);
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
 
 		ret = mmc_send_tuning(host->mmc, opcode, NULL);
 		if (ret == 0)
-			set_bit(i, host->taps);
+			set_bit(i, priv->taps);
 	}
 
 	return renesas_sdhi_select_tuning(host);
@@ -523,7 +523,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
-	unsigned long new_tap = host->tap_set;
+	unsigned long new_tap = priv->tap_set;
 	u32 val;
 
 	val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
@@ -560,9 +560,9 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
 			return false;
 	}
 
-	host->tap_set = (new_tap % host->tap_num);
+	priv->tap_set = (new_tap % priv->tap_num);
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
-		       host->tap_set / (use_4tap ? 2 : 1));
+		       priv->tap_set / (use_4tap ? 2 : 1));
 
 	return false;
 }
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index b6fffd3d2650..b4cf10109162 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -184,11 +184,6 @@ struct tmio_mmc_host {
 	 */
 	int (*execute_tuning)(struct tmio_mmc_host *host, u32 opcode);
 
-	/* Tuning values: 1 for success, 0 for failure */
-	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
-	unsigned int tap_num;
-	unsigned long tap_set;
-
 	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
 	void (*hs400_downgrade)(struct tmio_mmc_host *host);
 	void (*hs400_complete)(struct tmio_mmc_host *host);
-- 
2.20.1

