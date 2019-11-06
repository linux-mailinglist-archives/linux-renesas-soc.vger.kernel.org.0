Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B74CF0C1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 03:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbfKFCfx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 21:35:53 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:9499 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730788AbfKFCfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 21:35:53 -0500
X-IronPort-AV: E=Sophos;i="5.68,272,1569250800"; 
   d="scan'208";a="30937063"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2019 11:35:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A80CD4181863;
        Wed,  6 Nov 2019 11:35:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 5/6] iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
Date:   Wed,  6 Nov 2019 11:35:49 +0900
Message-Id: <1573007750-16611-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since we will have changed memory mapping of the IPMMU in the future,
This patch adds helper functions ipmmu_utlb_reg() and
ipmmu_imu{asid,ctr}_write() for "uTLB" registers. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 8e2ca1c..82da486 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -230,6 +230,23 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
+static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
+{
+	return reg;
+}
+
+static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
+				unsigned int utlb, u32 data)
+{
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), data);
+}
+
+static void ipmmu_imuctr_write(struct ipmmu_vmsa_device *mmu,
+			       unsigned int utlb, u32 data)
+{
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)), data);
+}
+
 /* -----------------------------------------------------------------------------
  * TLB and microTLB Management
  */
@@ -275,11 +292,10 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	 */
 
 	/* TODO: What should we set the ASID to ? */
-	ipmmu_write(mmu, IMUASID(utlb), 0);
+	ipmmu_imuasid_write(mmu, utlb, 0);
 	/* TODO: Do we need to flush the microTLB ? */
-	ipmmu_write(mmu, IMUCTR(utlb),
-		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
-		    IMUCTR_MMUEN);
+	ipmmu_imuctr_write(mmu, utlb, IMUCTR_TTSEL_MMU(domain->context_id) |
+				      IMUCTR_FLUSH | IMUCTR_MMUEN);
 	mmu->utlb_ctx[utlb] = domain->context_id;
 }
 
@@ -291,7 +307,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 {
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
 
-	ipmmu_write(mmu, IMUCTR(utlb), 0);
+	ipmmu_imuctr_write(mmu, utlb, 0);
 	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
 }
 
-- 
2.7.4

