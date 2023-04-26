Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1E6EF036
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Apr 2023 10:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240245AbjDZIZ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Apr 2023 04:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240264AbjDZIZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2023 04:25:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6E8A4EED
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Apr 2023 01:25:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,227,1677510000"; 
   d="scan'208";a="160810572"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2023 17:25:15 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 046AE40071E9;
        Wed, 26 Apr 2023 17:25:15 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com
Cc:     iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] iommu/ipmmu-vmsa: Allow PCIe devices
Date:   Wed, 26 Apr 2023 17:25:11 +0900
Message-Id: <20230426082511.3621484-1-yoshihiro.shimoda.uh@renesas.com>
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

To allow PCIe devices, add a new condition whether the device is
a PCI device or not in the ipmmu_device_is_allowed().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 https://lore.kernel.org/all/20230421122538.3389336-1-yoshihiro.shimoda.uh@renesas.com/
 - Drop a condition in the ipmmu_attach_device().
 - Drop adding PCIe root devices into the devices_allowlist.
 - Use dev_is_pci() instead of using strcmp() in ipmmu_device_is_allowed().

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

