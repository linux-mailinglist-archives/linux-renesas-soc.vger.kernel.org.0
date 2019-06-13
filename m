Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A375143E00
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfFMPqs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:46:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25554 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731782AbfFMJhR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 05:37:17 -0400
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; 
   d="scan'208";a="18585683"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jun 2019 18:37:14 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2E2B3417857B;
        Thu, 13 Jun 2019 18:37:14 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     hch@lst.de, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] usb-storage: Add a limitation for blk_queue_max_hw_sectors()
Date:   Thu, 13 Jun 2019 18:36:51 +0900
Message-Id: <1560418611-10239-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch fixes an issue that the following error happens on
swiotlb environment:

	xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 bytes), total 32768 (slots), used 1338 (slots)

On the kernel v5.1, block settings of a usb-storage with SuperSpeed
were the following so that the block layer will allocate buffers
up to 64 KiB, and then the issue didn't happen.

	max_segment_size = 65536
	max_hw_sectors_kb = 1024

After the commit 09324d32d2a0 ("block: force an unlimited segment
size on queues with a virt boundary") is applied, the block settings
are the following. So, the block layer will allocate buffers up to
1024 KiB, and then the issue happens:

	max_segment_size = 4294967295
	max_hw_sectors_kb = 1024

To fix the issue, the usb-storage driver checks the maximum size of
a mapping for the device and then adjusts the max_hw_sectors_kb
if required. After this patch is applied, the block settings will
be the following, and then the issue doesn't happen.

	max_segment_size = 4294967295
	max_hw_sectors_kb = 256

Fixes: 09324d32d2a0 ("block: force an unlimited segment size on queues with a virt boundary")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Call blk_queue_max_hw_sectors() for the maximum size of mapping
   unconditionally to simplify the code by using read the value back
   from the queue in the end.
 - Add a comment on the code.
 - On v1, I got Reviewed-by from Christoph. But, I changed the code a little,
   I removed the Reviewed-by.

 drivers/usb/storage/scsiglue.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 59190d8..556bb4f 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -28,6 +28,8 @@
  * status of a command.
  */
 
+#include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
@@ -99,6 +101,7 @@ static int slave_alloc (struct scsi_device *sdev)
 static int slave_configure(struct scsi_device *sdev)
 {
 	struct us_data *us = host_to_us(sdev->host);
+	struct device *dev = us->pusb_dev->bus->sysdev;
 
 	/*
 	 * Many devices have trouble transferring more than 32KB at a time,
@@ -129,6 +132,14 @@ static int slave_configure(struct scsi_device *sdev)
 	}
 
 	/*
+	 * The max_hw_sectors should be up to maximum size of a mapping for
+	 * the device. Otherwise, a DMA API might fail on swiotlb environment.
+	 */
+	blk_queue_max_hw_sectors(sdev->request_queue,
+		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
+		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
+
+	/*
 	 * Some USB host controllers can't do DMA; they have to use PIO.
 	 * They indicate this by setting their dma_mask to NULL.  For
 	 * such controllers we need to make sure the block layer sets
-- 
2.7.4

