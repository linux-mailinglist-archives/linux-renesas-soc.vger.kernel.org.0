Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D8735B08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 13:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfFELQ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 07:16:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:37256 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727198AbfFELQ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 07:16:56 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17883871"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2019 20:16:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E305441BD761;
        Wed,  5 Jun 2019 20:16:52 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        joro@8bytes.org
Cc:     linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Date:   Wed,  5 Jun 2019 20:11:49 +0900
Message-Id: <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a new capable IOMMU_CAP_MERGING to check whether
the IOVA would be contiguous strictly if a device requires and
the IOMMU driver has the capable.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/dma-iommu.c | 26 ++++++++++++++++++++++++--
 include/linux/iommu.h     |  1 +
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 034caae..ecf1a04 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -847,11 +847,16 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t iova;
 	size_t iova_len = 0;
 	unsigned long mask = dma_get_seg_boundary(dev);
-	int i;
+	int i, ret;
+	bool iova_contiguous = false;
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
 
+	if (dma_get_iova_contiguous(dev) &&
+	    iommu_capable(dev->bus, IOMMU_CAP_MERGING))
+		iova_contiguous = true;
+
 	/*
 	 * Work out how much IOVA space we need, and align the segments to
 	 * IOVA granules for the IOMMU driver to handle. With some clever
@@ -867,6 +872,13 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		sg_dma_len(s) = s_length;
 		s->offset -= s_iova_off;
 		s_length = iova_align(iovad, s_length + s_iova_off);
+		/*
+		 * Check whether the IOVA would be contiguous strictly if
+		 * a device requires and the IOMMU driver has the capable.
+		 */
+		if (iova_contiguous && i > 0 &&
+		    (s_iova_off || s->length != s_length))
+			return 0;
 		s->length = s_length;
 
 		/*
@@ -902,8 +914,18 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
 		goto out_free_iova;
 
-	return __finalise_sg(dev, sg, nents, iova);
+	ret = __finalise_sg(dev, sg, nents, iova);
+	/*
+	 * Check whether the sg entry is single if a device requires and
+	 * the IOMMU driver has the capable.
+	 */
+	if (iova_contiguous && ret != 1)
+		goto out_unmap_sg;
+
+	return ret;
 
+out_unmap_sg:
+	iommu_dma_unmap_sg(dev, sg, nents, dir, attrs);
 out_free_iova:
 	iommu_dma_free_iova(cookie, iova, iova_len);
 out_restore_sg:
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 91af22a..f971dd3 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -104,6 +104,7 @@ enum iommu_cap {
 					   transactions */
 	IOMMU_CAP_INTR_REMAP,		/* IOMMU supports interrupt isolation */
 	IOMMU_CAP_NOEXEC,		/* IOMMU_NOEXEC flag */
+	IOMMU_CAP_MERGING,		/* IOMMU supports segments merging */
 };
 
 /*
-- 
2.7.4

