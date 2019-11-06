Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2610CF0C18
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 03:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbfKFCfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 21:35:52 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27307 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730788AbfKFCfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 21:35:52 -0500
X-IronPort-AV: E=Sophos;i="5.68,272,1569250800"; 
   d="scan'208";a="30723680"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2019 11:35:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 83F6D4181863;
        Wed,  6 Nov 2019 11:35:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/6] iommu/ipmmu-vmsa: tidyup register definitions
Date:   Wed,  6 Nov 2019 11:35:46 +0900
Message-Id: <1573007750-16611-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To support different registers memory mapping hardware easily
in the future, this patch tidies up the register definitions
as below:
 - Add comments to state to which SoCs or SoC families they apply
 - Add categories about MMU "context" and uTLB registers

No change behavior.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 58 ++++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index c4ec166..79975e1 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -101,47 +101,49 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 
 #define IM_CTX_SIZE			0x40
 
-#define IMCTR				0x0000
-#define IMCTR_INTEN			(1 << 2)
-#define IMCTR_FLUSH			(1 << 1)
-#define IMCTR_MMUEN			(1 << 0)
-
-#define IMTTBCR				0x0008
-#define IMTTBCR_EAE			(1 << 31)
+/* MMU "context" registers */
+#define IMCTR				0x0000		/* R-Car Gen2/3 */
+#define IMCTR_INTEN			(1 << 2)	/* R-Car Gen2/3 */
+#define IMCTR_FLUSH			(1 << 1)	/* R-Car Gen2/3 */
+#define IMCTR_MMUEN			(1 << 0)	/* R-Car Gen2/3 */
+
+#define IMTTBCR				0x0008		/* R-Car Gen2/3 */
+#define IMTTBCR_EAE			(1 << 31)	/* R-Car Gen2/3 */
 #define IMTTBCR_SH0_INNER_SHAREABLE	(3 << 12)	/* R-Car Gen2 only */
 #define IMTTBCR_ORGN0_WB_WA		(1 << 10)	/* R-Car Gen2 only */
 #define IMTTBCR_IRGN0_WB_WA		(1 << 8)	/* R-Car Gen2 only */
 #define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
-#define IMTTBCR_SL0_LVL_1		(1 << 4)
+#define IMTTBCR_SL0_LVL_1		(1 << 4)	/* R-Car Gen2 only */
 
-#define IMBUSCR				0x000c
-#define IMBUSCR_DVM			(1 << 2)
-#define IMBUSCR_BUSSEL_MASK		(3 << 0)
+#define IMBUSCR				0x000c		/* R-Car Gen2 only */
+#define IMBUSCR_DVM			(1 << 2)	/* R-Car Gen2 only */
+#define IMBUSCR_BUSSEL_MASK		(3 << 0)	/* R-Car Gen2 only */
 
-#define IMTTLBR0			0x0010
-#define IMTTUBR0			0x0014
+#define IMTTLBR0			0x0010		/* R-Car Gen2/3 */
+#define IMTTUBR0			0x0014		/* R-Car Gen2/3 */
 
-#define IMSTR				0x0020
-#define IMSTR_MHIT			(1 << 4)
-#define IMSTR_ABORT			(1 << 2)
-#define IMSTR_PF			(1 << 1)
-#define IMSTR_TF			(1 << 0)
+#define IMSTR				0x0020		/* R-Car Gen2/3 */
+#define IMSTR_MHIT			(1 << 4)	/* R-Car Gen2/3 */
+#define IMSTR_ABORT			(1 << 2)	/* R-Car Gen2/3 */
+#define IMSTR_PF			(1 << 1)	/* R-Car Gen2/3 */
+#define IMSTR_TF			(1 << 0)	/* R-Car Gen2/3 */
 
-#define IMMAIR0				0x0028
+#define IMMAIR0				0x0028		/* R-Car Gen2/3 */
 
-#define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
-#define IMEUAR				0x0034	/* R-Car Gen3 only */
+#define IMELAR				0x0030		/* R-Car Gen2/3, IMEAR on R-Car Gen2 */
+#define IMEUAR				0x0034		/* R-Car Gen3 only */
 
+/* uTLB registers */
 #define IMUCTR(n)			((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
-#define IMUCTR0(n)			(0x0300 + ((n) * 16))
-#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
-#define IMUCTR_TTSEL_MMU(n)		((n) << 4)
-#define IMUCTR_FLUSH			(1 << 1)
-#define IMUCTR_MMUEN			(1 << 0)
+#define IMUCTR0(n)			(0x0300 + ((n) * 16))		/* R-Car Gen2/3 */
+#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))	/* R-Car Gen3 only */
+#define IMUCTR_TTSEL_MMU(n)		((n) << 4)	/* R-Car Gen2/3 */
+#define IMUCTR_FLUSH			(1 << 1)	/* R-Car Gen2/3 */
+#define IMUCTR_MMUEN			(1 << 0)	/* R-Car Gen2/3 */
 
 #define IMUASID(n)			((n) < 32 ? IMUASID0(n) : IMUASID32(n))
-#define IMUASID0(n)			(0x0308 + ((n) * 16))
-#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))
+#define IMUASID0(n)			(0x0308 + ((n) * 16))		/* R-Car Gen2/3 */
+#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))	/* R-Car Gen3 only */
 
 /* -----------------------------------------------------------------------------
  * Root device handling
-- 
2.7.4

