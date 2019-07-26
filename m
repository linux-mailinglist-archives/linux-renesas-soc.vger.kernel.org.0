Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03657760DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2019 10:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfGZIca (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jul 2019 04:32:30 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:41239 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725842AbfGZIc3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jul 2019 04:32:29 -0400
X-IronPort-AV: E=Sophos;i="5.64,310,1559487600"; 
   d="scan'208";a="22504208"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jul 2019 17:32:23 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AF5FD42017BC;
        Fri, 26 Jul 2019 17:32:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v9 4/5] block: add a helper function to merge the segments
Date:   Fri, 26 Jul 2019 17:31:15 +0900
Message-Id: <1564129876-28261-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a helper function whether a queue can merge
the segments by the DMA MAP layer (e.g. via IOMMU).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
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
index 1ef375d..f6d55e2 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1085,6 +1085,8 @@ extern void blk_queue_dma_alignment(struct request_queue *, int);
 extern void blk_queue_update_dma_alignment(struct request_queue *, int);
 extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
 extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
+extern bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
+					      struct device *dev);
 
 /*
  * Number of physical segments as sent to the device.
-- 
2.7.4

