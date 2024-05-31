Return-Path: <linux-renesas-soc+bounces-5746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9278D5B04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 08:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4EC1F2633E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 06:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419BE84039;
	Fri, 31 May 2024 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eay1DwKa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0457824BB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138681; cv=none; b=iao93BJ4oOfQidINeWEhfS87st4Imd5XON2GPGuRFFHV9g39d5IBSS+LDGeikpZ+VNsiDWYFLs8zpb7aXu67ebBdcRQjlObdWCH4guIdvKXjqZ8QVKjEqkWZI+gd22WxrzOtHL902PUlGAyLYXlc3d24neJwUaz1/lYz9IfK6KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138681; c=relaxed/simple;
	bh=C5J7n6mawG/YSKbecNqxc9g3YGlBb0G/F+anEupQ//M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RCFSmwqq+MUhUkFWI2xdgoVHTUoIAJ7CUtrXKeOvhpvigqKYe10MCws28Sx7Hiu1hEJ9tXIHshXSP4B6ZcE5LeCJOAuOI6+CI912GnMbV9ECRntTk917Hb1kP6kiqTPWIxld5yn1I77hHnf+j3HsWYR6UzCwDFFDNANa7eIm/M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eay1DwKa; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a63359aaacaso186727466b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138678; x=1717743478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnbFNt57mDlPrk/+6HbliL0AWlskuevESgsdP0A0m0w=;
        b=eay1DwKapbNh9NbYBIMgLZeli+U9sm00ya2Pe3hNq0Xw6vyLmKeW0ShbfbhYhqAKlB
         FxlYe0+hR6FehzJ4WstDi2g509wq7AzaTQqlt5kzZ5sharat5w3H+S8qYaS+Dm3s9ruN
         Fv7RxRxBbp08oLrvRCdEk+MeSLsvPU+az/1cHqJINBElenZcHapU+uGoYrWX/JyG/9jv
         zvhkKARkodOUf1xOCr+fXGIc2hW1nJ4gR1GAehUzuAwEC99YSelvvXZUKDuTQmbZiCZH
         0Hy62yfvOcd3KhRR3i5QMfp7ih2ht9Jp3u/oNGzH8exK9FTTDKvOu0bA4GZW0iY91KcF
         bE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138678; x=1717743478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnbFNt57mDlPrk/+6HbliL0AWlskuevESgsdP0A0m0w=;
        b=FRcwUhNwWiqYtkwHPsqTxhK8UFq5LT8go0JHB1r8hQpx1AVIJG9Z1eaB5fNDiwAkus
         rnLAHI5vQtaXT/7am/nuPWzCERa9JZhAGemrt5+1svmKD4bkF9mI6MhPoSsfP3OZFEvU
         IQfMABX3xXEErcb6hd9/X1l5DyVO7+V5fgSiBwDvt0AH2DE2IMFVCXmHhJv9+gawzcCZ
         kaQcF8FaePAEon8/jXwrZCW0m5X1yDSdmo9WnJYnk09M6HJSKPurC29hWMj3Pg+MB82Y
         QpGV3tKEZhX8iibM7ZvRGfYt9zGlyVWmfF4C19J/exOC8rRzw7a44IGa4JWm0KAjmXo9
         v1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmwgOeJNc64rJy5y30FmjcrTcohkvTRhlizDKyXKrk7hBVuy9UQnq7zfA/xnLx2HB46J1LAFGXdHoqLSOxauQnOm5C0PooEVkrU2RCJhul1Kc=
X-Gm-Message-State: AOJu0YxYe/elz2facWVb5vdavV2tjTVZEqAPky97PagyZLqCESDNp1ph
	5wIwDjIQV0mnTuRxXi+ZPG8/Zz4bH6fIyEK710Ubcrxa2HmLXwDmo9MUfCp3T7I=
X-Google-Smtp-Source: AGHT+IGgmUEX7HpEA1HJpFVW8dqvobduBoJSFrP3WJDjQ2csTb96wdrhjuykXG+2D+FLIlqu6sP1jw==
X-Received: by 2002:a17:906:600a:b0:a66:a24f:13c with SMTP id a640c23a62f3a-a681f87ea17mr57762066b.4.1717138677878;
        Thu, 30 May 2024 23:57:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:57 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com
Subject: [PATCH v9 6/9] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Fri, 31 May 2024 09:57:20 +0300
Message-Id: <20240531065723.1085423-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v9:
- collected Guenter's Rb tag

Changes in v8:
- none

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
index 7aad66da138a..1f013dfd3c97 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -318,7 +318,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2


