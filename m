Return-Path: <linux-renesas-soc+bounces-2368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A802784AF5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 240CDB2416E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 07:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F6D12C814;
	Tue,  6 Feb 2024 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MgiQahuv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08712CDA0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205944; cv=none; b=GY/ySRXMM6obScbOO1kgOJxdqZXeJmTuWf/jePaOw/zAfvB+5MlwwdS9Jj6fYwtsV7UzgL6KI6bEqtLsoe1ZvS11OfJT/l1N/Teb4FSVDdQgd2VmlJ5aTIKaUrzmqiwhrKilILvwnESQdU4lMk1iC2PWG9eIeEBxgFMQ/LiHF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205944; c=relaxed/simple;
	bh=J/XvStBpKipy73l5We0jwaSeE533ZzXJ5uwYDD0Q1C0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHMXeVt0BkZg8bDg4ZRCPaJ+yW+o9Jvl9kBPlF7sFAmRZfrzgV86/0nLuLFnFeZEhG1FmeycYrhRGjSPil/IDsnm7nOt4ZA9nBIw7r4CTGrTOrt4qHbE51USXal7FGy2nr9clRBvtbbxewl6jSJkryTcQSZ5rDP3BqJQ9ZqkoAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MgiQahuv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40fd2f7ef55so1312775e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 23:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205941; x=1707810741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RwoclSKr0jTPCLza6NnyZdnbSE3Er/n2jlH8URKPyo=;
        b=MgiQahuvDBK3YkvCjYwsAabnAXEtnGxhhRVLP4UisGUyauKfc+hj0h/WhvmK52uGgm
         pTCl8LkLk9ZQR5f7Ajkio2Xzz8fyr+F6p/WD33/jXOxQQWdwn/xT0/sOrc7rOHNsXovm
         ujKujXjsCIBDKPXr+SBCg0UDlQa78UR1okcPv7uasPXkge4uFGwpV7loQlSf8uNIYi5g
         DyvDkiBe9bLmZgyysIVIQO3JlxYh3tT5ZUF4hwL9pZTBjWvW9vTgBVC8kA+ozsTP9gbW
         Pt7/nw/QSMJ1DhDgvSgpLVSaNxBve0ULexBV5bzc8C8uAhAXJ5p+f0k9hp90OkvPy/h6
         wW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205941; x=1707810741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RwoclSKr0jTPCLza6NnyZdnbSE3Er/n2jlH8URKPyo=;
        b=sphKbHgeHzya3mEmMd0OPNNNk5HkbfJoe+w5LRpZGfFJsyYe8+E97VLG/0INgWYxF9
         /GjyqXHsZH1Mk6I37qI7J/IQkhFvDh5Gt41WXGtB/CHefKroCtKChmK1baD5RwIKnhZE
         dXURtgKxw5k+w2++DOqYUEtZ+VGPnMDApITuoU6s03PfXGHxLOEzoOx1+TwRY9nOQWJc
         QFEZ6p5pUlUjvJgJdsN2IZJ37iGyFEib6qdsqVQwexJEyb+ZCDaqPcx2ynBaoCDgGBCr
         Rs62eySGw5Xmo6xf6bSC8YaMPAcCpXfI8dbbOpnPvoEzPJOtj63dDhXQNZ8AqDLrNb8Q
         emFg==
X-Gm-Message-State: AOJu0YwQUmnCDRlHkEBTAA+lxGqmA08B3ZV8DPxetElD1hytXqhe0P8W
	g/s7fw/q+6rUW16lNCdQ/fH2FHy6IIgN73FnFp4jc0q5ZI9q68aarOaln4Msmp0=
X-Google-Smtp-Source: AGHT+IHTIHxy+NKS2mQrn/SyH9wuwDfTsMFo2cxO4LKyOcngCy5BnycZR64LOXpCks+S6Bt0zqfP4A==
X-Received: by 2002:a05:600c:1c84:b0:40e:8655:d48f with SMTP id k4-20020a05600c1c8400b0040e8655d48fmr6042770wms.11.1707205941216;
        Mon, 05 Feb 2024 23:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTO63sDkRQE+HeVgRxlVJkv+uG1jdMn6W2Lw9uAXSMO/GfIB2xQ+qCBFQ418ecsOz+poyMHK/Svj4wWrtiqdOdJNh0ZLEWyjqwQ2Ic0tbvcmqK3g9ti55kuJrwvWzJYyGTwL29JQzTHYRxba/Qghvc4KlmfE6FEjA9TAysrnoV5rtmlwDLu9PMDXpXPi7Nke8JPOdyYshGN+ODuf3w86vdJbGZ2YxsB9d3zE5afgXAIJhVgJiBpM8xO2l4YHRCHSjXUj4VF5ozPDcUljM+SxIVyYlOpkOEGQPTm/QioDZHgRu97G14pnl/lchhVJtCxiUzeq67718Z6Zbh5hPjUBddQspk1M4JHcRgPIRkkTxZ18EkGYJoXQakkHYOWe5c+3NLmp/sQxar89/1PTcY8e31lJKMsFD+GiPnXr6ZSUcqRQnNkSJgR8NaoLXzjduyBFh8lx8jFyYZhQ/igg1o5GFk4uNLd4nTAZFHeTHpW6v6iF8Km4TW7wvwXLZe9KAcr9peBS7E9+obNA==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:20 -0800 (PST)
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
Subject: [PATCH v4 8/9] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Tue,  6 Feb 2024 09:51:48 +0200
Message-Id: <20240206075149.864996-9-claudiu.beznea.uj@bp.renesas.com>
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

The RZ/G3S supports deep sleep states where power to most of the IP blocks
is cut off. To ensure proper working of the watchdog when resuming from
such states, the suspend function is stopping the watchdog and the resume
function is starting it. There is no need to configure the watchdog
in case the watchdog was stopped prior to starting suspend.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

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


