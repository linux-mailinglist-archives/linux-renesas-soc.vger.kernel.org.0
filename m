Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584CC43C7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfFMPgN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:36:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43359 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727487AbfFMKUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:20:42 -0400
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; 
   d="scan'208";a="18589673"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jun 2019 19:20:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E2A694274BC4;
        Thu, 13 Jun 2019 19:20:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     hch@lst.de, iommu@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead of a workaround
Date:   Thu, 13 Jun 2019 19:20:14 +0900
Message-Id: <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
provides a helper function to get the max mapping size, we can use
the function instead of the workaround code for swiotlb.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 130b91c..85bd6aa6 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -26,6 +26,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/highmem.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -1189,19 +1190,9 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
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
+	mmc->max_req_size = min_t(unsigned int,
+				  mmc->max_blk_size * mmc->max_blk_count,
+				  dma_max_mapping_size(&pdev->dev));
 	mmc->max_seg_size = mmc->max_req_size;
 
 	if (mmc_can_gpio_ro(mmc))
-- 
2.7.4

