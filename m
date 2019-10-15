Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8669DD744A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 13:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731693AbfJOLME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 07:12:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6361 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731669AbfJOLME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 07:12:04 -0400
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; 
   d="scan'208";a="28928928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 90761420786F;
        Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/6] iommu/ipmmu-vmsa: Calculate context registers' offset instead of a macro
Date:   Tue, 15 Oct 2019 20:11:58 +0900
Message-Id: <1571137920-15314-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since we will have changed memory mapping of the IPMMU in the future,
this patch uses ipmmu_features values instead of a macro to
calculate context registers offset. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index c60b31d..37bb4b7 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -50,6 +50,8 @@ struct ipmmu_features {
 	bool twobit_imttbcr_sl0;
 	bool reserved_context;
 	bool cache_snoop;
+	unsigned int ctx_offset_base;
+	unsigned int ctx_offset_stride;
 };
 
 struct ipmmu_vmsa_device {
@@ -99,8 +101,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 
 #define IM_NS_ALIAS_OFFSET		0x800
 
-#define IM_CTX_SIZE			0x40
-
 /* MMU "context" registers */
 #define IMCTR				0x0000		/* R-Car Gen2/3 */
 #define IMCTR_INTEN			(1 << 2)	/* R-Car Gen2/3 */
@@ -193,7 +193,8 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
 				  unsigned int context_id, unsigned int reg)
 {
-	return context_id * IM_CTX_SIZE + reg;
+	return mmu->features->ctx_offset_base +
+	       context_id * mmu->features->ctx_offset_stride + reg;
 }
 
 static u32 ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
@@ -937,6 +938,8 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.twobit_imttbcr_sl0 = false,
 	.reserved_context = false,
 	.cache_snoop = true,
+	.ctx_offset_base = 0,
+	.ctx_offset_stride = 0x40,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -948,6 +951,8 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.twobit_imttbcr_sl0 = true,
 	.reserved_context = true,
 	.cache_snoop = false,
+	.ctx_offset_base = 0,
+	.ctx_offset_stride = 0x40,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.7.4

