Return-Path: <linux-renesas-soc+bounces-2839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04285656D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 15:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7581F25FF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 14:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F77132C1F;
	Thu, 15 Feb 2024 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fLtDfOR7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9894D131E2E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006143; cv=none; b=RfrmxlJd17FCe1807tKita6+YwMxEHXoz8Uj6KRmj0BZLpQ9pT6Jufa1nUliq6fSzpjth51fhlO3QRLQodVEcl0h8YhBOj5F24lwWiIeE67PR48J2fkhaYXXw2wsUtUuv5vI+LT/lzqQlJeOiU6MmJfx0/Qm2Qk7QzHCPn1mNEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006143; c=relaxed/simple;
	bh=8AsK5mIJBGZIHLJAmDvX4jfuEJ1mMOpuX9MBHmSxx/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OW/0PrOcnVPEhQwYqS2s2ehTrztawGm1GRtuZ+pGa14UVQE5E1bX6/eKo62IjO0tqTr/jjCZZurYV/gEIoqHq2u1T05T+LQzIsQ49irXpq8Q1ZK8cvFW02gN5wuznGN86QMf41h1YgbKl8j6ZjIrm9JsumcxO7KJJ3NTdfJP3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fLtDfOR7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so7688975e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006140; x=1708610940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPUYiNHqZhUoHd+sZ4RJHnQ1CmF+Xdz4uH6uUdJNI+c=;
        b=fLtDfOR7zzKxOgfJBJUe7kJsm9PU7bmips5thzkXG0R3kUrM9GA4PodvdQTHaMbP6t
         +JScrNIJWDgVoXG921m8D8X/6Pbn5qILVqyxrN9Dhc8lJHeWCntABDxzzFdjbA3nppNh
         FE6LH/+ZLFn/lNTz/o0QHSx+hp1x3S/OmWqLJC7GChodNsb8TdE/G3IjAeQepsoMYj8d
         H/t16yL/nP9+EqL7Hapm3nTi7ApvbJm/6dYqX4mQ2s1hpU0YpSzEPtusVdRDTIIXjSnC
         Z9jMCxKsrhMW+zQ4HiKkE4a35vcIPG2CAZQcK8weZI3X7AxKZkndvzzO3hbOJo0o0yv7
         xNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006140; x=1708610940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPUYiNHqZhUoHd+sZ4RJHnQ1CmF+Xdz4uH6uUdJNI+c=;
        b=hgdEHRtb8s/8362IbNqT2XkHuVYz1I/T4QnWq/x68jmFSNM+I9cnelxYWIOz4TMhkJ
         yrEdlB9oicOJE318pkSN3jmyamJeLgagvClPBsAryVyQORm/vmD/saZI5R0fSe9OvG1z
         vmRS3wHljWUd+pRikeqhaI5aucUGpCu1zVNWMfkXiUWmiZO1c/3ySFgbqScrvz6mF+dJ
         GjR3K8nRmd56QKH60C43BdueEFeR2s1d2Bbz4P3eE7fgn2bK/Ei5zzl5qftwx2qCtygi
         25hF2nYeLhzjUWT4/vVo+MAqkT25rsbqMiZ2em1+IOtp2SLyErGRjz0fgJY05EJvbUcx
         rD/g==
X-Forwarded-Encrypted: i=1; AJvYcCUhLXzvOBsa5FfsxH5P6suXiaLLBy8EAfY2TrlCN53u3IAv2PSJXsrAnhywhesnU2xBtTu5kl/YR40zf7pRK28MjPIvMxl0fZr+y6GIjUGa3dI=
X-Gm-Message-State: AOJu0Ywp1B7V9BUx1yFgppSXomztRHA2G4d08t7h5ZU0Y4af/fD+n4md
	bvdaTTRKscbkDHQ4ZZy+UOeZgfuq1nRIHCI0gmo4s4ZetWCKRcMJ8ZMFAiI6O/mLeNP9qpTFf7W
	e
X-Google-Smtp-Source: AGHT+IFvZldNhSxzrdf2RQwJQa0TZBuItKWFMIhreW4M/KLv1wZjBxMoQDKWYNl1lU0a79AgB9qAPg==
X-Received: by 2002:a05:600c:1d26:b0:411:da90:89c0 with SMTP id l38-20020a05600c1d2600b00411da9089c0mr1565047wms.10.1708006140040;
        Thu, 15 Feb 2024 06:09:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:58 -0800 (PST)
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
Subject: [PATCH v7 4/9] watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
Date: Thu, 15 Feb 2024 16:08:36 +0200
Message-Id: <20240215140841.2278657-5-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_put() may return an error code. Check its return status.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_stop() to its caller.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
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


