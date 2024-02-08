Return-Path: <linux-renesas-soc+bounces-2460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B532984DF43
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 206111F2B3CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 11:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888A07AE79;
	Thu,  8 Feb 2024 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IInih2Ud"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A07994D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389921; cv=none; b=YHaswA+I1VPGfhZFwA9guxK3+D62DkOWDewa9japFXN/I6F8tOCcwLPxdNzD71m8iQG03D9iXVnc6YFTCCkuuDlWLCmjCm0tuxeqaX4mq98RdPhZlmWg6bcJ0Myxhw9rVhvnPkL35A+53JWAGyu3ozVKMSos83eh3g08bhs74yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389921; c=relaxed/simple;
	bh=NMfidsTDRu7/K1P+Tey7nNNvdvyeStoBwAN7EosPpiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/OvpVnn38XKgcER8+Qv8vrcv+oZbTRcZxWzeGVVzXOCGRiUKZmsTPAYnhhySBTjPe1BnOcjaDDlc2bh3sMP3GtUyuHQqR4iU41skN8bO4Bmhdlei0GGmmMl2AgZu2IyPh5o15xyUM9IqEd457vyddqS9u0H8HzYcIMPa4rWqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IInih2Ud; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b2fba3176so997418f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 02:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707389916; x=1707994716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvNVoZZzcn9RrwiNStxFGzR2YpCFWEcMy9Nh5ySh+1Q=;
        b=IInih2UdXQp3ADCj3i82TyAe020WQzbSFmcLcYvZBqGjIY5hQonm1Nnw35hFd3ZNlS
         Rb745biPJqLEwEQ5OHrzESOgVMXLLfDAKagck4hmju8s4MoG0zbGoQAiXCKiQRq0PLvK
         iH8aj1B59pqBbBFdV/biXTIlkxvF4YMGchnhhS4swNRZ1PfeTkfjlrv/9CwsyZdpckX2
         wG3lBvXymgchN8bVTUIY4Lq3f15cq2IzXyudiXpe1qYDQDu6wmwIaSwtKUrBYBSAHF0Y
         7tZEJWRBLGqGLYK2dyXjVL4tMcsSSj2qsDKKh12p02dt3mOdmfEiYU2BawffpSiJRmZK
         QeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389916; x=1707994716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvNVoZZzcn9RrwiNStxFGzR2YpCFWEcMy9Nh5ySh+1Q=;
        b=HuCNmdk6vugIImJD+Bq1+6CANrG7ETTqt/WmL7weuXJdwp3ESqMm5dXq5l1miuzRM9
         Bl8Sn0ymXHGllQi2JbVwYbEhyFFdt2S6oN5zqlKtar2Jj9xstuadIBjZoq89BBI9kuSC
         GYvXilgU/ipBKZC8b7/QbsvJoR/ZaL6eea5H08VA3MXz7bW1zET1EspYv3Rldxq/1/bj
         gwDxzUcgbdoeqi0pe08L7YNFOnBBpj9+t/H/qAfbszuha8bXIpHigNUrWazubgVXR6Si
         m3E5dZkZ/T8185c5W99Y43qnV7736k/DZbgHYDFlsKPwa2S0CeDX3OBegG14DAuFw/9j
         RaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvEwImJuOPLuRQzoFn0WOgie/yRIqRtY6D7HlfAfvUaSOifNKs1SdUMxU+IjYzj2UmlYQYYApKwE+as9WCnYZBOFSYMDBgQJBaODLrj9Umjkc=
X-Gm-Message-State: AOJu0Yw2vvTjAGJSoytjRm+4B0qfxUOGWNtC31RaUFyBDnZAw0IyTwJH
	9r7LUgGTw60TfBWcdEXX8LvpHjAVJSb9IVPEoN6inF+5YYsVQpPWNOPtnAolgP4=
X-Google-Smtp-Source: AGHT+IHtQRRx/dV7JxwY54Vnbi7Gg/5neO7mrpQ7teFzPW5TjAfuURmQkZLbkcOUZYVNZDW0tv4j6w==
X-Received: by 2002:a5d:6049:0:b0:33b:58cb:4a55 with SMTP id j9-20020a5d6049000000b0033b58cb4a55mr1039039wrt.70.1707389916607;
        Thu, 08 Feb 2024 02:58:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAAvIyoT02mjPwUanepurDzc1k25A7zggylspAGDQ7JkiAdDD8cHZTHbnqtJNBrPUZVju51nSQD92pUZwMCHpL0kmGoMtVMY6gr34AcB1BPDfBjkhhTY9sQOgzo1K/SRRb/mXq+A6abOPI+HI1QDLG/JOHD/6r1GzVu7P47dsd98Ouox5mkj+HUbnndeXjgQDgHk2PJvyGaM5por7K3aBOR2yH1+UoVEcQLRwuDiyJWf4i3ChQuJsByFn+KsBx4zOq085eKZGM2qeoUBEVMvTMqLQntuSbNyiiA+a2RzQwLkU4lqXiDUY/ATDZt9eJLOeyY5FJkWZ20hvF3wV5RHKEIcwkUEZePEnmXfgE4Jb6L5brw8/5MejXKmBp+KqJDcUwbbDR2WAFll2npK/O76Nb946TAhcFQAJdMkscGhnAB5m745M5zHspglhs3xF7aPDen/hjOZE/3ot3vEIpREA+sZF0b1q5CkXTm7RvsdjnL4zsOAOzKUfeK1EDeR2bg7BkUmsV+cfwqw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0033b4a52bfbfsm3344153wrs.57.2024.02.08.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:58:36 -0800 (PST)
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
Subject: [PATCH v6 8/9] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Thu,  8 Feb 2024 12:58:16 +0200
Message-Id: <20240208105817.2619703-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v6:
- none

Changes in v5:
- none

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


