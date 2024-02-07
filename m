Return-Path: <linux-renesas-soc+bounces-2434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D302584CB15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 14:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0459F1C253BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41F77C083;
	Wed,  7 Feb 2024 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pDLC+FLf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC976C7F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311293; cv=none; b=PVNqNwl7L2/alVq1+8lxtShW962PtSg24SkhN/7OPbm6DJI1eEjjjcZKsIMCadTWM3q8l5pQMqQ6GtC8LzTlsu4n9eym5vF6lPwUMZQk/DBZdfu5xVxG8TbAWQ5+oD8XJqsHuxZ2yOkNbp3s0v9LTOXs2d6HJvo0BHkcGp4DzCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311293; c=relaxed/simple;
	bh=0yYe2isV4O+U0xGShILWSjk2puDw/sFjq7PGbppMq9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eyyT7BN5VvTCRGuqcXX2iBYvearXTNzJiOLxEcW0qE/XtoHlz/89Zyf1mv1/9zu5IjPScNNZO3FmZJEPJRv0WdfldTdth1t8H+LMIEDH1USC9Kr8LT5h5aVbnBw4nZ2pcwYDQaTtV5XZv8o4A4EIoOSr/uB1shUt6N5oZ++gIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pDLC+FLf; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42c3a75c172so3794731cf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311291; x=1707916091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsvoQxJKgykHPmELvvoo0iWdxFiWSLC86SAFUlR5Bv0=;
        b=pDLC+FLfeJjrKP0bZJlF3ydUYL+1VI32q39fxVeqnHlVGTcbm/p0H6u4eteACwTVR4
         OyvQR4SA6TLKMcLEk8nX4rtxRri2TcJFlzs8ztSm4Gb0o+VQG5BhLazzhVqfmjtDBuZE
         evYrPgrQgLNJ+e6Jfx6U+9kGf2ErptMA5/9UARZ3msRblIxG1NswpOtJ2+4k+3iLjvSo
         bnbfTKIWZL3bFV1LU5M6KOSIchinwEdaVGwlqU24XLUC6s2jbzsGE+D1HMqA6viZfGMA
         gjc+puOmtamXE4aT/R6R+vYuZubUxbAtT85RhwWrhXBH9CFbJXf5D4UOwVhb4RHEuhSg
         K6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311291; x=1707916091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsvoQxJKgykHPmELvvoo0iWdxFiWSLC86SAFUlR5Bv0=;
        b=k2pzSfxf45X4H/XdFOItRo2tVxiVoKGJQnsS2UDQQdxqbpgt+YhoL22u8UW5QxJClS
         juczExXV4ldj3PjE4tIZES8dNydnUj7Z+al9dj+V/6yHg48vMPT2/1M2xBEFjwYno2qF
         VLZwm8CvXYBCNWypO3W/+qTMXTCrb87pF7KJXEG8pxS2VVhLZcu6PDwXm8Z8iGJ2dHwL
         I+aEXc2EpVun7sySn0eqLNhm6xdlwjiPPfPm2MPUmxMUxf0EA9U/7euckmOtaEQJ65i8
         XcFb8+GUXShm+X3Py4MNUzduO2EAA/BewcHk8WvvWFzjUoJK6N01q0KFi9fu+/9SY+U7
         OpFw==
X-Gm-Message-State: AOJu0Yz6tmwlMAxVoS+Qcyh9RNpSLV6bKmToKc09teyp+eeZF6FRFIcF
	/no9xErzy9pACWvW0faDMtJP1z4Ui5B5tr1pt4lfLiXhy4AJfAchboqOCTrm67Y=
X-Google-Smtp-Source: AGHT+IE+1BpA3a7UCsei6NH8TOTfZC9qzEwrFAKnlPA8aeHqcsri31Sbdl6+8CgI9cHbpcy4LG2yEA==
X-Received: by 2002:a05:6214:29c9:b0:68c:a6e3:4db9 with SMTP id gh9-20020a05621429c900b0068ca6e34db9mr7021485qvb.57.1707311290933;
        Wed, 07 Feb 2024 05:08:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhGi7Rh/av6SAxjEZKo61ucV9ac9cE013IgHnUT4qbvYPO/o69rvKfzj1nKmYnBh8eIVWtftlmXfIWJiCfr1aNYD9mdnotCXqzvfRj11Qu5GtbQGS2R3qjMHxcV05DnGUZr+IcIL7i4fSwT8tAHbGoMe8i250QKEoCLy2IZYe+8TYDFbGF7uT1XG5BypZ93el7z68uGlVO4iiJd+QfgviHPhu3lpmKcx2izAe8gpj6Mc75aPG5+90qFBd3fEY8tNQkz4Jo700Qfz8W5hXb/cEQuakWWHYHHJW18eqOczNyWF4+BQP+HTl0TmPUFbLop0AXSy/yEOQGjbtcg5ayW42KUBUiYHKFmiaSaMjNw0bxrfEHCWJvOSPax8s6oBiQB6YlNNfK1VGeKSenb0Qa3t7FZyL1HfxryV0kDXXAOMeyqbPh7KxtNTEuTfbmSGYqzr7bmyv14GlwHzVlE6OeX7XnRuqSDv+d1JMQdar43tFGSqgREyjVBV5Vq2Ji4B1rpdYH9E8TuxlGWA==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:08:10 -0800 (PST)
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
Subject: [PATCH v5 4/9] watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
Date: Wed,  7 Feb 2024 15:07:40 +0200
Message-Id: <20240207130745.1783198-5-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_put() may return an error code. Check its return status.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_stop() to its caller.

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


