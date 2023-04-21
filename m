Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34286EAA55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 14:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjDUMZz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 08:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjDUMZx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 08:25:53 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C9AD8A53
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 05:25:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,214,1677510000"; 
   d="scan'208";a="160286529"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Apr 2023 21:25:48 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A23FE42327D5;
        Fri, 21 Apr 2023 21:25:48 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com
Cc:     iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] iommu/ipmmu-vmsa: Allow PCIe devices
Date:   Fri, 21 Apr 2023 21:25:38 +0900
Message-Id: <20230421122538.3389336-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PCIe devices of R-Car Gen3/4 into devices_allowlist. For a PCI
device, ipmmu_attach_device() has to avoid enabling uTLB because
the uTLB has already been enabled by the parent device. Otherwise,
enable a wrong uTLB ID. Also ipmmu_device_is_allowed() has to
check whether the parent device is the PCIe host controller or not,
to use the IOMMU's dma_ops from a PCI device.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f64c5c9f5b9..c635c9b192f4 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -624,6 +625,10 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 	if (ret < 0)
 		return ret;
 
+	/* Avoid to enable utlb if this is a PCI device */
+	if (dev_is_pci(dev))
+		return 0;
+
 	for (i = 0; i < fwspec->num_ids; ++i)
 		ipmmu_utlb_enable(domain, fwspec->ids[i]);
 
@@ -702,10 +707,14 @@ static const struct soc_device_attribute soc_denylist[] = {
 };
 
 static const char * const devices_allowlist[] = {
+	"e65d0000.pcie",	/* R-Car Gen4 */
+	"e65d8000.pcie",	/* R-Car Gen4 */
 	"ee100000.mmc",
 	"ee120000.mmc",
 	"ee140000.mmc",
-	"ee160000.mmc"
+	"ee160000.mmc",
+	"ee800000.pcie",	/* R-Car Gen3 */
+	"fe000000.pcie",	/* R-Car Gen3 */
 };
 
 static bool ipmmu_device_is_allowed(struct device *dev)
@@ -723,12 +732,22 @@ static bool ipmmu_device_is_allowed(struct device *dev)
 	if (soc_device_match(soc_denylist))
 		return false;
 
+retry:
 	/* Check whether this device can work with the IPMMU */
 	for (i = 0; i < ARRAY_SIZE(devices_allowlist); i++) {
 		if (!strcmp(dev_name(dev), devices_allowlist[i]))
 			return true;
 	}
 
+	/*
+	 * Check whether this device has the parent device like a PCI device
+	 * except "soc".
+	 */
+	if (dev->parent && strcmp(dev_name(dev->parent), "soc")) {
+		dev = dev->parent;
+		goto retry;
+	}
+
 	/* Otherwise, do not allow use of IPMMU */
 	return false;
 }
-- 
2.25.1

