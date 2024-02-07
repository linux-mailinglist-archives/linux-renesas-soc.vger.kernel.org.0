Return-Path: <linux-renesas-soc+bounces-2438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCF84CB25
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 14:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F891F26815
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BC37E59C;
	Wed,  7 Feb 2024 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="n/hryBJ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046707E585
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311308; cv=none; b=i/8dMZg9WCe9bE2xmYNZQ4RVI4Vxm+etXDTpIFB1C8vUX3g4HxHr9sj6L7t1jZ4x2bxOVPOQ5+WyJwuxmyOb70M/Eo2p5kYLGvATrE3NW3cIT27Ggf2dwJYwtDPHvf3PHI/0Tee8vbfoQQhB53NjWiLkUYdFKU+jogXLh8ciQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311308; c=relaxed/simple;
	bh=nAmedCW/ZC03QdOpqI4vfMDgm+rkTWV8JGUP9rO0OUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KpFpQVaSI6KmDS3zTZkPLRhUyJ+CD/hSVMU4Hp5HMhMRHIDZYq4ZZWKwF76EHYtSaOKPUEry8v5OMvaCZSAaFC7HDcKVIkIQqrfwYH15A2uvVoqhL2bHLVLf8vHuyTHHbzyFfX3xGSiT8+8mHpZf3ynw9AZSUvYAiArs1Zy3ALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=n/hryBJ9; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-680b1335af6so13939966d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311306; x=1707916106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ9VMSq8dCJ7LcLYsUSqAogT7VEVHvmzpU/dJCFCZP4=;
        b=n/hryBJ9yXntghd+/I20VJfGrJxUtnksFoYhvaBLqXOrCu/yYngN/dAey2uo+PqiQD
         7vTuGUhWj3dPmxX+HgU6k+Hlbn8nNE6dbrWfbHNplMz/YlNyi02eWsKBpjQmzRkLike/
         M+0khLVe8ohlC12RwtBb45E5KA6fz0UEvdgD04k5KUaU4MxhTiFSpXLdnuOERZTklOw7
         0FaEchZNjagg9w1ZkTHo5ggRrBTbLAl92oojwGyzOy9fOqqg+YWZkB1FIUk3F5X9q/u9
         FrFsrUGTYokJFhSgJiXu6JY5k2kEZP5GMtzKYTjfGj1YuPDzd1t/8H5B7IvCLDwlxyRP
         OqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311306; x=1707916106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ9VMSq8dCJ7LcLYsUSqAogT7VEVHvmzpU/dJCFCZP4=;
        b=q50VyRss8iZU32+6hl/+TjRw4I5G3slx6Q0nCeOh3ZNtmmEQ8oHmoPu4rsBFmBcumz
         fq+dtU3AK5ANWa/W6FWqCaECLGTs83qpAN6XMZxxVqjjCPxLZWoLLo5tYndxn3UkH15V
         KVOONvPTC1Op3U3IpuU/TLbvrGCoPcxNgJWlUS8sfGy/EhwDNpxAselMdVzVarSN7HA8
         g8F5Xsm4buO+3S1FjAh3e7aAy3O2cO9OmgQQOGf9ScUZ8NRZEhiTzEoxUbjPbycP6ACP
         guopnwPtmJp05p6aIEtHCrQJPg6XBEFqk81V5yKArM6KHLjydwdlS0gCGoKNiL5Oswao
         OMtg==
X-Forwarded-Encrypted: i=1; AJvYcCWo8FA4CjL7ihSzQREkS31AANHaWg9n6pJiSMy3tg7R+KJf0iZJ/GH0+jMR2hSn2RHEqSY11k4I4J5M17eYenJ1ryS3zB1/H2XzOWWrXEwNMw0=
X-Gm-Message-State: AOJu0YxfxNw+3iC6lY+G+1zWTc+Apf3sUITTwkWXfU6gt+9KlsPgxR8p
	R79wHfgN1zPdz07Ti0qNc87inCPVHQKNP7PowfpNvratVTKWCBZlRuOlpAOOuME=
X-Google-Smtp-Source: AGHT+IE2pXJX7Ad/VbjGXgoT2QtCd7B9+mf58olJKTHH61Xyrg56ReH4axFmtC38kPLDrjk1ajEIPg==
X-Received: by 2002:ad4:5fc8:0:b0:68c:b9a8:a41b with SMTP id jq8-20020ad45fc8000000b0068cb9a8a41bmr4622016qvb.6.1707311305856;
        Wed, 07 Feb 2024 05:08:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdlQMnNUTAmKLGNAj7w8l6QHQQft3c1TPgl9je2tKKrAWPD8vpg4x5LJWQt1rHgYr1KEE8wdAH7or5V4I55d65V9Sq2BfZCDQDTTM/4AuDKGD2HmGa38u9SWpImRAmX4/aTaEQpNKSMLj1Sl2Q4c3G/7otIU2c8m5c6Sm8nw5T6V04V3w/7KkWcO1PGXoX1ah2GsMCrzp9b8DeGaJQITf9YxP6QlvDVFaZReR+dFFuCMlUZ2Qz3wdPYxA+lYKe9231tPGXt0Pz9TcsG4mYOnexV5BZLEQp70LQ8CzH52ShnCMCT8IF+T8IEGx3ohtBU2mtB0QbJgOBt9yfCnEv0u+s/OdtPWRS2+3zoMZZyLEzaSIWGGPlJV6IQI4kFKFxwfwU2nJ/RBu51GgJnVEgWV9u+ytP+eULjiXMBozEQKtuZAj0IsIH21TXUU5dw+wL/bLWmkhiOXUOJeF8tlgHHTfL9kM71x+ZHBupNgBvYe0htYhtir1fgyEPpaBHuwdPQAC9sFG/7oBakw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:08:25 -0800 (PST)
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
Subject: [PATCH v5 8/9] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Wed,  7 Feb 2024 15:07:44 +0200
Message-Id: <20240207130745.1783198-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
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


