Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFD3D744B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 13:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731691AbfJOLME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 07:12:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:32930 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbfJOLME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 07:12:04 -0400
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; 
   d="scan'208";a="28928934"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A84A74207866;
        Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 6/6] iommu/ipmmu-vmsa: Add utlb_offset_base
Date:   Tue, 15 Oct 2019 20:12:00 +0900
Message-Id: <1571137920-15314-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
index d8385ef..1225f12 100644
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
@@ -956,6 +957,7 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.cache_snoop = true,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -969,6 +971,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.cache_snoop = false,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.7.4

