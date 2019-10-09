Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71088D09B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 10:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbfJII0w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 04:26:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:30789 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729592AbfJII0w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 04:26:52 -0400
X-IronPort-AV: E=Sophos;i="5.67,273,1566831600"; 
   d="scan'208";a="28451940"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Oct 2019 17:26:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4376C41A46EC;
        Wed,  9 Oct 2019 17:26:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] iommu/ipmmu-vmsa: Remove some unused register declarations
Date:   Wed,  9 Oct 2019 17:26:47 +0900
Message-Id: <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To support different registers memory mapping hardware easily
in the future, this patch removes some unused register
declarations.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9da8309..dd554c2 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -104,8 +104,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMCTR				0x0000
 #define IMCTR_TRE			(1 << 17)
 #define IMCTR_AFE			(1 << 16)
-#define IMCTR_RTSEL_MASK		(3 << 4)
-#define IMCTR_RTSEL_SHIFT		4
 #define IMCTR_TREN			(1 << 3)
 #define IMCTR_INTEN			(1 << 2)
 #define IMCTR_FLUSH			(1 << 1)
@@ -115,7 +113,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 
 #define IMTTBCR				0x0008
 #define IMTTBCR_EAE			(1 << 31)
-#define IMTTBCR_PMB			(1 << 30)
 #define IMTTBCR_SH1_NON_SHAREABLE	(0 << 28)	/* R-Car Gen2 only */
 #define IMTTBCR_SH1_OUTER_SHAREABLE	(2 << 28)	/* R-Car Gen2 only */
 #define IMTTBCR_SH1_INNER_SHAREABLE	(3 << 28)	/* R-Car Gen2 only */
@@ -193,12 +190,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
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
@@ -206,8 +197,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMUCTR_FIXADD_MASK		(0xff << 16)
 #define IMUCTR_FIXADD_SHIFT		16
 #define IMUCTR_TTSEL_MMU(n)		((n) << 4)
-#define IMUCTR_TTSEL_PMB		(8 << 4)
-#define IMUCTR_TTSEL_MASK		(15 << 4)
 #define IMUCTR_FLUSH			(1 << 1)
 #define IMUCTR_MMUEN			(1 << 0)
 
-- 
2.7.4

