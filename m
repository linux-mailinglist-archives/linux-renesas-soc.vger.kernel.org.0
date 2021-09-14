Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADE540B6BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 20:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhINSWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 14:22:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:56726 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232004AbhINSV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 14:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=FXWtXqpSRzIUuu
        j9A/bTtWa9z8u/sxFXhKENNzrbSiY=; b=RFzZkChPLbbUKOCIPSk2OJQCa2pxKy
        MKlSK227gO4FRV7wFmidNL24LIv/jLtSlavz/x8qkmrJVoL06PY8/Hbluc7bj7vK
        FXle5aq8w3lKcKSm8IXCxaMqR21TezZYVCkFgufFO0dD1O4rnxy+mPQxccuFMbE/
        X+tSjH0V8gZo0=
Received: (qmail 518175 invoked from network); 14 Sep 2021 20:20:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2021 20:20:35 +0200
X-UD-Smtp-Session: l3s3148p1@x4VDo/jLIpEgAwDPXxMyACCkRmvQydX8
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] mmc: core: also abort tuning with CMD12 for SD
Date:   Tue, 14 Sep 2021 20:20:22 +0200
Message-Id: <20210914182023.8103-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We have various SanDisk cards which fail tuning to SDR104 unless we
allow a CMD12 also to be sent to abort a broken tuning. It is true that
the SD specs do not mention that CMD12 is allowed, but they also don't
say it is forbidden. And now reality tells that it is needed to make
some cards work. Other cards I tried did not regress.

So, add a new callback to the bus_ops which allows us to send STOP for
MMC and SD cards but not SDIO which does not support CMD12.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Renesas Salvator-XS board (R-Car H3 ES2.0) and a SanDisk
Ultra 64GB card.

 drivers/mmc/core/core.h    |  1 +
 drivers/mmc/core/mmc.c     |  6 ++++++
 drivers/mmc/core/mmc_ops.c | 21 +++------------------
 drivers/mmc/core/sd.c      |  6 ++++++
 4 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 7931a4f0137d..660873ba13ed 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -31,6 +31,7 @@ struct mmc_bus_ops {
 	int (*sw_reset)(struct mmc_host *);
 	bool (*cache_enabled)(struct mmc_host *);
 	int (*flush_cache)(struct mmc_host *);
+	int (*send_abort_tuning)(struct mmc_host *);
 };
 
 void mmc_attach_bus(struct mmc_host *host, const struct mmc_bus_ops *ops);
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 29e58ffae379..d638477e0a49 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2227,6 +2227,11 @@ static int _mmc_hw_reset(struct mmc_host *host)
 	return mmc_init_card(host, card->ocr, card);
 }
 
+static int _mmc_send_abort_tuning(struct mmc_host *host)
+{
+	return mmc_send_stop(host, 150, 0);
+}
+
 static const struct mmc_bus_ops mmc_ops = {
 	.remove = mmc_remove,
 	.detect = mmc_detect,
@@ -2239,6 +2244,7 @@ static const struct mmc_bus_ops mmc_ops = {
 	.hw_reset = _mmc_hw_reset,
 	.cache_enabled = _mmc_cache_enabled,
 	.flush_cache = _mmc_flush_cache,
+	.send_abort_tuning = _mmc_send_abort_tuning,
 };
 
 /*
diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index 0c54858e89c0..bc794419d443 100644
--- a/drivers/mmc/core/mmc_ops.c
+++ b/drivers/mmc/core/mmc_ops.c
@@ -705,26 +705,11 @@ EXPORT_SYMBOL_GPL(mmc_send_tuning);
 
 int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
 {
-	struct mmc_command cmd = {};
-
-	/*
-	 * eMMC specification specifies that CMD12 can be used to stop a tuning
-	 * command, but SD specification does not, so do nothing unless it is
-	 * eMMC.
-	 */
-	if (opcode != MMC_SEND_TUNING_BLOCK_HS200)
-		return 0;
+	if (host->bus_ops->send_abort_tuning)
+		return host->bus_ops->send_abort_tuning(host);
 
-	cmd.opcode = MMC_STOP_TRANSMISSION;
-	cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
-
-	/*
-	 * For drivers that override R1 to R1b, set an arbitrary timeout based
-	 * on the tuning timeout i.e. 150ms.
-	 */
-	cmd.busy_timeout = 150;
+	return 0;
 
-	return mmc_wait_for_cmd(host, &cmd, 0);
 }
 EXPORT_SYMBOL_GPL(mmc_send_abort_tuning);
 
diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index 4646b7a03db6..19c85e6088f4 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -1784,6 +1784,11 @@ static int mmc_sd_hw_reset(struct mmc_host *host)
 	return mmc_sd_init_card(host, host->card->ocr, host->card);
 }
 
+static int sd_send_abort_tuning(struct mmc_host *host)
+{
+	return mmc_send_stop(host, 150, 0);
+}
+
 static const struct mmc_bus_ops mmc_sd_ops = {
 	.remove = mmc_sd_remove,
 	.detect = mmc_sd_detect,
@@ -1796,6 +1801,7 @@ static const struct mmc_bus_ops mmc_sd_ops = {
 	.hw_reset = mmc_sd_hw_reset,
 	.cache_enabled = sd_cache_enabled,
 	.flush_cache = sd_flush_cache,
+	.send_abort_tuning = sd_send_abort_tuning,
 };
 
 /*
-- 
2.30.2

