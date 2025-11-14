Return-Path: <linux-renesas-soc+bounces-24617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F501C5BCEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 08:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BF724E41F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2382F6582;
	Fri, 14 Nov 2025 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJXUqQX5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52285275AFB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105837; cv=none; b=PYczss6UdIztJ8+pQuengnf7pTIFfe/2Z2+9n6K/GWpP97HkJ7bYlAiuHPdJt0lvNS3dwlZOseDuBK6pfugZaLW88aLPjec1QaBZWVgMkr8b31MuQ3eP3B59Zmbr2Oa3AigrOq1nocwqR3fwR+h7SOwRsHv6t2B3NUe+XYhBdf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105837; c=relaxed/simple;
	bh=J9vYEEJ0ofDcK3w+0OVyzsMDUwW8p6/8bi02TKiPxZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbmHOFiNWJJnb+3mdHgg0tJVLNAB2cSYPrxzS9Xo+4ivYqRhQ2H3FB/MmS6e2lXtqAvf7cBdEmgn2a1d6bJsgEi03mTa8MlnN7gLZVfOC8TpdPdj8CuRu1bBLks+nWKpdSVjzUkq7lZZPppH1TaeNofS7LwrVSKmlDkkczne+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJXUqQX5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471191ac79dso17569265e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763105834; x=1763710634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XTGvkxq+nuQadYmIzavB9udHbiTVbQTpJTHk/QQiaY=;
        b=nJXUqQX5VDnECRhkOhgVFh9EvJFCyMZo9wmxOq00AzflATNsDMfOgZvjnNi8byMN08
         EvgqsUa5W5lwYFyLcFStu+t7sMumemU6/PGKnCxJpwgfDQfLmB4jan4ttNr4NI7lSl2L
         ySXCvxFpRtfteZg8rDqsc2JnCRzYryvX/W3U0AcbHaoDTnTuKVSkrleK71P+gVxv3+X/
         QLP42ii1NTl77DgIKaEUnnM+K8Qu/IERTbFM4RhJsKZFggwlvPFent/e7V9knXPUOP63
         sHG8e7wgdBglvGIRp2CDTayiPkP2exiyeaU+tkVl2yVNQJf9WnGTv9ZOIpo2t9pOURxR
         Gxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105834; x=1763710634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XTGvkxq+nuQadYmIzavB9udHbiTVbQTpJTHk/QQiaY=;
        b=fSClcmMVAotE1WAyxOKRP4QZiNqi3SfS4tyPkkQBOxAI/Lyr9KJFTguvjrhQRKMT/y
         +0HAmrNcMF+DlHXG1mlx1imbKcexAx46ipxlTuUQgjz6ohvcOfia+gYtdxQRljUHRxlM
         jgoOm5bMMR+3EXh6rjyG/29vG5hbSABM/36bqs/+eF+S1jUqq5YgSYoBwciCbrsnTnmH
         afwtJnU1sUm0mTuXNmjsgPWmZ9s0f9aKaFwvRTkB+tKU0rLzSfcDe+h6C6A0eF515LGg
         HW8XCtaRsTJo8jS6DVFvqj74/QZOM9GRfjGWVVQTmLf182YbPARYxMOm1rKwW83u5iNN
         ZLng==
X-Forwarded-Encrypted: i=1; AJvYcCX4Ia82YQc/wMLHjUPWTcqi/+U52SSHG3RF+YTdwUTeUDBBoqkmpRDxaALSKwB5YyUnbF/TyGIwS19Ofv+hgVLSyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBkkG/Lduj7+3b4q7IYQO5XG8k6JhDxe1YfmgRjMNQq7NFKMd1
	KR5eRnQXHE+Afe69toPTO5TybpQlw3OnDMBniZqpjrjIQpZvXDtCeg1O
X-Gm-Gg: ASbGncvUIcmhUVrcF2fbwuueYBEx4ZTIWcZsE8x8XuEy3TU9zbHNHezG4qqEsMRHc9s
	OXSkaMbTpA/fUw0ZAUQ7Iyq5fYCpP+XCrHXiYCdNuyX9AhTQWisyddmDwFDs3CgaH1Kt0vSPkTC
	d4lYX4HO3bbUlh3euuDcReFOCLQgHwxhivwiSh0Y3xtXSmyuCtwO+KHYFmhx1EebHZo3/kLBdzk
	iWm+z2zTtAfiewL4jaCuz1x7sbxFxWJcEsfmsf/GZ0ntVfeZwSSYWptByuKKvNt2H7ine0eeCYk
	k6Nc2vM2UC9EJSrJopon/cFVnWzzX9avvxLXh8Lb9wC/DiuORFM9IQQ+VpKuNcc2W99aMedH0mQ
	kBBmm+a1K5//Yq6BBGW6PiaZkd/dMgQPvSqZ5UdrZ7vE0UYf7HS53gwMnqB44F5RRK8yDI7aYPr
	diJEVsFOBeyNbiSPGxLdAt+oPDAJt/8Xjz1PgYLpDMD7rqUECky18G4dXxzzrx4aUe3aGziyE0R
	bjN0TwP1nO1sSb+
X-Google-Smtp-Source: AGHT+IEGQiorDLdmzU4wrnBQ18nNZyBqJSTdnUc2AlzmYQPXesWGTMBeszeHumr9XsvOdUY1hWXCzQ==
X-Received: by 2002:a05:600c:1382:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-4778fe9b394mr19850915e9.19.1763105833330;
        Thu, 13 Nov 2025 23:37:13 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm95071825e9.11.2025.11.13.23.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:37:13 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>,
	stable@kernel.org,
	Tony Tang <tony.tang.ks@renesas.com>
Subject: [PATCH v3 1/2] ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
Date: Fri, 14 Nov 2025 07:37:05 +0000
Message-ID: <20251114073709.4376-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
References: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The full duplex audio starts with half duplex mode and then switch to
full duplex mode (another FIFO reset) when both playback/capture
streams available leading to random audio left/right channel swap
issue. Fix this channel swap issue by detecting the full duplex
condition by populating struct dup variable in startup() callback
and synchronize starting both the play and capture at the same time
in rz_ssi_start().

Cc: stable@kernel.org
Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
Co-developed-by: Tony Tang <tony.tang.ks@renesas.com>
Signed-off-by: Tony Tang <tony.tang.ks@renesas.com>
Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Reduced the indentation by restructuring the tests in rz_ssi_start().
 * Retained the tag as change is trivial.
v1->v2:
 * Improved the code logic in rz_ssi_start() by using else if
 * Collected Rb tag from Morimoto-san
---
 sound/soc/renesas/rz-ssi.c | 51 ++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 81b883e8ac92..62d3222c510f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -133,6 +133,12 @@ struct rz_ssi_priv {
 	bool bckp_rise;	/* Bit clock polarity (SSICR.BCKP) */
 	bool dma_rt;
 
+	struct {
+		bool tx_active;
+		bool rx_active;
+		bool one_stream_triggered;
+	} dup;
+
 	/* Full duplex communication support */
 	struct {
 		unsigned int rate;
@@ -332,13 +338,12 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
-	is_full_duplex = rz_ssi_is_stream_running(&ssi->playback) ||
-		rz_ssi_is_stream_running(&ssi->capture);
+	is_full_duplex = ssi->dup.tx_active && ssi->dup.rx_active;
 	ssicr = rz_ssi_reg_readl(ssi, SSICR);
 	ssifcr = rz_ssi_reg_readl(ssi, SSIFCR);
 	if (!is_full_duplex) {
 		ssifcr &= ~0xF;
-	} else {
+	} else if (ssi->dup.one_stream_triggered) {
 		rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
 		rz_ssi_set_idle(ssi);
 		ssifcr &= ~SSIFCR_FIFO_RST;
@@ -374,12 +379,16 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 			      SSISR_RUIRQ), 0);
 
 	strm->running = 1;
-	if (is_full_duplex)
-		ssicr |= SSICR_TEN | SSICR_REN;
-	else
+	if (!is_full_duplex) {
 		ssicr |= is_play ? SSICR_TEN : SSICR_REN;
-
-	rz_ssi_reg_writel(ssi, SSICR, ssicr);
+		rz_ssi_reg_writel(ssi, SSICR, ssicr);
+	} else if (ssi->dup.one_stream_triggered) {
+		ssicr |= SSICR_TEN | SSICR_REN;
+		rz_ssi_reg_writel(ssi, SSICR, ssicr);
+		ssi->dup.one_stream_triggered = false;
+	} else {
+		ssi->dup.one_stream_triggered = true;
+	}
 
 	return 0;
 }
@@ -915,6 +924,30 @@ static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int rz_ssi_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ssi->dup.tx_active = true;
+	else
+		ssi->dup.rx_active = true;
+
+	return 0;
+}
+
+static void rz_ssi_shutdown(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ssi->dup.tx_active = false;
+	else
+		ssi->dup.rx_active = false;
+}
+
 static bool rz_ssi_is_valid_hw_params(struct rz_ssi_priv *ssi, unsigned int rate,
 				      unsigned int channels,
 				      unsigned int sample_width,
@@ -985,6 +1018,8 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
+	.startup	= rz_ssi_startup,
+	.shutdown	= rz_ssi_shutdown,
 	.trigger	= rz_ssi_dai_trigger,
 	.set_fmt	= rz_ssi_dai_set_fmt,
 	.hw_params	= rz_ssi_dai_hw_params,
-- 
2.43.0


