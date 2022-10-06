Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD59E5F6DE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 21:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiJFTFi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 15:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbiJFTFR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 15:05:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B231A229
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ndzch74S9g6YCm
        jM+2YKJIkdu+RHkMspgXhcxGqN5Ic=; b=OY88cRfARuVhGMNDwxvfzKqJrmZ6Tg
        /i0gVH447vcm8A/Jt268Uj2BC+7ZIe9vhuI/drQdRNY5bCAMNXoUhMhn+7sfFyWb
        VViQoPb7XRkiYX8uBs/EIutyC02i+hPav6v/MwRIkSsa80rI59EYl3fDlp0v1BaX
        +XVkH1DxPA/mM=
Received: (qmail 1467687 invoked from network); 6 Oct 2022 21:05:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2022 21:05:07 +0200
X-UD-Smtp-Session: l3s3148p1@dRMcX2LqrIgucrRL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 6/6] DEBUG mmc: renesas_sdhi: debug end_flags for DMA
Date:   Thu,  6 Oct 2022 21:04:52 +0200
Message-Id: <20221006190452.5316-7-wsa+renesas@sang-engineering.com>
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

Not for upstream! With these trace_printks, one can verify that DMA is
only finished once both end_flags are set. The order in which they are
set does not matter. Also, cases when CMD or DATA have errors still work

Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index f6d1e04a627f..ac3983aca275 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -325,6 +325,7 @@ static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
 	if (status & dma_irqs) {
 		writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
 		set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);
+trace_printk("DMA end\n");
 		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags))
 			tasklet_schedule(&dma_priv->dma_complete);
 	}
@@ -339,6 +340,7 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
 	struct renesas_sdhi_dma *dma_priv = &priv->dma_priv;
 
 	set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
+trace_printk("Access end: %d\n", host->data->error);
 	if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
 	    host->data->error)
 		tasklet_schedule(&dma_priv->dma_complete);
@@ -442,6 +444,7 @@ static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
 	} else {
 		/* on CMD errors, simulate DMA end immediately */
 		set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags);
+trace_printk("Simulated DMA end\n");
 		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.end_flags))
 			tasklet_schedule(&priv->dma_priv.dma_complete);
 	}
@@ -477,6 +480,7 @@ static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
 {
 	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
 
+trace_printk("Tasklet\n");
 	spin_lock_irq(&host->lock);
 	if (!renesas_sdhi_internal_dmac_complete(host))
 		goto out;
-- 
2.35.1

