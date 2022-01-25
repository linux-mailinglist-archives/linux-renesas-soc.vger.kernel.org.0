Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCA949B491
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 14:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382047AbiAYNDx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 08:03:53 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:9144 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1574355AbiAYM6S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 07:58:18 -0500
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; 
   d="scan'208";a="107604457"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2022 21:56:12 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 13812400D0E4;
        Tue, 25 Jan 2022 21:56:12 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Date:   Tue, 25 Jan 2022 21:56:02 +0900
Message-Id: <20220125125602.4144793-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car Gen4 like r8a779f0 (R-Car S4-8). The IPMMU
hardware design of r8a779f0 is the same as r8a779a0. So, rename
"r8a779a0" to "rcar_gen4".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ca752bdc710f..6c4314c2e9bf 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -719,6 +719,7 @@ static int ipmmu_init_platform_device(struct device *dev,
 
 static const struct soc_device_attribute soc_needs_opt_in[] = {
 	{ .family = "R-Car Gen3", },
+	{ .family = "R-Car Gen4", },
 	{ .family = "RZ/G2", },
 	{ /* sentinel */ }
 };
@@ -743,7 +744,7 @@ static bool ipmmu_device_is_allowed(struct device *dev)
 	unsigned int i;
 
 	/*
-	 * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
+	 * R-Car Gen3, Gen4 and RZ/G2 use the allow list to opt-in devices.
 	 * For Other SoCs, this returns true anyway.
 	 */
 	if (!soc_device_match(soc_needs_opt_in))
@@ -926,7 +927,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.utlb_offset_base = 0,
 };
 
-static const struct ipmmu_features ipmmu_features_r8a779a0 = {
+static const struct ipmmu_features ipmmu_features_rcar_gen4 = {
 	.use_ns_alias_offset = false,
 	.has_cache_leaf_nodes = true,
 	.number_of_contexts = 16,
@@ -982,7 +983,10 @@ static const struct of_device_id ipmmu_of_ids[] = {
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
 		.compatible = "renesas,ipmmu-r8a779a0",
-		.data = &ipmmu_features_r8a779a0,
+		.data = &ipmmu_features_rcar_gen4,
+	}, {
+		.compatible = "renesas,rcar-gen4-ipmmu",
+		.data = &ipmmu_features_rcar_gen4,
 	}, {
 		/* Terminator */
 	},
-- 
2.25.1

