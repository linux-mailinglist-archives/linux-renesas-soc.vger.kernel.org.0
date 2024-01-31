Return-Path: <linux-renesas-soc+bounces-2117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9B843C37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270541C28CEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87CF762EB;
	Wed, 31 Jan 2024 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RCEqASWB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3675074E25
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696440; cv=none; b=P9juxjtQJx7Umf3EUhJqe+FoTe0sW2WP/D2pYB0VOTtwPIgHnOsbHZ1lhpRME7hZFtPhc1v4POb5oM+ZDIrRzpFpJ/PJSzPww9nv79rrGjiGHwLDxLhAlbXbhye+fWRJn5/ovNvezwJpyBFeJs2Nk7+8j6Pq/6d/hSDTnwCyzHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696440; c=relaxed/simple;
	bh=H6FcSZimBVudTaR4rGYjmB2bIv0NVLGFUOR4xJQdDQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0zIKNfC+kAVsHGJkl8tMpGDqYB/MJeX28JoBOthm7ZRGBQxLRNsoJqIB+5wGOUbwpbdtkpVOszHUjWlgcuZpdNwzg7jkTiBtFnGr/87cCxCZNSjogsW0OFwSBNnVJIgX7AE1KodIqWL31NWcpzvrW9fu421GuymOOBMbSaSfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RCEqASWB; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a364b5c5c19so198087066b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 02:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696437; x=1707301237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mO6jP/QWi6LCd6JhCn7qcYJB8RjfTTwNL1rKSjMisP8=;
        b=RCEqASWB6pmjujSA/Mu4ks1gJWH7zk0hRn8sQWvIeu3vulKYqFDOIdbqnzhZXXdUYb
         KJh51rnVOGljOMdBNmlRZNv1T1Kp7ZZZpa39MRO3rlr9+/QFO22xI/dseksSZxR1VY34
         d/Ew5xSNS1culhR1Yv1MTYjQiwBQw0L++06BVBQtuJTkX7NTLUktQtSYAu/d1BuGsgGn
         s3nKepGUHlKNQyinB1K04GORykgAHg1d68ulWpq43b92CyTzsgOVN3eq6SvBt909bUsc
         rAcjkzXCmrkOr78VWywVMxOivBcdMrb7rSY2LDEdumqqrhP0uQFedMpSKVcwxAY2Ou9v
         4r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696437; x=1707301237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mO6jP/QWi6LCd6JhCn7qcYJB8RjfTTwNL1rKSjMisP8=;
        b=a610aC5uKPGO6AkA+M4/IJAYPQFaXUmf18kJnvvQlQxorHp5QxWWVbRgyZ9obcncXc
         uuFTBCfG21YLGJaN+nJQxh69CrR1Wj1Hvjjio2vs6V8HL2QoRiNdA8r9j4O3PUtOWjZy
         /Zbaq8KWuhFAm1vWXvfMiYcw6PAT6RVo+ALYZDSUuKzGhUBupiOXMoOCmUyDPSG8zjcN
         k01vp+R91EbQ5jmKP3eatPSKbAh1JDSNrZolLHi7/lW7sdNPVLlDOrfONWKO9IfBzjcJ
         DFWU3TWUTCnnBnubocWion45PaLzmWDWHOKZBiUrExyM/h4GejxaRFVBGRhtlQw2hZN+
         015Q==
X-Gm-Message-State: AOJu0YwocKXz3csqcYan2RLI5hexRAbhJsme6NVegz2NJz5rA2TqHh65
	yZytkdefSJuFZpKCOGMELF/869sYUw5zaENQh6GNetOzHcmrbRKWIgajXiKhpyI=
X-Google-Smtp-Source: AGHT+IFxIAJqZQff8YhsVRjDOIwsAOn1ZXdtq63EKMPORsiG1KeevAGRjV0bqdNGoFXnvOIMGEh/Yw==
X-Received: by 2002:a17:906:118a:b0:a35:88ad:e607 with SMTP id n10-20020a170906118a00b00a3588ade607mr839119eja.31.1706696437272;
        Wed, 31 Jan 2024 02:20:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXb5vxl7q0ujGxCfzWzXA0dChjsu9Kf97S3Ve32BMSyn4a1NBlfWCk3Wuif0En7CfdlWnancsZr1rNrLf3om04RD/LPCAEb+cGQbeOln+g1sQb5v2J23OD0y7me6quuIXZ5Yid90Xd2Z10lTnK+rq72d94ROsBN2lw6Oh8rurlBzj63CRqI3hr5jXY+FcK6XDlgoMXSABMRvUGxf+Nuea/BQ2ZZp7O5zCg3xi9L5hMjASYqN2/mgkD6GGgesBm+y0GWmkUbwAvcSIQ47TknFIg/P81lAqcVJRdrJYawL5kyqPFONXVtS+uGux7cOux5wQAvqAFa/ipD9uJXvGKreVR4hRsmnvs1OWOpzxtIxecU/+PP5MtpvudwdTjqstaBx2BtIEnvxFApFwA82x7HsoxgAJCeEErPr50vQJYeX+HXRCIS2ZDWtg+egoBMQJ0EHJscfSgvhOxeSXMoJJHTahswDp9K++71oexBmurSA0ijQwMHFthoNVz8juvuJFYK9SqtvilO+HHftEm7uO811iXko4x3ejuKgcPuHTROxtQiy5hMQqajeCmMx9cWMuy6lerTeBUbRnZ9MdCjYBIPAqctiynFSdteDn6OhwDlepM1onk=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:36 -0800 (PST)
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
Subject: [PATCH v2 06/11] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Wed, 31 Jan 2024 12:20:12 +0200
Message-Id: <20240131102017.1841495-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

devm_add_action_or_reset() could return -ENOMEM or zero. Thus, remove
comparison with zero of the returning value to make code simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 93a49fd0c7aa..29eb47bcf984 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -316,7 +316,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2


