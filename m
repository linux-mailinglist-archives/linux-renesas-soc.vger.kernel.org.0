Return-Path: <linux-renesas-soc+bounces-2247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A50968469F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0452B22878
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 07:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F0017C7B;
	Fri,  2 Feb 2024 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mL/lkpD5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E26E17C7C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860746; cv=none; b=k53Ddmsmoqc4+J2QYb2XJi5nSzS0u4qj1GOO9qIr8FcGtYxapsDq7Bl6CfsHEFKvtNpDf2yPGLfQTrVlSnTMms3KgLC5QdbnX4xtYX4GzmaAzSO4ykTpux5cziTaDhDZetCKNza3fFlsD2gYWwPOF2pDAOjNiJOhjeh/JKKmj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860746; c=relaxed/simple;
	bh=udn490QalxCFr/hQufWrgoKRZtKIHoOL7E9IdCmRySE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EHCRpOYVQXbSGJY8N+xwV9VDvqcAoDMbFUEm01od7WLDIhsQqf1IA6tFLaJ36bagPxeWvOD2RGgmXBKruLuD3IS1+2u59N2b6hYLFrnC8au+dE3o0TePtTVqFWoWq3hISFk9XbZRAafSDOy91SKIBZLYGcIysAOihcCYifcQg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mL/lkpD5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a366ad7ad45so228020666b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2024 23:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706860742; x=1707465542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhYYbup+eKhaPA6BfUacQBCWMwe+8QZnL1UV9+O6b0U=;
        b=mL/lkpD540r7YoQjf7CycijONXR59fFuxZ2j1zbQy76uC4Hgkd0paqFdmUeapH4aOP
         m+1FuvbwqsfOXEQqPYjW5BB1sguxU12AQzQp7+L6385pKh9JUi4wmjSa10UH2dKXHbDk
         eDH1cAGLl0RBwVA4CE0RnrfHKYMQ1EArp2WSfKcswVtq/gLPKh25DAgd/ZW+3apL/qCL
         KtHbTbWFKlIukeMbTSwXFrjxGa0UkzmMGdsmPiKO5xYbQw3a3R5BEjjXZMYqUKJSDC/I
         OdrZ17a4TbMqVyus9V7I1iRBgVys766GO+l9C6KwzQY9Fn79xre19fvBrVBAk4UHdQG3
         vY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860742; x=1707465542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhYYbup+eKhaPA6BfUacQBCWMwe+8QZnL1UV9+O6b0U=;
        b=W3wGy7y+aO1KRX/LdAeERmEnNIQbakFF9FGTGneoKAnDPjMG6h7k6RDLeydCIchXJr
         KOVhmSJPm51jHw7oljqCiRQi5vulDMO82h15KI7VZEFbcBoFFv+4b+s1w3Z/G7NLYNme
         VIjC3SGduZqeg05g1iWDwXG5uQMA0Tea/YU56CAy9StDAt3uAv4+6VrCpEozZgsp+GVr
         xx/ps7teZQH/PL5Qn7uUX/SIoNftlgPJQaM/N9sT4+PXXTIsb0Wh7yTj9EuUVB/JluV6
         XnvvmIoNtWVHD0rw/uNZVCacVP4WLDcCbEJqTHVDyOh++Sv9m7Pqq7jkVrjVEVAsYgw+
         r3OA==
X-Gm-Message-State: AOJu0YwQv6cRFscnbWd+bLyne4PSnLXdCyDsd0Pna9dNnKIPu0fueTve
	hci8wh3MyAqg/49gHSf1gSf7adPJv2xcrcysSmMO00dWS+a7p2t6K+6mbtMN/Qo=
X-Google-Smtp-Source: AGHT+IEg/knFcPQA0y7+2msq/xdm+LkCCk6rzMGy+os6NIPrNoqwolw8s27bci3QaJiadR4+N7Tm0g==
X-Received: by 2002:a17:906:f913:b0:a30:a7ad:bd42 with SMTP id lc19-20020a170906f91300b00a30a7adbd42mr998760ejb.38.1706860742536;
        Thu, 01 Feb 2024 23:59:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU3OI7/jNCnWdUj+Wlp315d9D73ejTWw7lQwrWFtZuBfu2otE8jDVlA5CLNLkfwdcZVLLS8rHeEMLQBvYRiF/hqAYgtjrBIMzjFZsi0XX/RSmMpLwrrJ1EQKQcdHIPtYawPXrdRYoWK7cD8Rylw8DI0Wp6+5QGOa6Q3M1OajlwT2X2sREYxgy3yTkP4TWEbgSBrJSiGPSyL19wxqkTCGWZel+4b8P5kKuyvuAp5JnpFMa049K8fMBtPjzG9Zz9Z1nHckrXF+4D5nqGjmm9TFamsmeURqJkW+b+etRpcSRg73y42xR1RNaN4g90qwDDY+eLxPISgIwha5xHVVUiunzkZEaa657RekwthGOhnHyEMkBVFA7rakEVdXlHjHj2m72vWQqbh6HZS7RJGLa3BF2GW0da6olbaO2jIs5Gw6Nggw2tNJgQg7wvG5hfPyws9tADNy+NLMD+dSPoTrYWve88nTaMOanBfjX60KkwQXqEr4Ob6eM7ndFzmFBTAnL2p0y2nVutTtuUcBg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a3715be38c4sm185544ejc.210.2024.02.01.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:59:02 -0800 (PST)
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
Subject: [PATCH v3 2/8] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Fri,  2 Feb 2024 09:58:43 +0200
Message-Id: <20240202075849.3422380-3-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_start() to its caller.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


