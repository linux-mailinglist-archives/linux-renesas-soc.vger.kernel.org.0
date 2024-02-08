Return-Path: <linux-renesas-soc+bounces-2456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F377984DF32
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A80CA1F2AB39
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 11:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BCE78660;
	Thu,  8 Feb 2024 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="p74UzNjm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E381768F3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389913; cv=none; b=cvT8J/0HWNLCfurqWoQRbs5HlNKoBelBHtQwP8GldDbwomj5d+evElBVm+i5L4cDW40lBKnHXeUcGbspOpOJqobdC4PiddYC0rYdVB8o3XcBBfbCSlYdqAqLTwppXr/uyuWqMquapZwWtQgzImpEyHWCPRcpXsZm4WdGFtllzH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389913; c=relaxed/simple;
	bh=TWnaLa0m7j4db3AEiePIG8TB6o+5sCCR0ZRalKhzgoc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A+kIbTPV2xxiKHe1hNQIfiO6VSRxXV7hA0fcCbo5z14TK/ZpCCXZhqOfEpUIaY7NybzHpEI1K9MGup89Cc+LGQ44cBUE7krWGze72HnDP3aXEg16mY6cmG3nn847A+SRlAcUMICQCU5UqK7DQ/FJThRMIezZS+j1zENHx8WHJPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=p74UzNjm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51147d0abd1so1973741e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 02:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707389909; x=1707994709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DI1IV6Rx3uk2FbsWFVokMdXowmYpvscOLMsi3FnGC0=;
        b=p74UzNjmBP7jUj4amh18LwDXQ6FRmrXLiPU8bxa6fzyk/7DjDGxqnSmMak94+cU0AA
         5LkQXS0Rb7AZEoSRknjZqytEhV+M5eUolIAPLMyaraS5a8/SWpnM1kp8ztTT1u7hA3Ao
         jOFWGkqRXGipsgxY1TKMPLu7d2yIww2jLyKeCpeEXrkkqrT4G8AOp5x8CNe7/PGVcHby
         3y8JcReGbkmiz647hE/Z+c9Cm13DTGjvTPWS98ck7+ODbbLRYHIVckaWNIlUIG0LdJr0
         gXg/gObWgy2Dq0UmRz7QRXikB09HdBMUrbGVOM4LKSa2l/XwyAtqFHJPAYtQZzrOtz1A
         ZAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389909; x=1707994709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DI1IV6Rx3uk2FbsWFVokMdXowmYpvscOLMsi3FnGC0=;
        b=vkVvVjUbZBJ0fZQn+RnrboQ5N/Xlnph9s8Zf/vaY/wYEEZM/fysWEgG+m+BXR58IAO
         rXSCy5Y9ZMxwJYrPD2+AR9DbYSlLwnEvup3m5iPGoQcDKakCGGqbOjWrf9NKyFt6UORi
         Do8uyq0vKPvn1pByb02u/ffJf10aScP0z2lkx3KlUijYODGIYXs/ynz6UjY8NKydcypT
         zJKuBF4DVWltb9OxRhidzjvOUFAYyx3YbRU3RhItMPeQ6n3mMR1OEQVcbOM3sBIOv5QO
         3MPVhUvkTnMRPemwKZdU5so6DuHsK+/yQIdFnbhkv/pctNac2+Ajv9CmeC9PISazbR0/
         5BdQ==
X-Gm-Message-State: AOJu0YxmyUuo4F2cX2Qyu84v5Iu1t/gOF4WG0oqzohdgM1EoXK3Bbkb2
	m8PI/qiI5YqQaIZYIHrirup2AlxDktp5dkb6koOU4H3JXrVFw/kENN1hZbFNpiU=
X-Google-Smtp-Source: AGHT+IHDzoaL1pqG/5W7oJisL+W45+42NvPArczrhGcIZfvjdYPs0ALpc8BULrz27U2AM52ABBPR5g==
X-Received: by 2002:a05:6512:3b8b:b0:511:6ec9:d380 with SMTP id g11-20020a0565123b8b00b005116ec9d380mr1211968lfv.30.1707389908975;
        Thu, 08 Feb 2024 02:58:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7lOUQxgPEN2hTmCLvI92dF/9IYH1BUNLprXQj+N3P49eQ9Xzo+cu2Si1IPz3FerY2IAjhIV3ZlGdA3YnVqo5H9UNFkBk0yLCccoyfWGXf4TgPZzU9OTHd40JIJIVVnQ0QmJIzR1ZamVWrzbC+Cofey1Jm899GaN6V8YmF2bFSHynfr+2tDzb6rcjPYRp255xUDG0762YqzfJPLdyKiJnyvD+mVbyKNJ4ngV0rLFLS08oQV6lHQ/DmR9/nukFQWzpINKumanhhY49n1wyUasp0BI0/J87BUC/aMl/E1j2X6DkKK7vnX1UsrOX7FfC9CU4yQSBJj5ix23+UFGd7x3KnsQGVnZe/GOZ6i4WYWpfN0Vrrq6lnI34cXEdpTJz3HoGFjxTTJbPYj/Wy7Cef+/VdCtdRm+t4vWHMAUnlstlSLpz1l7lfgFXO9jgdCBdyfC3BGiMSycNITNrpQrlxrhP8R719n1pR7+AbAg4zp66iucX5Az3dpLSTSFCemVNPa+Zq3xccRPQkKg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0033b4a52bfbfsm3344153wrs.57.2024.02.08.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:58:28 -0800 (PST)
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
Subject: [PATCH v6 4/9] watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
Date: Thu,  8 Feb 2024 12:58:12 +0200
Message-Id: <20240208105817.2619703-5-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_put() may return an error code. Check its return status.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_stop() to its caller.

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
- propagate the return code of rzg2l_wdt_stop() to it's callers


 drivers/watchdog/rzg2l_wdt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index d87d4f50180c..7bce093316c4 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -144,9 +144,13 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
 	rzg2l_wdt_reset(priv);
-	pm_runtime_put(wdev->parent);
+
+	ret = pm_runtime_put(wdev->parent);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -163,7 +167,10 @@ static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int time
 	 * to reset the module) so that it is updated with new timeout values.
 	 */
 	if (watchdog_active(wdev)) {
-		rzg2l_wdt_stop(wdev);
+		ret = rzg2l_wdt_stop(wdev);
+		if (ret)
+			return ret;
+
 		ret = rzg2l_wdt_start(wdev);
 	}
 
-- 
2.39.2


