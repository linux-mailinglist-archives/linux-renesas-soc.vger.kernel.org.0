Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500C8D09BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 10:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbfJII0x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 04:26:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22208 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725776AbfJII0x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 04:26:53 -0400
X-IronPort-AV: E=Sophos;i="5.67,273,1566831600"; 
   d="scan'208";a="28670612"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Oct 2019 17:26:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4F58C41A46FF;
        Wed,  9 Oct 2019 17:26:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] iommu/ipmmu-vmsa: Calculate context registers' offset instead of a macro
Date:   Wed,  9 Oct 2019 17:26:48 +0900
Message-Id: <1570609609-1332-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since we will have changed memory mapping of the IPMMU in the future,
this patch uses ipmmu_features values instead of a macro to
calculate context registers offset. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index dd554c2..76fb250 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -50,6 +50,8 @@ struct ipmmu_features {
 	bool twobit_imttbcr_sl0;
 	bool reserved_context;
 	bool cache_snoop;
+	u32 ctx_offset_base;
+	u32 ctx_offset_stride;
 };
 
 struct ipmmu_vmsa_device {
@@ -99,8 +101,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 
 #define IM_NS_ALIAS_OFFSET		0x800
 
-#define IM_CTX_SIZE			0x40
-
 #define IMCTR				0x0000
 #define IMCTR_TRE			(1 << 17)
 #define IMCTR_AFE			(1 << 16)
@@ -253,18 +253,25 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
 	iowrite32(data, mmu->base + offset);
 }
 
+static u32 ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu, unsigned int context_id,
+			 unsigned int reg)
+{
+	return mmu->features->ctx_offset_base +
+	       context_id * mmu->features->ctx_offset_stride + reg;
+}
+
 static u32 ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
 			       unsigned int reg)
 {
 	return ipmmu_read(domain->mmu->root,
-			  domain->context_id * IM_CTX_SIZE + reg);
+			  ipmmu_ctx_reg(domain->mmu, domain->context_id, reg));
 }
 
 static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
 				 unsigned int reg, u32 data)
 {
 	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+		    ipmmu_ctx_reg(domain->mmu, domain->context_id, reg), data);
 }
 
 static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
@@ -272,10 +279,10 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 {
 	if (domain->mmu != domain->mmu->root)
 		ipmmu_write(domain->mmu,
-			    domain->context_id * IM_CTX_SIZE + reg, data);
+			    ipmmu_ctx_reg(domain->mmu, domain->context_id, reg),
+			    data);
 
-	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_ctx_write_root(domain, reg, data);
 }
 
 /* -----------------------------------------------------------------------------
@@ -974,7 +981,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 
 	/* Disable all contexts. */
 	for (i = 0; i < mmu->num_ctx; ++i)
-		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
+		ipmmu_write(mmu, ipmmu_ctx_reg(mmu, i, IMCTR), 0);
 }
 
 static const struct ipmmu_features ipmmu_features_default = {
@@ -986,6 +993,8 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.twobit_imttbcr_sl0 = false,
 	.reserved_context = false,
 	.cache_snoop = true,
+	.ctx_offset_base = 0,
+	.ctx_offset_stride = 0x40,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -997,6 +1006,8 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.twobit_imttbcr_sl0 = true,
 	.reserved_context = true,
 	.cache_snoop = false,
+	.ctx_offset_base = 0,
+	.ctx_offset_stride = 0x40,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.7.4

