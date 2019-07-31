Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3657C863
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729410AbfGaQRv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 12:17:51 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:30039 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfGaQRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 12:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564589868;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Mbr13au7Bfs6hyrvcRpJ6tBGO2CuHoO+AS8RtGSO9/8=;
        b=ADkLTpvtQ+E/2IAY7Fls6XP7OFf6VWxSMTAf+CsIccRxX8PZYXZ7OC8P8ME1qINaQZ
        yQb+WCkG9rowLf0u8I+8UKK0X0AJq9jts52iSESvchTv5+Wv36fcc1B1Kgx6InLWxifG
        KKZveUCo7c5vHtk6Dsx3BOZGSJvoaLMQEByTQXFXKjGJmeMA5S9V7+r0w5c9ds4mkK87
        VWTYfFNcLeAR6OhwdYYT0yNVGORTpzG1jNzT3MBwebJ1fogZRZD4t/THc8zG0Pvxv1iN
        PYntJtLNBwXvl29vSx3llEZmp57QPPmxGa0IpfcLUaes4l2VFoGD6R5l2zl3fyR9vsUP
        sbUQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dZd6zDDg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id h0a328v6VGHgaNZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 18:17:42 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc:     niklas.soderlund@ragnatech.se, wsa@the-dreams.de,
        yamada.masahiro@socionext.com, geert@linux-m68k.org,
        ulf.hansson@linaro.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 1/2] mmc: tmio: leave clock handling to runtime PM if enabled
Date:   Wed, 31 Jul 2019 18:17:36 +0200
Message-Id: <1564589857-17720-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
References: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This fixes a clock imbalance that occurs on Renesas systems because the SD
clock is handled by both runtime PM and the hardware driver. After a
suspend/resume cycle both enable the same clock, resulting in an enable
count of 2 even if the clock is only used by one device.

See https://www.spinics.net/lists/linux-mmc/msg44431.html for details.

This patch removes the clock handling from the driver's runtime PM
callbacks and turns the clock off after probing if the device has a power
domain attached.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 31ffcc3..733ff96 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1260,9 +1260,14 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	/* See if we also get DMA */
 	tmio_mmc_request_dma(_host, pdata);
 
-	pm_runtime_set_active(&pdev->dev);
+#ifdef CONFIG_PM
+	/* PM handles the clock; disable it so it won't be enabled twice. */
+	if (_host->clk_disable && pdev->dev.pm_domain)
+		_host->clk_disable(_host);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
 	pm_runtime_use_autosuspend(&pdev->dev);
+#endif
 
 	ret = mmc_add_host(mmc);
 	if (ret)
@@ -1325,7 +1330,8 @@ int tmio_mmc_host_runtime_suspend(struct device *dev)
 	if (host->clk_cache)
 		host->set_clock(host, 0);
 
-	tmio_mmc_clk_disable(host);
+	if (!dev->pm_domain)
+		tmio_mmc_clk_disable(host);
 
 	return 0;
 }
@@ -1340,7 +1346,9 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
-	tmio_mmc_clk_enable(host);
+	if (!dev->pm_domain)
+		tmio_mmc_clk_enable(host);
+
 	tmio_mmc_hw_reset(host->mmc);
 
 	if (host->clk_cache)
-- 
2.7.4

