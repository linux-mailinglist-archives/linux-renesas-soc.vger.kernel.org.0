Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224251F664D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2020 13:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgFKLKv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jun 2020 07:10:51 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6075 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727884AbgFKLKr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 07:10:47 -0400
X-IronPort-AV: E=Sophos;i="5.73,499,1583161200"; 
   d="scan'208";a="49411152"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2020 20:10:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 480B842B692D;
        Thu, 11 Jun 2020 20:10:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] iommu/renesas: Add support for r8a77961
Date:   Thu, 11 Jun 2020 20:10:30 +0900
Message-Id: <1591873830-10128-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 4c2972f..b57b1f2 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -3,7 +3,7 @@
  * IOMMU API for Renesas VMSA-compatible IPMMU
  * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  *
- * Copyright (C) 2014 Renesas Electronics Corporation
+ * Copyright (C) 2014-2020 Renesas Electronics Corporation
  */
 
 #include <linux/bitmap.h>
@@ -753,6 +753,7 @@ static const struct soc_device_attribute soc_rcar_gen3_whitelist[] = {
 	{ .soc_id = "r8a774b1", },
 	{ .soc_id = "r8a774c0", },
 	{ .soc_id = "r8a7795", .revision = "ES3.*" },
+	{ .soc_id = "r8a77961", },
 	{ .soc_id = "r8a77965", },
 	{ .soc_id = "r8a77990", },
 	{ .soc_id = "r8a77995", },
@@ -970,6 +971,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
 		.compatible = "renesas,ipmmu-r8a7796",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
+		.compatible = "renesas,ipmmu-r8a77961",
+		.data = &ipmmu_features_rcar_gen3,
+	}, {
 		.compatible = "renesas,ipmmu-r8a77965",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
-- 
2.7.4

