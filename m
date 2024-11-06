Return-Path: <linux-renesas-soc+bounces-10332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892449BE097
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0321C233D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4891DE8AE;
	Wed,  6 Nov 2024 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SVDL58sz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEFE1DE8A1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881199; cv=none; b=ooZIgqCqID2MCupTgrzfmTdRYpamcz66f8yk7hJHhjZtY56m+pd8RXdzWfyIVmKrrEc8nt7eUXGAk1pT9ze49H8X18MWrSy5zaS7/6n9s2/4Q8uJk8hfbFMi+UQLG8SBUH4a4Vadmwc9Zsi0q2IRenwv8Ro3YlBaShEFXSB+XnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881199; c=relaxed/simple;
	bh=9yQU3pibX+brmIMUzz7o55brbRDQsa2RoJOTqH73gG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZr+T+hTB1TMek6cXe2navbUwml8bGWPt+urarD852hxmAoeJZ1k2NabOgeRzSm7zKXhsVpkZS0pYErkfjDbhD/O7Imv2L7ZSoRGA7yaXboSmEbgsMTW7u5g9t3RxK2s8MvsHC4s+c3emw3z2mm5Lz5+JZEY/uZQUWUNL1EW1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SVDL58sz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a16b310f5so1003319366b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881196; x=1731485996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUZqrVOVAOQx25I2zGtXcv17LnnQ6riSA+Z+YzfJ800=;
        b=SVDL58szJnYKWVvmFWspKC1i80x8zvAMbs8+eAPpjeTXHEsyuDBkdfQT/fTGRMbhR1
         rgj+wWgyZs0NBtwVDmLo7BjXpqEDwGCMD6uEpIwj7v0i9uiSJq8YevrCEcu/hybX9v84
         1mmV2az9Sqx4O0/dH8mmf9BhWZiUaSCve07QqJKBWn444ETcEHqLvMzTTKUf+WuBcMTn
         M7wuZU4Av+HJoQd1u4CVU7rcaunRhi9GYds173TuRsR58F6FgerMlT1CGgO9PikTL3YY
         yfZwGKzPoxWP1udJ0/Oz+NFQiqVsDYHGmaxwqUmD0chS3wwVkwYf0AvYSnWR5D57H2vp
         ZCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881196; x=1731485996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUZqrVOVAOQx25I2zGtXcv17LnnQ6riSA+Z+YzfJ800=;
        b=sX1rfM+VmZCz4hDn+cR8gnqit/sJUThfGsovDAjlKUfLU9jMMA/OAEWFrIZUGTXnjO
         +fz7ROfIrQshLdPjTDhsIGQfKypHCKI3KmJ0l1gqwmuNh0J2S0BVK9AomTYABk9LK5pc
         f+NFpuqdcbciMAsVINe5A3U+Gf1D+WbGcOIyydzyWSnIIvouHTExyxV0WxmFn92Dxx3S
         I2eBUaCUf/brpA54qE/W/tVM0+DoRl21UgZ1Q/ySfXQPIm67RIfbCpRQL5bLUOKFhhXx
         yDhQzMpUscULFALMoGQR11p5SJYPT88tF7j+m4e7C90O+fYmkryDJEsCTbCB5dw/VWRB
         QMJQ==
X-Gm-Message-State: AOJu0Yyri1kRxUQOsQDMRgEW2iAKs43feIHhElnnMiC0pQVoxXWcGOfh
	V5gmo3bup+KUk0VhvM+2S+lUdP95ty/imv/D6WWP/9w4NmXMvoAqJbzVoPthv5E=
X-Google-Smtp-Source: AGHT+IFAj61o8T1/nrUGKe90uLoFOCY22Ct9IQWDiN3o35dikaofTS2OgMHrWcjZ/bVf05WTZ+Y+2A==
X-Received: by 2002:a17:907:3f83:b0:a9a:6633:3a90 with SMTP id a640c23a62f3a-a9e508ac3c0mr2121950966b.8.1730881196065;
        Wed, 06 Nov 2024 00:19:56 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:55 -0800 (PST)
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
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 19/31] ASoC: sh: rz-ssi: Issue software reset in hw_params API
Date: Wed,  6 Nov 2024 10:18:14 +0200
Message-Id: <20241106081826.1211088-20-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
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
 sound/soc/renesas/rz-ssi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 16bca493a254..f767a667c2bf 100644
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


