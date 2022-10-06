Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C515F6DD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 21:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiJFTFZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 15:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbiJFTFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 15:05:12 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE3F13CDE
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=e1hBVcfalOBT8O
        FtEtYNAgTXpszX4FDo09PlBGNBZ9I=; b=04hxqIlRi9U0eQJlZrxKqCE7a0bL/9
        W9+YTmLxOrB9DwGrmbaOLsjQ5KfXkjdUUqH3YzYy8CJ31n7pLTMUEzqOJUerg7ZC
        wodtBB/oljFE0H9qrbb+zCEYqkfcJRNcGZOtL3Wgs+GS4omj4MbRcJmSSVnGQLoE
        6LWwU0BHwFyKc=
Received: (qmail 1467531 invoked from network); 6 Oct 2022 21:05:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2022 21:05:02 +0200
X-UD-Smtp-Session: l3s3148p1@oHnOXmLqRPcucrRL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC 1/6] mmc: renesas_sdhi: remove accessor function for internal_dmac
Date:   Thu,  6 Oct 2022 21:04:47 +0200
Message-Id: <20221006190452.5316-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
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

This accessor function does not help readability but makes it worse.
Because I soon need to read from the registers as well and don't want to
add another function like this, I chose to remove the existing one and
use the accessor directly. I also switch from writeq to writel because
no 64 bit register is actually involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 31 +++++--------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 42937596c4c4..48bea0bd75e8 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -279,13 +279,6 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, renesas_sdhi_internal_dmac_of_match);
 
-static void
-renesas_sdhi_internal_dmac_dm_write(struct tmio_mmc_host *host,
-				    int addr, u64 val)
-{
-	writeq(val, host->ctl + addr);
-}
-
 static void
 renesas_sdhi_internal_dmac_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
@@ -295,8 +288,7 @@ renesas_sdhi_internal_dmac_enable_dma(struct tmio_mmc_host *host, bool enable)
 		return;
 
 	if (!enable)
-		renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO1,
-						    INFO1_CLEAR);
+		writel(INFO1_CLEAR, host->ctl + DM_CM_INFO1);
 
 	if (priv->dma_priv.enable)
 		priv->dma_priv.enable(host, enable);
@@ -309,10 +301,8 @@ renesas_sdhi_internal_dmac_abort_dma(struct tmio_mmc_host *host)
 
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
 
-	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_RST,
-					    RST_RESERVED_BITS & ~val);
-	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_RST,
-					    RST_RESERVED_BITS | val);
+	writel(RST_RESERVED_BITS & ~val, host->ctl + DM_CM_RST);
+	writel(RST_RESERVED_BITS | val, host->ctl + DM_CM_RST);
 
 	clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
 
@@ -397,10 +387,8 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	renesas_sdhi_internal_dmac_enable_dma(host, true);
 
 	/* set dma parameters */
-	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_DTRAN_MODE,
-					    dtran_mode);
-	renesas_sdhi_internal_dmac_dm_write(host, DM_DTRAN_ADDR,
-					    sg_dma_address(sg));
+	writel(dtran_mode, host->ctl + DM_CM_DTRAN_MODE);
+	writel(sg_dma_address(sg), host->ctl + DM_DTRAN_ADDR);
 
 	host->dma_on = true;
 
@@ -420,8 +408,7 @@ static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
 	tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
 
 	/* start the DMAC */
-	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_DTRAN_CTRL,
-					    DTRAN_CTRL_DM_START);
+	writel(DTRAN_CTRL_DM_START, host->ctl + DM_CM_DTRAN_CTRL);
 }
 
 static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
@@ -502,10 +489,8 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 	struct renesas_sdhi *priv = host_to_priv(host);
 
 	/* Disable DMAC interrupts, we don't use them */
-	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO1_MASK,
-					    INFO1_MASK_CLEAR);
-	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO2_MASK,
-					    INFO2_MASK_CLEAR);
+	writel(INFO1_MASK_CLEAR, host->ctl + DM_CM_INFO1_MASK);
+	writel(INFO2_MASK_CLEAR, host->ctl + DM_CM_INFO2_MASK);
 
 	/* Each value is set to non-zero to assume "enabling" each DMA */
 	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
-- 
2.35.1

