Return-Path: <linux-renesas-soc+bounces-2365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C014A84AF4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748DD28491D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 07:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B6712BEB8;
	Tue,  6 Feb 2024 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WGtxKTxy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17AC12B17F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205938; cv=none; b=nROp06iE/Tpc7pi7NPyqYnAdZK3rgw3SOqmMc9rWAzPMj9j01TXGFTsYZhC3gon/uNVBXLSJ0lsA3HCEGmfw6Veg7y1g5NzxkuXsYPLrE2mRpQJrgH0sTxDmTQZIMvWJH+YbrJ51mGE2qUcgOt1+bJOTuqQy7uul6s1nHU/qnvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205938; c=relaxed/simple;
	bh=oGuUsUJTOBwH4PJ/XO1WvReC8UQh5qLEUBVQyGMyDWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IvSIFJJnBUZq6OQM1vOwdAHJ57QAPuKGYyQo4Mbw+TqHKl9XZNnf1aOUPXkWh1/6AIiQUG4LsfDxWMOn4nY8s7ZitmMi5lcsVrIFiFO6fKYTLaAEn6D9KeiTbzGeeqrTb9lwMlArVaPio24eyyPsM1mTUq5nJre55Zzd9S+fdM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WGtxKTxy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fe00cb134so6514775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205935; x=1707810735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA4Lt7wlLZrwShaBAqRMXGVkQhmL/x3EvhyelQZjhV8=;
        b=WGtxKTxy7+PiMMhGjoEtNu56/u9mC4E97fFoHIGtyPC6EDifdfqqDQqaqIKUtsFJff
         fwGQxmXho8YLjEVgPP5Nlx7Irdhyrb2NjfrRMTRBDXxdOnJexLr0oRNjEYV3DlhAlDoC
         0C2YgZqmSgxmI4y+uaknpkzUEwOZ5ieu38T8fz+ZV3xFqRlgWcgISB72gkat3YJ22RsB
         a6eq27rSKFUrbRp7uDoDTSC2Gq/+o8nhz+RdngI80ENtAJcX/DhUPYucmeQARdWyjS5w
         vPZU6QR5Qpk1d2Tfw9nb9KAFP6tqTCduosWRuB8a7k9pOysTD+zm9CxY96Vk/L3Wng+C
         YtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205935; x=1707810735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA4Lt7wlLZrwShaBAqRMXGVkQhmL/x3EvhyelQZjhV8=;
        b=FSCK7+0UezkKG/b3dFuMHZSzAyOimwPB5bD09YdN7PbtOU3VF6MyA7/Dnt8G/9vvf+
         3TET7ijmUzcneHmyMJe8FU7eIfz/+sJ3Vc+QdidKUsPhcauuig54YRCnkIMmVNmXAlEE
         urtTrGI2FEJPvysTJy47xqA+tGToPHyvJCiWe+w09/sz8lZMkPupSjCiRpXm9R1Kd9ge
         +wxb6FGP4HLshDdJSx6PhqXPJN29/v1wBwVOcad4nJomiY1xpU32uNH3J5yiqwcp4f5x
         dJhwdXkDnj2Qyd6f/FHRzcy67k7f6ceoKfeaGQqZa0oXJD9jo1riiFi0wta6eXN/GY0G
         ckjg==
X-Gm-Message-State: AOJu0Yzq2eh1AZq5QjCtY06/qKUyAnRWfKViZjkOcwOZzKqG2zgWuKjK
	jtfTK/PkbAFBQhsM0vGmQTEpwrJpL49cZEpd4sZ9Lr48JPd/EjB7iogt1WHkOq4=
X-Google-Smtp-Source: AGHT+IG2yVREqITv5k8qKEYTKu9Lh7kMQkQMSQxMelPBeHMvQzb8WYIRPnCPhgjDWrpEN6eZNvUVlw==
X-Received: by 2002:a05:600c:190e:b0:40e:4932:3995 with SMTP id j14-20020a05600c190e00b0040e49323995mr1591113wmq.14.1707205935232;
        Mon, 05 Feb 2024 23:52:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWth/RATJ/DZGD2r0NP4gOV7vr/QlwUYiCe3d7g0uTTH5xUB8Lfqu/xpwzSw5uQfI9krndixIDhcHwNi+XGRSj9b0YUtfGSB0HmNMyIQyQZAdvAhZD0BruFjDwfHZFIIrdbgZ8tO22IRd0xjqZXtMtHFVxG41ZJQX8sNthRJ4w3EylXqHcLsGOQ0Ord611Y6er6R3wwX/JfCJsG3ewtnYNlw6FOlclaY9ZCftxAUGAhpNNrZdtAjeABygyTVcOlySVVXk0y/a2jEEs8lTYmd00nTxhpVLYTx5bcBcvx6U1w6WYmBJ09UigihcMgXUFp9i/zW6phP/FpRDCyCNX4BF2L0ibxvKQre9C/0mexuLmbRU8cUtni8wHyw3+l5AUpRT+CpthQuA/B5hyz460tBmX8F/mEfS+c45jVAdyqHFuWW09UR04glqgTNIkJ8TEafdsVLkqPrdhjcVBsEUAQA01d3oAN5WU26GfZYcHtIL+5v6Ybi/Pzdz52yB+aUAJtMpF9H2YgoDLZ7Q==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
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
Subject: [PATCH v4 5/9] watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
Date: Tue,  6 Feb 2024 09:51:45 +0200
Message-Id: <20240206075149.864996-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
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


