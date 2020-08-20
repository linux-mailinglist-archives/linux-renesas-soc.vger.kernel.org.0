Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909E524BE6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 15:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgHTN0b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 09:26:31 -0400
Received: from www.zeus03.de ([194.117.254.33]:47918 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730695AbgHTNZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 09:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=UvZoRqVd8SaH7h
        ySu0Bk8mZtHRpRIhIBd9uTcbOBcjY=; b=LEHHf83CXhYi4foBk0S6UFtFASxEw4
        UlIaLbZhi94LX8yTSF+4DF7+RTwqk5Rhj4zA9z+PiLTzf99QPbzv1Mt5jqB9PhGw
        nSX5qFLSWXUj3B6+7E6I341qiqkGq6sHs4XNqCdtipX4dL77mpqu5tp6hr+yUPMu
        z5hE2jDoxELbE=
Received: (qmail 560174 invoked from network); 20 Aug 2020 15:25:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2020 15:25:48 +0200
X-UD-Smtp-Session: l3s3148p1@El72Dk+tMpggAwDPXwuPAFbD76CDVWXO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 5/6] mmc: tmio: don't reset whole IP core when tuning fails
Date:   Thu, 20 Aug 2020 15:25:37 +0200
Message-Id: <20200820132538.24758-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SDHI needs to reset the SCC only, not the whole IP core. So, if tuning
fails, don't handle specifics in the generic TMIO core, but in the
specific drivers. For SDHI, we need to move around the reset routine a
bit. It is not modified.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 45 +++++++++++++++-------------
 drivers/mmc/host/tmio_mmc_core.c     |  4 +--
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 73ddd3e6eebb..872f36a43753 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -432,6 +432,25 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 	return 0;
 }
 
+static void renesas_sdhi_reset(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	renesas_sdhi_reset_scc(host, priv);
+	renesas_sdhi_reset_hs400_mode(host, priv);
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
+		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
+		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
+
+	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
+		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
+					     TMIO_MASK_INIT_RCAR2);
+}
+
 #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
 
 static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
@@ -503,7 +522,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
-	int i;
+	int i, ret;
 
 	priv->tap_num = renesas_sdhi_init_tuning(host);
 	if (!priv->tap_num)
@@ -531,7 +550,10 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 			set_bit(i, priv->smpcmp);
 	}
 
-	return renesas_sdhi_select_tuning(host);
+	ret = renesas_sdhi_select_tuning(host);
+	if (ret < 0)
+		renesas_sdhi_reset(host);
+	return ret;
 }
 
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
@@ -631,25 +653,6 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 	return renesas_sdhi_manual_correction(host, use_4tap);
 }
 
-static void renesas_sdhi_reset(struct tmio_mmc_host *host)
-{
-	struct renesas_sdhi *priv = host_to_priv(host);
-
-	renesas_sdhi_reset_scc(host, priv);
-	renesas_sdhi_reset_hs400_mode(host, priv);
-
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
-			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
-		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
-		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
-
-	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
-		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
-					     TMIO_MASK_INIT_RCAR2);
-}
-
 static int renesas_sdhi_wait_idle(struct tmio_mmc_host *host, u32 bit)
 {
 	int timeout = 1000;
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index f68c10b8ed61..e7bad761c714 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -722,10 +722,8 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 	ret = host->execute_tuning(host, opcode);
 
-	if (ret < 0) {
+	if (ret < 0)
 		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
-		tmio_mmc_reset(host);
-	}
 
 	return ret;
 }
-- 
2.20.1

