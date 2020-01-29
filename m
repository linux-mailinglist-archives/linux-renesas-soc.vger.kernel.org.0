Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D4B14D202
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 21:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgA2Uh3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 15:37:29 -0500
Received: from sauhun.de ([88.99.104.3]:41406 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbgA2Uh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 15:37:29 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 564E92C28AC;
        Wed, 29 Jan 2020 21:37:27 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 6/6] mmc: tmio: remove superfluous callback wrappers
Date:   Wed, 29 Jan 2020 21:37:09 +0100
Message-Id: <20200129203709.30493-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After various refactoring, we can populate the mmc_ops callbacks
directly and don't need to have wrappers for them anymore.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 18 ++++++++++------
 drivers/mmc/host/tmio_mmc_core.c     | 32 +---------------------------
 2 files changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 22eaabe513d0..0f07cc1aee34 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -321,8 +321,9 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 		SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_MASK;
 }
 
-static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
+static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 {
+	struct tmio_mmc_host *host = mmc_priv(mmc);
 	struct renesas_sdhi *priv = host_to_priv(host);
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
@@ -376,8 +377,9 @@ static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
 				     SH_MOBILE_SDHI_SCC_CKSEL));
 }
 
-static void renesas_sdhi_disable_scc(struct tmio_mmc_host *host)
+static void renesas_sdhi_disable_scc(struct mmc_host *mmc)
 {
+	struct tmio_mmc_host *host = mmc_priv(mmc);
 	struct renesas_sdhi *priv = host_to_priv(host);
 
 	renesas_sdhi_reset_scc(host, priv);
@@ -412,9 +414,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 }
 
-static void renesas_sdhi_prepare_hs400_tuning(struct tmio_mmc_host *host)
+static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
 {
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
 	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
+	return 0;
 }
 
 #define SH_MOBILE_SDHI_MAX_TAP 3
@@ -899,10 +904,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 		host->execute_tuning = renesas_sdhi_execute_tuning;
 		host->check_retune = renesas_sdhi_check_scc_error;
-		host->prepare_hs400_tuning =
-			renesas_sdhi_prepare_hs400_tuning;
-		host->hs400_downgrade = renesas_sdhi_disable_scc;
-		host->hs400_complete = renesas_sdhi_hs400_complete;
+		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
+		host->ops.hs400_downgrade = renesas_sdhi_disable_scc;
+		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
 	}
 
 	num_irqs = platform_irq_count(pdev);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index aeafa1c68ce2..a2415fb5dde0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -997,34 +997,7 @@ static int tmio_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
-static int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc,
-					 struct mmc_ios *ios)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-
-	if (host->prepare_hs400_tuning)
-		host->prepare_hs400_tuning(host);
-
-	return 0;
-}
-
-static void tmio_mmc_hs400_downgrade(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-
-	if (host->hs400_downgrade)
-		host->hs400_downgrade(host);
-}
-
-static void tmio_mmc_hs400_complete(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-
-	if (host->hs400_complete)
-		host->hs400_complete(host);
-}
-
-static const struct mmc_host_ops tmio_mmc_ops = {
+static struct mmc_host_ops tmio_mmc_ops = {
 	.request	= tmio_mmc_request,
 	.set_ios	= tmio_mmc_set_ios,
 	.get_ro         = tmio_mmc_get_ro,
@@ -1033,9 +1006,6 @@ static const struct mmc_host_ops tmio_mmc_ops = {
 	.multi_io_quirk	= tmio_multi_io_quirk,
 	.hw_reset	= tmio_mmc_hw_reset,
 	.execute_tuning = tmio_mmc_execute_tuning,
-	.prepare_hs400_tuning = tmio_mmc_prepare_hs400_tuning,
-	.hs400_downgrade = tmio_mmc_hs400_downgrade,
-	.hs400_complete	= tmio_mmc_hs400_complete,
 };
 
 static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
-- 
2.20.1

