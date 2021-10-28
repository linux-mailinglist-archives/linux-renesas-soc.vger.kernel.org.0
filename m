Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBBA43E91D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Oct 2021 21:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhJ1TyY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Oct 2021 15:54:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:46972 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230424AbhJ1TyX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 15:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=kGWJBJjhVq06e2WR7qZ79ZJl+2o
        W8/wlS2LVBf3743I=; b=3QAfnS8SGbRauFeBbNnYF/LykZeDZMBmEf2YWxagml8
        FJ53tyPW/Eo4cPhyvZt0zZq/Et8QRYCCnHGGZwqed7GnOVNZllh2yi4voDUOCWg/
        MaImXGX+UZsMGKUEUpN9qOqBCrVR8UOf1xq9YdXSiLSdjl4TxpeU9GkvxVJpNv2s
        =
Received: (qmail 1840540 invoked from network); 28 Oct 2021 21:51:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2021 21:51:55 +0200
X-UD-Smtp-Session: l3s3148p1@HW/tCm/PkMUgAwDPXw4yADGDI0jlsL8i
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: reenable card irqs after the reset callback
Date:   Thu, 28 Oct 2021 21:51:49 +0200
Message-Id: <20211028195149.8003-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The reset callback may clear the internal card detect interrupts, so
make sure to reenable them if needed.

Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 7dfc26f48c18..e2affa52ef46 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -195,6 +195,10 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
 	host->sdcard_irq_mask = host->sdcard_irq_mask_all;
 
+	if (host->native_hotplug)
+		tmio_mmc_enable_mmc_irqs(host,
+				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
+
 	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
 
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
@@ -956,8 +960,15 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	case MMC_POWER_OFF:
 		tmio_mmc_power_off(host);
 		/* For R-Car Gen2+, we need to reset SDHI specific SCC */
-		if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
+		if (host->pdata->flags & TMIO_MMC_MIN_RCAR2) {
 			host->reset(host);
+
+			if (host->native_hotplug)
+				tmio_mmc_enable_mmc_irqs(host,
+						TMIO_STAT_CARD_REMOVE |
+						TMIO_STAT_CARD_INSERT);
+		}
+
 		host->set_clock(host, 0);
 		break;
 	case MMC_POWER_UP:
@@ -1185,10 +1196,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	_host->set_clock(_host, 0);
 	tmio_mmc_reset(_host);
 
-	if (_host->native_hotplug)
-		tmio_mmc_enable_mmc_irqs(_host,
-				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
-
 	spin_lock_init(&_host->lock);
 	mutex_init(&_host->ios_lock);
 
-- 
2.30.2

