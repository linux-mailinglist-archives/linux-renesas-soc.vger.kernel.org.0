Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFF0A8210
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfIDMIH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:08:07 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:48552 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfIDMIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:08:07 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id xQ832000b05gfCL01Q83Th; Wed, 04 Sep 2019 14:08:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5U4x-0001al-Iz; Wed, 04 Sep 2019 14:08:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5U4x-0000Zi-I3; Wed, 04 Sep 2019 14:08:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Magnus Damm <damm+renesas@opensource.se>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] iommu/ipmmu-vmsa: Disable cache snoop transactions on R-Car Gen3
Date:   Wed,  4 Sep 2019 14:08:02 +0200
Message-Id: <20190904120802.2163-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904120802.2163-1-geert+renesas@glider.be>
References: <20190904120802.2163-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hai Nguyen Pham <hai.pham.ud@renesas.com>

According to the Hardware Manual Errata for Rev. 1.50 of April 10, 2019,
cache snoop transactions for page table walk requests are not supported
on R-Car Gen3.

Hence, this patch removes setting these fields in the IMTTBCR register,
since it will have no effect, and adds comments to the register bit
definitions, to make it clear they apply to R-Car Gen2 only.

Signed-off-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
[geert: Reword, add comments]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 71 ++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 1baabeaddc9cba1b..9da8309f71708f21 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -49,6 +49,7 @@ struct ipmmu_features {
 	bool setup_imbuscr;
 	bool twobit_imttbcr_sl0;
 	bool reserved_context;
+	bool cache_snoop;
 };
 
 struct ipmmu_vmsa_device {
@@ -115,36 +116,36 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMTTBCR				0x0008
 #define IMTTBCR_EAE			(1 << 31)
 #define IMTTBCR_PMB			(1 << 30)
-#define IMTTBCR_SH1_NON_SHAREABLE	(0 << 28)
-#define IMTTBCR_SH1_OUTER_SHAREABLE	(2 << 28)
-#define IMTTBCR_SH1_INNER_SHAREABLE	(3 << 28)
-#define IMTTBCR_SH1_MASK		(3 << 28)
-#define IMTTBCR_ORGN1_NC		(0 << 26)
-#define IMTTBCR_ORGN1_WB_WA		(1 << 26)
-#define IMTTBCR_ORGN1_WT		(2 << 26)
-#define IMTTBCR_ORGN1_WB		(3 << 26)
-#define IMTTBCR_ORGN1_MASK		(3 << 26)
-#define IMTTBCR_IRGN1_NC		(0 << 24)
-#define IMTTBCR_IRGN1_WB_WA		(1 << 24)
-#define IMTTBCR_IRGN1_WT		(2 << 24)
-#define IMTTBCR_IRGN1_WB		(3 << 24)
-#define IMTTBCR_IRGN1_MASK		(3 << 24)
+#define IMTTBCR_SH1_NON_SHAREABLE	(0 << 28)	/* R-Car Gen2 only */
+#define IMTTBCR_SH1_OUTER_SHAREABLE	(2 << 28)	/* R-Car Gen2 only */
+#define IMTTBCR_SH1_INNER_SHAREABLE	(3 << 28)	/* R-Car Gen2 only */
+#define IMTTBCR_SH1_MASK		(3 << 28)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN1_NC		(0 << 26)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN1_WB_WA		(1 << 26)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN1_WT		(2 << 26)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN1_WB		(3 << 26)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN1_MASK		(3 << 26)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN1_NC		(0 << 24)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN1_WB_WA		(1 << 24)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN1_WT		(2 << 24)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN1_WB		(3 << 24)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN1_MASK		(3 << 24)	/* R-Car Gen2 only */
 #define IMTTBCR_TSZ1_MASK		(7 << 16)
 #define IMTTBCR_TSZ1_SHIFT		16
-#define IMTTBCR_SH0_NON_SHAREABLE	(0 << 12)
-#define IMTTBCR_SH0_OUTER_SHAREABLE	(2 << 12)
-#define IMTTBCR_SH0_INNER_SHAREABLE	(3 << 12)
-#define IMTTBCR_SH0_MASK		(3 << 12)
-#define IMTTBCR_ORGN0_NC		(0 << 10)
-#define IMTTBCR_ORGN0_WB_WA		(1 << 10)
-#define IMTTBCR_ORGN0_WT		(2 << 10)
-#define IMTTBCR_ORGN0_WB		(3 << 10)
-#define IMTTBCR_ORGN0_MASK		(3 << 10)
-#define IMTTBCR_IRGN0_NC		(0 << 8)
-#define IMTTBCR_IRGN0_WB_WA		(1 << 8)
-#define IMTTBCR_IRGN0_WT		(2 << 8)
-#define IMTTBCR_IRGN0_WB		(3 << 8)
-#define IMTTBCR_IRGN0_MASK		(3 << 8)
+#define IMTTBCR_SH0_NON_SHAREABLE	(0 << 12)	/* R-Car Gen2 only */
+#define IMTTBCR_SH0_OUTER_SHAREABLE	(2 << 12)	/* R-Car Gen2 only */
+#define IMTTBCR_SH0_INNER_SHAREABLE	(3 << 12)	/* R-Car Gen2 only */
+#define IMTTBCR_SH0_MASK		(3 << 12)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN0_NC		(0 << 10)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN0_WB_WA		(1 << 10)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN0_WT		(2 << 10)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN0_WB		(3 << 10)	/* R-Car Gen2 only */
+#define IMTTBCR_ORGN0_MASK		(3 << 10)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN0_NC		(0 << 8)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN0_WB_WA		(1 << 8)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN0_WT		(2 << 8)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN0_WB		(3 << 8)	/* R-Car Gen2 only */
+#define IMTTBCR_IRGN0_MASK		(3 << 8)	/* R-Car Gen2 only */
 #define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)	/* R-Car Gen3 only */
 #define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)	/* R-Car Gen3 only */
 #define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
@@ -421,17 +422,19 @@ static void ipmmu_domain_setup_context(struct ipmmu_vmsa_domain *domain)
 
 	/*
 	 * TTBCR
-	 * We use long descriptors with inner-shareable WBWA tables and allocate
-	 * the whole 32-bit VA space to TTBR0.
+	 * We use long descriptors and allocate the whole 32-bit VA space to
+	 * TTBR0.
 	 */
 	if (domain->mmu->features->twobit_imttbcr_sl0)
 		tmp = IMTTBCR_SL0_TWOBIT_LVL_1;
 	else
 		tmp = IMTTBCR_SL0_LVL_1;
 
-	ipmmu_ctx_write_root(domain, IMTTBCR, IMTTBCR_EAE |
-			     IMTTBCR_SH0_INNER_SHAREABLE | IMTTBCR_ORGN0_WB_WA |
-			     IMTTBCR_IRGN0_WB_WA | tmp);
+	if (domain->mmu->features->cache_snoop)
+		tmp |= IMTTBCR_SH0_INNER_SHAREABLE | IMTTBCR_ORGN0_WB_WA |
+		       IMTTBCR_IRGN0_WB_WA;
+
+	ipmmu_ctx_write_root(domain, IMTTBCR, IMTTBCR_EAE | tmp);
 
 	/* MAIR0 */
 	ipmmu_ctx_write_root(domain, IMMAIR0,
@@ -993,6 +996,7 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.setup_imbuscr = true,
 	.twobit_imttbcr_sl0 = false,
 	.reserved_context = false,
+	.cache_snoop = true,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -1003,6 +1007,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.setup_imbuscr = false,
 	.twobit_imttbcr_sl0 = true,
 	.reserved_context = true,
+	.cache_snoop = false,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.17.1

