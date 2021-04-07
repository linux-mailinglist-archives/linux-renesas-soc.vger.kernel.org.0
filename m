Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9986C35705F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 17:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhDGPbv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 11:31:51 -0400
Received: from www.zeus03.de ([194.117.254.33]:54060 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353625AbhDGPbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 11:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=TSBi4Hp2iAdobCMDwLoeX9jHcig
        wAxZHbE83WS1g+pk=; b=EXE6QkbEbRYsT4QeIrn5Byi9XgB2XGT/ZZb/4hMDwiF
        WhfsxuEySGKSUEb56BB0UdlLmKNAxbj1mKBpjyu1+Y+ayxinhHna0f58DuajYIFL
        QbHyO1SlZwvpSMMRSqOhVq1cffqBbBExOxsGe/Agoay7SX5MsaGC77WEbi204rXs
        =
Received: (qmail 3067501 invoked from network); 7 Apr 2021 17:31:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2021 17:31:30 +0200
X-UD-Smtp-Session: l3s3148p1@fh7zn2O/cKogARa4RYN4AS31iQ6IViUK
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC/RFT] mmc: tmio: always restore irq register
Date:   Wed,  7 Apr 2021 17:31:26 +0200
Message-Id: <20210407153126.37285-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, only SDHI on R-Car Gen2+ reinitializes the irq register
during reset but it should be done on all instances. We can move it from
the SDHI driver to the TMIO core, because we now have the
'sd_irq_mask_all' variable which carries the proper value to use. That
also means we can remove the initialization from tmio_mmc_probe()
because it calls tmio_mmc_reset(), too. We only move that
tmio_mmc_reset() call there a little to ensure 'sd_irq_mask_all' is
properly set.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Shimoda-san, I think this is the implementation of what we discussed. It
passes my tests on a Renesas H3 ES2.0. I'd be happy if you or the BSP
team could run their additional checks with this patch. Thank you and
kind regards!

 drivers/mmc/host/renesas_sdhi_core.c |  2 --
 drivers/mmc/host/tmio_mmc_core.c     | 11 ++++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d36181b6f687..635bf31a6735 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -588,8 +588,6 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 		renesas_sdhi_scc_reset(host, priv);
 	}
 
-	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL_RCAR2);
-
 	if (sd_ctrl_read16(host, CTL_VERSION) >= SDHI_VER_GEN3_SD) {
 		val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
 		val |= CARD_OPT_EXTOP;
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 0c474d78b186..bcd26056d47a 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -192,6 +192,9 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	if (host->reset)
 		host->reset(host);
 
+	host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(host, CTL_IRQ_MASK);
+	tmio_mmc_disable_mmc_irqs(host, host->sdcard_irq_mask_all);
+
 	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
 
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
@@ -1176,13 +1179,11 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (pdata->flags & TMIO_MMC_SDIO_IRQ)
 		_host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
 
-	_host->set_clock(_host, 0);
-	tmio_mmc_reset(_host);
-
-	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	if (!_host->sdcard_irq_mask_all)
 		_host->sdcard_irq_mask_all = TMIO_MASK_ALL;
-	tmio_mmc_disable_mmc_irqs(_host, _host->sdcard_irq_mask_all);
+
+	_host->set_clock(_host, 0);
+	tmio_mmc_reset(_host);
 
 	if (_host->native_hotplug)
 		tmio_mmc_enable_mmc_irqs(_host,
-- 
2.30.0

