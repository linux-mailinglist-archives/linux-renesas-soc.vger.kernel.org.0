Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7088B43C76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfFMPgM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:36:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24190 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727490AbfFMKUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:20:42 -0400
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; 
   d="scan'208";a="18589676"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jun 2019 19:20:38 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 02F704274BC5;
        Thu, 13 Jun 2019 19:20:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     hch@lst.de, iommu@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can merge the segments
Date:   Thu, 13 Jun 2019 19:20:15 +0900
Message-Id: <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If max_segs of a mmc host is smaller than BLK_MAX_SEGMENTS,
the mmc subsystem tries to use such bigger segments by using
IOMMU subsystem, and then the mmc subsystem exposes such information
to the block layer by using blk_queue_can_use_iommu_merging().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/core/queue.c | 33 +++++++++++++++++++++++++++++----
 include/linux/mmc/host.h |  1 +
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index b5b9c61..59d7606 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -196,6 +196,11 @@ static void mmc_queue_setup_discard(struct request_queue *q,
 		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
 }
 
+static unsigned int mmc_get_max_segments(struct mmc_host *host)
+{
+	return host->can_merge ? BLK_MAX_SEGMENTS : host->max_segs;
+}
+
 /**
  * mmc_init_request() - initialize the MMC-specific per-request data
  * @q: the request queue
@@ -209,7 +214,7 @@ static int __mmc_init_request(struct mmc_queue *mq, struct request *req,
 	struct mmc_card *card = mq->card;
 	struct mmc_host *host = card->host;
 
-	mq_rq->sg = mmc_alloc_sg(host->max_segs, gfp);
+	mq_rq->sg = mmc_alloc_sg(mmc_get_max_segments(host), gfp);
 	if (!mq_rq->sg)
 		return -ENOMEM;
 
@@ -368,15 +373,24 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
 	blk_queue_bounce_limit(mq->queue, limit);
 	blk_queue_max_hw_sectors(mq->queue,
 		min(host->max_blk_count, host->max_req_size / 512));
-	blk_queue_max_segments(mq->queue, host->max_segs);
+	/* blk_queue_can_use_iommu_merging() should succeed if can_merge = 1 */
+	if (host->can_merge &&
+	    !blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)))
+		WARN_ON(1);
+	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
 
 	if (mmc_card_mmc(card))
 		block_size = card->ext_csd.data_sector_size;
 
 	blk_queue_logical_block_size(mq->queue, block_size);
-	blk_queue_max_segment_size(mq->queue,
+	/*
+	 * After blk_queue_can_use_iommu_merging() was called with succeed,
+	 * since it calls blk_queue_virt_boundary for IOMMU, the mmc should
+	 * not call blk_queue_max_segment_size().
+	 */
+	if (!host->can_merge)
+		blk_queue_max_segment_size(mq->queue,
 			round_down(host->max_seg_size, block_size));
-
 	INIT_WORK(&mq->recovery_work, mmc_mq_recovery_handler);
 	INIT_WORK(&mq->complete_work, mmc_blk_mq_complete_work);
 
@@ -422,6 +436,17 @@ int mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
 	mq->tag_set.cmd_size = sizeof(struct mmc_queue_req);
 	mq->tag_set.driver_data = mq;
 
+	/*
+	 * Since blk_mq_alloc_tag_set() calls .init_request() of mmc_mq_ops,
+	 * the host->can_merge should be set before to get max_segs from
+	 * mmc_get_max_segments().
+	 */
+	if (host->max_segs < BLK_MAX_SEGMENTS &&
+	    device_iommu_mapped(mmc_dev(host)))
+		host->can_merge = 1;
+	else
+		host->can_merge = 0;
+
 	ret = blk_mq_alloc_tag_set(&mq->tag_set);
 	if (ret)
 		return ret;
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 43d0f0c..84b9bef 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -398,6 +398,7 @@ struct mmc_host {
 	unsigned int		retune_now:1;	/* do re-tuning at next req */
 	unsigned int		retune_paused:1; /* re-tuning is temporarily disabled */
 	unsigned int		use_blk_mq:1;	/* use blk-mq */
+	unsigned int		can_merge:1;	/* merging can be used */
 
 	int			rescan_disable;	/* disable card detection */
 	int			rescan_entered;	/* used with nonremovable devices */
-- 
2.7.4

