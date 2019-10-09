Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA45D09BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 10:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730218AbfJII0x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 04:26:53 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:30789 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729592AbfJII0x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 04:26:53 -0400
X-IronPort-AV: E=Sophos;i="5.67,273,1566831600"; 
   d="scan'208";a="28451943"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Oct 2019 17:26:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5B1BE41A3B1F;
        Wed,  9 Oct 2019 17:26:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] iommu/ipmmu-vmsa: Add utlb_offset_base
Date:   Wed,  9 Oct 2019 17:26:49 +0900
Message-Id: <1570609609-1332-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since we will have changed memory mapping of the IPMMU in the future,
this patch adds a utlb_offset_base into struct ipmmu_features
for IMUCTR and IMUASID registers.
No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 76fb250..bc00e58 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -52,6 +52,7 @@ struct ipmmu_features {
 	bool cache_snoop;
 	u32 ctx_offset_base;
 	u32 ctx_offset_stride;
+	u32 utlb_offset_base;
 };
 
 struct ipmmu_vmsa_device {
@@ -285,6 +286,11 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 	ipmmu_ctx_write_root(domain, reg, data);
 }
 
+static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
+{
+	return mmu->features->utlb_offset_base + reg;
+}
+
 /* -----------------------------------------------------------------------------
  * TLB and microTLB Management
  */
@@ -330,9 +336,9 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	 */
 
 	/* TODO: What should we set the ASID to ? */
-	ipmmu_write(mmu, IMUASID(utlb), 0);
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), 0);
 	/* TODO: Do we need to flush the microTLB ? */
-	ipmmu_write(mmu, IMUCTR(utlb),
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)),
 		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
 		    IMUCTR_MMUEN);
 	mmu->utlb_ctx[utlb] = domain->context_id;
@@ -346,7 +352,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 {
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
 
-	ipmmu_write(mmu, IMUCTR(utlb), 0);
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)), 0);
 	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
 }
 
@@ -995,6 +1001,7 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.cache_snoop = true,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -1008,6 +1015,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.cache_snoop = false,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.7.4

