Return-Path: <linux-renesas-soc+bounces-7332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ADF931120
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 11:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576EA281A94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C45186E52;
	Mon, 15 Jul 2024 09:23:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EED27346C;
	Mon, 15 Jul 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721035419; cv=none; b=pPJ4psWwf5HZ4fBYJdKdWXJKIYgZqCUmIcXMheQvTi4wZSGS2uSYyiFE0yEHia3njZSChCs6OZ0x7nrydS9sxesFtdiPTiGA3avrMZNqldvDD7ibUER/omUyARJbPD5NjIVH1LLhB7xRhcRtvYq5xHccLVSEvG7SQmghuBuXLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721035419; c=relaxed/simple;
	bh=mvHTXOY6FpM/32JSNw9yx0nUrNp7h1+HZmsmW24kIlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSJzMwPpje8zc4YoDo7YSJkPvYVcXyPmJ4nDk8RN4Ltk423MWvjZ7DgppCBMZ6ErL6vd3B2oZ90Yg1em0WuY7cIH53xCPCyKbY+5VBJUVIwYSsQ28qU4xiMHZGuCqjC5j+ujLSaeNN5U/hra5/cSJa71HdTQwBbQLZHFLIqQZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="215322328"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jul 2024 18:23:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EF71640165B2;
	Mon, 15 Jul 2024 18:23:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: sh: rz-ssi: Add full duplex support
Date: Mon, 15 Jul 2024 10:23:20 +0100
Message-ID: <20240715092322.119879-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add full duplex support, to support simultaneous
playback/record on the same ssi channel.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 257 ++++++++++++++++++++++++++++++------------
 1 file changed, 182 insertions(+), 75 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 9d103646973a..d0bf0487bf1b 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -52,6 +52,7 @@
 #define SSIFCR_RIE		BIT(2)
 #define SSIFCR_TFRST		BIT(1)
 #define SSIFCR_RFRST		BIT(0)
+#define SSIFCR_FIFO_RST		(SSIFCR_TFRST | SSIFCR_RFRST)
 
 #define SSIFSR_TDC_MASK		0x3f
 #define SSIFSR_TDC_SHIFT	24
@@ -130,6 +131,14 @@ struct rz_ssi_priv {
 	bool lrckp_fsync_fall;	/* LR clock polarity (SSICR.LRCKP) */
 	bool bckp_rise;	/* Bit clock polarity (SSICR.BCKP) */
 	bool dma_rt;
+
+	/* Full duplex communication support */
+	struct {
+		unsigned int rate;
+		unsigned int channels;
+		unsigned int sample_width;
+		unsigned int sample_bits;
+	} hw_params_cache;
 };
 
 static void rz_ssi_dma_complete(void *data);
@@ -208,6 +217,11 @@ static bool rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
 	return ret;
 }
 
+static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
+{
+	return strm->substream && strm->running;
+}
+
 static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 			       struct snd_pcm_substream *substream)
 {
@@ -303,13 +317,53 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	return 0;
 }
 
+static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
+{
+	int timeout;
+
+	/* Disable irqs */
+	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
+			     SSICR_RUIEN | SSICR_ROIEN, 0);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_TIE | SSIFCR_RIE, 0);
+
+	/* Clear all error flags */
+	rz_ssi_reg_mask_setl(ssi, SSISR,
+			     (SSISR_TOIRQ | SSISR_TUIRQ | SSISR_ROIRQ |
+			      SSISR_RUIRQ), 0);
+
+	/* Wait for idle */
+	timeout = 100;
+	while (--timeout) {
+		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
+			break;
+		udelay(1);
+	}
+
+	if (!timeout)
+		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+
+	/* Hold FIFOs in reset */
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0,
+			     SSIFCR_TFRST | SSIFCR_RFRST);
+}
+
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
+	is_full_duplex = rz_ssi_is_stream_running(&ssi->playback) ||
+		rz_ssi_is_stream_running(&ssi->capture);
 	ssicr = rz_ssi_reg_readl(ssi, SSICR);
-	ssifcr = rz_ssi_reg_readl(ssi, SSIFCR) & ~0xF;
+	ssifcr = rz_ssi_reg_readl(ssi, SSIFCR);
+	if (!is_full_duplex) {
+		ssifcr &= ~0xF;
+	} else {
+		rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
+		rz_ssi_set_idle(ssi);
+		ssifcr &= ~SSIFCR_FIFO_RST;
+	}
 
 	/* FIFO interrupt thresholds */
 	if (rz_ssi_is_dma_enabled(ssi))
@@ -322,10 +376,14 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	/* enable IRQ */
 	if (is_play) {
 		ssicr |= SSICR_TUIEN | SSICR_TOIEN;
-		ssifcr |= SSIFCR_TIE | SSIFCR_RFRST;
+		ssifcr |= SSIFCR_TIE;
+		if (!is_full_duplex)
+			ssifcr |= SSIFCR_RFRST;
 	} else {
 		ssicr |= SSICR_RUIEN | SSICR_ROIEN;
-		ssifcr |= SSIFCR_RIE | SSIFCR_TFRST;
+		ssifcr |= SSIFCR_RIE;
+		if (!is_full_duplex)
+			ssifcr |= SSIFCR_TFRST;
 	}
 
 	rz_ssi_reg_writel(ssi, SSICR, ssicr);
@@ -337,7 +395,11 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 			      SSISR_RUIRQ), 0);
 
 	strm->running = 1;
-	ssicr |= is_play ? SSICR_TEN : SSICR_REN;
+	if (is_full_duplex)
+		ssicr |= SSICR_TEN | SSICR_REN;
+	else
+		ssicr |= is_play ? SSICR_TEN : SSICR_REN;
+
 	rz_ssi_reg_writel(ssi, SSICR, ssicr);
 
 	return 0;
@@ -345,10 +407,12 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 
 static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	int timeout;
-
 	strm->running = 0;
 
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return 0;
+
 	/* Disable TX/RX */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
 
@@ -356,30 +420,7 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	if (rz_ssi_is_dma_enabled(ssi))
 		dmaengine_terminate_async(strm->dma_ch);
 
-	/* Disable irqs */
-	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
-			     SSICR_RUIEN | SSICR_ROIEN, 0);
-	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_TIE | SSIFCR_RIE, 0);
-
-	/* Clear all error flags */
-	rz_ssi_reg_mask_setl(ssi, SSISR,
-			     (SSISR_TOIRQ | SSISR_TUIRQ | SSISR_ROIRQ |
-			      SSISR_RUIRQ), 0);
-
-	/* Wait for idle */
-	timeout = 100;
-	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
-			break;
-		udelay(1);
-	}
-
-	if (!timeout)
-		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
-
-	/* Hold FIFOs in reset */
-	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0,
-			     SSIFCR_TFRST | SSIFCR_RFRST);
+	rz_ssi_set_idle(ssi);
 
 	return 0;
 }
@@ -512,66 +553,90 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 
 static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 {
-	struct rz_ssi_stream *strm = NULL;
+	struct rz_ssi_stream *strm_playback = NULL;
+	struct rz_ssi_stream *strm_capture = NULL;
 	struct rz_ssi_priv *ssi = data;
 	u32 ssisr = rz_ssi_reg_readl(ssi, SSISR);
 
 	if (ssi->playback.substream)
-		strm = &ssi->playback;
-	else if (ssi->capture.substream)
-		strm = &ssi->capture;
-	else
+		strm_playback = &ssi->playback;
+	if (ssi->capture.substream)
+		strm_capture = &ssi->capture;
+
+	if (!strm_playback && !strm_capture)
 		return IRQ_HANDLED; /* Left over TX/RX interrupt */
 
 	if (irq == ssi->irq_int) { /* error or idle */
-		if (ssisr & SSISR_TUIRQ)
-			strm->uerr_num++;
-		if (ssisr & SSISR_TOIRQ)
-			strm->oerr_num++;
-		if (ssisr & SSISR_RUIRQ)
-			strm->uerr_num++;
-		if (ssisr & SSISR_ROIRQ)
-			strm->oerr_num++;
-
-		if (ssisr & (SSISR_TUIRQ | SSISR_TOIRQ | SSISR_RUIRQ |
-			     SSISR_ROIRQ)) {
-			/* Error handling */
-			/* You must reset (stop/restart) after each interrupt */
-			rz_ssi_stop(ssi, strm);
-
-			/* Clear all flags */
-			rz_ssi_reg_mask_setl(ssi, SSISR, SSISR_TOIRQ |
-					     SSISR_TUIRQ | SSISR_ROIRQ |
-					     SSISR_RUIRQ, 0);
-
-			/* Add/remove more data */
-			strm->transfer(ssi, strm);
-
-			/* Resume */
-			rz_ssi_start(ssi, strm);
+		bool is_stopped = false;
+		int i, count;
+
+		if (rz_ssi_is_dma_enabled(ssi))
+			count = 4;
+		else
+			count = 1;
+
+		if (ssisr & (SSISR_RUIRQ | SSISR_ROIRQ | SSISR_TUIRQ | SSISR_TOIRQ))
+			is_stopped = true;
+
+		if (ssi->capture.substream && is_stopped) {
+			if (ssisr & SSISR_RUIRQ)
+				strm_capture->uerr_num++;
+			if (ssisr & SSISR_ROIRQ)
+				strm_capture->oerr_num++;
+
+			rz_ssi_stop(ssi, strm_capture);
 		}
+
+		if (ssi->playback.substream && is_stopped) {
+			if (ssisr & SSISR_TUIRQ)
+				strm_playback->uerr_num++;
+			if (ssisr & SSISR_TOIRQ)
+				strm_playback->oerr_num++;
+
+			rz_ssi_stop(ssi, strm_playback);
+		}
+
+		/* Clear all flags */
+		rz_ssi_reg_mask_setl(ssi, SSISR, SSISR_TOIRQ | SSISR_TUIRQ |
+				     SSISR_ROIRQ | SSISR_RUIRQ, 0);
+
+		/* Add/remove more data */
+		if (ssi->capture.substream && is_stopped) {
+			for (i = 0; i < count; i++)
+				strm_capture->transfer(ssi, strm_capture);
+		}
+
+		if (ssi->playback.substream && is_stopped) {
+			for (i = 0; i < count; i++)
+				strm_playback->transfer(ssi, strm_playback);
+		}
+
+		/* Resume */
+		if (ssi->playback.substream && is_stopped)
+			rz_ssi_start(ssi, &ssi->playback);
+		if (ssi->capture.substream && is_stopped)
+			rz_ssi_start(ssi, &ssi->capture);
 	}
 
-	if (!strm->running)
+	if (!rz_ssi_is_stream_running(&ssi->playback) &&
+	    !rz_ssi_is_stream_running(&ssi->capture))
 		return IRQ_HANDLED;
 
 	/* tx data empty */
-	if (irq == ssi->irq_tx)
-		strm->transfer(ssi, &ssi->playback);
+	if (irq == ssi->irq_tx && rz_ssi_is_stream_running(&ssi->playback))
+		strm_playback->transfer(ssi, &ssi->playback);
 
 	/* rx data full */
-	if (irq == ssi->irq_rx) {
-		strm->transfer(ssi, &ssi->capture);
+	if (irq == ssi->irq_rx && rz_ssi_is_stream_running(&ssi->capture)) {
+		strm_capture->transfer(ssi, &ssi->capture);
 		rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
 	}
 
 	if (irq == ssi->irq_rt) {
-		struct snd_pcm_substream *substream = strm->substream;
-
-		if (rz_ssi_stream_is_play(ssi, substream)) {
-			strm->transfer(ssi, &ssi->playback);
+		if (ssi->playback.substream) {
+			strm_playback->transfer(ssi, &ssi->playback);
 		} else {
-			strm->transfer(ssi, &ssi->capture);
+			strm_capture->transfer(ssi, &ssi->capture);
 			rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
 		}
 	}
@@ -731,9 +796,12 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		/* Soft Reset */
-		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
-		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
-		udelay(5);
+		if (!rz_ssi_is_stream_running(&ssi->playback) &&
+		    !rz_ssi_is_stream_running(&ssi->capture)) {
+			rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
+			rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
+			udelay(5);
+		}
 
 		rz_ssi_stream_init(strm, substream);
 
@@ -824,14 +892,41 @@ static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static bool rz_ssi_is_valid_hw_params(struct rz_ssi_priv *ssi, unsigned int rate,
+				      unsigned int channels,
+				      unsigned int sample_width,
+				      unsigned int sample_bits)
+{
+	if (ssi->hw_params_cache.rate != rate ||
+	    ssi->hw_params_cache.channels != channels ||
+	    ssi->hw_params_cache.sample_width != sample_width ||
+	    ssi->hw_params_cache.sample_bits != sample_bits)
+		return false;
+
+	return true;
+}
+
+static void rz_ssi_cache_hw_params(struct rz_ssi_priv *ssi, unsigned int rate,
+				   unsigned int channels,
+				   unsigned int sample_width,
+				   unsigned int sample_bits)
+{
+	ssi->hw_params_cache.rate = rate;
+	ssi->hw_params_cache.channels = channels;
+	ssi->hw_params_cache.sample_width = sample_width;
+	ssi->hw_params_cache.sample_bits = sample_bits;
+}
+
 static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 	unsigned int sample_bits = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
 	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
 
 	if (sample_bits != 16) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
@@ -845,8 +940,20 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	return rz_ssi_clk_setup(ssi, params_rate(params),
-				params_channels(params));
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture)) {
+		if (rz_ssi_is_valid_hw_params(ssi, rate, channels,
+					      strm->sample_width, sample_bits))
+			return 0;
+
+		dev_err(ssi->dev, "Full duplex needs same HW params\n");
+		return -EINVAL;
+	}
+
+	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
+			       sample_bits);
+
+	return rz_ssi_clk_setup(ssi, rate, channels);
 }
 
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
-- 
2.43.0


