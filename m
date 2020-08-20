Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4477924BE75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 15:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgHTN0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 09:26:46 -0400
Received: from www.zeus03.de ([194.117.254.33]:47860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730830AbgHTNZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 09:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=loMHjk08D6u++B
        0yOqmOguSsTKPxpET8hjHO+42TJP0=; b=ynOSDXPgSUGR+EM4jBzhu6XnipDXok
        V4IxvsfMKyQkAX7JPCcmpsIk+tcy6zVxLCHLpoHvzbUj7Zb4QEcotVuDjEXGZXfv
        tYx357KPrqmsWOlt5mMjqGqteYDcKcVQYYeOMgRQVlAo7LthAwDaUtOfY3vUvBKR
        kfApN5v767LIE=
Received: (qmail 560076 invoked from network); 20 Aug 2020 15:25:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2020 15:25:47 +0200
X-UD-Smtp-Session: l3s3148p1@OqTnDk+tLJggAwDPXwuPAFbD76CDVWXO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 2/6] Revert "mmc: tmio: fix reset operation"
Date:   Thu, 20 Aug 2020 15:25:34 +0200
Message-Id: <20200820132538.24758-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit a87852c6b8827b7fece78ae57d871d56e4348e30. It did fix
the issue, but was building on top of already wrong assumptions. The
driver missed that 'hw_reset' was only for resetting remote HW (card)
and not for the IP core. Since we fixed that in a previous patch, we can
now remove this patch to make it clear that 'reset' is for resetting the
IP core only. Also, cancelling DMA will only be called when actually
needed again. It will also allow for further cleanups and better
readability. Note that in addition to the revert, the call in
'tmio_mmc_execute_tuning' will be converted, too, to maintain the
current behaviour.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 946fb013c610..125530e7bd17 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -178,18 +178,6 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	}
 }
 
-static void tmio_mmc_hw_reset(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-
-	host->reset(host);
-
-	tmio_mmc_abort_dma(host);
-
-	if (host->hw_reset)
-		host->hw_reset(host);
-}
-
 static void tmio_mmc_reset_work(struct work_struct *work)
 {
 	struct tmio_mmc_host *host = container_of(work, struct tmio_mmc_host,
@@ -228,11 +216,12 @@ static void tmio_mmc_reset_work(struct work_struct *work)
 
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	tmio_mmc_hw_reset(host->mmc);
+	host->reset(host);
 
 	/* Ready for new calls */
 	host->mrq = NULL;
 
+	tmio_mmc_abort_dma(host);
 	mmc_request_done(host->mmc, mrq);
 }
 
@@ -720,6 +709,14 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
 	return 0;
 }
 
+static void tmio_mmc_hw_reset(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->hw_reset)
+		host->hw_reset(host);
+}
+
 static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
@@ -732,7 +729,7 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 	if (ret < 0) {
 		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
-		tmio_mmc_hw_reset(mmc);
+		host->reset(host);
 	}
 
 	return ret;
@@ -1180,7 +1177,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
 
 	_host->set_clock(_host, 0);
-	tmio_mmc_hw_reset(mmc);
+	_host->reset(_host);
 
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
@@ -1283,7 +1280,7 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
 	tmio_mmc_clk_enable(host);
-	tmio_mmc_hw_reset(host->mmc);
+	host->reset(host);
 
 	if (host->clk_cache)
 		host->set_clock(host, host->clk_cache);
-- 
2.20.1

