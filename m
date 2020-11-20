Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA582BABD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Nov 2020 15:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgKTO0k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Nov 2020 09:26:40 -0500
Received: from www.zeus03.de ([194.117.254.33]:60820 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727120AbgKTO0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 09:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=US1jiov3Q39Q8O
        HNdgriM3I4d/ngv0XuinAIEULvBe8=; b=n1+nT41MD2foJjd1ElAgJvOeRXuOwL
        eShCZx4YCHUmEPcGZfFtPVyWGsdrmjpO81+4VPKpV+BNTE2FqzIouKx8fZI2cjci
        GS6Ux8Y1GTq8dztmEFM57l7suzRGRVWsbGvSd84aF0tgcHhFoF4Fv5kxF4pk7gwF
        D9ThZf/blicLM=
Received: (qmail 1510322 invoked from network); 20 Nov 2020 15:26:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2020 15:26:37 +0100
X-UD-Smtp-Session: l3s3148p1@nx/WoYq0utwgAwDPXwi7AEBAgYxIRHZX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 3/3] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Date:   Fri, 20 Nov 2020 15:26:29 +0100
Message-Id: <20201120142629.98222-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
References: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that we got the timeout handling in the driver correct, we can use
this capability to avoid polling via the MMC core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index fe13e1ea22dc..d8b811c46628 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -88,7 +88,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 
 static const struct renesas_sdhi_of_data of_rza2_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY,
+			  TMIO_MMC_HAVE_CBSY | MMC_CAP_WAIT_WHILE_BUSY,
 	.tmio_ocr_mask	= MMC_VDD_32_33,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23,
@@ -105,7 +105,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
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
2.28.0

