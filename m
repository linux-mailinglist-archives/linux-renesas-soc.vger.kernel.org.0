Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A5843C80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731968AbfFMPgQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:36:16 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38042 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727380AbfFMKUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:20:40 -0400
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; 
   d="scan'208";a="18380805"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jun 2019 19:20:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D6284274BC4;
        Thu, 13 Jun 2019 19:20:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     hch@lst.de, iommu@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v6 1/5] iommu: add an exported function to get minimum page size for a domain
Date:   Thu, 13 Jun 2019 19:20:11 +0900
Message-Id: <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds an exported function to get minimum page size for
a domain. This patch also modifies similar codes on the iommu.c.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/iommu.c | 18 +++++++++++++++---
 include/linux/iommu.h |  1 +
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2a90638..7ed16af 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -280,6 +280,18 @@ iommu_insert_device_resv_regions(struct list_head *dev_resv_regions,
 	return ret;
 }
 
+/**
+ * iommu_get_minimum_page_size - get minimum page size for a domain
+ * @domain: the domain
+ *
+ * Allow iommu driver to get a minimum page size for a domain.
+ */
+unsigned long iommu_get_minimum_page_size(struct iommu_domain *domain)
+{
+	return 1UL << __ffs(domain->pgsize_bitmap);
+}
+EXPORT_SYMBOL_GPL(iommu_get_minimum_page_size);
+
 int iommu_get_group_resv_regions(struct iommu_group *group,
 				 struct list_head *head)
 {
@@ -558,7 +570,7 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group,
 
 	BUG_ON(!domain->pgsize_bitmap);
 
-	pg_size = 1UL << __ffs(domain->pgsize_bitmap);
+	pg_size = iommu_get_minimum_page_size(domain);
 	INIT_LIST_HEAD(&mappings);
 
 	iommu_get_resv_regions(dev, &mappings);
@@ -1595,7 +1607,7 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
 		return -EINVAL;
 
 	/* find out the minimum page size supported */
-	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
+	min_pagesz = iommu_get_minimum_page_size(domain);
 
 	/*
 	 * both the virtual address and the physical one, as well as
@@ -1655,7 +1667,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 		return 0;
 
 	/* find out the minimum page size supported */
-	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
+	min_pagesz = iommu_get_minimum_page_size(domain);
 
 	/*
 	 * The virtual address, as well as the size of the mapping, must be
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 91af22a..7e53b43 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -366,6 +366,7 @@ extern int iommu_request_dma_domain_for_dev(struct device *dev);
 extern struct iommu_resv_region *
 iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
 			enum iommu_resv_type type);
+extern unsigned long iommu_get_minimum_page_size(struct iommu_domain *domain);
 extern int iommu_get_group_resv_regions(struct iommu_group *group,
 					struct list_head *head);
 
-- 
2.7.4

