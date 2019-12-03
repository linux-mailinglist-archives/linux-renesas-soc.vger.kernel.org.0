Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3461105AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 21:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfLCUFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 15:05:23 -0500
Received: from sauhun.de ([88.99.104.3]:34370 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbfLCUFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 15:05:22 -0500
Received: from localhost (p54B33759.dip0.t-ipconnect.de [84.179.55.89])
        by pokefinder.org (Postfix) with ESMTPSA id 9D7482C0696;
        Tue,  3 Dec 2019 21:05:20 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/5] mmc: renesas_sdhi: remove 4taps as a TMIO flag
Date:   Tue,  3 Dec 2019 21:05:12 +0100
Message-Id: <20191203200513.1758-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that the quirks structure is accesible, we can remove the TMIO flag
for HS400 using only 4 taps. This is Renesas specific anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 8 +++-----
 include/linux/mfd/tmio.h             | 3 ---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 2c743429e1e3..8ee6298d5a51 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -350,7 +350,7 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
 		       0x4 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
 
 
-	if (host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400)
+	if (priv->quirks && priv->quirks->hs400_4taps)
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
 			       host->tap_set / 2);
 
@@ -488,7 +488,8 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
-	bool use_4tap = host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400;
+	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+
 
 	/*
 	 * Skip checking SCC errors when running on 4 taps in HS400 mode as
@@ -720,9 +721,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (quirks && quirks->hs400_disabled)
 		host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
 
-	if (quirks && quirks->hs400_4taps)
-		mmc_data->flags |= TMIO_MMC_HAVE_4TAP_HS400;
-
 	/* For some SoC, we disable internal WP. GPIO may override this */
 	if (mmc_can_gpio_ro(host->mmc))
 		mmc_data->capabilities2 &= ~MMC_CAP2_NO_WRITE_PROTECT;
diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index 739b7bf37eaa..8ba042430d8e 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -79,9 +79,6 @@
 /* Some controllers have a CBSY bit */
 #define TMIO_MMC_HAVE_CBSY		BIT(11)
 
-/* Some controllers that support HS400 use 4 taps while others use 8. */
-#define TMIO_MMC_HAVE_4TAP_HS400	BIT(13)
-
 int tmio_core_mmc_enable(void __iomem *cnf, int shift, unsigned long base);
 int tmio_core_mmc_resume(void __iomem *cnf, int shift, unsigned long base);
 void tmio_core_mmc_pwr(void __iomem *cnf, int shift, int state);
-- 
2.20.1

