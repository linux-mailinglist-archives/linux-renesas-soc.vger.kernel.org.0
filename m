Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FD63584CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 15:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbhDHNel (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 09:34:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:60414 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231566AbhDHNek (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 09:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=qsUM8aHVC6jMIaBfNvZ4978IO4A
        5cA/CP2ef/UoBhQs=; b=oCQzl+zVa3SDuyDmhtFu1mawlePUFRmMoCcyKzPgsvy
        SWBVYLQ2qoDrX8dI/BbH+q/GmTkIwp+hD8J9FGjtxs1eHeaDtfiM3TG9c1Eaw1p7
        8X23X69c0ZaTTWGgjAcKX2Mobw1sHRqfMHAlHtOcCx3cNaYpzlwYKhc+NDDkPvto
        =
Received: (qmail 3410878 invoked from network); 8 Apr 2021 15:34:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2021 15:34:28 +0200
X-UD-Smtp-Session: l3s3148p1@oqQTG3a//OMgARa4RezXAVMsXvUl9i/q
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Date:   Thu,  8 Apr 2021 15:34:20 +0200
Message-Id: <20210408133420.2900-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that we got the timeout handling in the driver correct, we can use
this capability to avoid polling via the MMC core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I had this patch applied while developing all the other patches for
TMIO/SDHI for 5.13 and had no regressions. Further testing is
appreciated, but I am optimistic that we can enable this finally.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index ff97f15e317c..47c795e79c21 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -94,7 +94,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 
 static const struct renesas_sdhi_of_data of_rza2_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY,
+			  TMIO_MMC_HAVE_CBSY | MMC_CAP_WAIT_WHILE_BUSY,
 	.tmio_ocr_mask	= MMC_VDD_32_33,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23,
@@ -111,7 +111,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
-			  MMC_CAP_CMD23,
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
 	.bus_shift	= 2,
 	.scc_offset	= 0x1000,
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index c5f789675302..0a3494fcc5e8 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -31,13 +31,14 @@ static const struct renesas_sdhi_of_data of_default_cfg = {
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_32BIT_DATA_PORT |
-			  TMIO_MMC_HAVE_CBSY,
+			  TMIO_MMC_HAVE_CBSY | MMC_CAP_WAIT_WHILE_BUSY,
 	.tmio_ocr_mask	= MMC_VDD_32_33,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
-	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL,
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 };
@@ -58,7 +59,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
-			  MMC_CAP_CMD23,
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_4_BYTES,
 	.dma_rx_offset	= 0x2000,
-- 
2.30.0

