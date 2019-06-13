Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC404461C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 18:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbfFMQt0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 12:49:26 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:2728 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726771AbfFMEf3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 00:35:29 -0400
X-IronPort-AV: E=Sophos;i="5.62,368,1554735600"; 
   d="scan'208";a="18346413"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jun 2019 13:35:27 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 16B164117758;
        Thu, 13 Jun 2019 13:35:27 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     hch@lst.de, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb-storage: Add a limitation for blk_queue_max_hw_sectors()
Date:   Thu, 13 Jun 2019 13:35:04 +0900
Message-Id: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 We investigated this issue on the following ML:
 https://marc.info/?l=linux-block&m=156033909218970&w=2

 drivers/usb/storage/scsiglue.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 59190d8..89c3640 100644
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
+	unsigned int max_sectors = 0;	/* 0 means no update required */
 
 	/*
 	 * Many devices have trouble transferring more than 32KB at a time,
@@ -106,26 +109,34 @@ static int slave_configure(struct scsi_device *sdev)
 	 * are limiting both to 32K (64 sectores).
 	 */
 	if (us->fflags & (US_FL_MAX_SECTORS_64 | US_FL_MAX_SECTORS_MIN)) {
-		unsigned int max_sectors = 64;
+		max_sectors = 64;
 
 		if (us->fflags & US_FL_MAX_SECTORS_MIN)
 			max_sectors = PAGE_SIZE >> 9;
-		if (queue_max_hw_sectors(sdev->request_queue) > max_sectors)
-			blk_queue_max_hw_sectors(sdev->request_queue,
-					      max_sectors);
+		if (queue_max_hw_sectors(sdev->request_queue) <= max_sectors)
+			max_sectors = 0;
 	} else if (sdev->type == TYPE_TAPE) {
 		/*
 		 * Tapes need much higher max_sector limits, so just
 		 * raise it to the maximum possible (4 GB / 512) and
 		 * let the queue segment size sort out the real limit.
 		 */
-		blk_queue_max_hw_sectors(sdev->request_queue, 0x7FFFFF);
+		max_sectors = 0x7FFFFF;
 	} else if (us->pusb_dev->speed >= USB_SPEED_SUPER) {
 		/*
 		 * USB3 devices will be limited to 2048 sectors. This gives us
 		 * better throughput on most devices.
 		 */
-		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
+		max_sectors = 2048;
+	}
+
+	if (max_sectors > 0) {
+		struct device *dev = us->pusb_dev->bus->sysdev;
+		size_t max_dma_sectors = dma_max_mapping_size(dev) >>
+					 SECTOR_SHIFT;
+
+		max_sectors = min_t(size_t, max_sectors, max_dma_sectors);
+		blk_queue_max_hw_sectors(sdev->request_queue, max_sectors);
 	}
 
 	/*
-- 
2.7.4

