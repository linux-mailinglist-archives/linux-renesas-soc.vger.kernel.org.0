Return-Path: <linux-renesas-soc+bounces-16377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3BA9C6EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 13:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A201BC3E2A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 11:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C015D242D9E;
	Fri, 25 Apr 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PrXfrRO2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DAB2459F0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579673; cv=none; b=uQTD8OEvKhXIsRVHQQLylTFsKEvU4sKxTgQgaQ7u9LqNHK8Q+ghVwkxD7pvQJEMz+m66UH0qDTShbpGhSXmC3c4E7eYKQg5UCAQ1UZRYtroi06X84cDcik4M3B1CBRcuIEtKZD4X8Qm9mmXtIhXVHNrdK9y1lunP/9Wu6N4GIeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579673; c=relaxed/simple;
	bh=WDl768/k2XZPf3ix/tJOCX3vVhrNeIIJfYXHENX4OgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJmfWjHzcdw8uReSbW3bKsCEv8lGHrlJ8Ne4Y8VlKhrnjcwWUEiPWIsd2jQ+x/sQKINh09ExKyVRlnhLJD4JihGwwY7jCHMrjtcJJLg7KJtG0f5tv5ApCYkqdfj8t2nNc7XbCbwcJKuJjergV7WiKnU6PA4r1d5aB096W1J1XbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PrXfrRO2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=o8dZSj6KyBq+sXWqiCuImDo8ebOFxoaJEIPvwb07TS0=; b=PrXfrR
	O2xtLZfyvIe6vPTcYRg5Dou5RftuFbip2Nc7PqEKqrTm4NJZZHhCP0MynbKELv5C
	4h1478vP2vG7KrGHX5/p+awMxeTnd67yegwtGs0dOea5t68f1CddtjVvmFn56rUm
	JZIQJR8c+4ak4ntivMrtVLJG4m6x0UvQG4D8kPrEDBgR76/DwCqznW7W8JWq9TpS
	LrkO7alAa/EqccZtZMQFpsVDImunpGJCawhCGMY5FuOB82Z7qX+t7BvQsbsYFEra
	ol375b635Zz+B/3afx0U+EAayhOQ0zKWTQmt3ar7lwuWCGbrmvxM/7XmnuYyWOkE
	IzePCVpq7WDeeGDw==
Received: (qmail 3801357 invoked from network); 25 Apr 2025 13:14:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2025 13:14:28 +0200
X-UD-Smtp-Session: l3s3148p1@NPMGcJgzOpgujnsE
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hu Ziji <huziji@marvell.com>,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/11] mmc: rename mmc_retune_needed() to mmc_host_retune_needed()
Date: Fri, 25 Apr 2025 13:14:07 +0200
Message-ID: <20250425111414.2522-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmc_* functions sometimes relate to the card and sometimes to the host.
Make it obvious by renaming this function to include 'host'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/core.c            | 4 ++--
 drivers/mmc/core/host.c            | 2 +-
 drivers/mmc/core/mmc_test.c        | 2 +-
 drivers/mmc/core/sdio.c            | 2 +-
 drivers/mmc/host/sdhci-acpi.c      | 4 ++--
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 +++---
 drivers/mmc/host/sdhci-of-arasan.c | 2 +-
 drivers/mmc/host/sdhci-of-at91.c   | 2 +-
 drivers/mmc/host/sdhci-of-esdhc.c  | 2 +-
 drivers/mmc/host/sdhci-omap.c      | 2 +-
 drivers/mmc/host/sdhci-pci-core.c  | 6 +++---
 drivers/mmc/host/sdhci-pltfm.c     | 2 +-
 drivers/mmc/host/sdhci-pxav3.c     | 4 ++--
 drivers/mmc/host/sdhci-s3c.c       | 4 ++--
 drivers/mmc/host/sdhci-spear.c     | 2 +-
 drivers/mmc/host/sdhci-st.c        | 2 +-
 drivers/mmc/host/sdhci-xenon.c     | 2 +-
 drivers/mmc/host/sdhci.c           | 2 +-
 drivers/mmc/host/sdhci_am654.c     | 2 +-
 drivers/mmc/host/tmio_mmc_core.c   | 4 ++--
 include/linux/mmc/host.h           | 2 +-
 21 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 960d7f4a3503..c770a2835f23 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -146,7 +146,7 @@ void mmc_request_done(struct mmc_host *host, struct mmc_request *mrq)
 	    (err == -EILSEQ || (mrq->sbc && mrq->sbc->error == -EILSEQ) ||
 	    (mrq->data && mrq->data->error == -EILSEQ) ||
 	    (mrq->stop && mrq->stop->error == -EILSEQ)))
-		mmc_retune_needed(host);
+		mmc_host_retune_needed(host);
 
 	if (err && cmd->retries && mmc_host_is_spi(host)) {
 		if (cmd->resp[0] & R1_SPI_ILLEGAL_COMMAND)
@@ -493,7 +493,7 @@ void mmc_cqe_request_done(struct mmc_host *host, struct mmc_request *mrq)
 	/* Flag re-tuning needed on CRC errors */
 	if ((mrq->cmd && mrq->cmd->error == -EILSEQ) ||
 	    (mrq->data && mrq->data->error == -EILSEQ))
-		mmc_retune_needed(host);
+		mmc_host_retune_needed(host);
 
 	trace_mmc_request_done(host, mrq);
 
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 651c62ea0848..c9c67716d665 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -214,7 +214,7 @@ static void mmc_retune_timer(struct timer_list *t)
 {
 	struct mmc_host *host = from_timer(host, t, retune_timer);
 
-	mmc_retune_needed(host);
+	mmc_host_retune_needed(host);
 }
 
 static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index 503e4b2a7424..0293f2b7a9c8 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -1930,7 +1930,7 @@ static int mmc_test_rnd_perf(struct mmc_test_card *test, int write, int print,
 		dev_addr = rnd_addr + test->card->pref_erase * ea +
 			   ssz * mmc_test_rnd_num(range2);
 		if (force_retuning)
-			mmc_retune_needed(test->card->host);
+			mmc_host_retune_needed(test->card->host);
 		ret = mmc_test_area_io(test, sz, dev_addr, write, 0, 0);
 		if (ret)
 			return ret;
diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index 3fa1bae6845c..bd2104e0f13c 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -1056,7 +1056,7 @@ static int mmc_sdio_suspend(struct mmc_host *host)
 		mmc_power_off(host);
 	} else if (host->retune_period) {
 		mmc_retune_timer_stop(host);
-		mmc_retune_needed(host);
+		mmc_host_retune_needed(host);
 	}
 
 	mmc_release_host(host);
diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index e6c5c82f64fa..630868203f9e 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -1001,7 +1001,7 @@ static int sdhci_acpi_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	ret = sdhci_suspend_host(host);
 	if (ret)
@@ -1031,7 +1031,7 @@ static int sdhci_acpi_runtime_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	ret = sdhci_runtime_suspend_host(host);
 	if (ret)
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index b977d37e2684..2d78d7676967 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2016,11 +2016,11 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
 		(host->tuning_mode != SDHCI_TUNING_MODE_1)) {
 		mmc_retune_timer_stop(host->mmc);
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 	}
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	/*
 	 * For the device need to keep power during system PM, need
@@ -2099,7 +2099,7 @@ static int sdhci_esdhc_runtime_suspend(struct device *dev)
 		return ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	imx_data->actual_clock = host->mmc->actual_clock;
 	esdhc_pltfm_set_clock(host, 0);
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 8c29676ab662..979f19fd95f4 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -598,7 +598,7 @@ static int sdhci_arasan_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	if (sdhci_arasan->has_cqe) {
 		ret = cqhci_suspend(host->mmc);
diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 97988ed37467..8b36cdc6cf81 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -256,7 +256,7 @@ static int sdhci_at91_runtime_suspend(struct device *dev)
 	ret = sdhci_runtime_suspend_host(host);
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	clk_disable_unprepare(priv->gck);
 	clk_disable_unprepare(priv->hclock);
diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index 002d0d59b992..829491c59d09 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -1243,7 +1243,7 @@ static int esdhc_of_suspend(struct device *dev)
 	esdhc_proctl = sdhci_readl(host, SDHCI_HOST_CONTROL);
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	return sdhci_suspend_host(host);
 }
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 8897839ab2aa..98111e4253ec 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1440,7 +1440,7 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	if (omap_host->con != -EINVAL)
 		sdhci_runtime_suspend_host(host);
diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index 13a84b9309e0..b4b355f41bfa 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -86,7 +86,7 @@ static int sdhci_pci_suspend_host(struct sdhci_pci_chip *chip)
 		host = slot->host;
 
 		if (chip->pm_retune && host->tuning_mode != SDHCI_TUNING_MODE_3)
-			mmc_retune_needed(host->mmc);
+			mmc_host_retune_needed(host->mmc);
 
 		ret = sdhci_suspend_host(host);
 		if (ret)
@@ -167,7 +167,7 @@ static int sdhci_pci_runtime_suspend_host(struct sdhci_pci_chip *chip)
 
 		if (chip->rpm_retune &&
 		    host->tuning_mode != SDHCI_TUNING_MODE_3)
-			mmc_retune_needed(host->mmc);
+			mmc_host_retune_needed(host->mmc);
 	}
 
 	return 0;
@@ -1035,7 +1035,7 @@ static void glk_rpm_retune_wa(struct sdhci_pci_chip *chip, bool susp)
 
 	intel_host->rpm_retune_ok = true;
 	chip->rpm_retune = true;
-	mmc_retune_needed(host->mmc);
+	mmc_host_retune_needed(host->mmc);
 	pr_info("%s: Requiring re-tune after rpm resume", mmc_hostname(host->mmc));
 }
 
diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
index 62753d72198a..845f700dd454 100644
--- a/drivers/mmc/host/sdhci-pltfm.c
+++ b/drivers/mmc/host/sdhci-pltfm.c
@@ -193,7 +193,7 @@ int sdhci_pltfm_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	ret = sdhci_suspend_host(host);
 	if (ret)
diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index 3fb56face3d8..ab83a39feed0 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -497,7 +497,7 @@ static int sdhci_pxav3_suspend(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 	ret = sdhci_suspend_host(host);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
@@ -532,7 +532,7 @@ static int sdhci_pxav3_runtime_suspend(struct device *dev)
 		return ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	clk_disable_unprepare(pxa->clk_io);
 	if (!IS_ERR(pxa->clk_core))
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index bdf4dc0d6b77..a9524a0d7adc 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -695,7 +695,7 @@ static int sdhci_s3c_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	return sdhci_suspend_host(host);
 }
@@ -719,7 +719,7 @@ static int sdhci_s3c_runtime_suspend(struct device *dev)
 	ret = sdhci_runtime_suspend_host(host);
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	if (ourhost->cur_clk >= 0)
 		clk_disable_unprepare(ourhost->clk_bus[ourhost->cur_clk]);
diff --git a/drivers/mmc/host/sdhci-spear.c b/drivers/mmc/host/sdhci-spear.c
index 770dc12b9ae9..c192c7d284b8 100644
--- a/drivers/mmc/host/sdhci-spear.c
+++ b/drivers/mmc/host/sdhci-spear.c
@@ -141,7 +141,7 @@ static int sdhci_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	ret = sdhci_suspend_host(host);
 	if (!ret)
diff --git a/drivers/mmc/host/sdhci-st.c b/drivers/mmc/host/sdhci-st.c
index 4973e08a98f8..bfeb680d4be9 100644
--- a/drivers/mmc/host/sdhci-st.c
+++ b/drivers/mmc/host/sdhci-st.c
@@ -456,7 +456,7 @@ static int sdhci_st_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	ret = sdhci_suspend_host(host);
 	if (ret)
diff --git a/drivers/mmc/host/sdhci-xenon.c b/drivers/mmc/host/sdhci-xenon.c
index 098f0ea45cbe..48b00b82d361 100644
--- a/drivers/mmc/host/sdhci-xenon.c
+++ b/drivers/mmc/host/sdhci-xenon.c
@@ -655,7 +655,7 @@ static int xenon_runtime_suspend(struct device *dev)
 		return ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	clk_disable_unprepare(pltfm_host->clk);
 	/*
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index fd5681d1e31f..fa1924657ed6 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -3635,7 +3635,7 @@ static irqreturn_t sdhci_irq(int irq, void *dev_id)
 				mmc_hostname(host->mmc));
 
 		if (intmask & SDHCI_INT_RETUNE)
-			mmc_retune_needed(host->mmc);
+			mmc_host_retune_needed(host->mmc);
 
 		if ((intmask & SDHCI_INT_CARD_INT) &&
 		    (host->ier & SDHCI_INT_CARD_INT)) {
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index f75c31815ab0..ffd40733d71c 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -1043,7 +1043,7 @@ static int sdhci_am654_runtime_suspend(struct device *dev)
 	int ret;
 
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	ret = cqhci_suspend(host->mmc);
 	if (ret)
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index b71241f55df5..a2b35c1c8b62 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -224,7 +224,7 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host, bool preserve)
 	}
 
 	if (host->mmc->card)
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 }
 
 static void tmio_mmc_reset_work(struct work_struct *work)
@@ -852,7 +852,7 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 
 	/* Error means retune, but executed command was still successful */
 	if (host->check_retune && host->check_retune(host, mrq))
-		mmc_retune_needed(host->mmc);
+		mmc_host_retune_needed(host->mmc);
 
 	/* If SET_BLOCK_COUNT, continue with main command */
 	if (host->mrq && !mrq->cmd->error) {
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..e49a3f502ecf 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -699,7 +699,7 @@ static inline bool mmc_card_uhs2(struct mmc_host *host)
 
 void mmc_retune_timer_stop(struct mmc_host *host);
 
-static inline void mmc_retune_needed(struct mmc_host *host)
+static inline void mmc_host_retune_needed(struct mmc_host *host)
 {
 	if (host->can_retune)
 		host->need_retune = 1;
-- 
2.47.2


