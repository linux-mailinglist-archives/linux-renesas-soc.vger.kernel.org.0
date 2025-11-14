Return-Path: <linux-renesas-soc+bounces-24624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3BC5BE09
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1DB635D46F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25572FB62A;
	Fri, 14 Nov 2025 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbY4UR20"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715C2F9DBC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107144; cv=none; b=Ojr7G18ggxZOTrfZikD7uKBgoV27mnZfoZ/kWFIwFxYsrx91NIQQwbNuCsdERjntoVL5Ik9cA0DtKygYa+GheY0GJdtkBsYVg3gh+GpjFp9dQjLWizFy5qZwein1GJ7Ij6fWUw7h/YzcFrPb1EBZHQrNymfU74vA713fCqhXJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107144; c=relaxed/simple;
	bh=cFLV533h4O3rO3j2a2nEJRzLpD/2ov1h5vOs874CNdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZ4hWg1wEO75RgeSg3sLNfTXG/bRUknaYAaQub+KEemjc5+/euy0oxXFenwXd/KykjSFJQP2rBuT+W1wZpaYm53yozBXckK3j4jySOoCX54lidjWxsJ4+/7PDMFLe2kHrO3N8gSvgTRF1D6m4PKFIJpy/sOe659ahBF5AeQ+AH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbY4UR20; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47789cd2083so12225535e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107141; x=1763711941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkzCeEb3navO40uJNEmomf2mfxM1QxS5KFNp5J+6KA4=;
        b=UbY4UR20BV5UEFH5beN+v58ejsl7IQrKY6Eq8OAIpGPJSDv1ZBrXleVOvWRSqARQ0v
         BQukVnxSOISmtME4RuecwXIvlBlUmRstWmOOhW/H6CEkNxFNmy4oB+fXK6hwdoCUISAW
         8zaBxXKfsKQUh0RnGfCHGNBdEOdT3oqILqMavQ96NxCtbujAqp1DMbSBA9aGp90Be3sQ
         NHPhxI2d0MLAJDp1TeRWvrg8qiqkWcNzIiQiX5/T/6VCKXumcS0gAP7rwJhPsvPPSkqP
         hU9wQyAVHTZr3ETH1FjUjAKn7wjRTxFLaDK8kzYVYrR+a8P2jNgbu3R+bdCycYGKpE4e
         oxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107141; x=1763711941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkzCeEb3navO40uJNEmomf2mfxM1QxS5KFNp5J+6KA4=;
        b=kIqs/PF21m39WWBjEamWdOYeuHhUJukzogL0HXzqpOsCEBHLsWquoHzKdtXvQqprBt
         ZbAIrlPORv36wt0DhgMYcC4QQxA2iQg8J1XmG2VXkchbadIwNLw+WTKvyYN12aJv5Rme
         O7glJxrwDzOleu5BB7uUXw+qjQ13w4+VW7WXvgPAO6XxYFLqcp7sFIJ+DIvaH/Wod3pG
         BMMbl1Vmrb/kISyJt68MR3kkldcBphpnZNaBIu4llZdew5b61bt/iRB+1n6IRrAqBy/E
         MLuCirYeRdEAM5n1mnuA2z0RcRVBO/E4vw4tsILj3JpLFqhJMn8CxTDSiQdCHAcPN0I+
         671A==
X-Forwarded-Encrypted: i=1; AJvYcCWCcL1q9ZUMr1gNlodTSTu5oKzCVcJRjF62exJl9Vfb4p+XwkzZtJLtL8HqL/bHUH5nZrEn/szT9Ii27UYbnnJtfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86C4bZO8Qdj/jozDXjBN8J8OxuhjbFEQeaClvuf2ZjriNDqZa
	wGtRDnyIOLc19VSjwh10wTsdyt4qXEsZLReMW74lC9OxDjvuP4GKSw2l
X-Gm-Gg: ASbGncu8E3DD/AEIP5dch2kT99OuP5dVfwJHRqvf8/E1igqRdOZld/Ch0kvyZFUJp9F
	wiO7ML5CxmWU/mgZvdlbygC/0SECfT1po+nUe/wMJiTwgx9SwJDz3COq2A8dQiM6xIzIxtAKWs8
	ehrDvtHtHN8nHvDzYZPsk40RwiT41kdw50f4X8bzToyVodW2bl0bCtq4om0bViv5Q+xFFd6oSho
	RQJ8ZCMGCOOfNx11z9jus6e4E5+VrY3Zpfx25rDBrQFq+hZLPbZ1028T9PMdn76QNFJrzClp2qJ
	27XtmhymEcXDQvAs/uYGF6cS+ew+SCakORDSHZsV1mIO+HwkR7dZKWaxkh4i14jxlL0WmQSXQOQ
	d2yeiXZwNLanGA0OoNt5MdZBoUBsdouWWETpTDG79njr5pWqaQaK6Af7fLgiy6eH/kgsf6RiB8J
	+tbMgV7XtUk+EMCGLUQOHjmU9Ttg9RJU9nwmzjnkXVraIe0bGzmoSekg7RJDZkG38VjssUQ8Lf0
	gKExlDpyzCP5fUx
X-Google-Smtp-Source: AGHT+IEVkGZ6INx5GNdqNHodG0mme/hMs8mtdPy04E7Q4DZtbZ697iy8gTURwupoXOgMmgDqFRcb6Q==
X-Received: by 2002:a05:600c:a04:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4778fe9b384mr19462065e9.19.1763107141038;
        Thu, 13 Nov 2025 23:59:01 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:59:00 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/5] ASoC: renesas: rz-ssi: Add support for 24 bits sample width
Date: Fri, 14 Nov 2025 07:58:51 +0000
Message-ID: <20251114075856.4751-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for 24 bits sample format width for RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated rz_ssi_clk_setup() to make ssicr assignment in single line for
   24-bit sample width.
 * Updated rz_ssi_dma_slave_config() to check for 16-bit sample width,
   that will allow us to support 32-bit smaple width later without any
   code change.
---
 sound/soc/renesas/rz-ssi.c | 75 +++++++++++++++++++++++++++++---------
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 55aefff8857d..3ec7c9875b43 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -38,6 +38,7 @@
 #define SSICR_MST		BIT(14)
 #define SSICR_BCKP		BIT(13)
 #define SSICR_LRCKP		BIT(12)
+#define SSICR_PDTA		BIT(9)
 #define SSICR_CKDV(x)		(((x) & 0xf) << 4)
 #define SSICR_TEN		BIT(1)
 #define SSICR_REN		BIT(0)
@@ -74,7 +75,7 @@
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
 #define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
-#define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
+#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
 #define SSI_FIFO_DEPTH		32
@@ -294,11 +295,24 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	}
 
 	/*
-	 * DWL: Data Word Length = 16 bits
+	 * DWL: Data Word Length = {16, 24} bits
 	 * SWL: System Word Length = 32 bits
 	 */
 	ssicr |= SSICR_CKDV(clk_ckdv);
-	ssicr |= SSICR_DWL(1) | SSICR_SWL(3);
+	switch (ssi->hw_params_cache.sample_width) {
+	case 16:
+		ssicr |= SSICR_DWL(1);
+		break;
+	case 24:
+		ssicr |= SSICR_DWL(5) | SSICR_PDTA;
+		break;
+	default:
+		dev_err(ssi->dev, "Not support %u data width",
+			ssi->hw_params_cache.sample_width);
+		return -EINVAL;
+	}
+
+	ssicr |= SSICR_SWL(3);
 	rz_ssi_reg_writel(ssi, SSICR, ssicr);
 	rz_ssi_reg_writel(ssi, SSIFCR, SSIFCR_AUCKE | SSIFCR_FIFO_RST);
 
@@ -455,7 +469,6 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	struct snd_pcm_substream *substream = strm->substream;
 	struct snd_pcm_runtime *runtime;
-	u16 *buf;
 	int fifo_samples;
 	int frames_left;
 	int samples;
@@ -490,12 +503,23 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 			break;
 
 		/* calculate new buffer index */
-		buf = (u16 *)runtime->dma_area;
-		buf += strm->buffer_pos * runtime->channels;
+		if (ssi->hw_params_cache.sample_width == 16) {
+			u16 *buf;
 
-		/* Note, only supports 16-bit samples */
-		for (i = 0; i < samples; i++)
-			*buf++ = (u16)(rz_ssi_reg_readl(ssi, SSIFRDR) >> 16);
+			buf = (u16 *)runtime->dma_area;
+			buf += strm->buffer_pos * runtime->channels;
+
+			for (i = 0; i < samples; i++)
+				*buf++ = (u16)(rz_ssi_reg_readl(ssi, SSIFRDR) >> 16);
+		} else {
+			u32 *buf;
+
+			buf = (u32 *)runtime->dma_area;
+			buf += strm->buffer_pos * runtime->channels;
+
+			for (i = 0; i < samples; i++)
+				*buf++ = rz_ssi_reg_readl(ssi, SSIFRDR);
+		}
 
 		rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
 		rz_ssi_pointer_update(strm, samples / runtime->channels);
@@ -513,7 +537,6 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	int frames_left;
 	int i;
 	u32 ssifsr;
-	u16 *buf;
 
 	if (!rz_ssi_stream_is_valid(ssi, strm))
 		return -EINVAL;
@@ -542,12 +565,23 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 		return 0;
 
 	/* calculate new buffer index */
-	buf = (u16 *)(runtime->dma_area);
-	buf += strm->buffer_pos * runtime->channels;
+	if (ssi->hw_params_cache.sample_width == 16) {
+		u16 *buf;
+
+		buf = (u16 *)(runtime->dma_area);
+		buf += strm->buffer_pos * runtime->channels;
+
+		for (i = 0; i < samples; i++)
+			rz_ssi_reg_writel(ssi, SSIFTDR, ((u32)(*buf++) << 16));
+	} else {
+		u32 *buf;
 
-	/* Note, only supports 16-bit samples */
-	for (i = 0; i < samples; i++)
-		rz_ssi_reg_writel(ssi, SSIFTDR, ((u32)(*buf++) << 16));
+		buf = (u32 *)(runtime->dma_area);
+		buf += strm->buffer_pos * runtime->channels;
+
+		for (i = 0; i < samples; i++)
+			rz_ssi_reg_writel(ssi, SSIFTDR, *buf++);
+	}
 
 	rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_TDE, 0);
 	rz_ssi_pointer_update(strm, samples / runtime->channels);
@@ -658,8 +692,13 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
 	cfg.direction = is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 	cfg.dst_addr = ssi->phys + SSIFTDR;
 	cfg.src_addr = ssi->phys + SSIFRDR;
-	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	if (ssi->hw_params_cache.sample_width == 16) {
+		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	} else {
+		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	}
 
 	return dmaengine_slave_config(dma_ch, &cfg);
 }
@@ -977,7 +1016,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int ret;
 
-	if (sample_bits != 16) {
+	if (!(sample_bits == 16 || sample_bits == 24)) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
 			sample_bits);
 		return -EINVAL;
-- 
2.43.0


