Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02492B3A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 13:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfE0LxB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 07:53:01 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:35136 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfE0LxA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 07:53:00 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id HPsy2000T3XaVaC01PsyfV; Mon, 27 May 2019 13:52:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEBW-0001O4-E6; Mon, 27 May 2019 13:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEBW-0000aq-D8; Mon, 27 May 2019 13:52:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 2/6] iommu/ipmmu-vmsa: Prepare to handle 40-bit error addresses
Date:   Mon, 27 May 2019 13:52:49 +0200
Message-Id: <20190527115253.2114-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527115253.2114-1-geert+renesas@glider.be>
References: <20190527115253.2114-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On R-Car Gen3, the faulting virtual address is a 40-bit address, and
comprised of two registers.  Read the upper address part, and combine
both parts, when running on a 64-bit system.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Apart from this, the driver doesn't support 40-bit IOVA addresses yet.

v4:
  - Add Reviewed-by, Tested-by,

v3:
  - Add Reviewed-by,

v2:
  - Merge IMEAR/IMELAR.
---
 drivers/iommu/ipmmu-vmsa.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f2b781e20a0eba6..f2061bd1dc7b8852 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -186,7 +186,8 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMMAIR_ATTR_IDX_WBRWA		1
 #define IMMAIR_ATTR_IDX_DEV		2
 
-#define IMEAR				0x0030
+#define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
+#define IMEUAR				0x0034	/* R-Car Gen3 only */
 
 #define IMPCTR				0x0200
 #define IMPSTR				0x0208
@@ -522,14 +523,16 @@ static irqreturn_t ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
 {
 	const u32 err_mask = IMSTR_MHIT | IMSTR_ABORT | IMSTR_PF | IMSTR_TF;
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
+	unsigned long iova;
 	u32 status;
-	u32 iova;
 
 	status = ipmmu_ctx_read_root(domain, IMSTR);
 	if (!(status & err_mask))
 		return IRQ_NONE;
 
-	iova = ipmmu_ctx_read_root(domain, IMEAR);
+	iova = ipmmu_ctx_read_root(domain, IMELAR);
+	if (IS_ENABLED(CONFIG_64BIT))
+		iova |= (u64)ipmmu_ctx_read_root(domain, IMEUAR) << 32;
 
 	/*
 	 * Clear the error status flags. Unlike traditional interrupt flag
@@ -541,10 +544,10 @@ static irqreturn_t ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
 
 	/* Log fatal errors. */
 	if (status & IMSTR_MHIT)
-		dev_err_ratelimited(mmu->dev, "Multiple TLB hits @0x%08x\n",
+		dev_err_ratelimited(mmu->dev, "Multiple TLB hits @0x%lx\n",
 				    iova);
 	if (status & IMSTR_ABORT)
-		dev_err_ratelimited(mmu->dev, "Page Table Walk Abort @0x%08x\n",
+		dev_err_ratelimited(mmu->dev, "Page Table Walk Abort @0x%lx\n",
 				    iova);
 
 	if (!(status & (IMSTR_PF | IMSTR_TF)))
@@ -560,7 +563,7 @@ static irqreturn_t ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
 		return IRQ_HANDLED;
 
 	dev_err_ratelimited(mmu->dev,
-			    "Unhandled fault: status 0x%08x iova 0x%08x\n",
+			    "Unhandled fault: status 0x%08x iova 0x%lx\n",
 			    status, iova);
 
 	return IRQ_HANDLED;
-- 
2.17.1

