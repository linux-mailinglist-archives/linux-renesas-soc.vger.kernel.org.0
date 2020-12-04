Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751192CEEB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 14:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgLDNSK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 08:18:10 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:13000 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726432AbgLDNSK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 08:18:10 -0500
X-IronPort-AV: E=Sophos;i="5.78,392,1599490800"; 
   d="scan'208";a="64663411"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Dec 2020 22:17:38 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4BF2F433803C;
        Fri,  4 Dec 2020 22:17:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and post_req support
Date:   Fri,  4 Dec 2020 22:17:33 +0900
Message-Id: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pre_req and post_req support to improve performance.

Inspired by a patch in the BSP by Masaharu Hayakawa.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 When I applied this patch, read performance on R-Car H3 with HS400 mode
 was greatly improved:
 - without the patch : about 200MB/sec
 - with the patch :    about 250MB/sec

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 88 ++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index d8b811c..ce3c447 100644
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
@@ -172,6 +178,47 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host) {
 	tasklet_schedule(&priv->dma_priv.dma_complete);
 }
 
+/* Should not use host->sg_ptr/sg_len in the following function */
+static void
+renesas_sdhi_internal_dmac_unmap(struct tmio_mmc_host *host,
+				 struct mmc_data *data,
+				 enum renesas_sdhi_dma_cookie cookie,
+				 bool expected_unmatch)
+{
+	bool unmap = expected_unmatch ? (data->host_cookie != cookie) :
+					(data->host_cookie == cookie);
+
+	if (unmap) {
+		dma_unmap_sg(&host->pdev->dev, data->sg, data->sg_len,
+			     mmc_get_dma_dir(data));
+		data->host_cookie = COOKIE_UNMAPPED;
+	}
+}
+
+/* Should not use host->sg_ptr/sg_len in the following function */
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
+	/* This DMAC cannot handle if buffer is not 8-bytes alignment */
+	if (!IS_ALIGNED(sg_dma_address(data->sg), 8)) {
+		renesas_sdhi_internal_dmac_unmap(host, data, cookie, false);
+		return false;
+	}
+
+	return true;
+}
+
 static void
 renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 				     struct mmc_data *data)
@@ -182,14 +229,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	if (!test_bit(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY, &global_flags))
 		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
-	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
-			mmc_get_dma_dir(data)))
+	if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
 		goto force_pio;
 
-	/* This DMAC cannot handle if buffer is not 8-bytes alignment */
-	if (!IS_ALIGNED(sg_dma_address(sg), 8))
-		goto force_pio_with_unmap;
-
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
 		if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
@@ -212,7 +254,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	return;
 
 force_pio_with_unmap:
-	dma_unmap_sg(&host->pdev->dev, sg, host->sg_len, mmc_get_dma_dir(data));
+	renesas_sdhi_internal_dmac_unmap(host, data, COOKIE_UNMAPPED, true);
 
 force_pio:
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
@@ -245,7 +287,7 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
 		dir = DMA_TO_DEVICE;
 
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
-	dma_unmap_sg(&host->pdev->dev, host->sg_ptr, host->sg_len, dir);
+	renesas_sdhi_internal_dmac_unmap(host, host->data, COOKIE_MAPPED, false);
 
 	if (dir == DMA_FROM_DEVICE)
 		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
@@ -274,6 +316,32 @@ static void renesas_sdhi_internal_dmac_end_dma(struct tmio_mmc_host *host)
 		renesas_sdhi_internal_dmac_complete(host);
 }
 
+static void renesas_sdhi_internal_dmac_post_req(struct mmc_host *mmc,
+						struct mmc_request *req,
+						int err)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct mmc_data *data = req->data;
+
+	if (!data)
+		return;
+
+	renesas_sdhi_internal_dmac_unmap(host, data, COOKIE_UNMAPPED, true);
+}
+
+static void renesas_sdhi_internal_dmac_pre_req(struct mmc_host *mmc,
+					       struct mmc_request *req)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct mmc_data *data = req->data;
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
@@ -295,6 +363,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
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

