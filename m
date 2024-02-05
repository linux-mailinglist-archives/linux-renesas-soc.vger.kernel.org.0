Return-Path: <linux-renesas-soc+bounces-2333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D335D849FB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 17:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA23285339
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 16:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA32C4121B;
	Mon,  5 Feb 2024 16:43:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB364123F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Feb 2024 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707151419; cv=none; b=PrA3zYNEleudQFCTZzIomOCbH3YO30CEfENJx8vfLGwhXUV9GD76LAjOD78qhyMZomuk9Qq3MCnTYXQtknzrRgfI51R+7aht6uMxBQarHNGlvXv+6qfpnIZbxTjdaKHFfaPUIKVmBMjLOBpIzTo0dySwIj7gwfG6lrEPYpyUHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707151419; c=relaxed/simple;
	bh=LeDCKQro0T212yTX9dukrdEsUpHluX2JRx22LJrv1N8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dQ/N0fZqtrAltm9NiUEOVJ2/yB6fdn47JXqlhjSK7BIKqGHGpN9TkOLJ11Frei1fDqoGO9GX1wgce6nOBvVqWSVKsWQmsU+usD1VGJ8xsS/MEMsmTJeZqgplkZbK8W9ZBL3KAG7/znkf7w2LneIx1kEirmWrFnrLhcOrCX5NBjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07F401FB;
	Mon,  5 Feb 2024 08:44:19 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 621473F5A1;
	Mon,  5 Feb 2024 08:43:35 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Cc: will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] iommu/ipmmu-vmsa: Minor cleanups
Date: Mon,  5 Feb 2024 16:43:27 +0000
Message-Id: <791877b0d310dc2ab7dc616d2786ab24252b9b8e.1707151207.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the of_match_ptr() which was supposed to have gone long ago, but
managed to got lost in a fix-squashing mishap. On a similar theme, we
may as well also modernise the PM ops to get rid of the clunky #ifdefs,
and modernise the resource mapping to keep the checkpatch brigade happy.

Link: https://lore.kernel.org/linux-iommu/Yxni3d6CdI3FZ5D+@8bytes.org/
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/ipmmu-vmsa.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ace1fc4bd34b..90d3f03242db 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1005,7 +1005,6 @@ static const struct of_device_id ipmmu_of_ids[] = {
 static int ipmmu_probe(struct platform_device *pdev)
 {
 	struct ipmmu_vmsa_device *mmu;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -1025,8 +1024,7 @@ static int ipmmu_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Map I/O memory and request IRQ. */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mmu->base = devm_ioremap_resource(&pdev->dev, res);
+	mmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mmu->base))
 		return PTR_ERR(mmu->base);
 
@@ -1123,7 +1121,6 @@ static void ipmmu_remove(struct platform_device *pdev)
 	ipmmu_device_reset(mmu);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ipmmu_resume_noirq(struct device *dev)
 {
 	struct ipmmu_vmsa_device *mmu = dev_get_drvdata(dev);
@@ -1153,18 +1150,14 @@ static int ipmmu_resume_noirq(struct device *dev)
 }
 
 static const struct dev_pm_ops ipmmu_pm  = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, ipmmu_resume_noirq)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, ipmmu_resume_noirq)
 };
-#define DEV_PM_OPS	&ipmmu_pm
-#else
-#define DEV_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
 
 static struct platform_driver ipmmu_driver = {
 	.driver = {
 		.name = "ipmmu-vmsa",
-		.of_match_table = of_match_ptr(ipmmu_of_ids),
-		.pm = DEV_PM_OPS,
+		.of_match_table = ipmmu_of_ids,
+		.pm = pm_sleep_ptr(&ipmmu_pm),
 	},
 	.probe = ipmmu_probe,
 	.remove_new = ipmmu_remove,
-- 
2.39.2.101.g768bb238c484.dirty


