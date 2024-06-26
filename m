Return-Path: <linux-renesas-soc+bounces-6783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF23917B60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 10:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F101C23056
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 08:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7296B16A92F;
	Wed, 26 Jun 2024 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cqHVfGEK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839821684A0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391836; cv=none; b=dqJXbXrndwVADe7APD2mmFq+UPP5iADqqThzl4OoVEeCjwUCTT1d+XCdyH32o7Dsk/TRqlITRbA9to0LAh1QZcTXydcUbNyjt+YUNyS4RT0QeAEZONzfpoUiPKY1h4VmvABR4RJP2kKWzAaRY8q1eX5rKUACGc9vPpfwnGjL0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391836; c=relaxed/simple;
	bh=l0K8hHplUuNdti5ywCUqkEBOIc0XcPuH1zeDKo3XAjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZmo6nt0GMZnwokKfMnUkbrqtxKbfD8rTCKgzvbPfPqqm/oKgQ1aUqTq3kDdlWxtkH/7jAgRkhyjpPtRxhHl3C9DORTz/9q4k9g0yg5AkXzI1kFLl0LY6BFvPGIo9XeUeW8Z33tJJFh4xGotKSG/35IL5hL4UfoKGazxw+kDoI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cqHVfGEK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=r6BkVc9hpoFTj/
	M6/ZZYO9Z3WjgxWckMXitPkoC8wTQ=; b=cqHVfGEKIuq5OT0DVKC3w/pOAF8z8K
	b0RKP83IHMcfptjLvQk8LzH9OAtc19CVMglfLz9OLyaZOGy9JEy+G+cn2Qv7XTdJ
	DuqjP9v03suACbOUVBHcagID9fKw+Ati/obyyRQLy+3eK6oeH2X1iZk1SnijkCGQ
	0A1gwojn8A1GFuJ61PTS/oUfKXfvyJG3aSZUnNSpHdd2I0zP9sb/8yD6K6nzKh5+
	B0C2YJyotDb8ruFwp70Cs0gdE0GLLwuBeonDzOd8qCPjbe/m1xg8wLZGx6qAIuqr
	8onHlnbzj6s+9LhtzEfZQyqLrrq0xFo/e5ly2ThICqW+y7WWjODAbrSQ==
Received: (qmail 505513 invoked from network); 26 Jun 2024 10:50:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 10:50:27 +0200
X-UD-Smtp-Session: l3s3148p1@eEgZG8cbdIQgAwDPX0AHAIitiwsdozO7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Allen Pais <allen.lkml@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: sdhi: Convert from tasklet to BH workqueue
Date: Wed, 26 Jun 2024 10:48:21 +0200
Message-ID: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Allen Pais <allen.lkml@gmail.com>

The only generic interface to execute asynchronously in the BH context is
tasklet; however, it's marked deprecated and has some design flaws. To
replace tasklets, BH workqueue support was recently added. A BH workqueue
behaves similarly to regular workqueues except that the queued work items
are executed in the BH context.

This patch converts the SDHI driver from tasklet to BH workqueue.

Based on the work done by Tejun Heo <tj@kernel.org>

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
[wsa: fixed build faliures, corrected whitespace issues]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Renesas Salvator X board with a R-Car M3-W SoC. Same
performance as with tasklets. Thank you Allen for your work!


 drivers/mmc/host/renesas_sdhi.h               |  4 ++-
 drivers/mmc/host/renesas_sdhi_core.c          |  2 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 26 +++++++++----------
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  9 +++----
 drivers/mmc/host/tmio_mmc.h                   |  3 ++-
 drivers/mmc/host/tmio_mmc_core.c              |  4 +--
 6 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 586f94d4dbfd..f12a87442338 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -11,6 +11,7 @@
 
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 #include "tmio_mmc.h"
 
 struct renesas_sdhi_scc {
@@ -67,7 +68,7 @@ struct renesas_sdhi_dma {
 	dma_filter_fn filter;
 	void (*enable)(struct tmio_mmc_host *host, bool enable);
 	struct completion dma_dataend;
-	struct tasklet_struct dma_complete;
+	struct work_struct dma_complete;
 };
 
 struct renesas_sdhi {
@@ -93,6 +94,7 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct tmio_mmc_host *host;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 58536626e6c5..04874791541f 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -970,6 +970,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(host))
 		return PTR_ERR(host);
 
+	priv->host = host;
+
 	if (of_data) {
 		mmc_data->flags |= of_data->tmio_flags;
 		mmc_data->ocr_mask = of_data->tmio_ocr_mask;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 422fa63a2e99..d4b66daeda66 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -337,7 +337,7 @@ static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
 		writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
 		set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);
 		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags))
-			tasklet_schedule(&dma_priv->dma_complete);
+			queue_work(system_bh_wq, &dma_priv->dma_complete);
 	}
 
 	return status & dma_irqs;
@@ -352,7 +352,7 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
 	set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
 	if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
 	    host->data->error)
-		tasklet_schedule(&dma_priv->dma_complete);
+		queue_work(system_bh_wq, &dma_priv->dma_complete);
 }
 
 /*
@@ -440,9 +440,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
 }
 
-static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
+static void renesas_sdhi_internal_dmac_issue_work_fn(struct work_struct *work)
 {
-	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
+	struct tmio_mmc_host *host = from_work(host, work, dma_issue);
 	struct renesas_sdhi *priv = host_to_priv(host);
 
 	tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
@@ -454,7 +454,7 @@ static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
 		/* on CMD errors, simulate DMA end immediately */
 		set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags);
 		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.end_flags))
-			tasklet_schedule(&priv->dma_priv.dma_complete);
+			queue_work(system_bh_wq, &priv->dma_priv.dma_complete);
 	}
 }
 
@@ -484,9 +484,11 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
 	return true;
 }
 
-static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
+static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_struct *work)
 {
-	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
+	struct renesas_sdhi_dma *dma_priv = from_work(dma_priv, work, dma_complete);
+	struct renesas_sdhi *priv = container_of(dma_priv, typeof(*priv), dma_priv);
+	struct tmio_mmc_host *host = priv->host;
 
 	spin_lock_irq(&host->lock);
 	if (!renesas_sdhi_internal_dmac_complete(host))
@@ -544,12 +546,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 	/* Each value is set to non-zero to assume "enabling" each DMA */
 	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
 
-	tasklet_init(&priv->dma_priv.dma_complete,
-		     renesas_sdhi_internal_dmac_complete_tasklet_fn,
-		     (unsigned long)host);
-	tasklet_init(&host->dma_issue,
-		     renesas_sdhi_internal_dmac_issue_tasklet_fn,
-		     (unsigned long)host);
+	INIT_WORK(&priv->dma_priv.dma_complete,
+		  renesas_sdhi_internal_dmac_complete_work_fn);
+	INIT_WORK(&host->dma_issue,
+		  renesas_sdhi_internal_dmac_issue_work_fn);
 
 	/* Add pre_req and post_req */
 	host->ops.pre_req = renesas_sdhi_internal_dmac_pre_req;
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 9cf7f9feab72..5a6f41318645 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -312,9 +312,9 @@ static void renesas_sdhi_sys_dmac_start_dma(struct tmio_mmc_host *host,
 	}
 }
 
-static void renesas_sdhi_sys_dmac_issue_tasklet_fn(unsigned long priv)
+static void renesas_sdhi_sys_dmac_issue_work_fn(struct work_struct *work)
 {
-	struct tmio_mmc_host *host = (struct tmio_mmc_host *)priv;
+	struct tmio_mmc_host *host = from_work(host, work, dma_issue);
 	struct dma_chan *chan = NULL;
 
 	spin_lock_irq(&host->lock);
@@ -401,9 +401,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 			goto ebouncebuf;
 
 		init_completion(&priv->dma_priv.dma_dataend);
-		tasklet_init(&host->dma_issue,
-			     renesas_sdhi_sys_dmac_issue_tasklet_fn,
-			     (unsigned long)host);
+		INIT_WORK(&host->dma_issue,
+			  renesas_sdhi_sys_dmac_issue_work_fn);
 	}
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 2af5730c21f4..a75755f31d31 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -21,6 +21,7 @@
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 
 #define CTL_SD_CMD 0x00
 #define CTL_ARG_REG 0x04
@@ -153,7 +154,7 @@ struct tmio_mmc_host {
 	bool			dma_on;
 	struct dma_chan		*chan_rx;
 	struct dma_chan		*chan_tx;
-	struct tasklet_struct	dma_issue;
+	struct work_struct	dma_issue;
 	struct scatterlist	bounce_sg;
 	u8			*bounce_buf;
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2780f0a29871..b61a6310311d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -608,7 +608,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host, unsigned int stat)
 			} else {
 				tmio_mmc_disable_mmc_irqs(host,
 							  TMIO_MASK_READOP);
-				tasklet_schedule(&host->dma_issue);
+				queue_work(system_bh_wq, &host->dma_issue);
 			}
 		} else {
 			if (!host->dma_on) {
@@ -616,7 +616,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host, unsigned int stat)
 			} else {
 				tmio_mmc_disable_mmc_irqs(host,
 							  TMIO_MASK_WRITEOP);
-				tasklet_schedule(&host->dma_issue);
+				queue_work(system_bh_wq, &host->dma_issue);
 			}
 		}
 	} else {
-- 
2.43.0


