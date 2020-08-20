Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F4424BE72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgHTN0g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 09:26:36 -0400
Received: from www.zeus03.de ([194.117.254.33]:47892 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730849AbgHTNZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 09:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=EbG2XOkBtfb3CA
        Vv807FdK3xciE+xP+rLwWecjmjtsE=; b=RGgO/CAmdgQR9KjwUTRkZdFSkzaqj6
        MyjbaQsxVPMHPxa7UdOAkEVzevdIEvV2TbdynyloKLX9SxkywGtKC3JwLgN7NX8j
        hasSJia10ibBghEF6OFPX1l3DjIGS+kMYqyNEKahB4CjXJsmM7Ws5attcEpHBgIn
        k/hfUvJn9SF48=
Received: (qmail 560148 invoked from network); 20 Aug 2020 15:25:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2020 15:25:48 +0200
X-UD-Smtp-Session: l3s3148p1@+W7xDk+tMJggAwDPXwuPAFbD76CDVWXO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 4/6] mmc: tmio: factor out common parts of the reset routine
Date:   Thu, 20 Aug 2020 15:25:36 +0200
Message-Id: <20200820132538.24758-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some TMIO variants need specific actions in their reset routine, but
they are all based on a generic reset routine. So, the optional 'reset'
callback will now only take care of the additional stuff and we will
have a generic function around it. Less code, easier to maintain, and
much more readable. Code in tmio_mmc.c is untested but in my TC6387XB
datasheet the SDIO part is reset independently from the SD part, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 11 -----------
 drivers/mmc/host/tmio_mmc.c          |  8 --------
 drivers/mmc/host/tmio_mmc_core.c     | 14 +++++++-------
 3 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 73807c8cfa98..73ddd3e6eebb 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -635,17 +635,6 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
-	/* FIXME - should we set stop clock reg here */
-	sd_ctrl_write16(host, CTL_RESET_SD, 0x0000);
-	usleep_range(10000, 11000);
-	sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
-	usleep_range(10000, 11000);
-
-	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
-		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
-		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
-	}
-
 	renesas_sdhi_reset_scc(host, priv);
 	renesas_sdhi_reset_hs400_mode(host, priv);
 
diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
index 93e83ad25976..757c90160ae4 100644
--- a/drivers/mmc/host/tmio_mmc.c
+++ b/drivers/mmc/host/tmio_mmc.c
@@ -77,18 +77,10 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
 
 static void tmio_mmc_reset(struct tmio_mmc_host *host)
 {
-	/* FIXME - should we set stop clock reg here */
-	sd_ctrl_write16(host, CTL_RESET_SD, 0x0000);
 	sd_ctrl_write16(host, CTL_RESET_SDIO, 0x0000);
 	usleep_range(10000, 11000);
-	sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 	sd_ctrl_write16(host, CTL_RESET_SDIO, 0x0001);
 	usleep_range(10000, 11000);
-
-	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
-		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
-		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
-	}
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index a4bd0a0a305c..f68c10b8ed61 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -172,6 +172,9 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 	usleep_range(10000, 11000);
 
+	if (host->reset)
+		host->reset(host);
+
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
@@ -216,7 +219,7 @@ static void tmio_mmc_reset_work(struct work_struct *work)
 
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	host->reset(host);
+	tmio_mmc_reset(host);
 
 	/* Ready for new calls */
 	host->mrq = NULL;
@@ -721,7 +724,7 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 	if (ret < 0) {
 		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
-		host->reset(host);
+		tmio_mmc_reset(host);
 	}
 
 	return ret;
@@ -1144,9 +1147,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 				  mmc->caps & MMC_CAP_NEEDS_POLL ||
 				  !mmc_card_is_removable(mmc));
 
-	if (!_host->reset)
-		_host->reset = tmio_mmc_reset;
-
 	/*
 	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
 	 * hotplug gets disabled. It seems RuntimePM related yet we need further
@@ -1168,7 +1168,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
 
 	_host->set_clock(_host, 0);
-	_host->reset(_host);
+	tmio_mmc_reset(_host);
 
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
@@ -1271,7 +1271,7 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
 	tmio_mmc_clk_enable(host);
-	host->reset(host);
+	tmio_mmc_reset(host);
 
 	if (host->clk_cache)
 		host->set_clock(host, host->clk_cache);
-- 
2.20.1

