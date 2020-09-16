Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739F226C218
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 13:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgIPLYz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 07:24:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:26545 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726939AbgIPLSX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 07:18:23 -0400
X-IronPort-AV: E=Sophos;i="5.76,432,1592838000"; 
   d="scan'208";a="57211422"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Sep 2020 20:18:22 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 800CB400755E;
        Wed, 16 Sep 2020 20:18:22 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     axboe@kernel.dk, sergei.shtylyov@gmail.com
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT timeout issue
Date:   Wed, 16 Sep 2020 20:18:18 +0900
Message-Id: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When we wrote data to an SATA HDD, the following timeout issue
happened after the commit 429120f3df2d ("block: fix splitting
segments on boundary masks") was applied:

    # dd if=/dev/urandom of=/mnt/de1/file1-1024M bs=1M count=1024
    ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
    ata1.00: failed command: WRITE DMA EXT
    ata1.00: cmd 35/00:00:00:e6:0c/00:0a:00:00:00/e0 tag 0 dma 1310720 out
    res 40/00:01:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
    ata1.00: status: { DRDY }

Since the commit changed get_max_segment_size()'s behavior,
unexpected behavior happens if .dma_boundary of this sata-rcar driver
is 0x1ffffffe in somewhere (my guess).

By the way, the commit 8bfbeed58665 ("sata_rcar: correct
'sata_rcar_sht'") changed the .dma_boundary as 0x1ffffffe, but this
number is related to ATAPI_DMA_TRANS_CNT register. So, we should set
the .dma_boundary as ATA_DMA_BOUNDARY (0xffff), and set
.max_segment_size to min(0x1ffffffe, dma_max_mapping_size()).

After applied this, the timeout issue disappeared.

Fixes: 8bfbeed58665 ("sata_rcar: correct 'sata_rcar_sht'")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 As I wrote the commit description, I couldn't find why the issue
was related to the .dma_boundary. So, I marked RFC on this patch.
I would appreciate it if you would give me some advice.

 drivers/ata/sata_rcar.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 141ac60..abd0752 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -120,7 +120,7 @@
 /* Descriptor table word 0 bit (when DTA32M = 1) */
 #define SATA_RCAR_DTEND			BIT(0)
 
-#define SATA_RCAR_DMA_BOUNDARY		0x1FFFFFFEUL
+#define SATA_RCAR_DMA_TRANS_CNT		0x1FFFFFFEUL
 
 /* Gen2 Physical Layer Control Registers */
 #define RCAR_GEN2_PHY_CTL1_REG		0x1704
@@ -636,14 +636,7 @@ static u8 sata_rcar_bmdma_status(struct ata_port *ap)
 }
 
 static struct scsi_host_template sata_rcar_sht = {
-	ATA_BASE_SHT(DRV_NAME),
-	/*
-	 * This controller allows transfer chunks up to 512MB which cross 64KB
-	 * boundaries, therefore the DMA limits are more relaxed than standard
-	 * ATA SFF.
-	 */
-	.sg_tablesize		= ATA_MAX_PRD,
-	.dma_boundary		= SATA_RCAR_DMA_BOUNDARY,
+	ATA_BMDMA_SHT(DRV_NAME),
 };
 
 static struct ata_port_operations sata_rcar_port_ops = {
@@ -930,6 +923,14 @@ static int sata_rcar_probe(struct platform_device *pdev)
 	/* initialize host controller */
 	sata_rcar_init_controller(host);
 
+	/*
+	 * This controller allows transfer chunks up to 512MB which cross 64KB
+	 * boundaries, therefore the DMA limits are more relaxed than standard
+	 * ATA SFF.
+	 */
+	sata_rcar_sht.max_segment_size = min_t(unsigned int,
+					       SATA_RCAR_DMA_TRANS_CNT,
+					       dma_max_mapping_size(dev));
 	ret = ata_host_activate(host, irq, sata_rcar_interrupt, 0,
 				&sata_rcar_sht);
 	if (!ret)
-- 
2.7.4

