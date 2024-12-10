Return-Path: <linux-renesas-soc+bounces-11180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7D9EB788
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20472828B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB0523D400;
	Tue, 10 Dec 2024 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l7eMh92F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC87523A57A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850627; cv=none; b=EEPsPjrivEDMVEg6WNTXfhKJlOonxtm/kI8QiooObdtwiu7uls6UtHKZ3n/7a9SFdP+U+AR3gETZwxt7CGLIoRdGU4iQLBqxxF4wIiIcabyCzRywhcNkD7utX5MYvVYa/ExBJX+6kgCOvWQ8ARi9Mpgb7zuyWGg1J8fIOuRzIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850627; c=relaxed/simple;
	bh=TdUpesvK2bqZRA5lCnWS4V50ZEqpa6uiukIdp73czu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pwwQ6jcaXLo0AktGmoZwu8fLhKTPMhgIzDI3N2vQ4PZItwN5hGzfmNF8xmHimol6M8l07lJkTOo02joikL8jzarykzKfXUW9uEX1qrJm0M5wrSkzmQp0qj1MARameo7VGw50oKjZCGf1fIQIM8CgeJsJ+dITYvzMuNrTYV3SLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l7eMh92F; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so4786892a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850624; x=1734455424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fZD7MbYY4k4sOMCUWO81EIjBCeOEixHEXtaO9JyHpg=;
        b=l7eMh92FJNf507Qb2dky0SDTjlhKn5rluqm2wke2c6XR5VTTXtbbN0RRbE1OezXBsb
         Hcf0QGSTKHPLU3mUXf/Sbr8swuW/vEbMtTrEFNV+okGTAyjUcp/tXX35A2BIq1pwEM1+
         Zrmrj0neRmP42VA1U/H3LtIECDofqlIEiF6Z6vSnQuR1iVcZ0JvpLh8mMv9+fhtgpkto
         avrM1zPfdmEKDUUq9m5h5a2Aw4S0p+u65brKXzaXyW7kXlDNtoLuzn6wwvJx0UQT1vuO
         PqzPcJe3KHrMPMXh8Y1D6dt69YQPVOLGb2c1T1UznaHHN7PDEBOYf5WwHQDv+OmCOLhu
         nLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850624; x=1734455424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fZD7MbYY4k4sOMCUWO81EIjBCeOEixHEXtaO9JyHpg=;
        b=UOXn+5ovUoA36GMthFDwPq1aGjyfcZK3iNd6+Q0PyWbaq/aNghfnXhrDqB/yRVLZSy
         hXfh8qcCctAAeL16NziNPGmo28jJAId52A+1+1AHfUUiIhZ4J2J0ij6Q+oXVhnY8LOJq
         9Sd4RDw3Uzu/vNFtcgnpw6cx002V2wPv2IWFuJ+BQHVFVOC4oMMOdXyXzTBY9h0RgFQX
         7STyjdkL7OmMZodwN2ysp7HgvCkVnqPTE9hb+vjyLV0JeuTXwKzAVfyVueCBN9pND4ET
         cCZ9rdizWNI6nxiaZxruS/PovJ8PoWvc9d3FrO1pGK7jrF58e9WoD7CEdFHypEgO2wiZ
         ob7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUqEV1OdkioWiL46UX4CtIZ3q/G664EDfdoadX8q4+j+xAKFtYtiTz2XDDWECi16WYiQ08x7baB84KHTGJL28Ygw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXoHNtUcrDXQ/IFYaqavebvh4TnN75bgThXpYCORRsGJjCvvt
	QuGM2e87CiOmoQFADSdKOEUg59u+KMycJ97XKm67N7ua16TmvVUH//Ei7Zjf9Ng=
X-Gm-Gg: ASbGnctpju2YdQzGPHvAMADTTLuQBOLrnks38hN6wiiPSCnTc4k3TGqbx2cTM04olGJ
	Bi7eXjrQAobqOTJF9UCxZSybJERwTrtRGVfSyLxPp+OcDALioWjM6hfPLNntN5xRm9kTrQ3pZx3
	3tBDy8IrmRa36TmQk2URujrp+1r/PD04l8rSGuhJ6hNgu+NXhI/RbPsMpmq1HoMm8vVDNHeQg0e
	tkZHQyFRCao3+QinGaYesIFBawvt5rXgKqK3RyFOg8F371K2sghIYDpDxLyfFQIwqMkioefk7dE
	LxZoN6e+
X-Google-Smtp-Source: AGHT+IGPNWGY9jEOkszzr7a+HCzsQHx/+czOpLjoEtr5Y51ztb7vYMYNc711VxTTfs7vb+1yWs3GDg==
X-Received: by 2002:a05:6402:26ce:b0:5d3:c4a8:d259 with SMTP id 4fb4d7f45d1cf-5d41856a452mr6845842a12.19.1733850623996;
        Tue, 10 Dec 2024 09:10:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:23 -0800 (PST)
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
Subject: [PATCH v4 08/24] ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
Date: Tue, 10 Dec 2024 19:09:37 +0200
Message-Id: <20241210170953.2936724-9-claudiu.beznea.uj@bp.renesas.com>
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

Remove the rz_ssi_get_dai() function and use directly the
snd_soc_rtd_to_cpu() where needed or the struct device pointer embedded
in the struct rz_ssi_priv objects.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- updated patch description

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b24c323ee05f..e2e172d8e9db 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,14 +162,6 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline struct snd_soc_dai *
-rz_ssi_get_dai(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-
-	return snd_soc_rtd_to_cpu(rtd, 0);
-}
-
 static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
 					 struct snd_pcm_substream *substream)
 {
@@ -243,15 +235,15 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
+	struct device *dev = ssi->dev;
 
 	rz_ssi_set_substream(strm, NULL);
 
 	if (strm->oerr_num > 0)
-		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
+		dev_info(dev, "overrun = %d\n", strm->oerr_num);
 
 	if (strm->uerr_num > 0)
-		dev_info(dai->dev, "underrun = %d\n", strm->uerr_num);
+		dev_info(dev, "underrun = %d\n", strm->uerr_num);
 }
 
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
@@ -988,7 +980,8 @@ static int rz_ssi_pcm_open(struct snd_soc_component *component,
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
 	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 
-- 
2.39.2


