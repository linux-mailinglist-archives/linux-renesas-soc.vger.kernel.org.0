Return-Path: <linux-renesas-soc+bounces-11188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC89EB7CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36333188769C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B02E23EBFA;
	Tue, 10 Dec 2024 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zvofd3HV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533623238D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850646; cv=none; b=mlMGwjlKTYyaJHlptDXSk3CRZYOFQjR1GHLKw32AyglChEMwBJLvBQkywYex9yXscKkkTVJiyhZio++d4YnjoUPrs75eg96Wl3bnzGN+0/SQc5StzFwqpK9MsObYyO+X64JZsyA+3SAhVW7t5L1922UUSlKYfbkhYGG+ll0kgFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850646; c=relaxed/simple;
	bh=WRiEYmvCrEDu0efYiS+BnJtjOfOD3CrYjSzhUZqxggA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=du+c33GqFkDuBM03uNYMKnqLxnSpTKWsn30y+eBD8ffr7su0/XrAltp3bDvpkCx9y0WbD8J2x4mFSRlhKSKJ2aQWdu+n3+enSXjBP2zfVg35AKjiYgJlH+g594+wzHiRticRnwQKxUfzM9EVFoqbhnzktdn8lpWAcLA3VQfpByQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zvofd3HV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so4671110a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850643; x=1734455443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNFyzgag91SKUVQoD8nVAEcB8AscK0h2z9GDPU+fWvo=;
        b=Zvofd3HV+DvTBxPWHoe1SPdInPdjNUYoU2M8AXG1stpYGcYV3v7cBbmZd8kUT+meB8
         12eWtszwZpoFY5Kf28ox3CaKK6VH1DlCk0TsS05KBwIJEtEDQrNGXzfsTTvPZJqoV7jY
         II6zCvU6yiK/5vViQp3OF2FWBUUhUt/fkT+r/obZsWVi2LVRJqRySj8621edsqgbPH5i
         0Smr+H8kGxvN8wt/xDjT9PP8rlDT1SyDFtRpuLB2xYZW96CM4BO3cI2ctyLmY2Cg1/VA
         KmZgpa/FA911VIvsqiyyzxCaTMBTzH3SMSWZfk4CCbQqoMyP8rIc/G9gm7cz92e/lbcH
         Qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850643; x=1734455443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNFyzgag91SKUVQoD8nVAEcB8AscK0h2z9GDPU+fWvo=;
        b=ss1JmmZLfSagPHQ9qFBipuqgFubtvpggxB7Zv7jHFGX3N1CgzEFuIfjYNZxTvz+0OX
         TOuXPla5poW+0xH+4NJar3fZl1VkCR90PwJVeXdYR+aO1PavDu/nKBuOBw1MflDdxStd
         ABBQpmnQPeQH/pW6lyvMfgAOe56g3G7Gh75HaFJwiLBGsgNg0fZ7xrVPszzrE8oMbV8o
         8PxhkE+IxAdxBTaLrnlUoQFiVIcaE2j25thwXLPM6Ejne+A0HzZrXkkNKSLifp9NYNtW
         pzAuzbfsiom5ULsDezgggPpJ61jGL+XVtxYeU6uQ8N+5DcvwBu8PS3Q6/owwfYsnyMFJ
         K9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVc1gnUYwnedjUj/oNz8ZYPVnIXFoUUONsWBHAJXeDJXYy/THahYaoUpmlqD+ftDF0G7YKEBcllphqbSnyyzR/hiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZlFRbTYRJjkGkAtSy4R1AOi4upCmDEspP/JOD59KVBtKTKn8h
	sIZWKq+9Upb17xGPvrnBVnKpyAQoIKCKHCyPOouObDmV3c+HsujTCjLI7KXS7Ow=
X-Gm-Gg: ASbGnct/9AKnLVFH3KghROwwyCTWGbz/g3ySj6BIUTJPwTneLnRAIGJRgexm/maCmTF
	kcQRrNdpSUWxYFmlDyLB4urPlkuWYtJHvedXcrcCjqv60zvpovdCvD5ZtujEcopGKUmXk+iVmDR
	aMbANtgmSz+lZgkpuTeHlsrvSZPBeGrWvMH7aQEz/pk3TmwUjBaPobo0yc2tx0vCDXbn5vtPfHR
	btxdpteF2bM7p9LJaQb85gD6ErqGXFfQ3VueERDzQaBgSRBFcDZ3lEXIQSHCi6BXApex7tkBwXR
	HMGmxVrR
X-Google-Smtp-Source: AGHT+IGBwrXeGyw9PzNdwLgYXKjgGaPgrny0AlmNGbVXlrqkKBOlqakuZUH3QzbVuduS9Y4Lgz1XGQ==
X-Received: by 2002:aa7:d985:0:b0:5d3:d8b9:674d with SMTP id 4fb4d7f45d1cf-5d3d8b967femr12400130a12.0.1733850642620;
        Tue, 10 Dec 2024 09:10:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:42 -0800 (PST)
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
Subject: [PATCH v4 16/24] ASoC: renesas: rz-ssi: Issue software reset in hw_params API
Date: Tue, 10 Dec 2024 19:09:45 +0200
Message-Id: <20241210170953.2936724-17-claudiu.beznea.uj@bp.renesas.com>
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

The code initially issued software reset on SNDRV_PCM_TRIGGER_START
action only before starting the first stream. This can be easily moved to
hw_params() as the action is similar to setting the clocks. Moreover,
according to the hardware manual (Table 35.7 Bits Initialized by Software
Reset of the SSIFCR.SSIRST Bit) the software reset action acts also on the
clock dividers bits. Due to this issue the software reset in hw_params()
before configuring the clock dividers. This also simplifies the code in
trigger API.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- use rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST); in rz_ssi_swreset()
  as suggested in the review process

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 34c2e22b5a67..486822d79458 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -388,6 +388,15 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	return 0;
 }
 
+static int rz_ssi_swreset(struct rz_ssi_priv *ssi)
+{
+	u32 tmp;
+
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
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


