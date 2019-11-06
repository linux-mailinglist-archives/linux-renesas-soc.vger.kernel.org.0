Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3C4F0C1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 03:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730892AbfKFCfx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 21:35:53 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27307 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730426AbfKFCfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 21:35:52 -0500
X-IronPort-AV: E=Sophos;i="5.68,272,1569250800"; 
   d="scan'208";a="30723686"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2019 11:35:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B40EE4181863;
        Wed,  6 Nov 2019 11:35:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 6/6] iommu/ipmmu-vmsa: Add utlb_offset_base
Date:   Wed,  6 Nov 2019 11:35:50 +0900
Message-Id: <1573007750-16611-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since we will have changed memory mapping of the IPMMU in the future,
this patch adds a utlb_offset_base into struct ipmmu_features
for IMUCTR and IMUASID registers. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 82da486..c813436 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -52,6 +52,7 @@ struct ipmmu_features {
 	bool cache_snoop;
 	unsigned int ctx_offset_base;
 	unsigned int ctx_offset_stride;
+	unsigned int utlb_offset_base;
 };
 
 struct ipmmu_vmsa_device {
@@ -232,7 +233,7 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 
 static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
 {
-	return reg;
+	return mmu->features->utlb_offset_base + reg;
 }
 
 static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
@@ -958,6 +959,7 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.cache_snoop = true,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -971,6 +973,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.cache_snoop = false,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.7.4

