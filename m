Return-Path: <linux-renesas-soc+bounces-24619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4AC5BCF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 08:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9988D3B4017
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909692F5A1C;
	Fri, 14 Nov 2025 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn2iX/lM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BC2F60A3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105837; cv=none; b=h0Vr2zNbCASjkvbUoMkfv9bV1uRF3eBAsrzOGZw01szRvc3e29c7i/t3iCzzxPPBdZ79C1/00n4Z6r1OT4EYvqx2SjIC6RIF8g+0DhkdagEnz1aIXwwQlK4dOFfgnx/WfQWOI2JKvluhDDC3H3W/NlcvAeh/BqgRkqwHcuBXNLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105837; c=relaxed/simple;
	bh=lkh4hyq/8FMrrYfCa0/mOr7Eugc0cJPJFFjws+uija4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jT+8Pje8lEuqMEUfmBuc5gUt/GCpE9T3RT4Px+pd/9T/Zor1vApi6T/LAh8bCl78CJ7KnV7g7fS0TWqiGlMM8VF+rvyUIhtcuIoXCEmhfutSwDurAFEaGppCVWAkx6TNqfZHfQNLIr3Qjp3mlVC1/qpErNy+g77ndxbOSeDIsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn2iX/lM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711810948aso11010925e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763105834; x=1763710634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoTzx6hqmV9hM+FsySQPQ7RiL9yBYXtI+clOM6FTZNo=;
        b=Rn2iX/lMjD7MZyksqzkMLtATEBWoQTh+SXDkAzrUOusBMy+pVYb2cqXE2kQ0zSoAcp
         dcLO4xmr3fHokyNSpGUav48xpce7xsdZyR9JBEaUSf+RHK9QtS+C8bQ1bD3S0undjOSM
         Jc084tvb61u45Wx2P/+DmacvhEvzmZDUYUWy9VRZd140pyxshi8nLrVAkicB7F+SQeZ2
         Xslwu2XjNFIe+52dRVF05Lz61DchKNMs4yPt5j4tdjXtSwEGdmuBZIe35cGmV0HCA7Z/
         S+rEzUPmL4l7NSq6hwa1PDKRrnWC6yjjwMyji8YJhEQU/Gy9y+R+9Ggh6xhlBEeWhs8M
         Z4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105834; x=1763710634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eoTzx6hqmV9hM+FsySQPQ7RiL9yBYXtI+clOM6FTZNo=;
        b=pkbVTkKCfwTqez0xWbNoX/ORb7XWSHa7LEAclkKWN4im4Af3FwZ1GO81U0856ey+Sk
         rWUwg3jUe6NL46nRNwfSBxgWoVXehcYFTbaGPnos2p+X2sagkKY0ofVvY9t2SthGPuae
         hITqQAAGnuK49L1EK2tmtnIrC0R4Jn4IPP/FXGJHr9YZ+lbIlMw1ZKmI3YS8evxLqm3c
         s9LnRHbROhMcCBatjbZoFCvW/WJZ0ipxx9jnHQa/zoLcJyYFnVuMgMTAxdBirmuyEB4X
         pWEDWFrzVco5wRXpjkojTqZdoddtt5IgF2875SY8vO9UXUfjA83APVdrr3lwFuo8Qlxn
         zXJw==
X-Forwarded-Encrypted: i=1; AJvYcCVApMgFJw0eUSaWhjYSEF12nz6bRVgJKIkGR6YbXqialZ0L1iRdGUqzyt5I4mTuND19Wgc9mFpIbYq5dKPu83+yqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBH7f8Zk5D9FltbFMws1YcmPwUDeUjd5LKUamrgec9Cr3pYoNB
	USqcpXejGU8M1kHrhcMfCRJj65e2IsFDXZmyeRPVLup46jo0V4SiAFrf
X-Gm-Gg: ASbGnctgTESxz2pQ5uS5Z3ytFtECTflGmQueNM5hbxWBUpY14g1NmK/G4/PYeVb6LZ7
	YIqk8uQEvpC5ZQl8Sg4zHuUpMkOPbYXTMf4rqE0LWzTN7T9aaX1S/ToELVZSu61fwrnlisAlBuL
	jNENoONSiFwX94TtRg8VCav8BH7BUU6TE7m+zFa+0CSbRXFI8c+7JC9bsKFjTF1ygFJDgleOolx
	6fSXXGZ9aLBAotuFTn0GrxzW2Z8I/+ue6ycxoKnbmv4/UCH8SADT87KFybBFvXAUGdJ5L6Ard85
	yLg4SI7/krTgQFzjaU6AsnIGdRT9aW6pFPhBT3dn8O2m/sxCw0Qs+hA0TaZxHtiTVHGttZlAQ1/
	IJOo68wNzZn4eKlGhKtCggPzdP/0f2zA6LsaezNAAaE/X8wdgR4389Zg1XeKIUoymTPCMsGOaDl
	Gh74kXlrCkTaUJ5FlUjCVuOnFO8qQw54aTlhrfwjOTPbWYd1FBsz6XP/p4wk4UihhR16VTOp6RV
	YA64SjKnyQWNgM/
X-Google-Smtp-Source: AGHT+IG0OwVJlx9IxqhBCdb6uEYZrrRjxlVOfg439Ybhkpn3/YZFYPYFf7yTJOzlY42p7jR2av0jbQ==
X-Received: by 2002:a05:600c:8b38:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-4778fea2de7mr14660925e9.24.1763105833870;
        Thu, 13 Nov 2025 23:37:13 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm95071825e9.11.2025.11.13.23.37.13
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
	stable@kernel.org
Subject: [PATCH v3 2/2] ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
Date: Fri, 14 Nov 2025 07:37:06 +0000
Message-ID: <20251114073709.4376-3-biju.das.jz@bp.renesas.com>
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

The strm->sample_width is not filled during rz_ssi_dai_hw_params(). This
wrong value is used for caching sample_width in struct hw_params_cache.
Fix this issue by replacing 'strm->sample_width'->'params_width(params)'
in rz_ssi_dai_hw_params(). After this drop the variable sample_width
from struct rz_ssi_stream as it is unused.

Cc: stable@kernel.org
Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * Collected Rb tag from Morimoto-san
---
 sound/soc/renesas/rz-ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 62d3222c510f..f4dc2f68dead 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 
 /* REGISTER OFFSET */
@@ -87,7 +88,6 @@ struct rz_ssi_stream {
 	int dma_buffer_pos;	/* The address for the next DMA descriptor */
 	int completed_dma_buf_pos; /* The address of the last completed DMA descriptor. */
 	int period_counter;	/* for keeping track of periods transferred */
-	int sample_width;
 	int buffer_pos;		/* current frame position in the buffer */
 	int running;		/* 0=stopped, 1=running */
 
@@ -217,10 +217,7 @@ static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
 static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 			       struct snd_pcm_substream *substream)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
 	rz_ssi_set_substream(strm, substream);
-	strm->sample_width = samples_to_bytes(runtime, 1);
 	strm->dma_buffer_pos = 0;
 	strm->completed_dma_buf_pos = 0;
 	strm->period_counter = 0;
@@ -978,9 +975,9 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
-	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 	unsigned int sample_bits = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
+	unsigned int sample_width = params_width(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	int ret;
@@ -999,16 +996,14 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
 	if (rz_ssi_is_stream_running(&ssi->playback) ||
 	    rz_ssi_is_stream_running(&ssi->capture)) {
-		if (rz_ssi_is_valid_hw_params(ssi, rate, channels,
-					      strm->sample_width, sample_bits))
+		if (rz_ssi_is_valid_hw_params(ssi, rate, channels, sample_width, sample_bits))
 			return 0;
 
 		dev_err(ssi->dev, "Full duplex needs same HW params\n");
 		return -EINVAL;
 	}
 
-	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
-			       sample_bits);
+	rz_ssi_cache_hw_params(ssi, rate, channels, sample_width, sample_bits);
 
 	ret = rz_ssi_swreset(ssi);
 	if (ret)
-- 
2.43.0


