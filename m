Return-Path: <linux-renesas-soc+bounces-2841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AC856574
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 15:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03F741F2617C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 14:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891A3133293;
	Thu, 15 Feb 2024 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mvDkUFmC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2068133283
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006148; cv=none; b=BVZOwpXEb2X+uNsvVCGGTQCCTcXXFYmsIA6AnHsbDddKcKWb6O5x/3m1pYwhFFyhlnN8rsyMakopQ7YRHVKhLCcK/EXLmr9n7LFV1wF9VsKXqlAicLhBNDYEGqbgOmolxA6EaiztwOe80Ew75B95z+7FjXSnorNdhokrPvJkv3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006148; c=relaxed/simple;
	bh=4Xx+Y6oRenFZ8m0ziN8T9+sztwNA2LuxcGKFoIzVWlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M4rpM/kLZ92c55B1Uh6nxdtEtQ1xxQgbp6Z9Gj3JzDgeonNKgGvTJCDmKPNNLd+nK6xo5wfiwkC6kENCf6qyfZ/4eGayij/g4KuhqtgPYn3bVVwYS8RKZHDywXGv7rmDvMEsn6VmCQ/ObEZB0nAq5uEtONhfl518zbESUXe0hos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mvDkUFmC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412255afa19so2641065e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 06:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006145; x=1708610945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9hLCgOgDWO+oXa7HyITa5NYPaX6P8CRXV5rOrD/zA4=;
        b=mvDkUFmCROgG8QlXHh7hJxbEZbza6PjqQLM3ONvOTDbBafy9P2U3a7h5B48xmvOhcx
         hubC8FIchViXedk0hAGn/gM1xoUyfPeBsXSu6+jQiRStXzmjS7dR0Ei4rG/N2u3rgJIs
         T/82VRQgt/uX2C7Fi08V3pKUD3lJ+1qjy2ZjHBEAq0sfQrV1q6OlgCS+MBixduL9oK7D
         9Vw4DQcBtrJNKQs2bnIZTfKI3iU/5Ce/pzZ1O/uMXsKArnt22RQzNq1apRMhZlaKpDXA
         spfOlXvkAt2AM+nOpJKgmepWyNc0Lk60Op0cFhWYRZp9AHIgby7g0HBRF+w7iJ736CNf
         Uurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006145; x=1708610945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9hLCgOgDWO+oXa7HyITa5NYPaX6P8CRXV5rOrD/zA4=;
        b=P5tMqGl2EnjajX32Tau5tCZj3BYOfuv+2IHG+FF5cHDFkhH6IUXB0+L0dX8m5WM/CN
         jJLXuMEcV/F1biY+I8HyUSvskbYFNfYfqZ9W3EkWrPkK0rH/ByLCsXP9qYZ+wR0LMxhl
         5dJYu+JFbnNFjqwBrXJLv+NAD8XDI8RwiLoEKkd77VoVnFSxidc2QRjXnXbBrgnn9DB5
         9RvRvAatUjVGxP3m7Y67Jx0j6NajCKk+e00eQEon6tAbNAzT3hpury2eA/vqNfIfZDuu
         yoBECmM/5WgGu9qV/TCSxBYQa37/Qf9cFQLJ+3asfZIR/iMGFbd71ZgjeVsOkmntMG3o
         4/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUpgdJDe4kMHa03jp4qH7TJPxogCSGw8naf0JhHJszaVDGi564mwESsuM3FBiM5i77K2ai1HF7XHBcdeGgyZLKCaaNlK4PkTkaRv4tnRCBFmOg=
X-Gm-Message-State: AOJu0YwjOaP+nx8zf6DBuza9rAHSSHpMab7iR1Na4EaSTftqVNcyx7Ap
	lKcGTfUqaP1L09Kl50NUvhLfzQVvNWBM4BcgiwT/wyp3fF8t2om6uQHA+qNm2nc=
X-Google-Smtp-Source: AGHT+IFFf+tXifkQv2SatTeLE6k1cshLJpSleVtNe0WiRhCTT2+LgjmwsM13fQ76vQDs96dpLk3NoQ==
X-Received: by 2002:a05:600c:1c18:b0:411:f49f:b274 with SMTP id j24-20020a05600c1c1800b00411f49fb274mr1578583wms.0.1708006145169;
        Thu, 15 Feb 2024 06:09:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:09:04 -0800 (PST)
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
Subject: [PATCH v7 6/9] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Thu, 15 Feb 2024 16:08:38 +0200
Message-Id: <20240215140841.2278657-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

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


