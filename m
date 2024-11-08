Return-Path: <linux-renesas-soc+bounces-10419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C19C1B76
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35531C267E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6940F1F7069;
	Fri,  8 Nov 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JUXWhKzF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6E1F6680
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063061; cv=none; b=ARW0uUuRKa9g7NIhw3DkDkQ6Tb3ZFOzobIJJXblMthZO+Zg0Gjkcxwl+P7qQI4s1Loe8b0Zg3VhphMNdBdcpuKWOjfTbvtdvgPt5kn8TIzBedmgUZwk0wIWOinmJbrmgANQkLBmEQjldhRjEZ4MGwjk9bjXFIgK5rl5ryYy7qCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063061; c=relaxed/simple;
	bh=Nfd4gDEK7GpGxcCuhGzfaZ7psjmgyb5HQdhVpDmwzn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DM9cJLtZAUkkAGYFsTTXnr2SWMna8IhSoB6kYTDCUFLl4BpXoXYeioAJSTDeJth39FuLNIGNKm+OTieFld5p+ZFd2gR3WVKslpPv6nZEBXsDKYyGp49T0clBpP4nRLRcKvZJqVSqgYN3AJRClLLiE3rIhfAhaFY+Bw0+BXgj5rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JUXWhKzF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9e8522c10bso298791366b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063058; x=1731667858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsddwLgoaUC21DisQKymp7RX967qcBXHNoEIK2XIDWs=;
        b=JUXWhKzFd16CctZn7e8jQG3M61+vTk0J2aQx4QS/3YD9zCiXw8MSVqUsUo1j5XBISO
         KyG7nuy05aZY0sIWvr0Vc+uMJxOxK64wrAlYDWk4IQu8X9P7gl9qjSfN6ApK+mZe+C8B
         0syfeLty2qA5CEBwYzDU6cf66a2yU6qWQioaXSuibqAUJkXYx/Tc6h3hRxdTlAJ5dRsL
         TQSVNVK2kC9YEqCbvdJs474pxk7UHnD5/OJj5GHhl/y5sQ8aEUsb7ZapPz2F/v9VnaWK
         wuwX8X9/EWL98KtbaMWmIXxPEQ+zEz+K+AGOglk9jHVlzwkikSb//+zVyLGOqAgSJzeD
         ph4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063058; x=1731667858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsddwLgoaUC21DisQKymp7RX967qcBXHNoEIK2XIDWs=;
        b=O7777Mh957jTmMop70VQFy9bceDMq4O/pQp8zCLbQuZeXzJVLj3r8mEzkEwFBoylJ8
         eoZjmQaZ8m977KqJg05/Dgd5UTnvY8dUmX8+9eiYrezJft9FNqmvX9LGA8JNlpD0YKkk
         ai45RpOsf2OYYumTvXYHL4Xqt9hMiLcKZypHJGCls6RkVs23Am8ySVYXvQ81EyiB3Crr
         xVmv4tVzJayprZafVnBOrKJ9auSz/9wbu6p+3J5q0mAi3ozki8QE4abNDXu6He+8jb42
         9/Q80FGl2xRPQRVBdC2SWlsN2WUpJsFIEah+ku+7w7nOPlaIKGMkz1FWUmYQk9oKbwnY
         SoOQ==
X-Gm-Message-State: AOJu0YwyWATylMzuQB7jX+yybIQtZl4z15KvIMMhTv1j/mwTpfDPEj5l
	Co6oHUPzta8eYedR2ZT5pci4zu9LXe5Vfj5MUByhxpYR9TQHnK3kFyoBX1wEuAQ=
X-Google-Smtp-Source: AGHT+IEJg8K3pdmbEY8dCNi7XCNAbif69J5o4laKl4Sk/PK5iN8hqJH5aC5WbhvZFA416qHorGkEjg==
X-Received: by 2002:a17:907:7e83:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-a9eeffe72a4mr197003166b.29.1731063057752;
        Fri, 08 Nov 2024 02:50:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:57 -0800 (PST)
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
Subject: [PATCH v2 18/25] ASoC: sh: rz-ssi: Issue software reset in hw_params API
Date: Fri,  8 Nov 2024 12:49:51 +0200
Message-Id: <20241108104958.2931943-19-claudiu.beznea.uj@bp.renesas.com>
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

The code initially issued software reset on SNDRV_PCM_TRIGGER_START
action only before starting the first stream. This can be easily moved to
hw_params() as the action is similar to setting the clocks. Moreover,
according to the hardware manual (Table 35.7 Bits Initialized by Software
Reset of the SSIFCR.SSIRST Bit) the software reset action acts also on the
clock dividers bits. Due to this issue the software reset in hw_params()
before configuring the clock dividers. This also simplifies the code in
trigger API.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index d0e2665ec830..10dd973a1c85 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -388,6 +388,15 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	return 0;
 }
 
+static int rz_ssi_swreset(struct rz_ssi_priv *ssi)
+{
+	u32 tmp;
+
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, SSIFCR_SSIRST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
+	return readl_poll_timeout_atomic(ssi->base + SSIFCR, tmp, !(tmp & SSIFCR_SSIRST), 1, 5);
+}
+
 static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	strm->running = 0;
@@ -782,14 +791,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		/* Soft Reset */
-		if (!rz_ssi_is_stream_running(&ssi->playback) &&
-		    !rz_ssi_is_stream_running(&ssi->capture)) {
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
-			udelay(5);
-		}
-
 		rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
@@ -914,6 +915,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
+	int ret;
 
 	if (sample_bits != 16) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
@@ -940,6 +942,10 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
 			       sample_bits);
 
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
 	return rz_ssi_clk_setup(ssi, rate, channels);
 }
 
-- 
2.39.2


