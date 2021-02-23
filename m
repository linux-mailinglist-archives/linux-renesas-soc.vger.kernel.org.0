Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6D132289D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Feb 2021 11:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhBWKKs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Feb 2021 05:10:48 -0500
Received: from www.zeus03.de ([194.117.254.33]:49240 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231950AbhBWKJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 05:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=+YfE37GZhgVRlk
        p1VH1/Ni/UnOLq9XL6A5x6aE1z0/0=; b=JLfYx79FOKPZ9nMot3GiOcSqhjL0td
        QFHtlAXk/+vpWT8mLBvyPoSw4K1ZA3Llu8/xEaud3KqaD3Lmptcqv9pdF7xrLpwU
        4RFgjhwucN0jNzlvGERrK7Ou0IPU+yUMwCTvlmSn9UA39eWgMgpT5cE0YcEP5MGs
        JL4/txiHVQ7no=
Received: (qmail 2594344 invoked from network); 23 Feb 2021 11:08:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2021 11:08:39 +0100
X-UD-Smtp-Session: l3s3148p1@x3YxGv67JIMgARa4RdeBASWYxunz7zkl
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] mmc: tmio: support custom irq masks
Date:   Tue, 23 Feb 2021 11:08:29 +0100
Message-Id: <20210223100830.25125-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
References: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SDHI Gen2+ has a different value for TMIO_MASK_ALL, so add a member to
support that. If the member is not used, the previous default value is
applied.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.h      | 1 +
 drivers/mmc/host/tmio_mmc_core.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 2d1db9396d4a..7d5201d6a006 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -164,6 +164,7 @@ struct tmio_mmc_host {
 	u32			sdio_irq_mask;
 	unsigned int		clk_cache;
 	u32			sdcard_irq_setbit_mask;
+	u32			sdcard_irq_mask_all;
 
 	spinlock_t		lock;		/* protect host private data */
 	unsigned long		last_req_ts;
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 0e7a2faa5238..eca767dcabba 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1175,7 +1175,9 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	tmio_mmc_reset(_host);
 
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
-	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
+	if (!_host->sdcard_irq_mask_all)
+		_host->sdcard_irq_mask_all = TMIO_MASK_ALL;
+	tmio_mmc_disable_mmc_irqs(_host, _host->sdcard_irq_mask_all);
 
 	if (_host->native_hotplug)
 		tmio_mmc_enable_mmc_irqs(_host,
@@ -1229,7 +1231,7 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
 	cancel_work_sync(&host->done);
 	cancel_delayed_work_sync(&host->delayed_reset_work);
 	tmio_mmc_release_dma(host);
-	tmio_mmc_disable_mmc_irqs(host, TMIO_MASK_ALL);
+	tmio_mmc_disable_mmc_irqs(host, host->sdcard_irq_mask_all);
 
 	if (host->native_hotplug)
 		pm_runtime_put_noidle(&pdev->dev);
@@ -1259,7 +1261,7 @@ int tmio_mmc_host_runtime_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
-	tmio_mmc_disable_mmc_irqs(host, TMIO_MASK_ALL);
+	tmio_mmc_disable_mmc_irqs(host, host->sdcard_irq_mask_all);
 
 	if (host->clk_cache)
 		host->set_clock(host, 0);
-- 
2.30.0

