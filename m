Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2063A01E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 14:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfH1Mh3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 08:37:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:37304 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726339AbfH1Mh2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 08:37:28 -0400
X-IronPort-AV: E=Sophos;i="5.64,441,1559487600"; 
   d="scan'208";a="24934329"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2019 21:37:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B2C57400516A;
        Wed, 28 Aug 2019 21:37:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v10 1/4] dma: Introduce dma_get_merge_boundary()
Date:   Wed, 28 Aug 2019 21:35:40 +0900
Message-Id: <1566995743-5614-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566995743-5614-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1566995743-5614-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a new DMA API "dma_get_merge_boundary". This function
returns the DMA merge boundary if the DMA layer can merge the segments.
This patch also adds the implementation for a new dma_map_ops pointer.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/DMA-API.txt   |  8 ++++++++
 include/linux/dma-mapping.h |  6 ++++++
 kernel/dma/mapping.c        | 11 +++++++++++
 3 files changed, 25 insertions(+)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index e47c63b..9c4dd3d 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -204,6 +204,14 @@ Returns the maximum size of a mapping for the device. The size parameter
 of the mapping functions like dma_map_single(), dma_map_page() and
 others should not be larger than the returned value.
 
+::
+
+	unsigned long
+	dma_get_merge_boundary(struct device *dev);
+
+Returns the DMA merge boundary. If the device cannot merge any the DMA address
+segments, the function returns 0.
+
 Part Id - Streaming DMA mappings
 --------------------------------
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 14702e2..7072b78 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -131,6 +131,7 @@ struct dma_map_ops {
 	int (*dma_supported)(struct device *dev, u64 mask);
 	u64 (*get_required_mask)(struct device *dev);
 	size_t (*max_mapping_size)(struct device *dev);
+	unsigned long (*get_merge_boundary)(struct device *dev);
 };
 
 #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
@@ -462,6 +463,7 @@ int dma_set_mask(struct device *dev, u64 mask);
 int dma_set_coherent_mask(struct device *dev, u64 mask);
 u64 dma_get_required_mask(struct device *dev);
 size_t dma_max_mapping_size(struct device *dev);
+unsigned long dma_get_merge_boundary(struct device *dev);
 #else /* CONFIG_HAS_DMA */
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
@@ -567,6 +569,10 @@ static inline size_t dma_max_mapping_size(struct device *dev)
 {
 	return 0;
 }
+static inline unsigned long dma_get_merge_boundary(struct device *dev)
+{
+	return 0;
+}
 #endif /* CONFIG_HAS_DMA */
 
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index b0038ca..b3077b5 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -405,3 +405,14 @@ size_t dma_max_mapping_size(struct device *dev)
 	return size;
 }
 EXPORT_SYMBOL_GPL(dma_max_mapping_size);
+
+unsigned long dma_get_merge_boundary(struct device *dev)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (!ops || !ops->get_merge_boundary)
+		return 0;	/* can't merge */
+
+	return ops->get_merge_boundary(dev);
+}
+EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
-- 
2.7.4

