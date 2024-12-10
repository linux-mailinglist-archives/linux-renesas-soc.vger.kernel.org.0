Return-Path: <linux-renesas-soc+bounces-11189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDE9EB7CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1B1E281EEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8073323F9EA;
	Tue, 10 Dec 2024 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RxkgtaoU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620BD23EBFB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850648; cv=none; b=gJssEJNWwvnWLhtyQZVjM/UU+V08cez9NDDLpSqfmhls2m5iVRYas8Q8IqbZEDMjnh6uPRhxhODBsuiq6C5rL7gO03b97LHG2u5CBK9BgX9+baycivLnFVDux1LiIQ+zyZR4SYI+aian8r2JWGRQxwO70m1cuq2bIftpLFRYBuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850648; c=relaxed/simple;
	bh=JQNGPZYkGQRQ2sTS79lFZ6me2mcLImriGT7BK3n9sx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7nLpF8V/6+45Sa82IBq3GFYkDPSsHd438X/eTIhl6XdmeZNnSMj9LDkOxk2rhJAScNjpXd6zl30JfzOvXlf6O3uHMI4GcXpePBt8b9T011yZYIHPS0rAAvpTuz42hkWhsZXu702pDsVjKMlAN6QnaXwEgk/fVptJRfEjoyCqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RxkgtaoU; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so5214484a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850645; x=1734455445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdorf6J6oUWOvTlM/ckHP3yguOeZKUZzy/Da078XD3Q=;
        b=RxkgtaoUMawCkOLuYSCT0LaqBXe0bXBvLgBy/pgjEtbXQNA8Vqy5k636ofhxNKac5Z
         euouPsNyepl84zZmi1DHJ57gUxsm4a4ZMnOXZnO5n9tTgpmC1IjGud8k5RQvqfer6dl6
         5BlooiNDCoggtL79AHgEC9LkU8fE7fo+U7sVSwvu8w2URX970dpGlgGJ1xW7RJOdAf2e
         c/m0Jd+uARwv2JQ7MTVqrHJDjU3lwWw1Z0wlgEZm+04vghaA3jzfQdhpI+ZkjHV01CA3
         ZqPWHBXF6RkDUQGeLYHOdYHrJUG6MIz9WwYtVRaMFWn8NPC0K6pyL2PSOL8iah+PegfE
         2IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850645; x=1734455445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdorf6J6oUWOvTlM/ckHP3yguOeZKUZzy/Da078XD3Q=;
        b=Hj3+smrrSC9CWXFQnm9vTfgD8HYWmJTfum9eRfbJPGTM56PYIzgxd/r/UN/UQlFrZd
         aSjrwGbbbFdBOmZwQ7FlE2fpHARTivYSKxs4PEpGG39n9bElJgW/hNM/NlOrks8sMleI
         uM4dUGemQAYOBciCjQjYtb5JlKOhkdje6TsRazqUJOqmCC7eE4BJKTPIax2ZoWwXMaFs
         f+QmtrmFXbVCzQeSOJACDK4tJbnhlBfSRL0etdZU0RbvuRaeV8iPjD6DQLqFHrtXkWhx
         ZinSfBWWZLCfwy/jIXCu+RXuXczjOj6ebrM/CL31iE2bSSBxSUyPNJVq/AhTtZ0iOSK4
         +qeg==
X-Forwarded-Encrypted: i=1; AJvYcCUfvzkx7QFdIE3Z7xlfo9ZNzsf2RAW9wdq7v080EF+v0TWLCx24VbBX3zhdaZK5bTSbOjOyqsGzyH9UqcGQ8L9qNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzel6BPno6wdQFRmDdaE24QUEY2q9Wvznfj9oodkH4hDSakVOch
	GCrsTz5uo2DZA4/rZU76OogF1fYOzgX/48E+Z+sAEUvWnZCtYGjECPVFFwIGQxI=
X-Gm-Gg: ASbGnct2WpR7qdQVwIj6MPUV1iIZPwVMRouOueBtZbdny6zxt/k37WxZZuQmaM+WPKG
	zF86jWzWwUrx85T093iy3somrq1G+WStPLEl50b38PN/5DPGSFPNjv+GiF2+sxRZTlwEym0gqTZ
	AW15gFUENz8waWx8l5YNWczRty3UIlZ8n7jMaMUIjgW7AqmK9zIzkedyhBXHZwm1bYjhwdUVzAo
	iv4dh/xB3y/0+XxzsTHICtJGaKw5Ep8/SLME3oO04Ik/AwBDeqaIDr5dFdy+YXxZ+UAzS5xWq1D
	XqZH6ZvT
X-Google-Smtp-Source: AGHT+IG0YYavl8GoEPcOWdjWdvPZujuBgG2HJ16HofI4S8uWOgmyS/RSRLDoRpiWfKoP6RlhHB13MA==
X-Received: by 2002:a05:6402:3493:b0:5d3:e9fd:9a15 with SMTP id 4fb4d7f45d1cf-5d3e9fd9b71mr12243945a12.32.1733850644830;
        Tue, 10 Dec 2024 09:10:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:43 -0800 (PST)
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
Subject: [PATCH v4 17/24] ASoC: renesas: rz-ssi: Add suspend to RAM support
Date: Tue, 10 Dec 2024 19:09:46 +0200
Message-Id: <20241210170953.2936724-18-claudiu.beznea.uj@bp.renesas.com>
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

The SSIF-2 IP is available on the Renesas RZ/G3S SoC. The Renesas RZ/G3S
SoC supports a power-saving mode where power to most of the SoC
components is turned off. Add suspend/resume support to the SSIF-2 driver
to support this power-saving mode.

On SNDRV_PCM_TRIGGER_SUSPEND trigger the SSI is stopped (the stream
user pointer is left untouched to avoid breaking user space and the dma
buffer pointer is set to zero), on SNDRV_PCM_TRIGGER_RESUME software reset
is issued for the SSIF-2 IP and the clocks are re-configured.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 46 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 486822d79458..d48e2e7356b6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -782,6 +782,32 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	return -ENODEV;
 }
 
+static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
+{
+	int ret;
+
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return 0;
+
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
+	return rz_ssi_clk_setup(ssi, ssi->hw_params_cache.rate,
+				ssi->hw_params_cache.channels);
+}
+
+static void rz_ssi_streams_suspend(struct rz_ssi_priv *ssi)
+{
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return;
+
+	ssi->playback.dma_buffer_pos = 0;
+	ssi->capture.dma_buffer_pos = 0;
+}
+
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -790,8 +816,16 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0, i, num_transfer = 1;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = rz_ssi_trigger_resume(ssi);
+		if (ret)
+			return ret;
+
+		fallthrough;
+
 	case SNDRV_PCM_TRIGGER_START:
-		rz_ssi_stream_init(strm, substream);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
 			bool is_playback;
@@ -819,6 +853,12 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		ret = rz_ssi_start(ssi, strm);
 		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		rz_ssi_stop(ssi, strm);
+		rz_ssi_streams_suspend(ssi);
+		break;
+
 	case SNDRV_PCM_TRIGGER_STOP:
 		rz_ssi_stop(ssi, strm);
 		rz_ssi_stream_quit(ssi, strm);
@@ -958,7 +998,8 @@ static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
-				  SNDRV_PCM_INFO_MMAP_VALID,
+				  SNDRV_PCM_INFO_MMAP_VALID	|
+				  SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -1201,6 +1242,7 @@ static int rz_ssi_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops rz_ssi_pm_ops = {
 	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver rz_ssi_driver = {
-- 
2.39.2


