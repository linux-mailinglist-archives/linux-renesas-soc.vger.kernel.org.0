Return-Path: <linux-renesas-soc+bounces-10339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7769BE0C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B211F2230D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297881DF991;
	Wed,  6 Nov 2024 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mi/RVTyo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23871DF98E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881216; cv=none; b=esgMWrVoUB5jMxyLY20cD2buPMyk0mFqYmda/Hej6/Y2/5B/fGLJ7FPhNJnyAZUjY6ORNvLHVUKeTrKXHtaI6fRau+x1E68NT2QRmTDf4ELW5BGXOclO6p4fm6h6aY6JoviNBpWLwDDYplw7D6fQs1UUZXOowlxM/DFbhAxu4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881216; c=relaxed/simple;
	bh=EW5QvHdzBq+RJllof00TNGgCEYMdaEbYmP7Eh277mvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B7uZG3aFe1oYtTWIvq+0OgW1PUBZrL3dvFCfM9CyKeVtABdaTlAklyyqPpqAIGsw7xfvqIcWF74i8MihAkR5Z07N7lBe/1GaqIbTQ3xiu3dz3bAHbOHGQmUjHitWnTS/+tp5d4L7/7kngv8impIiOmIDGwcrSBGlt+AeewOMfoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mi/RVTyo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9eb3794a04so232381466b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881212; x=1731486012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PrH1MFyoXl7Ri4q0AfVSrjUgxkxxuAGcs0c90GGV4A=;
        b=Mi/RVTyoho3WeSeeF79dMKak/2HZuy780wjD7GhEtvNLBC2gFH3uimgVsR3j834M7v
         ICCVspKsAJxuzDtiOHwmQDHBOXwns11hQId3alJw5w39kHNi0gzc1ryDTiy2IYd0IT2z
         mqQ6S9YjlUrIA6W1Wcs46ckbzvlyql05TNwZNwvIneEZKGAD0bGhb2sIjjO55MA54ulK
         n7fnMA3chityOVkI1j5Qi+XGKwGKv9Sf3ipfy6Bbo1w4ouMaiRfnV9GtpJD0hCTeTrI3
         lLX5IV9HBo9hmBgj4hZfFHwWKoL3yT2JsC0wjc7MQnvU46OEDyyh3AMTMeVJcTp3RVwh
         oMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881212; x=1731486012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PrH1MFyoXl7Ri4q0AfVSrjUgxkxxuAGcs0c90GGV4A=;
        b=bWrcPaBBiywx18vkYCg3N5IqtU88iiiulgnLOvvRZbN/TFj5d1rQ1/lFNRHRXGAqfI
         5Q1lPBZ2WiZZ2GtQ6fdWl8fQF6VBfQIyxrQp4lUfkBdg9KnayYVSwKJztSCjx3lKrZGa
         Ol3q4IznYNgSy7m1msJigRCiGK/8qhbzuQS+UKOHZS9BL6dRUAOTSRRXfJy0Ey8voWDU
         CMbZaasfBvjrPWMhSwmvA/ublD2jbDAhmp5druBTnjAqE3O6hZ8mr9LZNNCWrTR+wISS
         tAZmlPJUJJAKC6nL8nYwPNbZDZwvqBzGO6OyNtLyLRiLFCpVImX+8IHK+CiC1CyPrqY9
         e+sQ==
X-Gm-Message-State: AOJu0YwBjBFNYcK+dB2B1MNID36krlWCDl7Pc5MYANw/zNdIdO2I2weY
	7XTxUWDy+b79O/icxZ4YC/Ry045+SnICJOgwed3cszCA+nucGpWBOQS4pbc9oTE=
X-Google-Smtp-Source: AGHT+IHNzJYoMyHuxe07aYkCHl9dPgMv+Bm3g4ThxLARQaU1LFW3c9JXQqf0XMx8bTGv4A4aJ+XhnQ==
X-Received: by 2002:a17:907:2d26:b0:a9e:b610:409c with SMTP id a640c23a62f3a-a9eb61043f7mr517178366b.48.1730881212201;
        Wed, 06 Nov 2024 00:20:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:11 -0800 (PST)
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
	Hao Bui <hao.bui.yg@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 26/31] ASoC: da7213: Extend support for the MCK in range [2, 50] MHz
Date: Wed,  6 Nov 2024 10:18:21 +0200
Message-Id: <20241106081826.1211088-27-claudiu.beznea.uj@bp.renesas.com>
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

From: Hao Bui <hao.bui.yg@renesas.com>

According to DA7212 HW manual, the codec's PLL input divider can operate
with MCLK range from 2MHz to 50MHz but current driver only set the
minimum supported MCLK frequency to 5MHz. That cause 11.025kHz audio
which is corresponding to MCLK of 2.8224MHz (11.025kHz * 256) unable to
play in case audio-simple-card is used.

Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
Co-developed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 18 +++++++++++++-----
 sound/soc/codecs/da7213.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index af38b2b5e174..ca4cc954efa8 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -20,6 +20,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <linux/pm_runtime.h>
+#include <linux/units.h>
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -1559,7 +1560,7 @@ static int da7213_set_component_sysclk(struct snd_soc_component *component,
 	if (freq == 0)
 		return 0;
 
-	if (((freq < 5000000) && (freq != 32768)) || (freq > 54000000)) {
+	if (((freq < da7213->fin_min_rate) && (freq != 32768)) || (freq > 54000000)) {
 		dev_err(component->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1858,11 +1859,14 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+#define DA7213_FIN_MIN_RATE	(5 * MEGA)
+#define DA7212_FIN_MIN_RATE	(2 * MEGA)
+
 #if defined(CONFIG_OF)
 /* DT */
 static const struct of_device_id da7213_of_match[] = {
-	{ .compatible = "dlg,da7212", },
-	{ .compatible = "dlg,da7213", },
+	{ .compatible = "dlg,da7212", .data = (void *)DA7212_FIN_MIN_RATE },
+	{ .compatible = "dlg,da7213", .data = (void *)DA7213_FIN_MIN_RATE },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da7213_of_match);
@@ -1870,8 +1874,8 @@ MODULE_DEVICE_TABLE(of, da7213_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id da7213_acpi_match[] = {
-	{ "DLGS7212", 0},
-	{ "DLGS7213", 0},
+	{ "DLGS7212", DA7212_FIN_MIN_RATE },
+	{ "DLGS7213", DA7213_FIN_MIN_RATE },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, da7213_acpi_match);
@@ -2167,6 +2171,10 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 	if (!da7213)
 		return -ENOMEM;
 
+	da7213->fin_min_rate = (uintptr_t)i2c_get_match_data(i2c);
+	if (!da7213->fin_min_rate)
+		return -EINVAL;
+
 	i2c_set_clientdata(i2c, da7213);
 
 	/* Get required supplies */
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 505b731c0adb..b9ab791d6b88 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -600,6 +600,7 @@ struct da7213_priv {
 	struct clk *mclk;
 	unsigned int mclk_rate;
 	unsigned int out_rate;
+	unsigned int fin_min_rate;
 	int clk_src;
 	bool master;
 	bool alc_calib_auto;
-- 
2.39.2


