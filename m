Return-Path: <linux-renesas-soc+bounces-24543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 180A3C56448
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9217634CB5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62595331213;
	Thu, 13 Nov 2025 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeAeo5ll"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7254D330B1E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022359; cv=none; b=CzydVLy1moUS3NUOV2jZbn9CpCIqh2bsZiL3751vGWpGA8bs1RQoFA1Ldwr7jtKz+ZkACa2DO+HX91nN9zwbgwWk4ZEDaRK/Hq0Bv0hpR0G67N6To4xIul/pVALLfBvUEVjKUl3zugM4qNRufl12iW4oSTiwlt/om2pW6OjwfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022359; c=relaxed/simple;
	bh=Vvo09bFq8tEaP1B5nFoGfs/9TqliMjuKbCECXkO5VIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4zUBd5iAVxwzHtnRHEf0vBPZL9nsjTfkvtKL/7bBq68eHhqySH5qj8lwXL1dHKojPkw0vohLQgPBxKrYJHWepFocxVJZ3FblE6YFc7VIzZWm3y3nk+YN6g450OQryaLPyw2h52pJTGP8nm6i2Q2Az3xvIt9e+VPflsYrBljRds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeAeo5ll; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755a7652eso3633445e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022356; x=1763627156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEgvbUe/SG9kBJT2lT+vOW4S6Qvv1BIswGeH2rkA3IU=;
        b=BeAeo5llKhjTG1m+stMMWqFziKWB1dPYlN9uogyteIiKyz0F6ZROlZK7Dn0Bqyu/sn
         i+l+KYgeubt4SlBuZctHkaZW0cQX1Ex93vxd+3VabqWk7xNjZXx0gKCQk9twbsCBSt78
         Qve66JfBwWFaU81a755i3YyUy1XFle1fUWra6BcHEhMr1r7NFNfnVXro8wcJGY7qEtif
         f7jWDaeGfw7rmxfgzwEbqQG+D15d9kfx8XgzSkkPPSTWSBcbgcPeGBulFlc2Qh++6pyg
         ukB3vds0G468Zng+n2069IOPJbhEeOo8LhZa+XG6rwrSjzglSY3lw/VWoQL1rM48oC+1
         83ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022356; x=1763627156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEgvbUe/SG9kBJT2lT+vOW4S6Qvv1BIswGeH2rkA3IU=;
        b=AmA+XGg9ev6kYf+cwsWlRBgl/h5QDJXm54F8rK4w9je/azy5lhIjrmHPqLEvRLiNkZ
         Bivq7ERtm6QHAxNm1WD5slwlIn87wWljcWkSvunshhByydLjQIg1k701DSk/dPWYd8im
         PEDGJYVHHJwLdDOCpIWJ7+W6lrTHwXT4Lz94rJ5uOanAj1JqvbNF9tSx5M9DIt1QX0Es
         YObtkCUufZqm5dJ/nxgXRUuIltB1jhU2bMcYXczlb/q1Ta1QVBiUOa/KH8FDYNS7nzzN
         teUivbrTtF8KURg+irszzRcbo7pt16KfarEM4/AD5zvZi8Xir5+h/7KOu9p2FRGWc5AK
         23Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXVl5A4dqvTcyLGzLzqDWTi1bMEH42J7lasnjrS18EFaDxknBeulSZuht9wIYyPp/x4tQeo7idj71cuwBxbbZolIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Gv1JIJ0KU4EwrJIxbxcC36p28PCHXZRKHbejsfqB6YLRdfZm
	d4P7roIngMfWPYIC9fYgtF9hX+a01U+x9cXuMZiNyEc1l3PLSZCnwb7T
X-Gm-Gg: ASbGnctF/T4nCRtX66UnP5Ta3LnaR4nYSTfNDl8/1c8gDknMgFUZfKfC0rH+KWEcaGq
	TxOzQ/OZ/XFUqN05oUBs2OUiqjOZ27sk/v+aNRSXc8pL7s6DeqxneaWMaCUS0F+6DgkjfrUd5nl
	7I2cAlP5stFLhOK3dTSAc+UwVtTnx5G+FhbJeh1+lezszacUQ8/dH+oRToUSAyKJD53itFqwMZ6
	3UAM9Xe0ZikIFeJAwqCAG46M8PsTBf8nwRQTDsWZOkmlY93TXRmGedfxs3Zi6EqKO4d66gumxRU
	3DJsxZgZpcBCYYQKYosZidAqgCAAfnUC6fIvBPupncVm7TzkKNq34uQLNuZmbr2I4wk4L5Tv8rN
	3dO2XIdbwMm4Ug0HhOmJNmum+EKFZ+dI/f5lT/i5O1hZQhLYQ5r/Ucdqx+D6s1lL4E8TS62liKc
	jqvmyuoakj9wW1llTu5mgPV8Bbh+E1PF1pvGx1K6MNcr+4FzhwEuaWSNHYB76xYC0Dj3fMi1Y=
X-Google-Smtp-Source: AGHT+IEh987VFOInqDaiE4dQokzyddzRnJWtVtXv0/enIYKH97ZJzm5R8OJ0GWVJzZF60mkUQh0k8A==
X-Received: by 2002:a05:600c:4fc9:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47787071649mr49869865e9.5.1763022355600;
        Thu, 13 Nov 2025 00:25:55 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb34295sm15214435e9.2.2025.11.13.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:25:55 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
Date: Thu, 13 Nov 2025 08:25:47 +0000
Message-ID: <20251113082551.99595-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
References: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Collected Rb tag from Morimoto-san
---
 sound/soc/renesas/rz-ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 86a6b4eff210..b5715e7318a4 100644
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
@@ -980,9 +977,9 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
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
@@ -1001,16 +998,14 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
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


