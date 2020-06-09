Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1A21F3AE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgFIMqd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729556AbgFIMqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A045BC05BD1E;
        Tue,  9 Jun 2020 05:46:31 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C322181E;
        Tue,  9 Jun 2020 14:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706789;
        bh=YFKrkm32kVOPplzX9Ke4v6/4mOrSe77eJjI6rVHe9BY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qUqBHIMmwN2gihb/s7oE9n3dKVNLyIg+ccgR+cVU9UyfZF7khDjc0QR7jfOVT+0sw
         XNbTejYmerz9jV4AUKtvQrOLPKLHr+GNWUCjOW0CSjecaj/G85mRM+lcIOj8yXORBx
         J75Pap3RxRl2lt/pk/329smjsPRCC3liARAo7tIg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tyrel Datwyler <tyreld@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Nilesh Javali <njavali@marvell.com>,
        GR-QLogic-Storage-Upstream@marvell.com (supporter:QLOGIC QLA2XXX
        FC-SCSI DRIVER), Jiri Kosina <trivial@kernel.org>,
        linux-scsi@vger.kernel.org (open list:IBM Power Virtual FC Device
        Drivers),
        linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND
        64-BIT)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/17] drivers: scsi: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:45:59 +0100
Message-Id: <20200609124610.3445662-7-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c    | 2 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c  | 2 +-
 drivers/scsi/qla2xxx/qla_inline.h | 2 +-
 drivers/scsi/qla2xxx/qla_iocb.c   | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 635f6f9cffc4..77f4d37d5bd6 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1344,7 +1344,7 @@ static void ibmvfc_map_sg_list(struct scsi_cmnd *scmd, int nseg,
 }
 
 /**
- * ibmvfc_map_sg_data - Maps dma for a scatterlist and initializes decriptor fields
+ * ibmvfc_map_sg_data - Maps dma for a scatterlist and initializes descriptor fields
  * @scmd:		struct scsi_cmnd with the scatterlist
  * @evt:		ibmvfc event struct
  * @vfc_cmd:	vfc_cmd that contains the memory descriptor
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 44e64aa21194..a92587624c72 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -667,7 +667,7 @@ static int map_sg_list(struct scsi_cmnd *cmd, int nseg,
 }
 
 /**
- * map_sg_data: - Maps dma for a scatterlist and initializes decriptor fields
+ * map_sg_data: - Maps dma for a scatterlist and initializes descriptor fields
  * @cmd:	struct scsi_cmnd with the scatterlist
  * @srp_cmd:	srp_cmd that contains the memory descriptor
  * @dev:	device for which to map dma memory
diff --git a/drivers/scsi/qla2xxx/qla_inline.h b/drivers/scsi/qla2xxx/qla_inline.h
index 1fb6ccac07cc..861dc522723c 100644
--- a/drivers/scsi/qla2xxx/qla_inline.h
+++ b/drivers/scsi/qla2xxx/qla_inline.h
@@ -11,7 +11,7 @@
  * Continuation Type 1 IOCBs to allocate.
  *
  * @vha: HA context
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of IOCB entries needed to store @dsds.
  */
diff --git a/drivers/scsi/qla2xxx/qla_iocb.c b/drivers/scsi/qla2xxx/qla_iocb.c
index 8865c35d3421..1d3c58c5f0e2 100644
--- a/drivers/scsi/qla2xxx/qla_iocb.c
+++ b/drivers/scsi/qla2xxx/qla_iocb.c
@@ -44,7 +44,7 @@ qla2x00_get_cmd_direction(srb_t *sp)
  * qla2x00_calc_iocbs_32() - Determine number of Command Type 2 and
  * Continuation Type 0 IOCBs to allocate.
  *
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of IOCB entries needed to store @dsds.
  */
@@ -66,7 +66,7 @@ qla2x00_calc_iocbs_32(uint16_t dsds)
  * qla2x00_calc_iocbs_64() - Determine number of Command Type 3 and
  * Continuation Type 1 IOCBs to allocate.
  *
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of IOCB entries needed to store @dsds.
  */
@@ -669,7 +669,7 @@ qla24xx_build_scsi_type_6_iocbs(srb_t *sp, struct cmd_type_6 *cmd_pkt,
  * qla24xx_calc_dsd_lists() - Determine number of DSD list required
  * for Command Type 6.
  *
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of dsd list needed to store @dsds.
  */
-- 
2.25.1

