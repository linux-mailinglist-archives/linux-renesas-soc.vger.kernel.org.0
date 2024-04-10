Return-Path: <linux-renesas-soc+bounces-4449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00A89F8B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D82D28B61C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEAC15F412;
	Wed, 10 Apr 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="caoRt37Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4103316EC09
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756473; cv=none; b=fJqvz3s/0YxbHxZ83PbZ78UgHx5gyOPT/zVvnfCPVXDVdtrIaH8Sf68Bi41lGpvxjXc4eZZNHGwQMidCyQzygQLG/vvXTZ5pIoP07A2yvudWBJXESEVNNcRK9GM2ChtGLUwHQmFEXgGRG6Ezz1SlT3Al+PcNSN2CUwD0KmxhgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756473; c=relaxed/simple;
	bh=2iaYjthGV+4YN90lhEWZi3Roao8D27ZIeW/fg1E7/vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9RMP2p+pIiz7dxIzWakvnQUeBsCq23g4xz3xPua66QHVqyeK45VRsytuk3uCBbaoz2QeK2LskNag2YGBap8JzM8JckonfUOXpl2cUt8p6tf8BusNJXXmcbsLiyn3dKuuTZc9k1XSuXOe6QPVuJPOS/T4gDo0PKrIS5+UtMEWX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=caoRt37Z; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516dc51bb72so5277922e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756469; x=1713361269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJkLrfz+B+TwXIL3E5Ouq4pIOb3ww8iGVXCK/i9BddI=;
        b=caoRt37Z0djF8KfUzlX902SDNH6iaLMT/OtD8W8Ux4RehUn1Rwuoc24qdWA02FCMQ9
         0M8sT+CVwuWpr2K/ka7GIY+pLaBdBo35zYFFNSlD0W38GUEtzkVrVB/SB8EyLVF4Gjsr
         YEw7b7SFlg8h1REdt0UGAPzDEABUMYW7qhv/riX+hotCwPYW3pNoNrfNuoOuNK/ZTirn
         2xnhB2F1zdoB6hPZ7PcMMF2Ql5ICtuJcHngmXBGw3ujhw2D02lVlCX1QsysnrYzRYv6H
         lbI70w4Soh9sOHBca8NCUICct5IwVC+MF09KZS2Y2IJzEEQ+L5D4/eIVBKaWALZEFcYP
         LBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756469; x=1713361269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJkLrfz+B+TwXIL3E5Ouq4pIOb3ww8iGVXCK/i9BddI=;
        b=M8mfLyxuA+w2GPY5E35UWLEq94rUWjQEm+huJei6JbaVuNx0qErc/U70wJvQ6x0Trx
         xMH2/6/A4IvD07h5W4/Lq7ZwiGHuM2YsFBudogwGVZZmoHK0pCBivhd3H4oToeSgS5Go
         V0J6qtutziuH+C2A6xzV8Gp1wCDBBIOeWmMpl+bhPbdZch3SRgyXh655wI1tV9zs+xBv
         xqtFfUyXvkWerRpreusR9aLaCjMmlCW1egHjpwMmke1KKPyaHcuZWC3+MSp+PwSSU/so
         iSlqL+rmNivaKFiAXMhvasgLosTdK/bdxbIntD1lKBA6xn0C3XkvsIfLOqzJ7odEF1Zq
         ieUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPTZGCl+cOT2ferXKb+h1YianrbhwbmMUZ/DLCEGz7Aqmkb+aZeyParbFG7Oqt4JrEEY/33dHKZGb2nbs827YkdMUmFVTePyKMcNCzJPuzrOE=
X-Gm-Message-State: AOJu0Ywfj4pvfC5+XAGPeETFiwZ25pUGlZxd2DFyRUxtiAy+t66ekNup
	KcYOV38tE/DrPPgEw8m7Zzs+fhMaRuOUL0oPWbNE/H7TLrjqpFFk9sCI0hj2iMk=
X-Google-Smtp-Source: AGHT+IFw3OPj12yQhGQYtGjHjUJu+zlht0FnITQUI9YuzbYxpNGRAMoUxZ9v7Lyr4jpHJCf2By7hqw==
X-Received: by 2002:a19:3847:0:b0:513:23be:e924 with SMTP id d7-20020a193847000000b0051323bee924mr1631343lfj.59.1712756469308;
        Wed, 10 Apr 2024 06:41:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:08 -0700 (PDT)
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
Subject: [PATCH RESEND v8 03/10] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Wed, 10 Apr 2024 16:40:37 +0300
Message-Id: <20240410134044.2138310-4-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_start() to its caller.

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


