Return-Path: <linux-renesas-soc+bounces-5747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573A8D5B07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 08:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A909E1C24209
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 06:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF33B132122;
	Fri, 31 May 2024 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qLFZL8Oa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4312E1F1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138683; cv=none; b=VrYnrKq6F1FXPH2SQhi235sYd1/DwxAbCb4/sP0Gy7ByY9thRbtNbUi2Vb2W60VQL+M9D3d8sKdswItySSW9rM1JMxTlhtI1wiI4X8ncIfiJlefFL77Hq1737oDrCPqYDNhljyPUgJqOSlmVg6T3MHfyiUQwDZCOJgQGPnDBQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138683; c=relaxed/simple;
	bh=P/Nh/oo/uWjDFwH5OIXq+nZf5Rwf9DCbobbRc0hNR4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8PKgscFHeUEZrAsw9h5vYjvkIHCyBfQPK8KtNKzcqDCdJU/QZ1aaqL5ic66/OcYFXi55Xe/mTi+kRaLpkxgIep2QNE74bMjj25BrlOPFGqeLbPcc5ZUex6esYMRAAOyOvfMtj0wzyAPduVRAaMnrmhYEO3RGx3928CNIy1Z64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qLFZL8Oa; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52962423ed8so2008138e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138680; x=1717743480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj2UABYkbAgBpbHbr7DMq3bJIVwbBa4OlR1Ztoek3y0=;
        b=qLFZL8OaEYfWJzw1hhVFCGTaS9XJnTpP/kfNkcdwke2DzQ/xK6UO+M/drY8v6jTuTs
         420ph9xdSSwrM29zMj0+8dmVDkJK476BleKH4ONPQCjqaWrjWFO7jg1GNDZY6epWgp8Y
         y5nAaIH/3un3zqp92AmuU5PXedM5oUlmUWc63xR3ZT31BwjAWylP6npi8GOX99/MtvRI
         yD6Td9qFErln7KrcMppYpgX0fqaIAj044pMjbnv20NpSj3lWbHCTtZwvHLERVqPtsRzy
         rFLjzp9RRUD5elUpyf5Q757/QF/2ciWCku8sKgfAx5HCuqRAIjStxxswRiYF/2G727A3
         GALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138680; x=1717743480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj2UABYkbAgBpbHbr7DMq3bJIVwbBa4OlR1Ztoek3y0=;
        b=s7P8NK7UiX9Ark0nWYs1OG5n16ZuMjyjYGiKB89Zajw1KVbNeHBaVTEEo3OqV0gTVh
         9cZIcvrjODHvJeBJlckdPQ43gSxUaSCNc+g0HMN+2Np7oOBxETk40K+kEYgTyIbTjI+6
         xzMx7UCItorc6+sHr9AFpaCvm6AJCgie7cDmMA3fnqPn96BHRFnPTz0wCtzveSe2wJCb
         RbyMM/N2rLjpOCM9ZZ97nNemCAY3tzz9VQ7K5fK9xDjALRvGiwExQeorR9dlO3vmBb7q
         MvGwOsAVwUL46wHismDqflhTBzIWTfm9qgaF+XRYPMr4iBRgz4HhmFHSt6n75O4oiS/+
         Kmmg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ch7iK1CPIUWfBZlNoAz33h1bWbFMmGhFSJblq8qxHpl15chkifpQGPimZmpnr+RnurKc/lXHxF71rtJyTidBp0PMBFppxgNw14KkKKD6iyM=
X-Gm-Message-State: AOJu0YzmNY8HPmM+hsaW7NkZZfJfPOdey8puceLOdz9AYOmu5Gen6y47
	j+0RQcE/VK7CaWZZqkLu74puRIgqYEHKOd3EG1EAswbBI1HV4yomLi3fmTS8Fqz4l56PO/PMuLE
	UUkY=
X-Google-Smtp-Source: AGHT+IEqTQ1CoXHVdILVikoDJEE4QrnRUwB4YwEvkNHAV0G0a99ZA1sEqFbBm+11Xk8uIfDtFIyPKg==
X-Received: by 2002:ac2:599a:0:b0:52b:6921:4fd9 with SMTP id 2adb3069b0e04-52b896c7ab6mr508765e87.50.1717138680288;
        Thu, 30 May 2024 23:58:00 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:59 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com
Subject: [PATCH v9 7/9] watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
Date: Fri, 31 May 2024 09:57:21 +0300
Message-Id: <20240531065723.1085423-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v9:
- collected Guenter's Rb tag

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
index 1f013dfd3c97..d77290f7fdea 100644
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
@@ -189,13 +164,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
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
@@ -207,7 +181,9 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
 	} else {
 		/* RZ/V2M doesn't have parity error registers */
-		rzg2l_wdt_reset(priv);
+		ret = reset_control_reset(priv->rstc);
+		if (ret)
+			return ret;
 
 		wdev->timeout = 0;
 
@@ -299,13 +275,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
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


