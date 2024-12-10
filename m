Return-Path: <linux-renesas-soc+bounces-11181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9B9EB79A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5EC1887B12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2945A3DABE1;
	Tue, 10 Dec 2024 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="R0QKl8lt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A21723A579
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850630; cv=none; b=qGtOrz3a46gy/W1DIqwYvZKujyeWp1zOVzM4S0drKRiui49ClQgoOed8Oteswzl+YLscH11gYFT2P22DxGiZ9/vTOkb7BxvuwFzrO3blp9qUWeOwrinyqH/wc3ruWXoFXNGmTh5mvDq+IQfhXcK/WkdAs1ynGI2E4+TNzILX0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850630; c=relaxed/simple;
	bh=ujffKmfqqDwP9nSS/Rh8QsJL6MbeKN+Qqc+lwPTDO6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AXPHbhymgK43J28A5Xu+n1B+adS9fu2E9hF0npyLPXmESf4D1VF7y3oXZ0y+9GdU5huYW1BuiS9bHRrdjF4uNjbK+qXXbGVtJuHEBl9PtluBleiwuxYWlGP5PZDgFacvnGSxO2RawXW4JyNQCF9w6EG91xfixqxBRKkPChbMPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=R0QKl8lt; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so7278617a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850626; x=1734455426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt6/CuLO4TNfbHvjGkE7QWPE5biRbMT4tQY2cpGkikU=;
        b=R0QKl8ltpkWoHydIefVc0xQrvPiLvplUyTjqzT6eHRvjJgdOVWa7o1ljB35cZVL3cd
         /NQI5szGDpJFyZlfoB1gawjPP0g8QUKO4DhZGoEM8GSqS88YT2ZgZ17TzWofc0EzxTOC
         TRSmQJfu0+JVzRqM+B6TUF5trZYIjjvnOl70wC4vDMO0gMcDFgB4j+hxE246F5nKqLmu
         kfoZBoL8BgkErwniYfqW8dajUAYq8FDikk5QWw9Tmb9JYf1Jp3ukkxZA7dVvq5vVnOOy
         Is8T+LIE5dV8rUZ/KlSZ7p7EZR/bZ3+Efq1njQqwVnAQ2Py8btOxhsngdgvTBhE+cXws
         Yr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850626; x=1734455426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt6/CuLO4TNfbHvjGkE7QWPE5biRbMT4tQY2cpGkikU=;
        b=pdEry3bSF7C5NkUk8AgOBHLfnMdBQ+g6qADdkzCshGLZsfQCAK6HXGzWjpg8lG0zJ8
         6o87bCGRY3egMkrKqap+8esIfXIMicNAw6/8Nv9dAjIdpev3C/zDkrAsEW2ycmGX5S1y
         bia2sSBIgFLfA/y4vLeGGWsIkJUXkTMkMFPNRosagYIyN5gvE1+fDrNu6R7Yl9pZJOCI
         QDoPRBsR0M9zyor8P+FWj1HRUpbQkUQ9KLFMWne8QVGdrnpyZAcazu4uuAM716/sqpbk
         busNyV40brRy4C1UfCTlwoCYI3CT/POVTkt+hBg0x0BWPRakGNI13bI8TkJCXOmbFDpd
         KL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg7RLcsJ+8XuYCQyZ6uwz0+0ApUqow/7lui+/lhxHn+A897m9n4PNme7Al/tLweNQtxDaCdvU/YOup1/Vx5wZKEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp31YiB1ASGRFX6x9s5YGXkduAG3RvI81S80/dPlJupNl/qSmC
	euXRbXTGuUyYFRgX5ENZ4L7mSh5JpuPNQkm42M6psv8PAjXUTkjGhkdRzh602W8=
X-Gm-Gg: ASbGncsbfQYlLsOyRRFKI+a86oVDZunUj6B0tuhOH3Jg+MubNlTZdaG7KuEaBbk2//e
	AokD7E9vzIPLWrmtwa3Dp9BvKiLTYNJ5JBe+OwUSUVflsXZMmVHBWMxvW3MV8CK9DAqz2RCZRxn
	ubgPS/nATQvvPYGfasUnla9nUOHm78viOpydnC5UKngBrG93CHbHh2Riu5JclZJ5pldt18slIKj
	9/Rfmxg7LIrkYR3TiWFwbYuC3XB5FTymO9wq+CDZXCjhgtSPOipcltdDyzEWuJru7sRHBms0NyC
	DzAvCma+
X-Google-Smtp-Source: AGHT+IFnf0CQr0jkK6OJUnuRd7yMlMyY8yimkX0n0o6RyaHOTAp9AyL9lRgA8mS0FG7jjIMo1TvGpQ==
X-Received: by 2002:a05:6402:2813:b0:5d3:d4cf:feb5 with SMTP id 4fb4d7f45d1cf-5d3d4d00325mr14392707a12.29.1733850625802;
        Tue, 10 Dec 2024 09:10:25 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:25 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 09/24] ASoC: renesas: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
Date: Tue, 10 Dec 2024 19:09:38 +0200
Message-Id: <20241210170953.2936724-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The first argument of the rz_ssi_stream_is_play() is not used. Remove it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- fixed typos in patch title and description
- collected tags

 sound/soc/renesas/rz-ssi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index e2e172d8e9db..1a98f6b3e6a7 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,8 +162,7 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-					 struct snd_pcm_substream *substream)
+static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 {
 	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 }
@@ -337,7 +336,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_play = rz_ssi_stream_is_play(strm->substream);
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
@@ -674,7 +673,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		 */
 		return 0;
 
-	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	dir = rz_ssi_stream_is_play(substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 
 	/* Always transfer 1 period */
 	amount = runtime->period_size;
@@ -800,7 +799,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ssi->dma_rt) {
 			bool is_playback;
 
-			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			is_playback = rz_ssi_stream_is_play(substream);
 			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
 						      is_playback);
 			/* Fallback to pio */
-- 
2.39.2


