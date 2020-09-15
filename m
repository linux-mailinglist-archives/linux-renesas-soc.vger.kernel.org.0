Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE2626AB43
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 19:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgIOR4G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 13:56:06 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:32524 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727990AbgIORzb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 13:55:31 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57128563"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Sep 2020 02:55:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2B3D6400753C;
        Wed, 16 Sep 2020 02:55:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] iommu: Kconfig: Update help description for IPMMU_VMSA config
Date:   Tue, 15 Sep 2020 18:55:23 +0100
Message-Id: <20200915175523.1626-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

ipmmu-vmsa driver is also used on Renesas RZ/G{1,2} Soc's, update the
description for the IPMMU_VMSA config symbol to reflect this.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
* Updated commit description as suggested by Geert
* Included RB from Geert
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index bef5d75e306b..d8f71bf31786 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -232,7 +232,7 @@ config IPMMU_VMSA
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for the Renesas VMSA-compatible IPMMU found in the R-Mobile
-	  APE6, R-Car Gen2, and R-Car Gen3 SoCs.
+	  APE6, R-Car Gen{2,3} and RZ/G{1,2} SoCs.
 
 	  If unsure, say N.
 
-- 
2.17.1

