Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB62A2E1965
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 08:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgLWHbQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 02:31:16 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:2516 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727454AbgLWHbP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 02:31:15 -0500
X-IronPort-AV: E=Sophos;i="5.78,441,1599490800"; 
   d="scan'208";a="66692941"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Dec 2020 16:30:43 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E47BB400F2B5;
        Wed, 23 Dec 2020 16:30:43 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] mmc: host: renesas_sdhi: Add a condition of cmd/data timeout for retune
Date:   Wed, 23 Dec 2020 16:30:22 +0900
Message-Id: <1608708622-29668-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608708622-29668-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608708622-29668-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the datasheet, this controller needs retune when
cmd or data timeout happens. So, add a condition into .check_retune().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 16 +++++++++++++---
 drivers/mmc/host/tmio_mmc.h          |  2 +-
 drivers/mmc/host/tmio_mmc_core.c     |  2 +-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 38f028e..158c21e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -768,10 +768,12 @@ static bool renesas_sdhi_auto_correction(struct tmio_mmc_host *host)
 	return false;
 }
 
-static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
+static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host,
+					 struct mmc_request *mrq)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+	bool ret = false;
 
 	/*
 	 * Skip checking SCC errors when running on 4 taps in HS400 mode as
@@ -785,11 +787,19 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 	if (mmc_doing_tune(host->mmc))
 		return false;
 
+	if (((mrq->cmd->error == -ETIMEDOUT) ||
+	     (mrq->data && mrq->data->error == -ETIMEDOUT)) &&
+	    ((host->mmc->caps & MMC_CAP_NONREMOVABLE) ||
+	     (host->ops.get_cd && host->ops.get_cd(host->mmc))))
+		ret |= true;
+
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
 	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN)
-		return renesas_sdhi_auto_correction(host);
+		ret |= renesas_sdhi_auto_correction(host);
+	else
+		ret |= renesas_sdhi_manual_correction(host, use_4tap);
 
-	return renesas_sdhi_manual_correction(host, use_4tap);
+	return ret;
 }
 
 static int renesas_sdhi_wait_idle(struct tmio_mmc_host *host, u32 bit)
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 784fa6e..2d1db93 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -181,7 +181,7 @@ struct tmio_mmc_host {
 			      unsigned int direction, int blk_size);
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host);
-	bool (*check_retune)(struct tmio_mmc_host *host);
+	bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	unsigned int (*get_timeout_cycles)(struct tmio_mmc_host *host);
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 21492b5..49c2d40 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -804,7 +804,7 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 	}
 
 	/* Error means retune, but executed command was still successful */
-	if (host->check_retune && host->check_retune(host))
+	if (host->check_retune && host->check_retune(host, mrq))
 		mmc_retune_needed(host->mmc);
 
 	/* If SET_BLOCK_COUNT, continue with main command */
-- 
2.7.4

