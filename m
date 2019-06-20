Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3294C9CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 10:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfFTIup (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 04:50:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:61840 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725925AbfFTIuo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 04:50:44 -0400
X-IronPort-AV: E=Sophos;i="5.62,396,1554735600"; 
   d="scan'208";a="19173850"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jun 2019 17:50:40 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CBCB14007522;
        Thu, 20 Jun 2019 17:50:40 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v7 4/5] block: add a helper function to merge the segments
Date:   Thu, 20 Jun 2019 17:50:09 +0900
Message-Id: <1561020610-953-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a helper function whether a queue can merge
the segments by the DMA MAP layer (e.g. via IOMMU).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 block/blk-settings.c   | 22 ++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 45f2c52..6a78ea0 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -4,6 +4,7 @@
  */
 #include <linux/bio.h>
 #include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
 #include <linux/gcd.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
@@ -831,6 +832,27 @@ void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
 }
 EXPORT_SYMBOL_GPL(blk_queue_write_cache);
 
+/**
+ * blk_queue_can_use_dma_map_merging - configure queue for merging segments.
+ * @q:		the request queue for the device
+ * @dev:	the device pointer for dma
+ *
+ * Tell the block layer about merging the segments by dma map of @q.
+ */
+bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
+				       struct device *dev)
+{
+	unsigned long boundary = dma_get_merge_boundary(dev);
+
+	if (!boundary)
+		return false;
+
+	/* No need to update max_segment_size. see blk_queue_virt_boundary() */
+	blk_queue_virt_boundary(q, boundary);
+
+	return true;
+}
+
 static int __init blk_settings_init(void)
 {
 	blk_max_low_pfn = max_low_pfn - 1;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 592669b..a7a839d 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1091,6 +1091,8 @@ extern void blk_queue_dma_alignment(struct request_queue *, int);
 extern void blk_queue_update_dma_alignment(struct request_queue *, int);
 extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
 extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
+extern bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
+					      struct device *dev);
 
 /*
  * Number of physical segments as sent to the device.
-- 
2.7.4

