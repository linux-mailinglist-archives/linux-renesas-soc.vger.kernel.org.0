Return-Path: <linux-renesas-soc+bounces-24506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A9653C532F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 16:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 855EA354509
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F3A34252E;
	Wed, 12 Nov 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEZ2yoqJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F72340280
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962093; cv=none; b=YfTb3QHPLTusR0W3HkBdFdC++Oox88/hOdgul+oDAlGCs3hGKfNdgw7sIj+OYmXwO8Ubs5e9wMQhELeyliOZB7II4vZokL/mKmAb1iL8v4EtzPXbIUCnV3YCvK+vtD+QIvuQQgQ5g22VyDlu+8vOl8xf99Uxcz6RRqjNtZ4NkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962093; c=relaxed/simple;
	bh=/gCWFkRkzNo3eNZ+1Ba3S8C9u3xVpEOMTubl+OzGIfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3yF4s365WnO6QLO1V7in8QnamU05hniX8r8OZn1wUzztoKwiYTfFFl0kBLP/8sdsxZ5xKLXDzS0wvdCVDm+UoF0hiC6LAVPD13LxurCwNJ/rDwTDlq3tBkByn2ItvDhBnoccxuPVswdKrlLHpD+0Gpgl228fDoSH6/uuIjWflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEZ2yoqJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b72dc0c15abso186050866b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 07:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962090; x=1763566890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCyPsKER0IjULkacDBKIbqRbNblXHgLZ/kXCVC2BOJ4=;
        b=MEZ2yoqJTFa7AJjfFCJWjpZZhetUjT5f7QxqIM3kIi3hFMhkG9lhvE/+TexSmrQYBR
         +9bjIk6AQqWH/t/uXWB3mLZuhMYQShmGhUBUWv569q/kfrrajNSLohPdPv9HN3riXG+o
         Xy4HzHpUi2yPWxYwV0v+0eOgW5xYLLTI6jhSyJHy+w5MwuqjbDrUUDzuO69KdU+uSOTj
         dV0G7blkl9nmR/xx4ltizp99S2FmOvauHqdY5fmrl4ZOYlqWazukNFFjlPm3muijoNlw
         maZz7aah8EeNoPQPN2qCXp843vnq0lYH0aomfKfIbdj0qy2dzQ5HHfNoZ8OE5jf5OmpK
         /k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962090; x=1763566890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCyPsKER0IjULkacDBKIbqRbNblXHgLZ/kXCVC2BOJ4=;
        b=O7U0ObTeV0c/J3m7USlCi16B4iEsvGUBC/ynRe2vBni4Qd1HZSm60WbhRetIT1ZeBr
         kAa7YPrVUdxANEfmZQGAIMVej/8VGpCas+V2KUQRyXo/FOukpwv5skhZo1bwf0p+nty0
         qcLl1+jtjdkjMBr/49JllvuUpQHZRY1HJwOIsj4OqnnBIAiVGVNyPtChF/vmMfDhNzsQ
         SCz1MEAqEnmoeJdhOVVBIDn9X/P+VDi7fStZdefESGNE8jR0jOX1F9WSNeljJM52n1Hc
         nGexNdKLiU9uIIB2DhgdiBOws0Ru9EcyOUW1farXR/1PcoEetCZkKX9jVQw6oDDxDF1W
         YPCw==
X-Forwarded-Encrypted: i=1; AJvYcCU68i5mBZfrodmyjE88pIdqCTThwmBWNLJWlzklQennTFpK66E2T6sJVR7lcp81Xt7qrPNj2WvK6R+fCRDLJVjCNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yT0+wkEboiSrbVgmT6cHCFl4oWM/i8+fjDp83Py5HWJkMk/y
	PULUyWW6mV/sAVHFcGu80VIoaU8wvmM6y5IKVeChhqR4sWoPN6vjbsnm
X-Gm-Gg: ASbGncvmkVxjBnI3eH2DEBSQGTPhYpyIyimRZOiStu+2q6qHo4KQi9O2+h7zWmhzxSQ
	Bzb7PsnoPvEqkZ3QMHWKzz+ORtdq28qFcyuNmMBnW97Hmg+XwmQqZ/YzG4K+Dr6bioSoHuPcTRU
	O7xjf9Ao8X6RF/FCyMxZMJ2fC59Ae75HEGGXF11Gdm1GK+flSIXR20uvm9uw5d0Zbri2N2g5wC6
	LQKO7Jv9lXIXdt2HFzkA/PlmnT4T2Y6SDwV0OnZpVaPCWxyywcAfw/lMyVaVbaifbPtJyzteK20
	5sKqMOafYxXz1DqGA0AGJnPhiMrit5aZkxfeyoAUQVHp/T18J0HGii+CWWWQkOk/FMKhuDD9sNI
	CN6pTG051e2wBspkdzw2LdYt0wBILsmA3zhIzGWg47jbImZ4SoOyhFKGZfakPdQlLBibzLGDLHn
	lg6lwadiXwhruJXnqDRZIKyl56vG43MtCgKvO+rw+7drIScZ8GrZy9ZRWldwOFboTNtPLlqWT/u
	r9ahQ==
X-Google-Smtp-Source: AGHT+IFV4ZJk8gCb7awz9e1XUlzsyTt2dLuTYq1zFzlkQqVLDRi2ppM+aqJDBCoFok+16YWsNFYpOQ==
X-Received: by 2002:a17:907:d11:b0:b73:3a:c49d with SMTP id a640c23a62f3a-b7331aac21cmr406575066b.52.1762962089984;
        Wed, 12 Nov 2025 07:41:29 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:29 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 7/7] ASoC: renesas: rz-ssi: Add support for 32 bits sample width
Date: Wed, 12 Nov 2025 15:41:08 +0000
Message-ID: <20251112154115.1048298-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for 32 bits sample format width for RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5ebaaa440141..85d368794de4 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -75,7 +75,8 @@
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
 #define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
-#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
 #define SSI_FIFO_DEPTH		32
@@ -295,7 +296,7 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	}
 
 	/*
-	 * DWL: Data Word Length = {16, 24} bits
+	 * DWL: Data Word Length = {16, 24, 32} bits
 	 * SWL: System Word Length = 32 bits
 	 */
 	ssicr |= SSICR_CKDV(clk_ckdv);
@@ -307,6 +308,9 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 		ssicr |= SSICR_PDTA;
 		ssicr |= SSICR_DWL(5);
 		break;
+	case 32:
+		ssicr |= SSICR_DWL(6);
+		break;
 	default:
 		dev_err(ssi->dev, "Not support %u data width",
 			ssi->hw_params_cache.sample_width);
@@ -697,7 +701,8 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
 	cfg.direction = is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 	cfg.dst_addr = ssi->phys + SSIFTDR;
 	cfg.src_addr = ssi->phys + SSIFRDR;
-	if (ssi->hw_params_cache.sample_width == 24) {
+	if (ssi->hw_params_cache.sample_width == 24 ||
+	    ssi->hw_params_cache.sample_width == 32) {
 		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	} else {
@@ -1021,7 +1026,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int ret;
 
-	if (!(sample_bits == 16 || sample_bits == 24)) {
+	if (!(sample_bits == 16 || sample_bits == 24 || sample_bits == 32)) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
 			sample_bits);
 		return -EINVAL;
-- 
2.43.0


