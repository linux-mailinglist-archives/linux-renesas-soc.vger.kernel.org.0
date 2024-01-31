Return-Path: <linux-renesas-soc+bounces-2116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F62843C45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0CCB28ADA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC58269D01;
	Wed, 31 Jan 2024 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qVpoD5Q3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304DD6E2B2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696438; cv=none; b=BBv8ze4opXLfVwWl7vGkpDrc1XvOq+rQNLvLvyScH+CPO/z/qh24sAs6R+S1jcJV1Wp6/GfG8dma/zHGMUysskZkxSoRyC44unJDJkU+n1ROdFhfCx6P3o9N6oPWZ1lWG7yNu6oo4ZNWO9VPJYxMlvwUVb/yNPKYPZu70mERZ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696438; c=relaxed/simple;
	bh=sQDbOUHSkc20XDneBfwuR876rxx6hocXRG53pgHnEa4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLSaFNjUgZtZwV8xz+M+IwVi4rVLQdrG1R3D4l12dEQYTmmc0UQ/uikQfzw+WjkX6iirAho89RIGy5DfGzkucXvD/QiL5Aw1U6a8UNHZpO+u1JxwkVIbf/5qG7S4kzCiAtu1fbAmt7KzDfUfLnxqvlGoj2XfPWUgAWXxDDdYNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qVpoD5Q3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a36126e7459so234512266b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696435; x=1707301235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ooh9H1my4f9HBXDuCfxTg/WHENrkeAM2CEvky+dksH0=;
        b=qVpoD5Q3TRqiH+ZJSwQBThNtv5vgIwJ+Gvcpby+huenLkkRYTMtTNaSA21LMRiAmDh
         0oJiTfnCRbnr2jBJ33RjF0AZd4QMIX9OIHTAmr04ClXgyEW+54EAi5mvoIlrj8+3nK+k
         S0wmtTTq3phsxkpORZfO2r9fga8KdEzQPLWtUpNcWU6qGO4v/d/e7HBaojLsahLPNUWz
         htZkuqRL3duzQjiNooRKqFGBi9xoHEwyGwSRSBE3niD1LU5VUnSyQihpZyitNPlXoe6T
         n07hC1ghIjvlmIR0ftvHUB/lBUabZ9ixW6q5y1IdJne1YyaYM/vf/Ez+Ly3L68GD/u99
         C+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696435; x=1707301235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ooh9H1my4f9HBXDuCfxTg/WHENrkeAM2CEvky+dksH0=;
        b=v5iLtEUxAmPegWkHorOGCCUOKHK/BVhsj5gGuhoomXTdefpKrL8IX3dF61qDzvvzdi
         ejefDd33AFUjdq2Cua1qhBO55GszxSiZ0w4WwkvSTl34aoeJlmlDzCumLIKRwerWFpRY
         Muf5WwrRlkYVdNgAWBl/fcUbjhriLSB05Zxu/k/zYTe6MIJ9n15iMN2lpYtYkJKa/XhY
         BdACOxQLF0W9ZEXExhRnNnCzreykFGmJE02Ma6ldqFs76Jq99KombSDb8y33+L9m2JWU
         eFRXs+UXVWucyA43MtP8lPx928z9qLmqmc0FTni1/hhbVsRj18LrsgiVpDBKZKLadLWD
         gcKA==
X-Gm-Message-State: AOJu0YwTKzPIm1exErICPojsXOdHmj2f1hCRpShULyKynC2nIHFdi8rs
	wZ6U4Jr6IJJHkAyjUtADuRou7K28gGnn+8KWOBXy66THfzO9FB6eVDMt9Z9DmoM=
X-Google-Smtp-Source: AGHT+IHvRNc192jUA4iCLjsij/+OOxRCokcwE5ef++xOMh5pD2E5JacvZcBHYDJhFIRu0L+TCjp3UA==
X-Received: by 2002:a17:906:3598:b0:a36:3d9d:59e4 with SMTP id o24-20020a170906359800b00a363d9d59e4mr877872ejb.64.1706696435441;
        Wed, 31 Jan 2024 02:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXGMfTz9OxErq0VDb9MmafdDteHQcfYXNHT7XZZrVwJ3TfG6Rq0dyQdbG3Q3HZFcm3z7bEp6UwJFNKQV0+TAIG8iDmH5In6F620fE/QCMKkrKxVk3dudkBrURUhrJBBCtmU6JAjnYxEmm/Mzh9nNhDShtrNcHTiHBgNm/Moec+agD/8nbzAN8xKFeVLdU2fKcMK1smT6o8ecRJJ4ZWOGbnrEh/LdECScpzVnPhnTMRCjbwzSNpA3DVaEA0Be6f8NMI+grJVwgi31rDSKbz8V3QRpYntADtTYk9vUc0ucr74DWJRGEAin5oXyApiv/MZyNOEx2qTZ9zVO6Ns5SWJ4hxlhLvyq9aWBGwoAB9Zbf4SXQ47JHsig2KGx/RTWYibiV3Qs10bqgLo79U9IEPfix2nW2e2d4FHkBS7ULQJvGesz3+tEfNp66yWyjh23V5dzR50ZHkWfJ4UMCSpBDvn8SmD+KvVtbzpkamKn/OShtBNqSFyZoQ5/eXmvc41vH3tyHSNKOPbIe+LHDDeE4uFpiBMdBYXICJirKCNkd2FBUEKopy8KLqigVDuWrSe1qtUtYmzAd20Q4jPaH5AKdgyYinyOpSxAyeNt6mfa9vXwlVSKFQ=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:35 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 05/11] watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
Date: Wed, 31 Jan 2024 12:20:11 +0200
Message-Id: <20240131102017.1841495-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to de-assert the reset signal on probe as the watchdog
is not used prior executing start. Also, the clocks are not enabled in
probe (pm_runtime_enable() doesn't do that), thus this is another indicator
that the watchdog wasn't used previously like this. Instead, keep the
watchdog hardware in its previous state at probe (by default it is in
reset state), enable it when it is started and move it to reset state
when it is stopped. This saves some extra power when the watchdog is
unused.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 7bce093316c4..93a49fd0c7aa 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -129,6 +129,10 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
 
@@ -146,7 +150,9 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	rzg2l_wdt_reset(priv);
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_put(wdev->parent);
 	if (ret < 0)
@@ -186,6 +192,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	clk_prepare_enable(priv->osc_clk);
 
 	if (priv->devtype == WDT_RZG2L) {
+		int ret;
+
+		ret = reset_control_deassert(priv->rstc);
+		if (ret)
+			return ret;
+
 		/* Generate Reset (WDTRSTB) Signal on parity error */
 		rzg2l_wdt_write(priv, 0, PECR);
 
@@ -236,13 +248,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.restart = rzg2l_wdt_restart,
 };
 
-static void rzg2l_wdt_reset_assert_pm_disable(void *data)
+static void rzg2l_wdt_pm_disable(void *data)
 {
 	struct watchdog_device *wdev = data;
-	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	pm_runtime_disable(wdev->parent);
-	reset_control_assert(priv->rstc);
 }
 
 static int rzg2l_wdt_probe(struct platform_device *pdev)
@@ -285,10 +295,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	ret = reset_control_deassert(priv->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to deassert");
-
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
 	if (priv->devtype == WDT_RZV2M) {
@@ -309,9 +315,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_wdt_reset_assert_pm_disable,
-				       &priv->wdev);
+	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2


