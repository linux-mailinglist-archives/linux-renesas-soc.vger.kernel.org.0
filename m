Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B52C616320
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 13:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiKBMyl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 08:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiKBMyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 08:54:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FFCF27FC3
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=6Qz3PtSDg94klk
        cWL6XHq2yQoPRPCPW8xo9RNfPzFjE=; b=0crpFcQplGNlTJMxVg9t/YBUsUYR74
        xxwpbQkuHqnJWsIbryshN9cHBtuzDzIq2Icy4Ao30LaoaPezW8NJzQHhDLvu7aLl
        XMS6C3iUrCDnRK8WRkgTbzZG4Bl0zIGgLnLgmOnjSkzLNbzoaZELvCWLpwhTwfvb
        +brKXIG69AJ+s=
Received: (qmail 2206667 invoked from network); 2 Nov 2022 13:54:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2022 13:54:37 +0100
X-UD-Smtp-Session: l3s3148p1@FgrNV3zsx8wucrSg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/2] mmc: tmio: remove tmio_mmc_k(un)map_atomic helpers
Date:   Wed,  2 Nov 2022 13:54:29 +0100
Message-Id: <20221102125430.28466-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
References: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After a8402aed8ca5 ("mmc: tmio_mmc_core: Remove
local_irq_{save,restore}() around k[un]map_atomic()") and ac91578a6812
("mmc: tmio_mmc_core: Replace kmap_atomic() with kmap_local_page()"),
the helpers contain just a single call. Putting it directly in the code
makes it actually more readable. More so, because we now avoid the
'offset' calculation when mapping/unmapping and just use it when we need
it in the copy routines.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c |  6 +++---
 drivers/mmc/host/tmio_mmc.h              | 11 -----------
 drivers/mmc/host/tmio_mmc_core.c         | 13 +++++++------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index e9cc6c15d229..c4545cb143dd 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -254,11 +254,11 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
 
 	/* The only sg element can be unaligned, use our bounce buffer then */
 	if (!aligned) {
-		void *sg_vaddr = tmio_mmc_kmap_atomic(sg);
+		void *sg_vaddr = kmap_local_page(sg_page(sg));
 
 		sg_init_one(&host->bounce_sg, host->bounce_buf, sg->length);
-		memcpy(host->bounce_buf, sg_vaddr, host->bounce_sg.length);
-		tmio_mmc_kunmap_atomic(sg, sg_vaddr);
+		memcpy(host->bounce_buf, sg_vaddr + sg->offset, host->bounce_sg.length);
+		kunmap_local(sg_vaddr);
 		host->sg_ptr = &host->bounce_sg;
 		sg = host->sg_ptr;
 	}
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index e36ff80108e6..df6b3dccf96a 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -204,17 +204,6 @@ void tmio_mmc_enable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
 void tmio_mmc_disable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
 irqreturn_t tmio_mmc_irq(int irq, void *devid);
 
-static inline char *tmio_mmc_kmap_atomic(struct scatterlist *sg)
-{
-	return kmap_local_page(sg_page(sg)) + sg->offset;
-}
-
-static inline void tmio_mmc_kunmap_atomic(struct scatterlist *sg,
-					  void *virt)
-{
-	kunmap_local(virt - sg->offset);
-}
-
 #ifdef CONFIG_PM
 int tmio_mmc_host_runtime_suspend(struct device *dev);
 int tmio_mmc_host_runtime_resume(struct device *dev);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 6d50c0dd53fe..6d8597f1d22d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -421,8 +421,8 @@ static void tmio_mmc_pio_irq(struct tmio_mmc_host *host)
 		return;
 	}
 
-	sg_virt = tmio_mmc_kmap_atomic(host->sg_ptr);
-	buf = (unsigned short *)(sg_virt + host->sg_off);
+	sg_virt = kmap_local_page(sg_page(host->sg_ptr));
+	buf = (unsigned short *)(sg_virt + host->sg_ptr->offset + host->sg_off);
 
 	count = host->sg_ptr->length - host->sg_off;
 	if (count > data->blksz)
@@ -436,7 +436,7 @@ static void tmio_mmc_pio_irq(struct tmio_mmc_host *host)
 
 	host->sg_off += count;
 
-	tmio_mmc_kunmap_atomic(host->sg_ptr, sg_virt);
+	kunmap_local(sg_virt);
 
 	if (host->sg_off == host->sg_ptr->length)
 		tmio_mmc_next_sg(host);
@@ -445,10 +445,11 @@ static void tmio_mmc_pio_irq(struct tmio_mmc_host *host)
 static void tmio_mmc_check_bounce_buffer(struct tmio_mmc_host *host)
 {
 	if (host->sg_ptr == &host->bounce_sg) {
-		void *sg_vaddr = tmio_mmc_kmap_atomic(host->sg_orig);
+		void *sg_virt = kmap_local_page(sg_page(host->sg_orig));
 
-		memcpy(sg_vaddr, host->bounce_buf, host->bounce_sg.length);
-		tmio_mmc_kunmap_atomic(host->sg_orig, sg_vaddr);
+		memcpy(sg_virt + host->sg_orig->offset, host->bounce_buf,
+		       host->bounce_sg.length);
+		kunmap_local(sg_virt);
 	}
 }
 
-- 
2.35.1

