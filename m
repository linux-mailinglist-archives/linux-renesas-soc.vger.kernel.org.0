Return-Path: <linux-renesas-soc+bounces-2433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657C84CB12
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 14:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F93284DA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A4F7C08C;
	Wed,  7 Feb 2024 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MHieDIKh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D481177F21
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311293; cv=none; b=hQ6idb71OV/v052VwKOSjeuyTlGyynnm6vXlSlURGCySVCGWcujVxEjKZN33B+xOjgs3IcO7WV10tGzMbslyKaqM0UxSvisnwTTzbM6s2oEgdMom9pc8JGvbvAjhwl3r+Uu4XgOhr1B+WEMF3569BHxBQbVxTpRAyK8WI0byXBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311293; c=relaxed/simple;
	bh=FF8wk47/TcFJ/MQbMeoYLR1AQ3+e7GoE5yBfYiqyb7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hwyeuCHZMUTkm7eSEy49GU+t5SDBPofD87bTy7oEcluPMbl0dx816ouNl4PkJcaAcqM17hcBIEIlyURF6GBS1EftDux7by1Rz1qpWTznYHWIwVGzOc3SaPSszmeLUtMsqSxLoiMm4kGkbgqs4TDWcT6e+Ljr/yPpoHXCSMm0WHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MHieDIKh; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e112a5d30cso192351a34.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311287; x=1707916087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz2e76cy2G1jvNc9Tv5K0X3L6EcoQBWjCx1l4t2/PSs=;
        b=MHieDIKh0XDgNubUtC60Y/jISgPsnWbt1VUk6aHFldeL1USHLNHdCrsZOrR0RpZ4yt
         l1prqrqWe/k6tSI6Mqy2XLPfWIdYX/x22r658lArO+07r8rr7WejtWTR1EY7YV1l+00m
         TlLBbjGyYoV2qyDshJPxOkfWFTekwIWHyOaSie1ZinSLn4W0c/D4m0ItIRupKNrM311c
         w3f+QEbzw+x3akpsMXWymQyWdvyDld2AN2DGp4eLXBI4dxjZ88OoRo3B5zDS8FNJqmja
         Q1CDFQppGcDQVrhVtvUoJiZgCZb2wIJNqz3uJLbXZb1J2FtctbyHmHgHadIopdWIN2PD
         l4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311287; x=1707916087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz2e76cy2G1jvNc9Tv5K0X3L6EcoQBWjCx1l4t2/PSs=;
        b=g4z0T046ChFJWXx5Wwq9jEnEwJNEiLXgk+REyxPVM88AngqF2Hh61xanR5oPmWAToV
         f9+A7d9Oywm2mymctab0xOHJNGmO/MpP8+vdYcqn0MLMZXqU/dAcFQsW5toHm/mMpMRo
         HiXjG2KAyuVd8NjQf/uoc5zVbu91PRQhQ6cIKevoIchCRPJA4aQRgJVIle9eNwuzJrbH
         jo5e/bRQsq+TTuhIYGEZ/NERQrTokW/NoQCohBEHBZSupgpSYV7nvj7G3tnt6FYWcHx5
         2Auq6CkEA4rAJ/SyUN0KwAxZdxegwxlRdf1RHsM5Uu6yN0QYH3oF75y2aZyVa2wzSwiM
         dmsQ==
X-Gm-Message-State: AOJu0YzHoCtDOrWIkPkprH/pdA40CBB/6nu3Niv6UOMFpW4uWRTDEhlt
	wh5Hp1N7DR2N7TsKcY2to1FLyLxHMQ5aq8YhBMakL/y/n6K82dysb272KgVsQ4g=
X-Google-Smtp-Source: AGHT+IFhdWe/IlP3jGi9ohUcj2YwCpp6JrR8st8tLbVC/OF9Ug1NoFWh/Ez1fLF//qbThNHKpipgUw==
X-Received: by 2002:a9d:7ccc:0:b0:6e2:baa0:76bc with SMTP id r12-20020a9d7ccc000000b006e2baa076bcmr1091321otn.26.1707311287085;
        Wed, 07 Feb 2024 05:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEvcNgyV17O0Ogb+Haf4TBO+ibKFEJ1F83Uqm1jIQNL/0S0SxTdVTh3mUo7X5GPm/bIio05AKvbC+JELabVlT/Kv1s77LtFlieMLelJb55tjgsJJ3TKPMZGejoLePsLqgX5JzoB1cpqGa6TZMuZOeWN0dJ8rz/WuRY3dmag8xOpvtRW+b7162SmGrEekovdeS9EcHfmrEzPL6CT0uH+zb+JsKlt0lEA1qtttHXNdfJtZ7d6Ag00CqUFAPya/ACEej3CePs4Lcl3dipWcTSywbEPkBESsRlAlG2hhUqp9RUBoPTzlrwLS8f6TSJOWAYsdTrXNly5Fj/w+HPOpHxbUn3UW1VWWYcv7w7xcIhwL+NcIutWV1VH1UvxJfuwfNCiRs0LfsQkxhpmlnduZVqmBVLIdN53Z6zAno9chOlRXakwfCfjyaf9wft6uBr4geWCFvkXdArwWuOpQ9Lc9I/IKRnDSv6NQKZtIzw0G8LwR3YjKYhGEte9brgK0tnO5wdG4IbwnEiXnXBcg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:08:06 -0800 (PST)
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
Subject: [PATCH v5 3/9] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Wed,  7 Feb 2024 15:07:39 +0200
Message-Id: <20240207130745.1783198-4-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_start() to its caller.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


