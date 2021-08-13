Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456883EB337
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 11:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbhHMJMo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 05:12:44 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48550 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238739AbhHMJMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 05:12:44 -0400
X-IronPort-AV: E=Sophos;i="5.84,318,1620658800"; 
   d="scan'208";a="90544465"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Aug 2021 18:12:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1A2714228B65;
        Fri, 13 Aug 2021 18:12:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 3/3] ASoC: sh: rz-ssi: Add SSI DMAC support
Date:   Fri, 13 Aug 2021 10:11:56 +0100
Message-Id: <20210813091156.10700-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
References: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SSI DMAC support to RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note:-
 This patch has run time dependency on [1]
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210806095322.2326-4-biju.das.jz@bp.renesas.com/

v4->v5
 * updated ssi_start functions with setting fifo thresholds
   and ssi_stop function with cancel all dma txn.
v3->v4:
 * Updated the subject line as per style for the subsystem.
 * started using dmaengine_terminate_async instead of 
   dmaengine_terminate_sync as it is called from atomic context.
v2->v3:
 * Removed the passing legacy channel configuration parameters from dmaengine_slave_config function
 * started using dma_request_chan instead of deprecated dma_request_slave_channel
v1->v2:
 * No change
---
 sound/soc/sh/rz-ssi.c | 256 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 224 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 615fa81f061e..ea8d33ede5d2 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/clk.h>
+#include <linux/dmaengine.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -86,6 +87,7 @@ struct rz_ssi_stream {
 	struct rz_ssi_priv *priv;
 	struct snd_pcm_substream *substream;
 	int fifo_sample_size;	/* sample capacity of SSI FIFO */
+	int dma_buffer_pos;	/* The address for the next DMA descriptor */
 	int period_counter;	/* for keeping track of periods transferred */
 	int sample_width;
 	int buffer_pos;		/* current frame position in the buffer */
@@ -94,6 +96,8 @@ struct rz_ssi_stream {
 	int uerr_num;
 	int oerr_num;
 
+	struct dma_chan *dma_ch;
+
 	int (*transfer)(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm);
 };
 
@@ -105,6 +109,7 @@ struct rz_ssi_priv {
 	struct clk *sfr_clk;
 	struct clk *clk;
 
+	phys_addr_t phys;
 	int irq_int;
 	int irq_tx;
 	int irq_rx;
@@ -128,8 +133,11 @@ struct rz_ssi_priv {
 
 	bool lrckp_fsync_fall;	/* LR clock polarity (SSICR.LRCKP) */
 	bool bckp_rise;	/* Bit clock polarity (SSICR.BCKP) */
+	bool dma_rt;
 };
 
+static void rz_ssi_dma_complete(void *data);
+
 static void rz_ssi_reg_writel(struct rz_ssi_priv *priv, uint reg, u32 data)
 {
 	writel(data, (priv->base + reg));
@@ -175,6 +183,11 @@ rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 	return stream;
 }
 
+static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
+{
+	return (ssi->playback.dma_ch || ssi->capture.dma_ch);
+}
+
 static int rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
 				  struct rz_ssi_stream *strm)
 {
@@ -196,6 +209,7 @@ static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
 
 	strm->substream = substream;
 	strm->sample_width = samples_to_bytes(runtime, 1);
+	strm->dma_buffer_pos = 0;
 	strm->period_counter = 0;
 	strm->buffer_pos = 0;
 
@@ -297,9 +311,12 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	ssifcr = rz_ssi_reg_readl(ssi, SSIFCR) & ~0xF;
 
 	/* FIFO interrupt thresholds */
-	rz_ssi_reg_writel(ssi, SSISCR,
-			  SSISCR_TDES(strm->fifo_sample_size / 2 - 1) |
-			  SSISCR_RDFS(0));
+	if (rz_ssi_is_dma_enabled(ssi))
+		rz_ssi_reg_writel(ssi, SSISCR, 0);
+	else
+		rz_ssi_reg_writel(ssi, SSISCR,
+				  SSISCR_TDES(strm->fifo_sample_size / 2 - 1) |
+				  SSISCR_RDFS(0));
 
 	/* enable IRQ */
 	if (is_play) {
@@ -334,6 +351,10 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	/* Disable TX/RX */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
 
+	/* Cancel all remaining DMA transactions */
+	if (rz_ssi_is_dma_enabled(ssi))
+		dmaengine_terminate_async(strm->dma_ch);
+
 	/* Disable irqs */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
 			     SSICR_RUIEN | SSICR_ROIEN, 0);
@@ -549,12 +570,143 @@ static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
+				   struct dma_chan *dma_ch, bool is_play)
+{
+	struct dma_slave_config cfg;
+
+	memset(&cfg, 0, sizeof(cfg));
+
+	cfg.direction = is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	cfg.dst_addr = ssi->phys + SSIFTDR;
+	cfg.src_addr = ssi->phys + SSIFRDR;
+	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+
+	return dmaengine_slave_config(dma_ch, &cfg);
+}
+
+static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
+			       struct rz_ssi_stream *strm)
+{
+	struct snd_pcm_substream *substream = strm->substream;
+	struct dma_async_tx_descriptor *desc;
+	struct snd_pcm_runtime *runtime;
+	enum dma_transfer_direction dir;
+	u32 dma_paddr, dma_size;
+	int amount;
+
+	if (!rz_ssi_stream_is_valid(ssi, strm))
+		return -EINVAL;
+
+	runtime = substream->runtime;
+	if (runtime->status->state == SNDRV_PCM_STATE_DRAINING)
+		/*
+		 * Stream is ending, so do not queue up any more DMA
+		 * transfers otherwise we play partial sound clips
+		 * because we can't shut off the DMA quick enough.
+		 */
+		return 0;
+
+	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+
+	/* Always transfer 1 period */
+	amount = runtime->period_size;
+
+	/* DMA physical address and size */
+	dma_paddr = runtime->dma_addr + frames_to_bytes(runtime,
+							strm->dma_buffer_pos);
+	dma_size = frames_to_bytes(runtime, amount);
+	desc = dmaengine_prep_slave_single(strm->dma_ch, dma_paddr, dma_size,
+					   dir,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(ssi->dev, "dmaengine_prep_slave_single() fail\n");
+		return -ENOMEM;
+	}
+
+	desc->callback = rz_ssi_dma_complete;
+	desc->callback_param = strm;
+
+	if (dmaengine_submit(desc) < 0) {
+		dev_err(ssi->dev, "dmaengine_submit() fail\n");
+		return -EIO;
+	}
+
+	/* Update DMA pointer */
+	strm->dma_buffer_pos += amount;
+	if (strm->dma_buffer_pos >= runtime->buffer_size)
+		strm->dma_buffer_pos = 0;
+
+	/* Start DMA */
+	dma_async_issue_pending(strm->dma_ch);
+
+	return 0;
+}
+
+static void rz_ssi_dma_complete(void *data)
+{
+	struct rz_ssi_stream *strm = (struct rz_ssi_stream *)data;
+
+	if (!strm->running || !strm->substream || !strm->substream->runtime)
+		return;
+
+	/* Note that next DMA transaction has probably already started */
+	rz_ssi_pointer_update(strm, strm->substream->runtime->period_size);
+
+	/* Queue up another DMA transaction */
+	rz_ssi_dma_transfer(strm->priv, strm);
+}
+
+static void rz_ssi_release_dma_channels(struct rz_ssi_priv *ssi)
+{
+	if (ssi->playback.dma_ch) {
+		dma_release_channel(ssi->playback.dma_ch);
+		ssi->playback.dma_ch = NULL;
+		if (ssi->dma_rt)
+			ssi->dma_rt = false;
+	}
+
+	if (ssi->capture.dma_ch) {
+		dma_release_channel(ssi->capture.dma_ch);
+		ssi->capture.dma_ch = NULL;
+	}
+}
+
+static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
+{
+	ssi->playback.dma_ch = dma_request_chan(dev, "tx");
+	ssi->capture.dma_ch = dma_request_chan(dev, "rx");
+	if (!ssi->playback.dma_ch && !ssi->capture.dma_ch) {
+		ssi->playback.dma_ch = dma_request_chan(dev, "rt");
+		if (!ssi->playback.dma_ch)
+			goto no_dma;
+
+		ssi->dma_rt = true;
+	}
+
+	if (ssi->playback.dma_ch &&
+	    (rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch, true) < 0))
+		goto no_dma;
+
+	if (ssi->capture.dma_ch &&
+	    (rz_ssi_dma_slave_config(ssi, ssi->capture.dma_ch, false) < 0))
+		goto no_dma;
+
+	return 0;
+
+no_dma:
+	rz_ssi_release_dma_channels(ssi);
+
+	return -ENODEV;
+}
+
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
 	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
-	int ret = 0;
+	int ret = 0, i, num_transfer = 1;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -567,9 +719,29 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret)
 			goto done;
 
-		ret = strm->transfer(ssi, strm);
-		if (ret)
-			goto done;
+		if (ssi->dma_rt) {
+			bool is_playback;
+
+			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
+						      is_playback);
+			/* Fallback to pio */
+			if (ret < 0) {
+				ssi->playback.transfer = rz_ssi_pio_send;
+				ssi->capture.transfer = rz_ssi_pio_recv;
+				rz_ssi_release_dma_channels(ssi);
+			}
+		}
+
+		/* For DMA, queue up multiple DMA descriptors */
+		if (rz_ssi_is_dma_enabled(ssi))
+			num_transfer = 4;
+
+		for (i = 0; i < num_transfer; i++) {
+			ret = strm->transfer(ssi, strm);
+			if (ret)
+				goto done;
+		}
 
 		ret = rz_ssi_start(ssi, strm);
 		break;
@@ -737,6 +909,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 {
 	struct rz_ssi_priv *ssi;
 	struct clk *audio_clk;
+	struct resource *res;
 	int ret;
 
 	ssi = devm_kzalloc(&pdev->dev, sizeof(*ssi), GFP_KERNEL);
@@ -745,10 +918,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
-	ssi->base = devm_platform_ioremap_resource(pdev, 0);
+	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
 		return PTR_ERR(ssi->base);
 
+	ssi->phys = res->start;
 	ssi->clk = devm_clk_get(&pdev->dev, "ssi");
 	if (IS_ERR(ssi->clk))
 		return PTR_ERR(ssi->clk);
@@ -775,8 +949,18 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	ssi->audio_mck = ssi->audio_clk_1 ? ssi->audio_clk_1 : ssi->audio_clk_2;
 
-	ssi->playback.transfer = rz_ssi_pio_send;
-	ssi->capture.transfer = rz_ssi_pio_recv;
+	/* Detect DMA support */
+	ret = rz_ssi_dma_request(ssi, &pdev->dev);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "DMA not available, using PIO\n");
+		ssi->playback.transfer = rz_ssi_pio_send;
+		ssi->capture.transfer = rz_ssi_pio_recv;
+	} else {
+		dev_info(&pdev->dev, "DMA enabled");
+		ssi->playback.transfer = rz_ssi_dma_transfer;
+		ssi->capture.transfer = rz_ssi_dma_transfer;
+	}
+
 	ssi->playback.priv = ssi;
 	ssi->capture.priv = ssi;
 
@@ -792,28 +976,32 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "irq request error (int_req)\n");
 
-	/* Tx and Rx interrupts (pio only) */
-	ssi->irq_tx = platform_get_irq_byname(pdev, "dma_tx");
-	if (ssi->irq_tx < 0)
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Unable to get SSI dma_tx IRQ\n");
-
-	ret = devm_request_irq(&pdev->dev, ssi->irq_tx, &rz_ssi_interrupt, 0,
-			       dev_name(&pdev->dev), ssi);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "irq request error (dma_tx)\n");
-
-	ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
-	if (ssi->irq_rx < 0)
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Unable to get SSI dma_rx IRQ\n");
-
-	ret = devm_request_irq(&pdev->dev, ssi->irq_rx, &rz_ssi_interrupt, 0,
-			       dev_name(&pdev->dev), ssi);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "irq request error (dma_rx)\n");
+	if (!rz_ssi_is_dma_enabled(ssi)) {
+		/* Tx and Rx interrupts (pio only) */
+		ssi->irq_tx = platform_get_irq_byname(pdev, "dma_tx");
+		if (ssi->irq_tx < 0)
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unable to get SSI dma_tx IRQ\n");
+
+		ret = devm_request_irq(&pdev->dev, ssi->irq_tx,
+				       &rz_ssi_interrupt, 0,
+				       dev_name(&pdev->dev), ssi);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "irq request error (dma_tx)\n");
+
+		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
+		if (ssi->irq_rx < 0)
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unable to get SSI dma_rx IRQ\n");
+
+		ret = devm_request_irq(&pdev->dev, ssi->irq_rx,
+				       &rz_ssi_interrupt, 0,
+				       dev_name(&pdev->dev), ssi);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "irq request error (dma_rx)\n");
+	}
 
 	ssi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(ssi->rstc))
@@ -829,6 +1017,8 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      rz_ssi_soc_dai,
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
+		rz_ssi_release_dma_channels(ssi);
+
 		pm_runtime_put(ssi->dev);
 		pm_runtime_disable(ssi->dev);
 		reset_control_assert(ssi->rstc);
@@ -842,6 +1032,8 @@ static int rz_ssi_remove(struct platform_device *pdev)
 {
 	struct rz_ssi_priv *ssi = dev_get_drvdata(&pdev->dev);
 
+	rz_ssi_release_dma_channels(ssi);
+
 	pm_runtime_put(ssi->dev);
 	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
-- 
2.17.1

