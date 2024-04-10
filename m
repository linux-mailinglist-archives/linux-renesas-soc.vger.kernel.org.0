Return-Path: <linux-renesas-soc+bounces-4451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0489F8BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22AD928441D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFC116FF5D;
	Wed, 10 Apr 2024 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nlDRevBp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2E216F26B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756476; cv=none; b=AEBffN5MsvzCU4rUv3LAFogRl1bKtECFmCW8nPniYRLp1V9iMkbiEL+bakQj0WGp9QdlO9c2vVPbYLEVL09aEuvwe3Gsfip/rkvFEKaIoCmJxkejDKhckGTquT9jBSaQBgNiguElqyKmS5NLWZE/dMeBlwXZcRGMW2L5B0dlFlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756476; c=relaxed/simple;
	bh=7mOWThEj82No40O+j4Gsb3EPCVrROElgn/WJZB/tenc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lukqxGoVozIoi+smSNKenoDjc2poL4Yp9AcDnFhiIjks4dfh/q8DgtkYnZC75RSMsbl1CDeylbWbXbimvfdEsQH3vhDhbXAGGoy/H1qyeLO04dPhpfgtsr0ebSPCpUgqdvfC4hn+W4WVFhSYnImKFmJw/fzGE+JLk5TXuw73lGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nlDRevBp; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d718ee7344so76904411fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756473; x=1713361273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndAfnruplO82J5rjSW4lZ2fxdaHakj0g3zjVmUjCmY8=;
        b=nlDRevBpG+M5hSfzdDl4xJXtJhw+R1UURSSLubtOoMRuQ5dKguPE9CtyUG/64dZbjO
         dtO+DpPxmntw0pJ6MfZ2obr1tFP4mCaY+GSxwiVhhyjajDbhIfJJqp5m/QBQnJhqT/Nk
         +bk7pSkJojyLYes+n59M8NkfxLAB6IoOCSgRZ42iaJuh6CMM0LBHgOzL6Ysq8YKMcwpY
         0dQtHSU52RW9cacN5uxnAy/WclQZNCk+TTOByQPIHIVEW7fEI2Un0G8jvI8ptN3Wn0N1
         1YGg7iinYUkvpI7pC9/suAiOLgqwnpqOrjXla/c35ki0zxZ07CGS5OT9H6tKTj1mrwn8
         T5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756473; x=1713361273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndAfnruplO82J5rjSW4lZ2fxdaHakj0g3zjVmUjCmY8=;
        b=k+UEXY0DYUfdTRH1qkBFYmbcuZeistpgMq8EUooXmhIWz2dLO8YSmg9dDS1zrcjy6B
         svZR57NiusnRxTX9vOEUKIz68cu3jWAJp3mS1IpNsOEWoTccTloGwXGxbcvtA/Llg28M
         BthFXARYt+a4PSSu6pBIXjRsvaAJppT312kuYqXJy/+9ZyUie36LdbT+SFFtccwUWnz1
         /Cya9tquqF/+AaFbGqwnTlJcKXAZyHVy1VzGtr8HngWu/nHKt10skz25+GAmBJadqTdp
         3WqpwskB/GEuh6JfAA/se4YePhQH1spkh7wmM4d+2aJZNbCvaO9YNX9HzoU1LlUrhwSF
         mpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSTS7GQY6y0pq7dLyz6BKH1KytXlDJjqjUO+ssQxN7w0uvbSfZCP9GrDbZLFFkW1UD/U3KSEMula07ucRxuEmtOx75i4OZPAFKQOqgxUSr9rU=
X-Gm-Message-State: AOJu0YwgS/DptGat+2eDbKz0kzkvGU84slv2EqgnUW+Y9vnxsNSWa8BU
	quzQKx/evIsFRaxouTPZT8IPn9mxUrZLba6Lswhx8gOK1BO8DBpsazV9FrfHUyo=
X-Google-Smtp-Source: AGHT+IHBch3z46eIpwIMrlag3ucoQRtxLPxfE5oWrDfrZwGW8hkURhoSdNwL3iOwO/2g13RlmD+IZA==
X-Received: by 2002:a2e:7c0c:0:b0:2d8:52b2:2002 with SMTP id x12-20020a2e7c0c000000b002d852b22002mr2025805ljc.47.1712756473412;
        Wed, 10 Apr 2024 06:41:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RESEND v8 05/10] watchdog: rzg2l_wdt: Remove reset de-assert from probe
Date: Wed, 10 Apr 2024 16:40:39 +0300
Message-Id: <20240410134044.2138310-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- update patch title

Changes in v4:
- none

Changes in v3:
- none

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


