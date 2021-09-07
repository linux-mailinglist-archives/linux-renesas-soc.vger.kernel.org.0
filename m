Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC32402523
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 10:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242286AbhIGIbt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 04:31:49 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:60072 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242048AbhIGIbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 04:31:47 -0400
X-IronPort-AV: E=Sophos;i="5.85,274,1624287600"; 
   d="scan'208";a="93151329"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2021 17:30:40 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A0EF400D0FA;
        Tue,  7 Sep 2021 17:30:40 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Date:   Tue,  7 Sep 2021 17:30:20 +0900
Message-Id: <20210907083020.907648-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
of this SoC differs than others. So, add a new ipmmu_features for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index d38ff29a76e8..d8fe5ba0cb23 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -33,10 +33,10 @@
 #define arm_iommu_detach_device(...)	do {} while (0)
 #endif
 
-#define IPMMU_CTX_MAX		8U
+#define IPMMU_CTX_MAX		16U
 #define IPMMU_CTX_INVALID	-1
 
-#define IPMMU_UTLB_MAX		48U
+#define IPMMU_UTLB_MAX		64U
 
 struct ipmmu_features {
 	bool use_ns_alias_offset;
@@ -189,8 +189,12 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
 				  unsigned int context_id, unsigned int reg)
 {
-	return mmu->features->ctx_offset_base +
-	       context_id * mmu->features->ctx_offset_stride + reg;
+	unsigned int base = mmu->features->ctx_offset_base;
+
+	if (context_id > 7)
+		base += 0x800 - 8 * 0x40;
+
+	return base + context_id * mmu->features->ctx_offset_stride + reg;
 }
 
 static u32 ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
@@ -922,6 +926,20 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.utlb_offset_base = 0,
 };
 
+static const struct ipmmu_features ipmmu_features_r8a779a0 = {
+	.use_ns_alias_offset = false,
+	.has_cache_leaf_nodes = true,
+	.number_of_contexts = 16,
+	.num_utlbs = 64,
+	.setup_imbuscr = false,
+	.twobit_imttbcr_sl0 = true,
+	.reserved_context = true,
+	.cache_snoop = false,
+	.ctx_offset_base = 0x10000,
+	.ctx_offset_stride = 0x1040,
+	.utlb_offset_base = 0x3000,
+};
+
 static const struct of_device_id ipmmu_of_ids[] = {
 	{
 		.compatible = "renesas,ipmmu-vmsa",
@@ -959,6 +977,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
 	}, {
 		.compatible = "renesas,ipmmu-r8a77995",
 		.data = &ipmmu_features_rcar_gen3,
+	}, {
+		.compatible = "renesas,ipmmu-r8a779a0",
+		.data = &ipmmu_features_r8a779a0,
 	}, {
 		/* Terminator */
 	},
-- 
2.25.1

