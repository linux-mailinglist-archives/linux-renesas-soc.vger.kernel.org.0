Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7777E2B391
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 13:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfE0LxD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 07:53:03 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:35122 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfE0LxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 07:53:02 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id HPsy2000X3XaVaC01PsyfY; Mon, 27 May 2019 13:52:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEBW-0001OH-Il; Mon, 27 May 2019 13:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEBW-0000bB-HV; Mon, 27 May 2019 13:52:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 6/6] iommu/ipmmu-vmsa: Add suspend/resume support
Date:   Mon, 27 May 2019 13:52:53 +0200
Message-Id: <20190527115253.2114-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527115253.2114-1-geert+renesas@glider.be>
References: <20190527115253.2114-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

During PSCI system suspend, R-Car Gen3 SoCs are powered down, and all
IPMMU state is lost.  Hence after s2ram, devices wired behind an IPMMU,
and configured to use it, will see their DMA operations hang.

To fix this, restore all IPMMU contexts, and re-enable all active
micro-TLBs during system resume.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
This patch takes a different approach than the BSP, which implements a
bulk save/restore of all registers during system suspend/resume.

v4:
  - Add Reviewed-by, Tested-by,

v3:
  - No changes,

v2:
  - Drop PSCI checks.
---
 drivers/iommu/ipmmu-vmsa.c | 47 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 56e84bcc9532e1ce..408ad0b2591925e0 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -36,7 +36,10 @@
 #define arm_iommu_detach_device(...)	do {} while (0)
 #endif
 
-#define IPMMU_CTX_MAX 8U
+#define IPMMU_CTX_MAX		8U
+#define IPMMU_CTX_INVALID	-1
+
+#define IPMMU_UTLB_MAX		48U
 
 struct ipmmu_features {
 	bool use_ns_alias_offset;
@@ -58,6 +61,7 @@ struct ipmmu_vmsa_device {
 	spinlock_t lock;			/* Protects ctx and domains[] */
 	DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
 	struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
+	s8 utlb_ctx[IPMMU_UTLB_MAX];
 
 	struct iommu_group *group;
 	struct dma_iommu_mapping *mapping;
@@ -335,6 +339,7 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	ipmmu_write(mmu, IMUCTR(utlb),
 		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
 		    IMUCTR_MMUEN);
+	mmu->utlb_ctx[utlb] = domain->context_id;
 }
 
 /*
@@ -346,6 +351,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
 
 	ipmmu_write(mmu, IMUCTR(utlb), 0);
+	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
 }
 
 static void ipmmu_tlb_flush_all(void *cookie)
@@ -1043,6 +1049,7 @@ static int ipmmu_probe(struct platform_device *pdev)
 	spin_lock_init(&mmu->lock);
 	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
 	mmu->features = of_device_get_match_data(&pdev->dev);
+	memset(mmu->utlb_ctx, IPMMU_CTX_INVALID, mmu->features->num_utlbs);
 	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 
 	/* Map I/O memory and request IRQ. */
@@ -1158,10 +1165,48 @@ static int ipmmu_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int ipmmu_resume_noirq(struct device *dev)
+{
+	struct ipmmu_vmsa_device *mmu = dev_get_drvdata(dev);
+	unsigned int i;
+
+	/* Reset root MMU and restore contexts */
+	if (ipmmu_is_root(mmu)) {
+		ipmmu_device_reset(mmu);
+
+		for (i = 0; i < mmu->num_ctx; i++) {
+			if (!mmu->domains[i])
+				continue;
+
+			ipmmu_domain_setup_context(mmu->domains[i]);
+		}
+	}
+
+	/* Re-enable active micro-TLBs */
+	for (i = 0; i < mmu->features->num_utlbs; i++) {
+		if (mmu->utlb_ctx[i] == IPMMU_CTX_INVALID)
+			continue;
+
+		ipmmu_utlb_enable(mmu->root->domains[mmu->utlb_ctx[i]], i);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops ipmmu_pm  = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, ipmmu_resume_noirq)
+};
+#define DEV_PM_OPS	&ipmmu_pm
+#else
+#define DEV_PM_OPS	NULL
+#endif /* CONFIG_PM_SLEEP */
+
 static struct platform_driver ipmmu_driver = {
 	.driver = {
 		.name = "ipmmu-vmsa",
 		.of_match_table = of_match_ptr(ipmmu_of_ids),
+		.pm = DEV_PM_OPS,
 	},
 	.probe = ipmmu_probe,
 	.remove	= ipmmu_remove,
-- 
2.17.1

