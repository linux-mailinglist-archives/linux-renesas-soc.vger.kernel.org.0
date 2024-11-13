Return-Path: <linux-renesas-soc+bounces-10501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B73519C717F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 14:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D043B2C923
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 13:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2297020010A;
	Wed, 13 Nov 2024 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TEFSKpPJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40A20721E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504984; cv=none; b=dV9bmVSjfTHSgUO8mCTVKeb8sYMpeDN2YYcqksrkVqhlQ0iHuxs+9EgRvvQ8LuOEbAI2JcxqVG9ZcV7Nz+VdosXqudtJFhWWacMr0Cue20tBt/axQNVkx39Viz0eLzZSQHiAOnJ/WzWg80MsjrL/xqs2Zc82brktXuLXDeAPvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504984; c=relaxed/simple;
	bh=3/nMrplyu1CS26v3CmVThtiTMNI7VxBJOloy2v7mF0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AAo+Qda3ZeYQKYMN8t2spMAb0rU0q/inhjpaE+X5RvbvZlkeOvHW2D/cUQIk5TLFWbhVamrFvKCkZdqPnzampmyHulkphTccohDafBJDvusaGnyPCsj5Ap7zDItcG18yLJuDbioXV6voWkAHt9MlBq+gYwaDMu/vZKGEk6oJ/AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TEFSKpPJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f1292a9bso8410776e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504980; x=1732109780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebvqXc3BNnaEmIYcV6FQ3/XHcONiwErht0FtwjiZBz0=;
        b=TEFSKpPJXuFvGQtQ3JP5pkMXuUxOnt26UbbwiH7A1s5ClkYTkfYKc2Z4jHjrxtdHec
         1hgvmsSgaRt9guu1yHSiTLm3wMWaz2MipuLoynb4sj6y6NVrXlWSnxDfoA9tOetGZZoY
         br7fQThtyQUhtWBh9MBGC6g8hGzDybgJMCxoaO3r05yqOKj32eNv1KvwO1/jVEjxaLtF
         IAp+GCM10fp9C1MZkCTfkhq+/fq3USGwH7OjP+vyIk8WYpAm9As/z+7j5WsiLImgFIzn
         TMyEGIOh2GhY+UHielG3tEw8D+hGt7PT6eX76Yre48Thai2ZXiEh9pMDkh11hRKE//Sf
         auPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504980; x=1732109780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebvqXc3BNnaEmIYcV6FQ3/XHcONiwErht0FtwjiZBz0=;
        b=sG6B8H3tXMbKDUtNpwsD+BBjZvcRdaWV0SntG09Waa0mD+Efx5EHAW82e1BeWO/ld/
         b4EI2rGMXQpH853K7Et1Oagc1N0amtqDtXmfaiSBVGLNQe1IFdD86LNuNQVxe5pP7c7E
         Wn1tg64tCknVXXKvUETpBgO3SE8Z1nm+t4evBQngoG3UcdAcFmSBIXiHztjiE66f39OM
         Aer0D/mjwOXJT/B5Uupjrd6XrbAF3U6g5Isl6ynWZ8WdgpHy+MI3bk9JRIQlal5LWl9I
         Q7UQ2vjhTKuOseb6RcAtDSXwg80ISPjPnjUJNGODhvXk7QYulrFI1B4J9/z8DjOuwuv5
         0S8w==
X-Gm-Message-State: AOJu0Yx+QwmHABnAfHHMXkjLWs/ed80ggkpHBmmOWAA7Frj6p6j4tjFO
	eNRO5Hyc1w/l9uvi2+y7Z6Hjj2BluyX26ou5rCftBcgLbCSGauMKGY+L/qVJJmA=
X-Google-Smtp-Source: AGHT+IGR1P7Lt4oB51b/DZ11e2JaXo0ni2pJ+vo336Q7wZP2XAQWNh1QSMMM2N1uppIPUB5UdQRn8w==
X-Received: by 2002:a05:6512:2248:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53d862bb5d5mr10522158e87.13.1731504979601;
        Wed, 13 Nov 2024 05:36:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:19 -0800 (PST)
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
Subject: [PATCH v3 17/25] ASoC: renesas: rz-ssi: Add runtime PM support
Date: Wed, 13 Nov 2024 15:35:32 +0200
Message-Id: <20241113133540.2005850-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add runtime PM support to the ssi driver. This assert/de-assert the
reset lines on runtime suspend/resume. Along with it the de-assertion of
the reset line from probe function was removed as it is not necessary
anymore.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 01e8b6a4e8a8..d0e2665ec830 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1139,14 +1139,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	reset_control_deassert(ssi->rstc);
 	/* Default 0 for power saving. Can be overridden via sysfs. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1154,13 +1153,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	return 0;
 
-err_reset:
-	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
@@ -1182,10 +1179,29 @@ static const struct of_device_id rz_ssi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
+static int rz_ssi_runtime_suspend(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_assert(ssi->rstc);
+}
+
+static int rz_ssi_runtime_resume(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_deassert(ssi->rstc);
+}
+
+static const struct dev_pm_ops rz_ssi_pm_ops = {
+	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+};
+
 static struct platform_driver rz_ssi_driver = {
 	.driver	= {
 		.name	= "rz-ssi-pcm-audio",
 		.of_match_table = rz_ssi_of_match,
+		.pm = pm_ptr(&rz_ssi_pm_ops),
 	},
 	.probe		= rz_ssi_probe,
 	.remove		= rz_ssi_remove,
-- 
2.39.2


