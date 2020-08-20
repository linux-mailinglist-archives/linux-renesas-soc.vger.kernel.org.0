Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE2F24BE78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 15:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbgHTN0x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 09:26:53 -0400
Received: from www.zeus03.de ([194.117.254.33]:47846 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730765AbgHTNZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 09:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=hjNThGVUxVmJ7F
        t5ICc+pAgIb9ES8z3AiSIOPZEnIqM=; b=waYeKVoywwteSZL2hPQ/x7B/RadE0b
        ooyZn7Zntw1knz6Mo8C8gIR4kUU6VH3fK4Yykkt25wJP3B1dfea4azVReSBGmvCj
        W/O9yb9zXLBwgqedJVDMORvMaLD4kTrE93X2jzoIlS7QRr3Z52pI0M+diBg13PJZ
        sfkhQx3c0YRDA=
Received: (qmail 560039 invoked from network); 20 Aug 2020 15:25:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2020 15:25:47 +0200
X-UD-Smtp-Session: l3s3148p1@66PiDk+tKpggAwDPXwuPAFbD76CDVWXO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 1/6] mmc: renesas_sdhi: move wrong 'hw_reset' to 'reset'
Date:   Thu, 20 Aug 2020 15:25:33 +0200
Message-Id: <20200820132538.24758-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This driver got the usage of 'hw_reset' wrong and missed that it is used
to reset the remote HW (card) only, not the local one (controller). Move
everything to the proper 'reset' callback. Also, add the generic reset
code from TMIO, so we will ensure the same behaviour (it will get
refactored away in a later patch). This also means we need to drop
MMC_CAP_HW_RESET because this is currently not supported by our
hardware.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 15e21894bd44..73807c8cfa98 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -631,11 +631,20 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 	return renesas_sdhi_manual_correction(host, use_4tap);
 }
 
-static void renesas_sdhi_hw_reset(struct tmio_mmc_host *host)
+static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
-	struct renesas_sdhi *priv;
+	struct renesas_sdhi *priv = host_to_priv(host);
 
-	priv = host_to_priv(host);
+	/* FIXME - should we set stop clock reg here */
+	sd_ctrl_write16(host, CTL_RESET_SD, 0x0000);
+	usleep_range(10000, 11000);
+	sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
+	usleep_range(10000, 11000);
+
+	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
+		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
+		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
+	}
 
 	renesas_sdhi_reset_scc(host, priv);
 	renesas_sdhi_reset_hs400_mode(host, priv);
@@ -862,11 +871,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 			renesas_sdhi_start_signal_voltage_switch;
 		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
 
-		/* SDR and HS200/400 registers requires HW reset */
 		if (of_data && of_data->scc_offset) {
 			priv->scc_ctl = host->ctl + of_data->scc_offset;
-			host->mmc->caps |= MMC_CAP_HW_RESET;
-			host->hw_reset = renesas_sdhi_hw_reset;
+			host->reset = renesas_sdhi_reset;
 		}
 	}
 
-- 
2.20.1

