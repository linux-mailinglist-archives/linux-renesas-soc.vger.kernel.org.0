Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19F81D1C4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 19:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732834AbgEMRbj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 13:31:39 -0400
Received: from www.zeus03.de ([194.117.254.33]:39792 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732731AbgEMRbj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 13:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=lTJV8O7kx6trRAlxnD5NwiE752V
        EX9ct9iVA4/E+mdA=; b=lX48X8IEg02bQqHvGf/Ej/H8Sc0rinhn2zolcOuZNMj
        0cA4S+sNFqG2FpVtcYfZTiL5f3eoIkHBaOlzdS294xuTcpjcjll5mpwGfCuVnO0h
        B4F6z4DnseJlg0274Vm6z2M1POJrffbjL5PV8UjUMGkPu/A7EHwID3IJOCG34xgs
        =
Received: (qmail 3435993 invoked from network); 13 May 2020 19:31:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2020 19:31:37 +0200
X-UD-Smtp-Session: l3s3148p1@1N3B84qlFt0gAwDPXwcWAIZZjypw6UMc
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: don't lose RPM savings because of manual clk handling
Date:   Wed, 13 May 2020 19:31:31 +0200
Message-Id: <20200513173131.11200-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SDHI driver en-/disabled clocks on its own during probe() and
remove(). This basically killed all potential RPM power savings. Now, we
just enable the clocks for a short time when we access registers in
probe(). We otherwise leave all handling to RPM. That means, we need to
shift the RPM enabling code in the TMIO core a bit up, so we can access
registers there, too.

clk_summary before:
sd0                   1        1        0    12480000          0     0  50000
   sdif0              2        2        0    12480000          0     0  50000

clk_summary after:
sd0                   1        1        0    12480000          0     0  50000
   sdif0              1        1        0    12480000          0     0  50000

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Salvator-XS board with R-Car M3-N.

 drivers/mmc/host/renesas_sdhi_core.c |  7 +++----
 drivers/mmc/host/tmio_mmc_core.c     | 14 +++++++-------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index ff72b381a6b3..d581142634f8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -910,6 +910,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		goto efree;
 
 	ver = sd_ctrl_read16(host, CTL_VERSION);
+	renesas_sdhi_clk_disable(host);
+
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
 		mmc_data->max_blk_count = U16_MAX;
@@ -920,7 +922,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	ret = tmio_mmc_host_probe(host);
 	if (ret < 0)
-		goto edisclk;
+		goto efree;
 
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (of_data && of_data->scc_offset &&
@@ -985,8 +987,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 eirq:
 	tmio_mmc_host_remove(host);
-edisclk:
-	renesas_sdhi_clk_disable(host);
 efree:
 	tmio_mmc_host_free(host);
 
@@ -999,7 +999,6 @@ int renesas_sdhi_remove(struct platform_device *pdev)
 	struct tmio_mmc_host *host = platform_get_drvdata(pdev);
 
 	tmio_mmc_host_remove(host);
-	renesas_sdhi_clk_disable(host);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 9a4ae954553b..6968177dd1cd 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1116,6 +1116,13 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 
 	_host->set_pwr = pdata->set_pwr;
 
+	dev_pm_domain_start(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	ret = tmio_mmc_init_ocr(_host);
 	if (ret < 0)
 		return ret;
@@ -1192,13 +1199,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	/* See if we also get DMA */
 	tmio_mmc_request_dma(_host, pdata);
 
-	dev_pm_domain_start(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	ret = mmc_add_host(mmc);
 	if (ret)
 		goto remove_host;
-- 
2.20.1

