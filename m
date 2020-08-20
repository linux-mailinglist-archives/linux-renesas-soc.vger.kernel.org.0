Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E14524BE6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 15:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgHTN0e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 09:26:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:47932 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730856AbgHTNZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 09:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=vDZhpS+9ugVXTw
        1jJxosywbr7ET2TfXwAgG0o3lq5+4=; b=ODwVLSybEj1jrympX8zg9CqRkIeJbB
        C4HV6hhbbSvuflYuNO29IV+Pp4RvQ1ki4h0muxAdadethsyvYnu8OWIz0ZA8tg/R
        eUnc4lqNoSvih0c3MBG9gzBH3/FETTdIBxj5omCchsu0hzEgVCtqlok57oL5j7+G
        vEsJ6Rd1myGB4=
Received: (qmail 560195 invoked from network); 20 Aug 2020 15:25:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2020 15:25:48 +0200
X-UD-Smtp-Session: l3s3148p1@JWv7Dk+tNJggAwDPXwuPAFbD76CDVWXO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 6/6] mmc: tmio: remove indirection of 'execute_tuning' callback
Date:   Thu, 20 Aug 2020 15:25:38 +0200
Message-Id: <20200820132538.24758-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After all the previous refactorization, we can now populate mmc_ops
directly and don't need a layer inbetween. The NULL-pointer check and
the error printout are already done by the MMC core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c |  7 ++++---
 drivers/mmc/host/tmio_mmc.h          |  6 ------
 drivers/mmc/host/tmio_mmc_core.c     | 17 -----------------
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 872f36a43753..29148fa25d82 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -519,8 +519,9 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	return 0;
 }
 
-static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
+static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
+	struct tmio_mmc_host *host = mmc_priv(mmc);
 	struct renesas_sdhi *priv = host_to_priv(host);
 	int i, ret;
 
@@ -543,7 +544,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 		/* Set sampling clock position */
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
 
-		if (mmc_send_tuning(host->mmc, opcode, NULL) == 0)
+		if (mmc_send_tuning(mmc, opcode, NULL) == 0)
 			set_bit(i, priv->taps);
 
 		if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) == 0)
@@ -942,8 +943,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (!hit)
 			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
 
-		host->execute_tuning = renesas_sdhi_execute_tuning;
 		host->check_retune = renesas_sdhi_check_scc_error;
+		host->ops.execute_tuning = renesas_sdhi_execute_tuning;
 		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
 		host->ops.hs400_downgrade = renesas_sdhi_disable_scc;
 		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index dac717041c2d..51b5f388f6d8 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -180,12 +180,6 @@ struct tmio_mmc_host {
 	void (*reset)(struct tmio_mmc_host *host);
 	bool (*check_retune)(struct tmio_mmc_host *host);
 
-	/*
-	 * Mandatory callback for tuning to occur which is optional for SDR50
-	 * and mandatory for SDR104.
-	 */
-	int (*execute_tuning)(struct tmio_mmc_host *host, u32 opcode);
-
 	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
 	void (*hs400_downgrade)(struct tmio_mmc_host *host);
 	void (*hs400_complete)(struct tmio_mmc_host *host);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index e7bad761c714..0f266cbf82b8 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -712,22 +712,6 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
 	return 0;
 }
 
-static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-	int ret;
-
-	if (!host->execute_tuning)
-		return 0;
-
-	ret = host->execute_tuning(host, opcode);
-
-	if (ret < 0)
-		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
-
-	return ret;
-}
-
 static void tmio_process_mrq(struct tmio_mmc_host *host,
 			     struct mmc_request *mrq)
 {
@@ -1001,7 +985,6 @@ static struct mmc_host_ops tmio_mmc_ops = {
 	.get_cd		= tmio_mmc_get_cd,
 	.enable_sdio_irq = tmio_mmc_enable_sdio_irq,
 	.multi_io_quirk	= tmio_multi_io_quirk,
-	.execute_tuning = tmio_mmc_execute_tuning,
 };
 
 static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
-- 
2.20.1

