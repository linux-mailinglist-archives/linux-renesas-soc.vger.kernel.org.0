Return-Path: <linux-renesas-soc+bounces-27074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4668D3B7B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBC63040C41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467532DC32A;
	Mon, 19 Jan 2026 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fHyeLxZl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B927B4E8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852394; cv=none; b=kof8l4BfEQUIBAAxamVsDMLh/KbOgU0jngPM4r6FAnEuPzwLHABqipj/ma8A2JuNiBE3o/n+tEI1DMhJkN9xuz50lnVT8VGlZnUNFVaI56hRj2hk3ASr3qgaPFzX6riIlSgMdEqOiiJxCRc5hff5qeuw2+1tfEOn60LV2dlIJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852394; c=relaxed/simple;
	bh=sEgcOzdkJB4i1U2lvGg0wbqZtIVnk+4CCknJx50DshM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J91w1S4TnSN/ApeCI5plKIIJTUiGJ2dhFirUDhzAQpKdnbo+UrAvxj1x32fYd4WoIhLkypd9FRIZmV37B4PbhF1fvtABxz5d4F/cuahrso6ui3w90rEUea9MSOclduYh0rpLcz/h5WZUQikznaN/KTlOScETVNIc4+r425GgU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fHyeLxZl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b871cfb49e6so751241866b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852391; x=1769457191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgnwvaXk3Vj+g4Vws4wVhdESpFwwCWsk/73Dv32O4Vo=;
        b=fHyeLxZlw+Rp5hh8Blv55sHk+xee3amcUGbrkyxoHHAQFJMc+B505xvmMcXRmoa2Xr
         bm6Vlx4WrekuQKAdhBRskwMv/vi2/xmTuH/MBt5WD3cEDB6YJUBYnS5DPDaLiSnWb0Lg
         ozpwDhRzo8TXSFy+YJMZNQNt+lGw9+jwkKLWEBYG/S4HoGRRhUqvcZ3tdA1T1Opr8bx7
         eGvI+FWs5Bt4H9AolOpiTMh4LdGUDTsaMF9QRnQB4TrGYB8/JxXEnpEA9JbiNmdNyQY9
         TwR0jkBK/qFXldvtebFVfoDg/QupN6SfaGIr/U2pDk73w/TqOv+61ed8SLP8Zx4MGtxB
         yBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852391; x=1769457191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgnwvaXk3Vj+g4Vws4wVhdESpFwwCWsk/73Dv32O4Vo=;
        b=rl/mPQrYZdOJ15bWP8qtqeAWF61wbIeJ/ydIzeUEWKJ6kQtnTAgVZQEE2PPeBdHZPy
         Off+is3rLIHG2IvMPRZa8vvEi9ScX76P3c/9Fndz0/JMN3xgZF+hUDTvxTPUrzDWXhjQ
         n/zSBl3C1F51jT3in1F7iGYXBodYf+mqZEm/3Fm5mz/xOovlc5Nt1D4rzSnVI2M5i8M2
         /mZnWUhsQ4SObeel4z+mg9xfeVQlOgtzmi+/zenN+3duHZIXr6ymGxENKmMpGNW5uEnL
         GaI1sefjssJgtixdwCYccNnPEyVwBWPKQRitEwDxNhy9frjfd2Wwm6UikYESoY8lKRGn
         QEAA==
X-Forwarded-Encrypted: i=1; AJvYcCWz2XiJOpWC4/8eezCDynH+68bxFiEyfXfDCY92131UA8np4zU7qZRKIuTEkZrMjNpIeeApnrtCmPMJap1smWcRpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRR1Q5pCCqsoZFXxtE2AqjO9mzHb8ZwbDuv1DqrzSKZNQ7Aq95
	vHVrat+QYlmr3BjzoaRZR2pKVExaDjF1rNP66JOuzdqaH5dK7jEutMFX/EAqi/L5Lyiv2ZoiXSF
	+nUnc
X-Gm-Gg: AY/fxX6Ib4Olf9iYKQiduVagQBTDz0PWoLB6bh6A+yjbx07m7LhRYGyAHPTe3Si/vCb
	ju1/2PgUWeYeO/j2bmdTLpoFhdjfQhyMRIds2iR8zuW6tDd8CcA/Hf5RWA3e0W7PclVeUUav/tZ
	U6ynEbmI1Cf0YlNS2Ud582KILofRz7s70bSrkgmnpqHm9ApZnBEibtqjhBVQuVHpk5LwY4MHBjZ
	11XVgIUTwVkONAQYaZ6qtLUmKqOBYaOYhPtgK1EWV/itYWoH9FT4DUrwLvdg3/5j3ZLH9Vd3wkW
	LHPUdt4GUxFK88CjSKYFunDQnRwyAe4Qm84blkcIxA5meofDR8E5YcX/0btKZS2opEYez1/qLug
	lPS2SUt9e3VwrZcxGcetqY31JKAu5guGSEgW2ZJ3rsxJPAo0/RQZNaLYralP+Wl6zspzt/3FvDX
	XGh+HgPkmwDWsTBGC61UcPPtEXqEJFRVcmKTwNE4Q=
X-Received: by 2002:a17:907:9488:b0:b87:7634:b20c with SMTP id a640c23a62f3a-b8796b215a4mr921693266b.38.1768852391173;
        Mon, 19 Jan 2026 11:53:11 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:10 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/4] ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
Date: Mon, 19 Jan 2026 21:52:49 +0200
Message-ID: <20260119195252.3362486-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The code in rz_ssi_stream_is_play() checks whether substream->stream is
different from SNDRV_PCM_STREAM_PLAYBACK and returns the capture
struct rz_ssi_stream in that case. The logic is easier to follow if
substream->stream is compared directly against SNDRV_PCM_STREAM_CAPTURE
and return the capture struct rz_ssi_stream.

Use the conditional operator to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5909778a6a70..35239ed7f916 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -180,12 +180,7 @@ static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 static inline struct rz_ssi_stream *
 rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 {
-	struct rz_ssi_stream *stream = &ssi->playback;
-
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
-		stream = &ssi->capture;
-
-	return stream;
+	return (ssi->playback.substream == substream) ? &ssi->playback : &ssi->capture;
 }
 
 static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
-- 
2.43.0


