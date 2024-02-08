Return-Path: <linux-renesas-soc+bounces-2455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FEE84DF2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E851F28859
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 11:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35E176412;
	Thu,  8 Feb 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VCieDP3Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D27604D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389910; cv=none; b=Wl1Y4z7zXXLKNIdr68VmeOY6/YfCuHZq77g/eT4AIqkzxFE8CVJoxbsCoxKXiV4/mRmzO9vE/4TWur6R6jX1/ET/UyTkXrzESo5lhK1QLfnXzzRxEcG1jSluNLAr1yAC5S+53zIgKIDsHZ1cCxz494YEBCOAM6jZeaCQQi14voc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389910; c=relaxed/simple;
	bh=w6qWP7XaJKm/vK3s1+oR2qLNqOjHuQiddgUXe+2xIMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=exNMRiu/vx2A6WCh5r+DmYqpGH82q2tKrvAFo1d8NldrAjUND5VS6Co+3kO7FbKVBjtyh7edVoxlnUrwP8833TuRakaI6HF4gUbFc5LicUtuZ5a+bjZES1XnTL1FyxX78iKq4e4BodHgGaRoRcXpvCE3QkkDSYgAzqKU05F/afI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VCieDP3Q; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33934567777so1107036f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 02:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707389907; x=1707994707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdKMGLoYpcuyVr+Gs2X3MdI3n2P7wXvDLhgtABtpYKQ=;
        b=VCieDP3QSbOLijLEGrmMZS5Sr6oVd265dcWicZMFNv8p/pPtmBBvzgtvesiigdUXXW
         eMyeHNYVQToC//ord9VCs5iICV2czPpmDRk2DLup1XtPWq/IRos02Z6PyWTHTagJH88t
         m9QN0V0B5PCaPX+Z7nUbnLYhZFOJmarAYrDY2wxZmmmQyziVdXt8IVBqai4IjeW3hz/u
         wspP4gGqT1MAPscv30cJwmurlXio/gBaihbWR3n6fPQEfK9ksEAWgXZgfTH/nLE3VceC
         O0o33/AnUjYd9COBQ8fsxD+ZwTt3FPFKGcZBT6KEEm7OR0nP7n7xoV9DqEjs75hsZHRZ
         woiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389907; x=1707994707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdKMGLoYpcuyVr+Gs2X3MdI3n2P7wXvDLhgtABtpYKQ=;
        b=hQqnEDXRk/LdSKnvdpqmtWXd9ltf9R5cDLY21YfDPPHk/T0JTXO7RFIUpMQO4BNLC+
         eBd9yP2qtxO95/fy/8KenEClg6/6pKJ31BcgKijf5Oz0Jf4TEYSNxvVjNaVZKaqPcSm2
         jRpWgABSpVjFUXR+t8p0Lo+NymIbvhVl0r+/1uWEn7mIx52bO92UCizFmccTjJq9/rqu
         /72U/y7MKc5b5NKAgNC+Tum1MC4p1yo0ItLqFbZqcM7dtmTA5Z5yTutryT5/YaQaSpRX
         a/dSCsf5oRe9PwLmlEpA4wmnsy60z0TC6/iwc3XloNHUqoGvAzBWediR0uC3A/ON1aL0
         Cq9w==
X-Gm-Message-State: AOJu0Yzbo3dcsdxoO5LlmeZs3E3DeouqGyeV5uqLp3jHViTN8kmajrCI
	hiBX4hnI6yuJcaX9cb31+haCwz2uUg8SYj+LjcjJkkNME5/naQaZ6FCiYW2+Gmg=
X-Google-Smtp-Source: AGHT+IHO63N9IizXhjNv8vkwbtKD7YMLRdiRv7uqbIiKptoPk7pYJqsYhfniIYKkZ8q7RK9/3wj68g==
X-Received: by 2002:a5d:630f:0:b0:33b:2bad:ba10 with SMTP id i15-20020a5d630f000000b0033b2badba10mr5922906wru.12.1707389907090;
        Thu, 08 Feb 2024 02:58:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/ilygVs7EM6XhmZXFvOX/h2U/KKibLQoEqKRfuvGtrO1lAsIqTyEszWP1teBQ5B4YtyavhoNq5ouZq7fsYC/yulzHR79SneEQT8DHsgDBqvA8uKzOUr7iB1R/xoN45d5UOnJa5TPiqNLo16Y7pgrkdlGyX7tdTIzzICwc8F6s/jaWGEB7Sfipaeq3LMNMIHxgoI59kuSL6ClVSDtdf/Xg6gt9yryCpO4CG5ELk1hwb2s5/5VAoV3daRW/DWtHT/kmMw5FyBcHL6WKNuHyzKq5JiArEe+Uagz1oN44Yi5x89FTLPPhzn/LQd+OTNV8XQTbmMBk0+XRW5MdWmtvF5bxsif5VcfrFXKDPksRToJ1A74nB7jEH8wHaisgExw4dffZkg0uga/0NiTJOtMxyxLrC+BmJkcg8DbUol5+pLwqkArtw4QTy1yCJhyS8ErnUvCq6ifGPZlpK/flaxTMVnsPJioGupCyz7QvTaA+8e27GhqvdcTs/7NyCCBIfDbU6+DOQFxwW3i5ew==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0033b4a52bfbfsm3344153wrs.57.2024.02.08.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:58:26 -0800 (PST)
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
Subject: [PATCH v6 3/9] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Thu,  8 Feb 2024 12:58:11 +0200
Message-Id: <20240208105817.2619703-4-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_start() to its caller.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
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
- propagate the return code of rzg2l_wdt_start() to it's callers


 drivers/watchdog/rzg2l_wdt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 1741f98ca67c..d87d4f50180c 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -123,8 +123,11 @@ static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
 static int rzg2l_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
-	pm_runtime_get_sync(wdev->parent);
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
@@ -150,6 +153,8 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 
 static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
 {
+	int ret = 0;
+
 	wdev->timeout = timeout;
 
 	/*
@@ -159,10 +164,10 @@ static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int time
 	 */
 	if (watchdog_active(wdev)) {
 		rzg2l_wdt_stop(wdev);
-		rzg2l_wdt_start(wdev);
+		ret = rzg2l_wdt_start(wdev);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
-- 
2.39.2


