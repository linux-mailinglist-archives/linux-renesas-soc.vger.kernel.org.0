Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E530539FE9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 20:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbhFHSIY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 14:08:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:40184 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234170AbhFHSIW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 14:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=awmCGdu2Nt/7xt5sOnwWTnUnsmm
        gMJ8NHBH/br7L48w=; b=sn05GMjnzAMl3kEG/Jw8DSLfaAOqT+9Rs8k/AJKE7Ww
        oQQ4l4ClWJftcXb7itemBmbvaXeDqm50KFMfzLJsr5o/Zf9FWu32HeNVOO3L5gFt
        uVp3ag4ChVxJVXwiFIUjnNv/hh6tF2s1jAJ3Lw35FQS13Pt8CMa81TJQtMwtreTU
        =
Received: (qmail 1198650 invoked from network); 8 Jun 2021 20:06:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2021 20:06:27 +0200
X-UD-Smtp-Session: l3s3148p1@xFVJBEXELqVQT+F6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: improve function name when aborting a tuning cmd
Date:   Tue,  8 Jun 2021 20:06:20 +0200
Message-Id: <20210608180620.40059-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

'mmc_abort_tuning()' made me think tuning gets completely aborted.
However, it sends only a STOP cmd to cancel the current tuning cmd.
Tuning process may still continue after that. So, rename the function to
'mmc_send_abort_tuning()' to better reflect all this.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Ulf, here is the patch we discussed earlier today. Based on mmc/next.

 drivers/mmc/core/mmc_ops.c           | 4 ++--
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 drivers/mmc/host/sdhci.c             | 2 +-
 include/linux/mmc/host.h             | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index 3c58f6d0f482..973756ed4016 100644
--- a/drivers/mmc/core/mmc_ops.c
+++ b/drivers/mmc/core/mmc_ops.c
@@ -700,7 +700,7 @@ int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error)
 }
 EXPORT_SYMBOL_GPL(mmc_send_tuning);
 
-int mmc_abort_tuning(struct mmc_host *host, u32 opcode)
+int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
 {
 	struct mmc_command cmd = {};
 
@@ -723,7 +723,7 @@ int mmc_abort_tuning(struct mmc_host *host, u32 opcode)
 
 	return mmc_wait_for_cmd(host, &cmd, 0);
 }
-EXPORT_SYMBOL_GPL(mmc_abort_tuning);
+EXPORT_SYMBOL_GPL(mmc_send_abort_tuning);
 
 static int
 mmc_send_bus_test(struct mmc_card *card, struct mmc_host *host, u8 opcode,
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index baab4c2e1b53..e49ca0f7fe9a 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -704,7 +704,7 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 			set_bit(i, priv->smpcmp);
 
 		if (cmd_error)
-			mmc_abort_tuning(mmc, opcode);
+			mmc_send_abort_tuning(mmc, opcode);
 	}
 
 	ret = renesas_sdhi_select_tuning(host);
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index bf238ade1602..6aaf5c3ce34c 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2680,7 +2680,7 @@ void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode)
 
 	sdhci_end_tuning(host);
 
-	mmc_abort_tuning(host->mmc, opcode);
+	mmc_send_abort_tuning(host->mmc, opcode);
 }
 EXPORT_SYMBOL_GPL(sdhci_abort_tuning);
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index c7e7b43600e9..0abd47e9ef9b 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -632,6 +632,6 @@ static inline enum dma_data_direction mmc_get_dma_dir(struct mmc_data *data)
 }
 
 int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error);
-int mmc_abort_tuning(struct mmc_host *host, u32 opcode);
+int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode);
 
 #endif /* LINUX_MMC_HOST_H */
-- 
2.30.2

