Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78C7DAE2B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2019 06:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfIJEDC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 00:03:02 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52951 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbfIJEDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 00:03:02 -0400
X-IronPort-AV: E=Sophos;i="5.64,487,1559487600"; 
   d="scan'208";a="25970041"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Sep 2019 13:02:59 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8F5D240078C4;
        Tue, 10 Sep 2019 13:02:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     treding@nvidia.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] mmc: queue: Fix bigger segments usage
Date:   Tue, 10 Sep 2019 13:02:58 +0900
Message-Id: <1568088179-16865-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568088179-16865-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1568088179-16865-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The commit 38c38cb73223 ("mmc: queue: use bigger segments if DMA MAP
layer can merge the segments") always enables the bugger segments
if DMA MAP layer can merge the segments, but some controllers (SDHCI)
have strictly limitation about the segments size, and then the commit
breaks on the controllers.

To fix the issue, this patch adds a new flag MMC_CAP2_MERGE_CAPABLE
into the struct mmc_host and the bigger segments usage is disabled
as default.

Reported-by: Thierry Reding <treding@nvidia.com>
Fixes: 38c38cb73223 ("mmc: queue: use bigger segments if DMA MAP layer can merge the segments")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/core/queue.c | 8 +++++++-
 include/linux/mmc/host.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index 1e29b30..9edc086 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -399,6 +399,11 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
 	init_waitqueue_head(&mq->wait);
 }
 
+static inline bool mmc_merge_capable(struct mmc_host *host)
+{
+	return host->caps2 & MMC_CAP2_MERGE_CAPABLE;
+}
+
 /* Set queue depth to get a reasonable value for q->nr_requests */
 #define MMC_QUEUE_DEPTH 64
 
@@ -441,7 +446,8 @@ int mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
 	 * the host->can_dma_map_merge should be set before to get max_segs
 	 * from mmc_get_max_segments().
 	 */
-	if (host->max_segs < MMC_DMA_MAP_MERGE_SEGMENTS &&
+	if (mmc_merge_capable(host) &&
+	    host->max_segs < MMC_DMA_MAP_MERGE_SEGMENTS &&
 	    dma_get_merge_boundary(mmc_dev(host)))
 		host->can_dma_map_merge = 1;
 	else
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index c5662b3..3becb28 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -367,6 +367,7 @@ struct mmc_host {
 #define MMC_CAP2_CQE		(1 << 23)	/* Has eMMC command queue engine */
 #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
 #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
+#define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
 
 	int			fixed_drv_type;	/* fixed driver type for non-removable media */
 
-- 
2.7.4

