Return-Path: <linux-renesas-soc+bounces-4453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3BA89F8C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943D01F2D5F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64775174ED1;
	Wed, 10 Apr 2024 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lbh2s80z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122B172792
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756482; cv=none; b=PamcUqPTTpLVzTb7CJQxhOuJjQRx9Tdmde8btqa1CyxW/NY/MkP/qQLK5StRsagOGcBJpOoOqf2bJMH7+AcB786u+O0uEpTW/cFeqpk74zMNHU0M4au+IzHW2jW/7D4Z8/DkT8xJum1YN5E2ONgVVgoXWsOOZFbLhNCugsnJF9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756482; c=relaxed/simple;
	bh=Rdlb2ia/Zc28BSEYVcVdZUAeB+95/SXqjOJ1NOQ27MU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WUBqd2PDFqj6FJ60nuYcj5nb4PkI2NDjoziO01yE+pIuTjCjdoj1n74W82SVDak+VOYaEQ7qf/+2FagBkIE3kaz3itFxUScTpqFC+Yto6taNQCrVoTXi4EVAhuEwxkJtRckKrHYzw/mQqpfhj3Yj8l6gzhMu0l3MLZLC77Iv69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lbh2s80z; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d487659bso7085509e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756478; x=1713361278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK+4L+T/fCIZeFhsmGZI2escuTtf5tzbbpdNzNvLL94=;
        b=Lbh2s80z5MaG3g3vr3Ps8+ktHtEZJSFW1q1obqZzhRfPKdyjbkicQ5PqCaMSHNCM80
         c5XHjl4HilSuIJwi0T70XIpzUgZ996EpVmPM+kvx7ywcmP4AlQltnoqL57/Yhl1NvznJ
         omklfHUTegS1iJm8fTpt03YcXmBRo/55pWjJt8VJ+Zzol7wQ88zUN3j9FcgvRfkZAhk9
         VolioGIplMTPEjHBx73y21XukbxBtWnKtG6+VXpCypFpCGmWFElLJg6I5Un6EOnHYgXY
         vSXoomKkxjt+iFOahHWsOB88MvzhdAAkI8ET3iMF9NP4rAryVXm6hbRGoJXBIDApOCtb
         NdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756478; x=1713361278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK+4L+T/fCIZeFhsmGZI2escuTtf5tzbbpdNzNvLL94=;
        b=vSe0HDY8b+lzH1QCAo+TgzfYDWgszha35/aQ6lU1E+PH87sCghdfF+PEfG5WEg5SU4
         HpVLxlatVRmO4ROEpD6Ttvbxotf+PgvnQHdtJw9Lg8DszkojTNh6LjJGw8dSzkdECGCR
         UYSiCjOCUlUoHeHwZYRZD9bsTztvSq+E4h6/7k6yNyKVdg1Kl0OFuYvmQucGsH4xT5xB
         WcO28/W+pU4bR0+3yIQl0Fkx1+ZzC9W2ul/SpfsqPkp3IjuWOId/x05qzyAsRZGwUYKF
         PY/9SwoqD7/5BpdHYloDLz/xR1gYhgG6bifQooqvB5hdL5MoFpF2icORT4AH8rL5/XLp
         Klxw==
X-Forwarded-Encrypted: i=1; AJvYcCW/YeArWYElB6dwTH0UujmMEVrVpuNZ01XMIUfv/FU9URMuismnK8K63rtxnUapa+tqvwloKjqiIiRmznt0okAyPS4l9z94nyffXM3IorezYJY=
X-Gm-Message-State: AOJu0YzeNXdEbm28K3SaLwLVIhk77Ki1/c7z2zkYOAH7mDZdH35T3acO
	STUM792zjNg9OrDxL/Qm2BvXWId7H0WABRqb1OlAzz/pIWWqbn556JCmU5vRqgE=
X-Google-Smtp-Source: AGHT+IHkGb8mjtV9pN57/rdk2rifpIFkEXJ1hY+ryzX1kld++TgTjPbpmaqJFhV1Ikuo/OSQXqId/A==
X-Received: by 2002:a05:6512:230d:b0:516:d27c:f6c6 with SMTP id o13-20020a056512230d00b00516d27cf6c6mr2167365lfu.35.1712756478328;
        Wed, 10 Apr 2024 06:41:18 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:17 -0700 (PDT)
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
Subject: [PATCH RESEND v8 07/10] watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
Date: Wed, 10 Apr 2024 16:40:41 +0300
Message-Id: <20240410134044.2138310-8-claudiu.beznea.uj@bp.renesas.com>
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

The reset driver has been adapted in commit da235d2fac21
("clk: renesas: rzg2l: Check reset monitor registers") to check the reset
monitor bits before declaring reset asserts/de-asserts as
successful/failure operations. With that, there is no need to keep the
reset workaround for RZ/V2M in place in the watchdog driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- collected tag

Changes in v3:
- none

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 39 ++++--------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 29eb47bcf984..42f1d5d6f07e 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -8,7 +8,6 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -54,35 +53,11 @@ struct rzg2l_wdt_priv {
 	struct reset_control *rstc;
 	unsigned long osc_clk_rate;
 	unsigned long delay;
-	unsigned long minimum_assertion_period;
 	struct clk *pclk;
 	struct clk *osc_clk;
 	enum rz_wdt_type devtype;
 };
 
-static int rzg2l_wdt_reset(struct rzg2l_wdt_priv *priv)
-{
-	int err, status;
-
-	if (priv->devtype == WDT_RZV2M) {
-		/* WDT needs TYPE-B reset control */
-		err = reset_control_assert(priv->rstc);
-		if (err)
-			return err;
-		ndelay(priv->minimum_assertion_period);
-		err = reset_control_deassert(priv->rstc);
-		if (err)
-			return err;
-		err = read_poll_timeout(reset_control_status, status,
-					status != 1, 0, 1000, false,
-					priv->rstc);
-	} else {
-		err = reset_control_reset(priv->rstc);
-	}
-
-	return err;
-}
-
 static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
 {
 	/* delay timer when change the setting register */
@@ -187,13 +162,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
 	clk_prepare_enable(priv->pclk);
 	clk_prepare_enable(priv->osc_clk);
 
 	if (priv->devtype == WDT_RZG2L) {
-		int ret;
-
 		ret = reset_control_deassert(priv->rstc);
 		if (ret)
 			return ret;
@@ -205,7 +179,9 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
 	} else {
 		/* RZ/V2M doesn't have parity error registers */
-		rzg2l_wdt_reset(priv);
+		ret = reset_control_reset(priv->rstc);
+		if (ret)
+			return ret;
 
 		wdev->timeout = 0;
 
@@ -297,13 +273,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
-	if (priv->devtype == WDT_RZV2M) {
-		priv->minimum_assertion_period = RZV2M_A_NSEC +
-			3 * F2CYCLE_NSEC(pclk_rate) + 5 *
-			max(F2CYCLE_NSEC(priv->osc_clk_rate),
-			    F2CYCLE_NSEC(pclk_rate));
-	}
-
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2


