Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F16435AFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 13:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfFELQz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 07:16:55 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:37256 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727315AbfFELQy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 07:16:54 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17883868"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2019 20:16:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A1E9C41BD76A;
        Wed,  5 Jun 2019 20:16:52 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        joro@8bytes.org
Cc:     linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v5 1/8] dma-mapping: add a device driver helper for iova contiguous
Date:   Wed,  5 Jun 2019 20:11:47 +0900
Message-Id: <1559733114-4221-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This API can set a flag whether a device requires iova contiguous
strictly.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/linux/device.h      |  1 +
 include/linux/dma-mapping.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index e85264f..a33d611 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -752,6 +752,7 @@ struct device_dma_parameters {
 	 */
 	unsigned int max_segment_size;
 	unsigned long segment_boundary_mask;
+	bool iova_contiguous;
 };
 
 /**
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 6309a72..cdb4e75 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -729,6 +729,22 @@ static inline int dma_set_seg_boundary(struct device *dev, unsigned long mask)
 	return -EIO;
 }
 
+static inline int dma_get_iova_contiguous(struct device *dev)
+{
+	if (dev->dma_parms)
+		return dev->dma_parms->iova_contiguous;
+	return false;
+}
+
+static inline int dma_set_iova_contiguous(struct device *dev, bool contiguous)
+{
+	if (dev->dma_parms) {
+		dev->dma_parms->iova_contiguous = contiguous;
+		return 0;
+	}
+	return -EIO;
+}
+
 #ifndef dma_max_pfn
 static inline unsigned long dma_max_pfn(struct device *dev)
 {
-- 
2.7.4

