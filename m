Return-Path: <linux-renesas-soc+bounces-14694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FAA6A90D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9364E1887787
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 14:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEE319DF98;
	Thu, 20 Mar 2025 14:41:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC9D1A5B97
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742481698; cv=none; b=fwMaCMj4OUBvSkDlLVysOPrbR2C/xD/gDJn6VV3f2HXZmZiUttQV+y8iMwCRX8uJYlZJmzrQiTuyh8TE3VhoFRdCz2C3ZQZt1zwW0+8CaxJbtRHvv22JnnVNQkZSkqTLaoYX4NEDad1arF4kdoyk6pC2C0EeAePfElcm6hvsO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742481698; c=relaxed/simple;
	bh=XX7x03shqTK9RikU1K18ymzGeQc0SsbcFLMKCng8MqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B8eUwkXS85RdL5Dhw4tvZiWuq2kHkw03CFm+s6g7Lugjf2SUtZzXb7nZyMQVEU16N/1GT69RTaD1vOy8F6Zj7W6YCa2/QdoTnCYc/U/TbdZDQYKLtcFmKigXD9cJhwIhd8H5ZTx9J6T9JyhH58L17sCU+06O1XE/3H/cpi2lKdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1C631063;
	Thu, 20 Mar 2025 07:41:43 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 535EE3F63F;
	Thu, 20 Mar 2025 07:41:35 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] iommu/ipmmu-vmsa: Register in a sensible order
Date: Thu, 20 Mar 2025 14:41:27 +0000
Message-Id: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPMMU registers almost-initialised instances, but misses assigning the
drvdata to make them fully functional, so initial calls back into
ipmmu_probe_device() are likely to fail unnecessarily. Reorder this to
work as it should, also pruning the long-out-of-date comment and adding
the missing sysfs cleanup on error for good measure.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/ipmmu-vmsa.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 074daf1aac4e..e424b279a8cd 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1081,31 +1081,24 @@ static int ipmmu_probe(struct platform_device *pdev)
 		}
 	}
 
+	platform_set_drvdata(pdev, mmu);
 	/*
 	 * Register the IPMMU to the IOMMU subsystem in the following cases:
 	 * - R-Car Gen2 IPMMU (all devices registered)
 	 * - R-Car Gen3 IPMMU (leaf devices only - skip root IPMMU-MM device)
 	 */
-	if (!mmu->features->has_cache_leaf_nodes || !ipmmu_is_root(mmu)) {
-		ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL,
-					     dev_name(&pdev->dev));
-		if (ret)
-			return ret;
+	if (mmu->features->has_cache_leaf_nodes && ipmmu_is_root(mmu))
+		return 0;
 
-		ret = iommu_device_register(&mmu->iommu, &ipmmu_ops, &pdev->dev);
-		if (ret)
-			return ret;
-	}
+	ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
+	if (ret)
+		return ret;
 
-	/*
-	 * We can't create the ARM mapping here as it requires the bus to have
-	 * an IOMMU, which only happens when bus_set_iommu() is called in
-	 * ipmmu_init() after the probe function returns.
-	 */
+	ret = iommu_device_register(&mmu->iommu, &ipmmu_ops, &pdev->dev);
+	if (ret)
+		iommu_device_sysfs_remove(&mmu->iommu);
 
-	platform_set_drvdata(pdev, mmu);
-
-	return 0;
+	return ret;
 }
 
 static void ipmmu_remove(struct platform_device *pdev)
-- 
2.39.2.101.g768bb238c484.dirty


