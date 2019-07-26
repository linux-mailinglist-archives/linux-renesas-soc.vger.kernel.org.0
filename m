Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00D2760D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2019 10:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfGZIc1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jul 2019 04:32:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:7114 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726552AbfGZIc1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jul 2019 04:32:27 -0400
X-IronPort-AV: E=Sophos;i="5.64,310,1559487600"; 
   d="scan'208";a="22285519"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jul 2019 17:32:23 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C6D654202743;
        Fri, 26 Jul 2019 17:32:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v9 5/5] mmc: queue: Use bigger segments if DMA MAP layer can merge the segments
Date:   Fri, 26 Jul 2019 17:31:16 +0900
Message-Id: <1564129876-28261-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the max_segs of a mmc host is smaller than 512, the mmc
subsystem tries to use 512 segments if DMA MAP layer can merge
the segments, and then the mmc subsystem exposes such information
to the block layer by using blk_queue_can_use_dma_map_merging().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/mmc/core/queue.c | 35 ++++++++++++++++++++++++++++++++---
 include/linux/mmc/host.h |  1 +
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index 7102e2e..25568dc 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -21,6 +21,8 @@
 #include "card.h"
 #include "host.h"
 
+#define MMC_DMA_MAP_MERGE_SEGMENTS	512
+
 static inline bool mmc_cqe_dcmd_busy(struct mmc_queue *mq)
 {
 	/* Allow only 1 DCMD at a time */
@@ -193,6 +195,12 @@ static void mmc_queue_setup_discard(struct request_queue *q,
 		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
 }
 
+static unsigned int mmc_get_max_segments(struct mmc_host *host)
+{
+	return host->can_dma_map_merge ? MMC_DMA_MAP_MERGE_SEGMENTS :
+					 host->max_segs;
+}
+
 /**
  * mmc_init_request() - initialize the MMC-specific per-request data
  * @q: the request queue
@@ -206,7 +214,7 @@ static int __mmc_init_request(struct mmc_queue *mq, struct request *req,
 	struct mmc_card *card = mq->card;
 	struct mmc_host *host = card->host;
 
-	mq_rq->sg = mmc_alloc_sg(host->max_segs, gfp);
+	mq_rq->sg = mmc_alloc_sg(mmc_get_max_segments(host), gfp);
 	if (!mq_rq->sg)
 		return -ENOMEM;
 
@@ -362,13 +370,23 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
 		blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
 	blk_queue_max_hw_sectors(mq->queue,
 		min(host->max_blk_count, host->max_req_size / 512));
-	blk_queue_max_segments(mq->queue, host->max_segs);
+	if (host->can_dma_map_merge)
+		WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
+							mmc_dev(host)),
+		     "merging was advertised but not possible");
+	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
 
 	if (mmc_card_mmc(card))
 		block_size = card->ext_csd.data_sector_size;
 
 	blk_queue_logical_block_size(mq->queue, block_size);
-	blk_queue_max_segment_size(mq->queue,
+	/*
+	 * After blk_queue_can_use_dma_map_merging() was called with succeed,
+	 * since it calls blk_queue_virt_boundary(), the mmc should not call
+	 * both blk_queue_max_segment_size().
+	 */
+	if (host->can_dma_map_merge)
+		blk_queue_max_segment_size(mq->queue,
 			round_down(host->max_seg_size, block_size));
 
 	dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
@@ -418,6 +436,17 @@ int mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
 	mq->tag_set.cmd_size = sizeof(struct mmc_queue_req);
 	mq->tag_set.driver_data = mq;
 
+	/*
+	 * Since blk_mq_alloc_tag_set() calls .init_request() of mmc_mq_ops,
+	 * the host->can_dma_map_merge should be set before to get max_segs
+	 * from mmc_get_max_segments().
+	 */
+	if (host->max_segs < MMC_DMA_MAP_MERGE_SEGMENTS &&
+	    dma_get_merge_boundary(mmc_dev(host)))
+		host->can_dma_map_merge = 1;
+	else
+		host->can_dma_map_merge = 0;
+
 	ret = blk_mq_alloc_tag_set(&mq->tag_set);
 	if (ret)
 		return ret;
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 4a351cb..c5662b3 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -396,6 +396,7 @@ struct mmc_host {
 	unsigned int		retune_paused:1; /* re-tuning is temporarily disabled */
 	unsigned int		use_blk_mq:1;	/* use blk-mq */
 	unsigned int		retune_crc_disable:1; /* don't trigger retune upon crc */
+	unsigned int		can_dma_map_merge:1; /* merging can be used */
 
 	int			rescan_disable;	/* disable card detection */
 	int			rescan_entered;	/* used with nonremovable devices */
-- 
2.7.4

