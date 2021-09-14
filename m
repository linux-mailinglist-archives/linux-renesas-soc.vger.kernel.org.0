Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4116F40B6BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 20:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhINSWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 14:22:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:56730 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232019AbhINSV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 14:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=g3Ydjt6/rs/V/i
        wz5INUiD7GrceHhBFduaviPdKRHfI=; b=h1abPQcmUrW6U/2vUtmxIvyA9gQLJT
        OPnS903OAxAiTseAbSd1FODBXdfK3c8unGdaNI08PkrrZIeeAZx5Et33FcB85vY0
        K1tHj6gFrg80Nexavhfgx3ljP1mhoBiyIADxz82WJ3L63QKzCLCkTC1KfW+Qvxqp
        QiXoeFIQdyDzY=
Received: (qmail 518204 invoked from network); 14 Sep 2021 20:20:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2021 20:20:35 +0200
X-UD-Smtp-Session: l3s3148p1@BTJKo/jLJJEgAwDPXxMyACCkRmvQydX8
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] mmc: core: remove obsolete parameter from mmc_send_abort_tuning
Date:   Tue, 14 Sep 2021 20:20:23 +0200
Message-Id: <20210914182023.8103-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Due to refactoring, this is not needed anymore. Remove it from the core
and from drivers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/mmc_ops.c           | 2 +-
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 drivers/mmc/host/sdhci.c             | 2 +-
 include/linux/mmc/host.h             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index bc794419d443..d60750d0f1b9 100644
--- a/drivers/mmc/core/mmc_ops.c
+++ b/drivers/mmc/core/mmc_ops.c
@@ -703,7 +703,7 @@ int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error)
 }
 EXPORT_SYMBOL_GPL(mmc_send_tuning);
 
-int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
+int mmc_send_abort_tuning(struct mmc_host *host)
 {
 	if (host->bus_ops->send_abort_tuning)
 		return host->bus_ops->send_abort_tuning(host);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6fc4cf3c9dce..8884ff392935 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -683,7 +683,7 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 			set_bit(i, priv->smpcmp);
 
 		if (cmd_error)
-			mmc_send_abort_tuning(mmc, opcode);
+			mmc_send_abort_tuning(mmc);
 	}
 
 	ret = renesas_sdhi_select_tuning(host);
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 8eefa7d5fe85..8efc029ee21b 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2685,7 +2685,7 @@ void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode)
 
 	sdhci_end_tuning(host);
 
-	mmc_send_abort_tuning(host->mmc, opcode);
+	mmc_send_abort_tuning(host->mmc);
 }
 EXPORT_SYMBOL_GPL(sdhci_abort_tuning);
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 0c0c9a0fdf57..890dc5c5ffce 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -633,6 +633,6 @@ static inline enum dma_data_direction mmc_get_dma_dir(struct mmc_data *data)
 }
 
 int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error);
-int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode);
+int mmc_send_abort_tuning(struct mmc_host *host);
 
 #endif /* LINUX_MMC_HOST_H */
-- 
2.30.2

