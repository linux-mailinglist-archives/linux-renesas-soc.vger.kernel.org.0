Return-Path: <linux-renesas-soc+bounces-24626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C88C5BE0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC84D3B1E57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAA02FBDEE;
	Fri, 14 Nov 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE2vRygB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23D2F90D3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107145; cv=none; b=u0oY2ZVeuClN9jKwSLJT+fmkjj0l3wsFhN9145G6i6w/t+E9KGxtqH7O+ouIffHFVf1ujr2+JT1FES5/BIK2KusHun0SDwZR+++kaaGBSCNR9Yb8eHrejbN0qKS/3i1i3OD5BtnID/RdMn/XnIXNr6YIlGX41W8GigNSJSa22eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107145; c=relaxed/simple;
	bh=1oB6ejVOQiSslI+YY6o6RVr+qL2UsPs4X0pdDi9q1yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPyv46Q4OTl4GcI6Jc4NGthEFH/5WhTWVOyYo1+6NFKUw3qSdmMCBQftutu3uIqr9zniM3OaTS3zh1736EkwOrtEiI1KvsognfSqLWpHVt+vHey81nIEvz3J+zJMIxYmB2a1niD+3xfAhY8eZUI4dScXaCarbu2nqlmOG/NomV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE2vRygB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso14308895e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107140; x=1763711940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CmbAWmpu4IIfMH0eqanYAoW/4AiPlJTrOkq2LeJ2C4=;
        b=CE2vRygB/KzLgAHaR5Om/wkWOXzXtXEumQqgsZMz3bhAp07NYGidekzChouQuihi1a
         FH9UCaJOaIX0fqW9aopaep6VubefngAuc9UeyT/24Pk26uMLwnsuVl78UqBCPo/nTNLN
         aUCMXxS0HI+Bimm0F7El6qnyUFyyphaBu6nXxZskAnDbYhUQcYTm071a8pQh+Nd2IHRG
         UbBC05Amk47qXSg6L395P7Sn5OK25FueXZa7D80XpzZb5hvBvjcSfZ3N0CZ+z76oA1EJ
         oSONagvt/9dYudfiVKu78m1lZOuQo9PPvLQYE2fITGLjNtzQEAhrplwpVWnmGO89Ifw2
         vKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107140; x=1763711940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CmbAWmpu4IIfMH0eqanYAoW/4AiPlJTrOkq2LeJ2C4=;
        b=rLxpIUNOOaymQ0mnt6Xno9ZDZnC7DqARk+TETKTeZngjVe+ODblYKUAfYdRTe3qRpL
         cuehSXWvZ6UPyNPZj7xoVcFX2fAiCdvpjBjT2D/7/yDz6hwPezO8YfX4LB2MnMbNHLuX
         YbJCR9047JNooo97YxKULsxYOK07M4n/VWKtaMYYImRVH5TjrEETS9gJuroD0asVcPj9
         g6tHs1QYcfERJs7FdsYeYIRxzlAs6JDgZUUHzx8gyGkBZ6DcBTiXbb/gmnxcZ23bw/o2
         1PrAD0ln/YltY3p2ICG6LKjupPdliIamdYQUF2V5Hjrtnx1jtHcp0PFl2an1uqlmalPI
         DdYw==
X-Forwarded-Encrypted: i=1; AJvYcCVNpWInuqzQt6uM/LkgZmlYtZXbXcehn7Dh+uZ9UTZnRUnTiPp9pYVEUsmlUBqatlGRaVENVKJHHnylUB50PSqDSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkjCFAufqmm+s59xjUtn5zNt19xMABJr9mFG4AcZyRV5XfFVB
	lX3+7/a0I7DebaBGQOK4c+BvTjmoGKVoF/MI6oGC51Zs1/pnfCZYP/ULIC/yAw==
X-Gm-Gg: ASbGncsyRRrqMMHDX81nwQ+f1ulzj8zUR8iDXSUCP0jiKvgkxFQURLU7XdUYY0uOTbb
	KDLcs/v+S203Hhjd1pJhCUCQGMU1dJW5GncK11n8jF3DYq0bQ40A0QGcBgp70I0YmHVfyfJqTtG
	Tv8MAq99VK3pRwPzyXm6tnRlCswX+NSrVlCM23ylAzGcPbVQ2fBOd5MlWM1N6EvQLX4VTGYRhEn
	9yqkJgYUbwV25vbl/qiUZ+2HIQyvqT70LZe/OPjgE2QK11bf2O6jTIA5VLvBF+1Q1v2nskZVaUQ
	58Hc44sTNLL8pevjtdpMzxdGIq6nBGhZQHXHCXWQE6i/dD7D8yIjYqBJUsz6HEkaqUbhrX+zW7A
	JLy/KW8XDaApOOcULI2uCsiX1JKJEblhLMGYn535WhNThqua+UaaflbdnX6e+KOz0tRjNHa59ZJ
	FZrDW5GMFRIwYVTGZ/XClHf9IILG1E4CX5ICVzzoC9q2NndKdhpGH1CTguxe5f4k1+C1M+pvJ3H
	PXPIl+7vvgX56gH
X-Google-Smtp-Source: AGHT+IHyUrHUtSoN6qunQKG/oS0uHt3Xb7PwuZ/jNdLTEYwTgxmXjTTrQls0Yrm3bKue/k1AuP95Uw==
X-Received: by 2002:a05:600c:3586:b0:477:7d94:9cf0 with SMTP id 5b1f17b1804b1-4778fdb36d5mr21891195e9.12.1763107140419;
        Thu, 13 Nov 2025 23:59:00 -0800 (PST)
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
Subject: [PATCH v2 3/5] ASoC: renesas: rz-ssi: Move DMA configuration
Date: Fri, 14 Nov 2025 07:58:50 +0000
Message-ID: <20251114075856.4751-4-biju.das.jz@bp.renesas.com>
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

Move DMA configuration from rz_ssi_dma_request() to rz_ssi_dai_trigger()
for supporting sample widths higher than 16.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 sound/soc/renesas/rz-ssi.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 21f7d7c7c009..55aefff8857d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -774,14 +774,6 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	if (!rz_ssi_is_dma_enabled(ssi))
 		goto no_dma;
 
-	if (ssi->playback.dma_ch &&
-	    (rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch, true) < 0))
-		goto no_dma;
-
-	if (ssi->capture.dma_ch &&
-	    (rz_ssi_dma_slave_config(ssi, ssi->capture.dma_ch, false) < 0))
-		goto no_dma;
-
 	return 0;
 
 no_dma:
@@ -829,24 +821,27 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (cmd == SNDRV_PCM_TRIGGER_START)
 			rz_ssi_stream_init(strm, substream);
 
-		if (ssi->dma_rt) {
-			bool is_playback;
+		if (rz_ssi_is_dma_enabled(ssi)) {
+			bool is_playback = rz_ssi_stream_is_play(substream);
+
+			if (ssi->dma_rt)
+				ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
+							      is_playback);
+			else
+				ret = rz_ssi_dma_slave_config(ssi, strm->dma_ch,
+							      is_playback);
 
-			is_playback = rz_ssi_stream_is_play(substream);
-			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
-						      is_playback);
 			/* Fallback to pio */
 			if (ret < 0) {
 				ssi->playback.transfer = rz_ssi_pio_send;
 				ssi->capture.transfer = rz_ssi_pio_recv;
 				rz_ssi_release_dma_channels(ssi);
+			} else {
+				/* For DMA, queue up multiple DMA descriptors */
+				num_transfer = 4;
 			}
 		}
 
-		/* For DMA, queue up multiple DMA descriptors */
-		if (rz_ssi_is_dma_enabled(ssi))
-			num_transfer = 4;
-
 		for (i = 0; i < num_transfer; i++) {
 			ret = strm->transfer(ssi, strm);
 			if (ret)
-- 
2.43.0


