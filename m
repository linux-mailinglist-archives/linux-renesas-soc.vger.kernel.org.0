Return-Path: <linux-renesas-soc+bounces-4450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B489F8B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90A6B1C25D98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB48416F0FC;
	Wed, 10 Apr 2024 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M8nfES8C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0016F0CE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756474; cv=none; b=pnK0m8auS2Ym4+bVpY2uf7HIBoMJyiHA+l2tykBk+QheESFu5I5GN+0zP+lfebeQ8Lv7ihQcmgEdLKi5cXjhGpOiqB/JkMXn0nBgUgRzdlwqQpVmAuvZ4DLEBnoG3NtQmVsYSVAp3CmNKsZFGweWALhEPFRN5SnptWOseYr1m3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756474; c=relaxed/simple;
	bh=Wr6oHFeer/nBk2CrajAUv1ACQwpXo37jKZZaaBfm3BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oj57pRPMY2uK2jm71kF7bCrctlBU7R9sYxdK3H2lgujlbGczAABURuxWmtlu9hRjVwjandDSL3Rr0KfSi2+ZRIJl2QkXOcq6PJMsWw+aD087Dol9+XnDKpAHk10FmQE/Yrjv+KAVTb/neM3fccoh8/B9ydpQBrs5Tkx5c+X9GOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M8nfES8C; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-416a0878ad9so13189505e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756471; x=1713361271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqHO2GEYl7GxbzESdMYs5ztGHyZiF6bQIqtKeXOQESU=;
        b=M8nfES8CkQjGfUIHJYJgF5eoVClMfgKbJ5jjsZvxI1SP+PjTSap4ZFRVjysJncgPdy
         tOge4ap9Sl+rcgI5NMinkrbHJtK5uqpvIp+7JtfDAE/fnjws3QMQcD9teslF8U2Cte1m
         uljjZn7gYMP6VA/JOSwRTEwH55QOdJx099bQYclMYCg9mJNZkh+kc1YwRI0z80Pkfdng
         MZUqEQz+RQCv5xzDTvdJYhxYD7Nbs6Lr++FOWZQJ5OyAv8GHslSHNXbOzKhM7ceytt8q
         9ii4J3cyQHK56gIOIUMLoIPthFWWs4FYlXpgldsULdQsFsfqIZ/l7fDqIbCGwSG0PA5O
         LL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756471; x=1713361271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqHO2GEYl7GxbzESdMYs5ztGHyZiF6bQIqtKeXOQESU=;
        b=AHhEXd9MX26CU8qXl+RvElL3KEcHavfwrHV7x9fl89fjSiTjA1mM+HGSjfr4gTAtfK
         q3DwtC1BPtUhK4sF8+lxsFh55FuSZ/U0dAgq76di/fDtmD5yPX0PWq5CmHtY/4ejvyky
         IQDl1t6Fw8qqOCH7wbst/yvhUeKWpXDXlL8NVMdh2ggVEiY1E7MedyA2fOEWJuUKmIv5
         j51M4wsRprfx5wYlj7B1eQwVVjFqZiwzKhRcA29wQuf248QeVtZmPGLdwcF0pwLhUjGU
         /6McltI4RPrbN6kcr00oz9zQivcLDuWbIepY+qkqyNMBRRflMZ2p6ZD6aCnxd1MRqP3b
         RK4w==
X-Forwarded-Encrypted: i=1; AJvYcCXsZdkh+8+qfV3bNwmqqnMiaKanDk3EDR4D4vHVidByQ84mhQ98kyzx9bntyGjSfs2CJHzsvcuLYRxWczQSXLIYETXvh9j/gnMy7CUJl3r9gl0=
X-Gm-Message-State: AOJu0YzykKkcbHGCQFoK2CDoRl/UabOOqxQ1KgDj0NuIzdOr/c5OClPy
	47J0kK1twVfnGan6pDl/GDIYnI+XWPF3GD4xB0gv5TJNrMCBflSWAWGh9HxE/hI=
X-Google-Smtp-Source: AGHT+IHlHkLJQocIgFdLWEZ+jc54M5NfdTfRLOOWAqu20ekgP4Q3FqD6sJ5hx9covF42haCEFR+msA==
X-Received: by 2002:a05:600c:3c9d:b0:414:90c3:f5be with SMTP id bg29-20020a05600c3c9d00b0041490c3f5bemr1940073wmb.36.1712756471429;
        Wed, 10 Apr 2024 06:41:11 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:11 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH RESEND v8 04/10] watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
Date: Wed, 10 Apr 2024 16:40:38 +0300
Message-Id: <20240410134044.2138310-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
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


