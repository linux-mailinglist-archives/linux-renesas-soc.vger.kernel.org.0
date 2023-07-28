Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 537C9766178
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 03:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjG1BrH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 21:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbjG1BrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 21:47:06 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E46EFC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 18:47:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,236,1684767600"; 
   d="scan'208";a="174769818"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2023 10:47:03 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A5DDF4003EB6;
        Fri, 28 Jul 2023 10:47:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com
Cc:     iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4] iommu/ipmmu-vmsa: Allow PCIe devices
Date:   Fri, 28 Jul 2023 10:46:59 +0900
Message-Id: <20230728014659.411751-1-yoshihiro.shimoda.uh@renesas.com>
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

IPMMU hardware on R-Car Gen3 and RZ/G2 is simple. Each bus-master
device like eMMC host and PCIe controllers has a micro-TLB of
The IPMMU, and after enabled it, all transactions of the device are
under the IPMMU.

 eMMC host ---(micro-TLB of eMMC)--- IPMMU cache --- IPMMU main
 PCIe --------(micro-TLB of PCIe)--- IPMMU cache --- IPMMU main

Now this IPMMU driver allows eMMC host, and it is safe to use
the IPMMU. So, we can assume that it is safe to use the IPMMU
from PCIe devices too, because all PCIe devices transactions will
go to the micro-TLB of PCIe. So, add a new condition whether
the device is a PCIe device or not in the ipmmu_device_is_allowed()
which will be called if the PCIe host controller has iommu-map
property.

This can improve CPU load because the PCIe controllers only have
a capability for lower 32-bit memory area so that this can avoid
using swiotlb.

Note that IPMMU on R-Car Gen4 is different than R-Car Gen3 and
RZ/G2's one, especially OS-ID. But, for now, the IPMMU driver
takes care of OS-ID 0 only. In other words, all PCIe devices will
go to the micro-TLB of PCIe.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes from v3:
https://lore.kernel.org/all/20230529063928.1030014-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebase the latest iommu/next branch.

Changes from v2:
https://lore.kernel.org/all/20230426082511.3621484-1-yoshihiro.shimoda.uh@renesas.com/
 - Add descriptions why it is safe to add PCIe devices and why
   this is needed.

 drivers/iommu/ipmmu-vmsa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f64c5c9f5b9..6efc99382edb 100644
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
@@ -723,6 +724,10 @@ static bool ipmmu_device_is_allowed(struct device *dev)
 	if (soc_device_match(soc_denylist))
 		return false;
 
+	/* Check whether this device is a PCI device */
+	if (dev_is_pci(dev))
+		return true;
+
 	/* Check whether this device can work with the IPMMU */
 	for (i = 0; i < ARRAY_SIZE(devices_allowlist); i++) {
 		if (!strcmp(dev_name(dev), devices_allowlist[i]))
-- 
2.25.1

