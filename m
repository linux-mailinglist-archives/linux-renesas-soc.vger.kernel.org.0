Return-Path: <linux-renesas-soc+bounces-10412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED09C1B55
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA0E8284924
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C151B1EF93A;
	Fri,  8 Nov 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Dbeo1O7K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C721946DA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063043; cv=none; b=EZTSWQuFtGlu45ynMgReN1tZS9aIbkUQ++GpxctOyRn+REtMvaYWhyijwULD0OJKA89Oy8ZbZMRyXqr2B68FiBOtTxPsBiOvBnllkOqZmf/fiFkawTztYn3T+U5TDEP0d1I62j0vOX2ZmDhtuSCOtOSWod609oJp72MTLgjnO+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063043; c=relaxed/simple;
	bh=d8mU8bYOrPorUuoOZuvaha0KU0RlKCB/stgC96hd0g8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gvs2gSE8oZ4fAaN6lCCjhUTA/timxP39xKwC/8tFgrP02NmEf7fqie61yLkpqG2XzQ5g76Kqhxuk4Ec5qSgnPJV+W29gxmf5TVwOEdFxBSRKLBARc/Q2Ldi7CcEHQHUfASYF2v9Cgb/xq9vDd1fF2iOiRrJI5R386GFFcZkcyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Dbeo1O7K; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so334925366b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063039; x=1731667839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0HYIcZ4941pOAMBeRvtJV39WH2Y/jzU7I8a5PPgGFo=;
        b=Dbeo1O7KoHUqawQ/OBO+NwwWCSd6GBqHJzertGEHPBY2Q9Rlrs8v3XvZlbZCuby5ty
         6mmFq9FICsoUAVLYpK2GnEXQnbDxj3B0TvjsC6Mzs87OqYeby+F9ukO1m4fuYcyk8VsI
         L9iMH2JvlUZqSir+JWrJktbgnNWHoAB7Z3HAnZagmuQbuEQSTgSzHMMtwPqrSP+bmFF9
         onXFDbY6pO9ZMBubbahQe0Wz81JGpNJjvQQ4AgCr+hDWElBeIRBunyozwe4nFpJi4C1b
         2OEqU6EY8xfqMwmWJH8hdp1VsWPn1LEcapAcPKIFacKKbkm2qhEh+KlLeFYRiIYB6Fek
         SDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063039; x=1731667839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0HYIcZ4941pOAMBeRvtJV39WH2Y/jzU7I8a5PPgGFo=;
        b=WMp7+SbwwerJWkLcsKIqHR+sMhhApj2TYYJUefxj3PpsaYwwF05F7lhlvfQmRkZ2Vf
         kWtY1aDfliVCkP9jy1ojjUqRusucUOQ7K3/hPifyGrz2lL0HcQ4s+p/22sfy9zUq1X/L
         f7Be4+i7hPpD2XLqymakNm6AjSRHR2kfApPD39keoylAP4wuiMbJwEdA20NzALFdCTpK
         H5IDGRkDeeFCBN892Wc+MSf3eZgABT6c/3FXbe2Az5laRVaQyPQ0TalnYoeeFf5+8jrq
         412oQelOl+BWlhxmH0If4GFkHMAPeAjgi8ZtUIoxlavm3M6FPwjLdrnuIIB1Ws1NLawr
         I6AQ==
X-Gm-Message-State: AOJu0Yw2A995HXWHmR4kXC1nH0c6JNpGWwJfo/f5Cv/TQsQFi/etEhL5
	d0BKQA669uO/9A/UuGUfS7pOX+GW8O0rOzZgi4/1I6aUlnzhSCwUrtzxKa2ETRo=
X-Google-Smtp-Source: AGHT+IFGG1BBo43Xzy4yQ4uC6LGC4AjE4EiaqG8//Yidm3ggRg+BojPgMYe1LcTHoO/XqgYzHzGGaA==
X-Received: by 2002:a17:907:842:b0:a9a:4f78:c3 with SMTP id a640c23a62f3a-a9eeff0dc7bmr201747066b.21.1731063038893;
        Fri, 08 Nov 2024 02:50:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/25] ASoC: sh: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
Date: Fri,  8 Nov 2024 12:49:44 +0200
Message-Id: <20241108104958.2931943-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- fixed typos in patch title and description
- collected tags

 sound/soc/renesas/rz-ssi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4c33663a0ae4..f230d63339e8 100644
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


