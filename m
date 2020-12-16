Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D814B2DBEA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 11:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgLPKaL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 05:30:11 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62267 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726177AbgLPKaL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 05:30:11 -0500
X-IronPort-AV: E=Sophos;i="5.78,424,1599490800"; 
   d="scan'208";a="65954222"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2020 19:29:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 510F242C8FD5;
        Wed, 16 Dec 2020 19:29:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] mmc: renesas_internal_dmac: add pre_req and post_req support
Date:   Wed, 16 Dec 2020 19:29:32 +0900
Message-Id: <1608114572-1892-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pre_req and post_req support to improve performance.

Inspired by a patch in the BSP by Masaharu Hayakawa.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 91 ++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index f3e76d6..ff97f15 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -56,6 +56,12 @@
 #define INFO2_DTRANERR1		BIT(17)
 #define INFO2_DTRANERR0		BIT(16)
 
+enum renesas_sdhi_dma_cookie {
+	COOKIE_UNMAPPED,
+	COOKIE_PRE_MAPPED,
+	COOKIE_MAPPED,
+};
+
 /*
  * Specification of this driver:
  * - host->chan_{rx,tx} will be used as a flag of enabling/disabling the dma
@@ -172,6 +178,50 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host) {
 	tasklet_schedule(&priv->dma_priv.dma_complete);
 }
 
+/*
+ * renesas_sdhi_internal_dmac_map() will be called with two difference
+ * sg pointers in two mmc_data by .pre_req(), but tmio host can have a single
+ * sg_ptr only. So, renesas_sdhi_internal_dmac_{un}map() should use a sg
+ * pointer in a mmc_data instead of host->sg_ptr.
+ */
+static void
+renesas_sdhi_internal_dmac_unmap(struct tmio_mmc_host *host,
+				 struct mmc_data *data,
+				 enum renesas_sdhi_dma_cookie cookie)
+{
+	bool unmap = cookie == COOKIE_UNMAPPED ? (data->host_cookie != cookie) :
+						 (data->host_cookie == cookie);
+
+	if (unmap) {
+		dma_unmap_sg(&host->pdev->dev, data->sg, data->sg_len,
+			     mmc_get_dma_dir(data));
+		data->host_cookie = COOKIE_UNMAPPED;
+	}
+}
+
+static bool
+renesas_sdhi_internal_dmac_map(struct tmio_mmc_host *host,
+			       struct mmc_data *data,
+			       enum renesas_sdhi_dma_cookie cookie)
+{
+	if (data->host_cookie == COOKIE_PRE_MAPPED)
+		return true;
+
+	if (!dma_map_sg(&host->pdev->dev, data->sg, data->sg_len,
+			    mmc_get_dma_dir(data)))
+		return false;
+
+	data->host_cookie = cookie;
+
+	/* This DMAC cannot handle if buffer is not 128-bytes alignment */
+	if (!IS_ALIGNED(sg_dma_address(data->sg), 128)) {
+		renesas_sdhi_internal_dmac_unmap(host, data, cookie);
+		return false;
+	}
+
+	return true;
+}
+
 static void
 renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 				     struct mmc_data *data)
@@ -182,14 +232,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	if (!test_bit(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY, &global_flags))
 		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
-	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
-			mmc_get_dma_dir(data)))
+	if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
 		goto force_pio;
 
-	/* This DMAC cannot handle if buffer is not 128-bytes alignment */
-	if (!IS_ALIGNED(sg_dma_address(sg), 128))
-		goto force_pio_with_unmap;
-
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
 		if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
@@ -212,7 +257,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	return;
 
 force_pio_with_unmap:
-	dma_unmap_sg(&host->pdev->dev, sg, host->sg_len, mmc_get_dma_dir(data));
+	renesas_sdhi_internal_dmac_unmap(host, data, COOKIE_UNMAPPED);
 
 force_pio:
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
@@ -245,7 +290,7 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
 		dir = DMA_TO_DEVICE;
 
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
-	dma_unmap_sg(&host->pdev->dev, host->sg_ptr, host->sg_len, dir);
+	renesas_sdhi_internal_dmac_unmap(host, host->data, COOKIE_MAPPED);
 
 	if (dir == DMA_FROM_DEVICE)
 		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
@@ -274,6 +319,32 @@ static void renesas_sdhi_internal_dmac_end_dma(struct tmio_mmc_host *host)
 		renesas_sdhi_internal_dmac_complete(host);
 }
 
+static void renesas_sdhi_internal_dmac_post_req(struct mmc_host *mmc,
+						struct mmc_request *mrq,
+						int err)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct mmc_data *data = mrq->data;
+
+	if (!data)
+		return;
+
+	renesas_sdhi_internal_dmac_unmap(host, data, COOKIE_UNMAPPED);
+}
+
+static void renesas_sdhi_internal_dmac_pre_req(struct mmc_host *mmc,
+					       struct mmc_request *mrq)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct mmc_data *data = mrq->data;
+
+	if (!data)
+		return;
+
+	data->host_cookie = COOKIE_UNMAPPED;
+	renesas_sdhi_internal_dmac_map(host, data, COOKIE_PRE_MAPPED);
+}
+
 static void
 renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 				       struct tmio_mmc_data *pdata)
@@ -295,6 +366,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 	tasklet_init(&host->dma_issue,
 		     renesas_sdhi_internal_dmac_issue_tasklet_fn,
 		     (unsigned long)host);
+
+	/* Add pre_req and post_req */
+	host->ops.pre_req = renesas_sdhi_internal_dmac_pre_req;
+	host->ops.post_req = renesas_sdhi_internal_dmac_post_req;
 }
 
 static void
-- 
2.7.4

