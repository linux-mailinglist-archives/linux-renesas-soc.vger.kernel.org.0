Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E094B0F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 06:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfFSE4B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 00:56:01 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:62281 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725892AbfFSE4B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 00:56:01 -0400
X-IronPort-AV: E=Sophos;i="5.62,391,1554735600"; 
   d="scan'208";a="19038381"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jun 2019 13:55:58 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3AFCD40065B7;
        Wed, 19 Jun 2019 13:55:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     hch@lst.de, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] mmc: tmio: Use dma_max_mapping_size() instead of a workaround
Date:   Wed, 19 Jun 2019 13:55:30 +0900
Message-Id: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
provides a helper function to get the max mapping size, we can use
the function instead of the workaround code for swiotlb.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 This patch is from other patch series [1]. Since this patch can be
 applied right now because this patch is independent with other subsystems
 on the patch series.

 [1]
 https://patchwork.kernel.org/patch/10992401/

 Changes from the [1] above:
 - Use size_t instead of "unsigned int" on min_t.
 - Remove #include directive of swiotlb.h.
 - Add Acked-by and Reviewed-by.

 drivers/mmc/host/tmio_mmc_core.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 83fd943..2cb3f95 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -26,6 +26,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/highmem.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -45,7 +46,6 @@
 #include <linux/scatterlist.h>
 #include <linux/sizes.h>
 #include <linux/spinlock.h>
-#include <linux/swiotlb.h>
 #include <linux/workqueue.h>
 
 #include "tmio_mmc.h"
@@ -1199,19 +1199,9 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	mmc->max_blk_size = TMIO_MAX_BLK_SIZE;
 	mmc->max_blk_count = pdata->max_blk_count ? :
 		(PAGE_SIZE / mmc->max_blk_size) * mmc->max_segs;
-	mmc->max_req_size = mmc->max_blk_size * mmc->max_blk_count;
-	/*
-	 * Since swiotlb has memory size limitation, this will calculate
-	 * the maximum size locally (because we don't have any APIs for it now)
-	 * and check the current max_req_size. And then, this will update
-	 * the max_req_size if needed as a workaround.
-	 */
-	if (swiotlb_max_segment()) {
-		unsigned int max_size = (1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
-
-		if (mmc->max_req_size > max_size)
-			mmc->max_req_size = max_size;
-	}
+	mmc->max_req_size = min_t(size_t,
+				  mmc->max_blk_size * mmc->max_blk_count,
+				  dma_max_mapping_size(&pdev->dev));
 	mmc->max_seg_size = mmc->max_req_size;
 
 	if (mmc_can_gpio_ro(mmc))
-- 
2.7.4

