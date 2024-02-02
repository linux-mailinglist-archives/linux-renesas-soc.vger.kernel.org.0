Return-Path: <linux-renesas-soc+bounces-2252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0343846A06
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465961F29BCA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995061B59F;
	Fri,  2 Feb 2024 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qoLWx8sz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2B19475
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860753; cv=none; b=jE0Q7a86PtXAWvNbfJw/Olwt+g96leYW/h/UiAFgpJ+BMuC9iaV5leWlDZA/XkK6gde1g29OyL42LTyNHtZ/mlCmkmhMw3xs829ELtDHF6GXGV8Daps9DHRVKYyNu0/Mx+wiRPoUHKKR0KfG7RJKFzT+xvzzBjpUN5IFf93Ec+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860753; c=relaxed/simple;
	bh=aIf+Pu3HweWyoN7lkEi0qmM7OKFln8UmJUtFm6v0tPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dm4aCfICiXNHudQT0K2DuFmz2hqKwSelXun/1y8wG29iJckGCflIsnvpFirwQ2elzn1bqlzjQLek/gNtvgd58TK2uCm0W7N1rpDV9me/ZLU+PvI+0yzuuQbCHUNy4yoYo+QpRuRX0ZfcKZ3wCoKH//8H0Op23iLnCl2R1N05PJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qoLWx8sz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a30e445602cso625058366b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2024 23:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706860750; x=1707465550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfVK6XRPMqlFzKP2qmkaBnCxYUhq6mpRwszPVemjL+4=;
        b=qoLWx8szTmDZp5TRODdR6Qx83EhCkW+N0soKhIHX0XAqzKfNH/Jc5N8CJ8iQjTSeUm
         Z2IilCA+rB8w96hDx0wigUmd8dpuzHXNEIOPyjYbf1x3ya6exASz1UcvPxxCBAwexQyv
         /gmP4CR0N6KTzOgboaTSehsLziQYw2aDlpmxJS0W4ZVj23KafyfID0KKaCa7zXbqsun3
         u3DAydbbbH8PGeAVimVYfznHD3TPbRavsvG80w2qg1eY+cP2QSFxEuwfa3O5H4QM0Xd2
         iVBS5zqH/tOc31//CHKAUBjj9Wk0W66/y35GwhNPVhRhaPF7Q4hd6z1ws5AAKyw+gQFy
         tIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860750; x=1707465550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfVK6XRPMqlFzKP2qmkaBnCxYUhq6mpRwszPVemjL+4=;
        b=DLIYYuPZQZJPFCL8D5K0Et0R8oHGyrOimYYMf/R5j1DD09LJvDhBQzszJCNgrtSozu
         NtNqdT+OjIWZz97K5UPXIuFVgHzr6eM2/NJtuf1EQ1GSIj/WMdUrTnCg+6a+8ni+b+jx
         3V/vKt0IQ5Nd7QQZ+UfnDbr+MBymQ9vWOthDvZphz/DVO9QPwEahv//pGLxzjIP/hO+T
         dpQiHrU6xUrZa/tD0jz0fH0IcQtBxNBofWpwVTuyUDnF+/TI6esVeyOiSvS5nOSYJ6B8
         flWUzwZ7qPaUuyuAlcgh1uRs3OukWtGc3o9aeTt5OdSawC5Vi8TekFrBqeyCP4VdMfdD
         rVyQ==
X-Gm-Message-State: AOJu0YzGdvdP9SnEj4Vy4ao0J6J/huq5njPMA8p+GwkVhZ5Hc74y9q52
	5ptSJgHH1ZJ/+hgwtfIPwSARemeUzpY4okqhNdnyJkP9edcuw+bEiO+lX/Vs4y0=
X-Google-Smtp-Source: AGHT+IE4olcKoazqFZk62MlgJKknx3xWnlOExmjvhxqFfby5JxnaP+LFDhARqT301OXiFGYyahONnw==
X-Received: by 2002:a17:906:cb8b:b0:a35:a12f:e363 with SMTP id mf11-20020a170906cb8b00b00a35a12fe363mr1047795ejb.10.1706860749862;
        Thu, 01 Feb 2024 23:59:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVWC4J+UJPCvDPLkKBdcyGv5dMGq1Eq0xR2AqnW+Av52NTCcIAkSsddPOzNWcyimr28m53iZTGmWUmL0bLxMfIfGZ4VPix79HFw6ACNyGaP069ghMxT8Jlu7IeVvlYHpnlQJ84kVb3Ff4fImb/2EUFa6ugdTL8ji36jLWPtbeI2AWyhCWcx+DDb4SqD3pOpN6MadVzOLZzCqBt2Q3cipNLTyB0aOU3iZxpCMR9RHTwEkFPIC+hwlpTHYLcjhyQZSu6IfDfVVOBxCRKN8fuzrCHoHzPiKtqfv6I6y51kXMqcvUYf8ybATkyhBr72/XBV3JjpR3TGvS8ofTN/tXoMytWa0rlfJs6pYfU1UI2EWoOldF2ZUSPHmgTkLBebpw4X898XBwCDPvgnx1AbQjD3jWj11KR9is89+Kz24gzmDQ4aEKR+en9tKADlFPnoafi1ZKEgcYVUptRSBEdqr6utJB87atGEMq8pSHxhbnDV45yG95GTk9++GehFoOe7xGFAXw3tzked3MEDkw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a3715be38c4sm185544ejc.210.2024.02.01.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:59:09 -0800 (PST)
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
Subject: [PATCH v3 7/8] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Fri,  2 Feb 2024 09:58:48 +0200
Message-Id: <20240202075849.3422380-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S supports deep sleep states where power to most of the IP blocks
is cut off. To ensure proper working of the watchdog when resuming from
such states, the suspend function is stopping the watchdog and the resume
function is starting it. There is no need to configure the watchdog
in case the watchdog was stopped prior to starting suspend.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- remove the usage of pm_ptr()

 drivers/watchdog/rzg2l_wdt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 42f1d5d6f07e..c8c20cfb97a3 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -284,6 +284,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
+	dev_set_drvdata(dev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret)
 		return ret;
@@ -305,10 +306,35 @@ static const struct of_device_id rzg2l_wdt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
 
+static int rzg2l_wdt_suspend_late(struct device *dev)
+{
+	struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (!watchdog_active(&priv->wdev))
+		return 0;
+
+	return rzg2l_wdt_stop(&priv->wdev);
+}
+
+static int rzg2l_wdt_resume_early(struct device *dev)
+{
+	struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (!watchdog_active(&priv->wdev))
+		return 0;
+
+	return rzg2l_wdt_start(&priv->wdev);
+}
+
+static const struct dev_pm_ops rzg2l_wdt_pm_ops = {
+	LATE_SYSTEM_SLEEP_PM_OPS(rzg2l_wdt_suspend_late, rzg2l_wdt_resume_early)
+};
+
 static struct platform_driver rzg2l_wdt_driver = {
 	.driver = {
 		.name = "rzg2l_wdt",
 		.of_match_table = rzg2l_wdt_ids,
+		.pm = &rzg2l_wdt_pm_ops,
 	},
 	.probe = rzg2l_wdt_probe,
 };
-- 
2.39.2


