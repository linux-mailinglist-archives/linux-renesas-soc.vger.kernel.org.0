Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE611F0C17
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 03:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730863AbfKFCfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 21:35:52 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:59769 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730426AbfKFCfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 21:35:52 -0500
X-IronPort-AV: E=Sophos;i="5.68,272,1569250800"; 
   d="scan'208";a="30937057"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2019 11:35:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 780484181474;
        Wed,  6 Nov 2019 11:35:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/6] iommu/ipmmu-vmsa: Remove all unused register definitions
Date:   Wed,  6 Nov 2019 11:35:45 +0900
Message-Id: <1573007750-16611-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To support different registers memory mapping hardware easily
in the future, this patch removes all unused register
definitions.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 76 ----------------------------------------------
 1 file changed, 76 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 5904c23..c4ec166 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -102,122 +102,46 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IM_CTX_SIZE			0x40
 
 #define IMCTR				0x0000
-#define IMCTR_TRE			(1 << 17)
-#define IMCTR_AFE			(1 << 16)
-#define IMCTR_RTSEL_MASK		(3 << 4)
-#define IMCTR_RTSEL_SHIFT		4
-#define IMCTR_TREN			(1 << 3)
 #define IMCTR_INTEN			(1 << 2)
 #define IMCTR_FLUSH			(1 << 1)
 #define IMCTR_MMUEN			(1 << 0)
 
-#define IMCAAR				0x0004
-
 #define IMTTBCR				0x0008
 #define IMTTBCR_EAE			(1 << 31)
-#define IMTTBCR_PMB			(1 << 30)
-#define IMTTBCR_SH1_NON_SHAREABLE	(0 << 28)	/* R-Car Gen2 only */
-#define IMTTBCR_SH1_OUTER_SHAREABLE	(2 << 28)	/* R-Car Gen2 only */
-#define IMTTBCR_SH1_INNER_SHAREABLE	(3 << 28)	/* R-Car Gen2 only */
-#define IMTTBCR_SH1_MASK		(3 << 28)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN1_NC		(0 << 26)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN1_WB_WA		(1 << 26)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN1_WT		(2 << 26)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN1_WB		(3 << 26)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN1_MASK		(3 << 26)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN1_NC		(0 << 24)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN1_WB_WA		(1 << 24)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN1_WT		(2 << 24)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN1_WB		(3 << 24)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN1_MASK		(3 << 24)	/* R-Car Gen2 only */
-#define IMTTBCR_TSZ1_MASK		(7 << 16)
-#define IMTTBCR_TSZ1_SHIFT		16
-#define IMTTBCR_SH0_NON_SHAREABLE	(0 << 12)	/* R-Car Gen2 only */
-#define IMTTBCR_SH0_OUTER_SHAREABLE	(2 << 12)	/* R-Car Gen2 only */
 #define IMTTBCR_SH0_INNER_SHAREABLE	(3 << 12)	/* R-Car Gen2 only */
-#define IMTTBCR_SH0_MASK		(3 << 12)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN0_NC		(0 << 10)	/* R-Car Gen2 only */
 #define IMTTBCR_ORGN0_WB_WA		(1 << 10)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN0_WT		(2 << 10)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN0_WB		(3 << 10)	/* R-Car Gen2 only */
-#define IMTTBCR_ORGN0_MASK		(3 << 10)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN0_NC		(0 << 8)	/* R-Car Gen2 only */
 #define IMTTBCR_IRGN0_WB_WA		(1 << 8)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN0_WT		(2 << 8)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN0_WB		(3 << 8)	/* R-Car Gen2 only */
-#define IMTTBCR_IRGN0_MASK		(3 << 8)	/* R-Car Gen2 only */
-#define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)	/* R-Car Gen3 only */
-#define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)	/* R-Car Gen3 only */
 #define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
-#define IMTTBCR_SL0_LVL_2		(0 << 4)
 #define IMTTBCR_SL0_LVL_1		(1 << 4)
-#define IMTTBCR_TSZ0_MASK		(7 << 0)
-#define IMTTBCR_TSZ0_SHIFT		O
 
 #define IMBUSCR				0x000c
 #define IMBUSCR_DVM			(1 << 2)
-#define IMBUSCR_BUSSEL_SYS		(0 << 0)
-#define IMBUSCR_BUSSEL_CCI		(1 << 0)
-#define IMBUSCR_BUSSEL_IMCAAR		(2 << 0)
-#define IMBUSCR_BUSSEL_CCI_IMCAAR	(3 << 0)
 #define IMBUSCR_BUSSEL_MASK		(3 << 0)
 
 #define IMTTLBR0			0x0010
 #define IMTTUBR0			0x0014
-#define IMTTLBR1			0x0018
-#define IMTTUBR1			0x001c
 
 #define IMSTR				0x0020
-#define IMSTR_ERRLVL_MASK		(3 << 12)
-#define IMSTR_ERRLVL_SHIFT		12
-#define IMSTR_ERRCODE_TLB_FORMAT	(1 << 8)
-#define IMSTR_ERRCODE_ACCESS_PERM	(4 << 8)
-#define IMSTR_ERRCODE_SECURE_ACCESS	(5 << 8)
-#define IMSTR_ERRCODE_MASK		(7 << 8)
 #define IMSTR_MHIT			(1 << 4)
 #define IMSTR_ABORT			(1 << 2)
 #define IMSTR_PF			(1 << 1)
 #define IMSTR_TF			(1 << 0)
 
 #define IMMAIR0				0x0028
-#define IMMAIR1				0x002c
-#define IMMAIR_ATTR_MASK		0xff
-#define IMMAIR_ATTR_DEVICE		0x04
-#define IMMAIR_ATTR_NC			0x44
-#define IMMAIR_ATTR_WBRWA		0xff
-#define IMMAIR_ATTR_SHIFT(n)		((n) << 3)
-#define IMMAIR_ATTR_IDX_NC		0
-#define IMMAIR_ATTR_IDX_WBRWA		1
-#define IMMAIR_ATTR_IDX_DEV		2
 
 #define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
 #define IMEUAR				0x0034	/* R-Car Gen3 only */
 
-#define IMPCTR				0x0200
-#define IMPSTR				0x0208
-#define IMPEAR				0x020c
-#define IMPMBA(n)			(0x0280 + ((n) * 4))
-#define IMPMBD(n)			(0x02c0 + ((n) * 4))
-
 #define IMUCTR(n)			((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
 #define IMUCTR0(n)			(0x0300 + ((n) * 16))
 #define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
-#define IMUCTR_FIXADDEN			(1 << 31)
-#define IMUCTR_FIXADD_MASK		(0xff << 16)
-#define IMUCTR_FIXADD_SHIFT		16
 #define IMUCTR_TTSEL_MMU(n)		((n) << 4)
-#define IMUCTR_TTSEL_PMB		(8 << 4)
-#define IMUCTR_TTSEL_MASK		(15 << 4)
 #define IMUCTR_FLUSH			(1 << 1)
 #define IMUCTR_MMUEN			(1 << 0)
 
 #define IMUASID(n)			((n) < 32 ? IMUASID0(n) : IMUASID32(n))
 #define IMUASID0(n)			(0x0308 + ((n) * 16))
 #define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))
-#define IMUASID_ASID8_MASK		(0xff << 8)
-#define IMUASID_ASID8_SHIFT		8
-#define IMUASID_ASID0_MASK		(0xff << 0)
-#define IMUASID_ASID0_SHIFT		0
 
 /* -----------------------------------------------------------------------------
  * Root device handling
-- 
2.7.4

