Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C439F5F6DDF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 21:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbiJFTFh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 15:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbiJFTFR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 15:05:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A2118B29
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=xWWpxzzUPL9XDB
        mOZbVt7NR6M77neuEtXnAUJ1CFWXc=; b=CO1UJjlOKMazadYSdJwTJAVL23MWks
        x8+CuwMHLWoBrDqrXqqf488zSHGdTLtDHXJt898fK0pVhSI4yfCkOKgyJ6Dusjh5
        RSrV2FietRqFUmdHvDHV/XBeXRHcHak/1XQahPdP+IRpFXSiMwO0AHpCgek2wCU+
        img6GE3DXchjQ=
Received: (qmail 1467654 invoked from network); 6 Oct 2022 21:05:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2022 21:05:06 +0200
X-UD-Smtp-Session: l3s3148p1@06EMX2LqFYoucrRL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC 5/6] mmc: renesas_sdhi: take DMA end interrupts into account
Date:   Thu,  6 Oct 2022 21:04:51 +0200
Message-Id: <20221006190452.5316-6-wsa+renesas@sang-engineering.com>
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

So far, we have been relying on access_end interrupts only to mark DMA
transfers as done implying that DMA end interrupts have occurred by then
anyhow. On some SoCs under some conditions, this turned out to be not
enough. So, we enable DMA interrupts as well and make sure that both
events, DMA irq and access_end irq, have happened before finishing the
DMA transfer.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  5 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 51 ++++++++++++++++---
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index fa88b721364c..8f96457c9739 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -54,7 +54,12 @@ struct renesas_sdhi_of_data_with_quirks {
 	const struct renesas_sdhi_quirks *quirks;
 };
 
+/* We want both end_flags to be set before we mark DMA as finished */
+#define SDHI_DMA_END_FLAG_DMA		BIT(0)
+#define SDHI_DMA_END_FLAG_ACCESS	BIT(1)
+
 struct renesas_sdhi_dma {
+	unsigned long end_flags;
 	enum dma_slave_buswidth dma_buswidth;
 	bool (*filter)(struct dma_chan *chan, void *arg);
 	void (*enable)(struct tmio_mmc_host *host, bool enable);
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 630ec1e785d6..f6d1e04a627f 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -47,7 +47,6 @@
 #define RST_RESERVED_BITS	GENMASK_ULL(31, 0)
 
 /* DM_CM_INFO1 and DM_CM_INFO1_MASK */
-#define INFO1_CLEAR		0
 #define INFO1_MASK_CLEAR	GENMASK_ULL(31, 0)
 #define INFO1_DTRANEND1		BIT(20)
 #define INFO1_DTRANEND1_OLD	BIT(17)
@@ -285,12 +284,14 @@ static void
 renesas_sdhi_internal_dmac_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 dma_irqs = INFO1_DTRANEND0 |
+			(priv->quirks && priv->quirks->old_info1_layout ?
+			INFO1_DTRANEND1_OLD : INFO1_DTRANEND1);
 
 	if (!host->chan_tx || !host->chan_rx)
 		return;
 
-	if (!enable)
-		writel(INFO1_CLEAR, host->ctl + DM_CM_INFO1);
+	writel(enable ? ~dma_irqs : INFO1_MASK_CLEAR, host->ctl + DM_CM_INFO1_MASK);
 
 	if (priv->dma_priv.enable)
 		priv->dma_priv.enable(host, enable);
@@ -311,12 +312,36 @@ renesas_sdhi_internal_dmac_abort_dma(struct tmio_mmc_host *host)
 	renesas_sdhi_internal_dmac_enable_dma(host, true);
 }
 
+static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct renesas_sdhi_dma *dma_priv = &priv->dma_priv;
+
+	u32 dma_irqs = INFO1_DTRANEND0 |
+			(priv->quirks && priv->quirks->old_info1_layout ?
+			INFO1_DTRANEND1_OLD : INFO1_DTRANEND1);
+	u32 status = readl(host->ctl + DM_CM_INFO1);
+
+	if (status & dma_irqs) {
+		writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
+		set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);
+		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags))
+			tasklet_schedule(&dma_priv->dma_complete);
+	}
+
+	return status & dma_irqs;
+}
+
 static void
 renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct renesas_sdhi_dma *dma_priv = &priv->dma_priv;
 
-	tasklet_schedule(&priv->dma_priv.dma_complete);
+	set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
+	if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
+	    host->data->error)
+		tasklet_schedule(&dma_priv->dma_complete);
 }
 
 /*
@@ -386,6 +411,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH0;
 	}
 
+	priv->dma_priv.end_flags = 0;
 	renesas_sdhi_internal_dmac_enable_dma(host, true);
 
 	/* set dma parameters */
@@ -406,11 +432,19 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
 {
 	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
+	struct renesas_sdhi *priv = host_to_priv(host);
 
 	tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
 
-	/* start the DMAC */
-	writel(DTRAN_CTRL_DM_START, host->ctl + DM_CM_DTRAN_CTRL);
+	if (!host->cmd->error) {
+		/* start the DMAC */
+		writel(DTRAN_CTRL_DM_START, host->ctl + DM_CM_DTRAN_CTRL);
+	} else {
+		/* on CMD errors, simulate DMA end immediately */
+		set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags);
+		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.end_flags))
+			tasklet_schedule(&priv->dma_priv.dma_complete);
+	}
 }
 
 static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
@@ -490,9 +524,11 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
-	/* Disable DMAC interrupts, we don't use them */
+	/* Disable DMAC interrupts initially */
 	writel(INFO1_MASK_CLEAR, host->ctl + DM_CM_INFO1_MASK);
 	writel(INFO2_MASK_CLEAR, host->ctl + DM_CM_INFO2_MASK);
+	writel(0, host->ctl + DM_CM_INFO1);
+	writel(0, host->ctl + DM_CM_INFO2);
 
 	/* Each value is set to non-zero to assume "enabling" each DMA */
 	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
@@ -524,6 +560,7 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
 	.abort = renesas_sdhi_internal_dmac_abort_dma,
 	.dataend = renesas_sdhi_internal_dmac_dataend_dma,
 	.end = renesas_sdhi_internal_dmac_end_dma,
+	.dma_irq = renesas_sdhi_internal_dmac_dma_irq,
 };
 
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
-- 
2.35.1

