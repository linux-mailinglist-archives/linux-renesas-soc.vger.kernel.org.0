Return-Path: <linux-renesas-soc+bounces-9747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4F99E61F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F281C23368
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF281EB9F1;
	Tue, 15 Oct 2024 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVWGJ+zu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE21E7640;
	Tue, 15 Oct 2024 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992298; cv=none; b=iPek0IZexeZWjCnHT2Xcti1SyriyfkI5cQCxVYka08GW51Lo2yuYDFVhdVRy/ln05bVtIknU/JvCX5E35KLbgyUKhz2oHfvNzfV1zMebCuEG8fDeEgYQ3ivndmRwu8sHi+N02d1xzVaCrhARTVRdKj9p6sw5A4AkD2HfTQ4MAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992298; c=relaxed/simple;
	bh=geT0lHqADzdDzIZm9Biira1fSCZG9feRVWG3U7e/Tl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehAg0CvhjNsXsib2uF1m8TY/9/1gBB2DZeF163H5gaD9CkXyptkV1g7fS5cb/PudxCZIkWavTCOenH3nYok6U3ByHjaGLRFiyeJo7RY4w7m5/JCAFwb0kD656RPDK3LM1y3fo2S/HW1s/wBWVCgnuRCxcbHTJsz9m+CPaylK8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVWGJ+zu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d533b5412so2542874f8f.2;
        Tue, 15 Oct 2024 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728992295; x=1729597095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRbm+GAQ9u5DjfAW30Utt/l8EcrPAOw7i/lZO7JA7Sg=;
        b=DVWGJ+zuRnGwXyIfOmy+KqKUwc11f7fOo+T5zJnt8FTDhi4DLhDeoEI5clsHb8YIJG
         RhfwF1DhUnmSW7pTnGGJJpIqKCvkjqJSRqNecdvR/RcTP7fWYeo8Zkmi1xp7oWLdb/hn
         Lb81WrBR3HV7GWLZy3ViqVl/yBYA3OczSEHXDxSUdv1n7ioPjNdcDRMnh4hC3+Dl1arO
         kWTJNHudHl+m1XT8zRxStS7lABhMZFMtz7iuy76aQGmP1DFU8eeJPODG9yXat4P1BaBU
         4IoXuTXYX5hChSejkKVf9jezeLcNGnApZeP1VydEfBHr7jxf6IjZoJAzuyDpLYu0AkVi
         cy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728992295; x=1729597095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRbm+GAQ9u5DjfAW30Utt/l8EcrPAOw7i/lZO7JA7Sg=;
        b=g9/PaZ0AQ5IgFaPdkWwMZsumAvtwZjFFsAGzo72rwKj2ZDn2P9Drc6B1XZOdgxoRhX
         /iFmcxc5LSP2q1wpBYZHGv+Uct2C43xjC+hH/Rjh0JadSo5CuDNZPFaj6UuX1Q28sUGP
         b9R5iSkRvm8r+nUrgBgJina8/WWRrVWA3hhRN4DWkCv1tdvekjHLwPdra9/Io1KqLJAa
         Qr6t2xAck9Q4+UOvBLUyCrj2zV3yrShvyuI/P5YQ507eiWvhnYN+ZO3THKG0iHNJ3G0z
         dXHkV2atjOjGQWt8ATITiJZ0SESzUEJzopTlMxbnTYv9x+voTcjjq8K32iy4V8vzVzzB
         u6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+VKJl3Rs9ftED1Y4eshtE8mpU6R6KUhIp8Gfnk+uTdju0F9bfg6GsMMfOU0zrXAMCzUTiQsqajcyCbNVLbFiz38=@vger.kernel.org, AJvYcCVVpqXvLlTTDYB65T/RqfUTTUtejoxzg6HaajC7w97hliANNlb7GgIZ2tqfclJEGeTKRNf6QYDwB44+HpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YycqYJErVFAMYnrwRTams/O4FMzIPA4+3135zr44u8RkLW6Z130
	rkYeQYgkQgEDuBhlChK/LMxnQy2g/YAlNA0+xK+ROfhzy8QMTNPi
X-Google-Smtp-Source: AGHT+IH/vNkS4s7cE6jdRGiUnaB4KfJOhIfEFLA+OStSVrhM3s7KTwwFV3iG9mdQRX4CkulbNbHkxw==
X-Received: by 2002:a5d:6b8a:0:b0:37d:4f1b:359 with SMTP id ffacd0b85a97d-37d5531b3a6mr10329736f8f.53.1728992294713;
        Tue, 15 Oct 2024 04:38:14 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ab23:85df:144b:6ce6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a256sm1363943f8f.14.2024.10.15.04.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 04:38:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] ASoC: audio-graph-card2: Update comment with renamed file path
Date: Tue, 15 Oct 2024 12:37:57 +0100
Message-ID: <20241015113757.152548-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The "sound/soc/sh" directory has been renamed to "sound/soc/renesas".
Update the comment in audio-graph-card2.c to reflect the new file path
for better accuracy.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 4ad3d1b0714f..747afe7d6f34 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -50,7 +50,7 @@
 	snd_soc_runtime_get_dai_fmt()
 
 	sample driver
-		linux/sound/soc/sh/rcar/core.c
+		linux/sound/soc/renesas/rcar/core.c
 		linux/sound/soc/codecs/ak4613.c
 		linux/sound/soc/codecs/pcm3168a.c
 		linux/sound/soc/soc-utils.c
-- 
2.43.0


