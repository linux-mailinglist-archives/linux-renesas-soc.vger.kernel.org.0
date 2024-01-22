Return-Path: <linux-renesas-soc+bounces-1633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D612D836154
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 12:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F391C203E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3DD4B5AE;
	Mon, 22 Jan 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HFjfxles"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2617D4A9AB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921913; cv=none; b=UkRMVZwTSshjArDA4bFlLqipsGwW0wk6Bl7B9shmNA15FO43AvP3X+AtRvoJcUP6AJwkBs6Iw1MimDY3klye5C487suIphQ3yT9tVs3Zuo+ZC+MBtuh77kj6YcGUx+XByL82f9+D+Z/myfM5GVWV4qrRoa0x8OH9WR7ejDEHQsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921913; c=relaxed/simple;
	bh=QSHrqKvBFITUcBnX8YOoV4xwGvo/LUKyPfUJqWIie9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DFd6fF2mLvQ+befZdJt894RUHHyzN5JGuE2uz47NzSNl9zgll/jgKY7cBJ3VkHVf8a1iNsDb13+6gNp9f7ThqjCbkkmveCIltZ3t3WF4nj3oC6ZQh7/VUPPAeTGg3Z2srIVhpflUDx1eC8NgbyFjqrph0b9mXiSNX8CxaqKuP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HFjfxles; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55a45a453eeso3644522a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921910; x=1706526710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEA5wOjREvccnNUzxu9B12Stn4mw/QPURiJXd8LQ/aM=;
        b=HFjfxlesQLWw2eazjzzCx0ZUeYlZkaX9e6bPqKbFPVp09D8LiB6fiInRs94zGNY4gN
         265+waRwh8HjkazjHLBGdhrcLWu18bk3oVdf+mgov4heHbFbvsTYhUfRfeghGLkkn9Ia
         r2iFcILXmuZ0QD9odPGBsXFdH3tRIp+9tNikCI6QH1Ascm+DvgfmJhZ3gpVnMwhrK7FV
         iHlOdftnB+UWuaED82lAco3jnqujLk09a5Xgh2CC8GcmBeEnClEzk9ehSqVtSZaLL7/U
         VrPMHSib/NbLA6q73tbghDAhk8XAej8GwA47/ab4/vTUnKgtFtjODKu0FTkxAaizMHnU
         WriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921910; x=1706526710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEA5wOjREvccnNUzxu9B12Stn4mw/QPURiJXd8LQ/aM=;
        b=t5K91SUxzj/qkndAawsrXXI8ujpBasqhMgdjiKaYYxu6LDiL6lyBpqz2iBBpIwHtb9
         Em1vxOoVw7k35gisw1n/V5KNPyla5e+fJdcTaLr6gUz9Ff88LQEHW46Cuz2Zhwq6Bspe
         ZWsXufar3XGqiVT217P10cL/19W+BXaCZw7sZeXcxrwhB/XOSSxTLyzWi218z1sHRfIS
         RzY+D9nbXz+A6FKDkR+2OU5R52pn9qOWI51m59jXNTDyCJ8HXIV4XA8K49LfrW7VhDFB
         r7rc0r9Mm+G5DJB5Kqs6heTz71Q6QQKrf2GpYUMfKfJd8U98633ojpTu2r5lKhdBUalL
         AZeg==
X-Gm-Message-State: AOJu0Yx70nB69H3ATuqLjZjVC5d+w3EcVnVmFwpDr5mFC9TlUq2l4drv
	DCIF/wfaxGcEcauqP8C71kZH+rjnC6u21n3P7oQfXx20jc91UGS9HtupMGDFGYk=
X-Google-Smtp-Source: AGHT+IGw7I6s3NPiyW22Qvw7VVWkxhXCAzTHINh94nQfxWrT31yIhB4pL/X+FC/j64bGD1gBP9c7LA==
X-Received: by 2002:a50:d5c9:0:b0:55a:5fad:6c7c with SMTP id g9-20020a50d5c9000000b0055a5fad6c7cmr2300051edj.50.1705921910408;
        Mon, 22 Jan 2024 03:11:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:49 -0800 (PST)
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
Subject: [PATCH 07/10] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Mon, 22 Jan 2024 13:11:12 +0200
Message-Id: <20240122111115.2861835-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/watchdog/rzg2l_wdt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 9333dc1a75ab..186796b739f7 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -279,6 +279,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
+	dev_set_drvdata(dev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret)
 		return ret;
@@ -300,10 +301,35 @@ static const struct of_device_id rzg2l_wdt_ids[] = {
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
+		.pm = pm_ptr(&rzg2l_wdt_pm_ops),
 	},
 	.probe = rzg2l_wdt_probe,
 };
-- 
2.39.2


