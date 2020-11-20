Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F9D2BABD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Nov 2020 15:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgKTO0k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Nov 2020 09:26:40 -0500
Received: from www.zeus03.de ([194.117.254.33]:60810 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgKTO0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 09:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=s0GtLyTo/E6FIf
        T4fBvJhskOC1t+OmDLcsmqIBxoHsM=; b=lR6zswf7FKz0qxKcvUubxtEKAxC0jm
        ZvxWI/A+jVC3g/ERK043IeO9yKTNSP+YBU5suEIAJWeScYcd9z9HLWUbdR7qCUtD
        AA5GerhDSG5R/XXQGEeOr0hkqGJOvb/2k1LiI/T4kyJ9gzaUSYig5SbsWlPGgNUt
        /7AYuk04MG/BA=
Received: (qmail 1510263 invoked from network); 20 Nov 2020 15:26:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2020 15:26:36 +0100
X-UD-Smtp-Session: l3s3148p1@V4jJoYq0ttwgAwDPXwi7AEBAgYxIRHZX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 1/3] mmc: tmio: set max_busy_timeout
Date:   Fri, 20 Nov 2020 15:26:27 +0100
Message-Id: <20201120142629.98222-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
References: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Set max_busy_timeouts for variants known to support the TOPxx bits in
the SD_OPTION register. The timeout mechanism was running in the
background but not yet properly handled in the driver. So, let the MMC
core know when to not use R1B to avoid unhandled timeouts.

My datasheets for older variants (tmio_mmc.c) suggest that they support
it, too. However, actual bit descriptions are lacking, so I chose an
opt-in approach.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c |  3 +++
 drivers/mmc/host/tmio_mmc.h          |  2 ++
 drivers/mmc/host/tmio_mmc_core.c     | 15 +++++++++++++++
 drivers/mmc/host/uniphier-sd.c       |  1 +
 include/linux/mfd/tmio.h             |  7 ++++++-
 5 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index bb937411c2ec..153767054c05 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1041,6 +1041,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	/* All SDHI have SDIO status bits which must be 1 */
 	mmc_data->flags |= TMIO_MMC_SDIO_STATUS_SETBITS;
 
+	/* All SDHI support HW busy detection */
+	mmc_data->flags |= TMIO_MMC_USE_BUSY_TIMEOUT;
+
 	dev_pm_domain_start(&pdev->dev);
 
 	ret = renesas_sdhi_clk_enable(host);
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 7ff41185896a..819198af17f4 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -80,6 +80,8 @@
 #define	CLK_CTL_SCLKEN		BIT(8)
 
 /* Definitions for values the CTL_SD_MEM_CARD_OPT register can take */
+#define CARD_OPT_TOP_MASK	0xf0
+#define CARD_OPT_TOP_SHIFT	4
 #define CARD_OPT_WIDTH8		BIT(13)
 #define CARD_OPT_WIDTH		BIT(15)
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index cb4149fd12e0..2518fa9f9fc6 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -885,6 +885,18 @@ static void tmio_mmc_set_bus_width(struct tmio_mmc_host *host,
 	sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, reg);
 }
 
+static void tmio_mmc_max_busy_timeout(struct tmio_mmc_host *host)
+{
+	u16 val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
+	unsigned int clk_rate = host->mmc->actual_clock ?: host->mmc->f_max;
+	unsigned int cycles;
+
+	val = (val & CARD_OPT_TOP_MASK) >> CARD_OPT_TOP_SHIFT;
+	cycles = 1 << (13  + val);
+
+	host->mmc->max_busy_timeout = cycles / (clk_rate * MSEC_PER_SEC);
+}
+
 /* Set MMC clock / power.
  * Note: This controller uses a simple divider scheme therefore it cannot
  * run a MMC card at full speed (20MHz). The max clock is 24MHz on SD, but as
@@ -943,6 +955,9 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		break;
 	}
 
+	if (host->pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT)
+		tmio_mmc_max_busy_timeout(host);
+
 	/* Let things settle. delay taken from winCE driver */
 	usleep_range(140, 200);
 	if (PTR_ERR(host->mrq) == -EINTR)
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 3092466a99ab..a6cd16771d4e 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -586,6 +586,7 @@ static int uniphier_sd_probe(struct platform_device *pdev)
 
 	tmio_data = &priv->tmio_data;
 	tmio_data->flags |= TMIO_MMC_32BIT_DATA_PORT;
+	tmio_data->flags |= TMIO_MMC_USE_BUSY_TIMEOUT;
 
 	host = tmio_mmc_host_alloc(pdev, tmio_data);
 	if (IS_ERR(host))
diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index 8ba042430d8e..27264fe4b3b9 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -55,7 +55,12 @@
  */
 #define TMIO_MMC_HAS_IDLE_WAIT		BIT(4)
 
-/* BIT(5) is unused */
+/*
+ * Use the busy timeout feature. Probably all TMIO versions support it. Yet,
+ * we don't have documentation for old variants, so we enable only known good
+ * variants with this flag. Can be removed once all variants are known good.
+ */
+#define TMIO_MMC_USE_BUSY_TIMEOUT	BIT(5)
 
 /*
  * Some controllers have CMD12 automatically
-- 
2.28.0

