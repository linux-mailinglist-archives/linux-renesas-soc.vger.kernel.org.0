Return-Path: <linux-renesas-soc+bounces-2367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A684AF58
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FA9B1F24FA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 07:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C501A12CD94;
	Tue,  6 Feb 2024 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FeEKYPsG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDD12C55C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205942; cv=none; b=ZufAaZ9frIW7C6co5sdLpKuPOvDy2eVn9y+baP791iY+IK4v1S5vucVTTGB7rw2xOIjHnbAy5dp8/OC7EcLA2QDOL+vEIIq0FpH7chPqKhWAuYHBd+K7qg5UN6wf8tDra8QYRjPbvo5zhRBGURAoDU02LQAq2ZMYPx4FXeEktXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205942; c=relaxed/simple;
	bh=jKTSHJTtTI4N0iJp7IFQIhA+NWord9Ob1XRiUrlNEHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rewk6rH1Qe6ZBbENyNFy2JKSVYB6asZhrGM5+iKRrHxJNX6GZ2SsNwdeN+2ZTTdqmuB1N3ekyY77OxpSOMEsNy974ZaXLS8KeJrEIX+t4Bbc9vApq2i2Vv1flPyg/jVHrcxm5q3VnUDOQh2jx2hT3SQtXpSGMx7Ea5HB2d75jsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FeEKYPsG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fc6578423so34778525e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205939; x=1707810739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWojBmpvYKWohEDFYHq6fZ2AU0LO/ivcX8nI4tPnMdo=;
        b=FeEKYPsGc3D+mxJwJXSTnWM2M/ge7sJu1B5sNA7G8aT/cEFJ9nb62CR2ykebQ1xwUB
         9ev4eoNuCK6oc+HC0wSppRcKucALcha2CHcmMJcQJcwDOMm4HEhWqEj4/awsiE8xFuGM
         Iv3l5p/QyQv+lt5KvaWgSs3tyFFqhy0IkPTcWUpXsHe471CuEwUzVM4FfFFiQ+H7uLz2
         P+pMyDnGXSEdj/6mMtL4agjiu4LPBRhxgVFgmGWHbc1EDxKPemI8AYpwnr7ryYZMhc7R
         NsqnZckCcquhHAijzwvRj+U9hHpBCwbMEKc1ib8DlW4hFC0y4ixsa3oSRDG9gjZQhNlh
         HTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205939; x=1707810739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWojBmpvYKWohEDFYHq6fZ2AU0LO/ivcX8nI4tPnMdo=;
        b=Fufxl1F60/yQh6GeGfp9OFQqUdrTqV3ULXgN9i/p6SJWO4IefgCDA1Rv7GkY9oriE/
         F1oQ3QImvH0y3Dzx0pof2g6IgHS3WPA5mI0KjWOOnJ/msFAbFp/e1y2kgOXAF65oQZq+
         s+dwWyEb1Nvr1m+n3iXOMIwf1YVOA4li87MmSIWQhub6hrHrqTVqWks8tXun4JuiCs99
         AIeaXcJ3zTDJCtSi6QkzNQ0WahZVst3M37KFa8GEvCX2khzkzBSLjl5sYTn2+ljOoFun
         hj8JUHgvmR5y+5cUlZE3mNJfP/q8OMXj7KMykTLU0sXda/OQLCzB+aFHhiEl/FoImf6u
         /GbQ==
X-Gm-Message-State: AOJu0YxCYBPZcm/ZFaeUAUS6mHs5pMfr0HKiiJ8f6ClB7mP8pWnxlpYj
	H8qLLTXnDFBzgntPROh7XqelNdSvieJ73ooIw62NTqeJakOEibAfEajLBSPWmTI=
X-Google-Smtp-Source: AGHT+IE1KCHfFqNJTUF491wTOEguszTxGu9U5rKdSCHIS/yH+UvTbSjcd2dnsTM2BBhAFR992ZN9cg==
X-Received: by 2002:a05:600c:354b:b0:40e:befe:37f3 with SMTP id i11-20020a05600c354b00b0040ebefe37f3mr1095012wmq.4.1707205939244;
        Mon, 05 Feb 2024 23:52:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpdu9BHv49FzPBvhIJZTLAiH3Ss/cgRJv38/YYSE2DTTeaWqCYw69xKLmLl6adUawypx3Wyuo0EP8bbeRHtMAAC2J8fIJ1oYMGG95oPPIQanvjsaMvpKuvD0n1jVEK8f1SMM5L0FLvFNMkZOrdmAf2MU7ByfqLFN5ze/4z5yeRy7cuwvANvJ0cu52opkeUB+1pLAIC9hU/ra2JA6g4VQVU1iyHo38yAoUMvmxUZAJgxLF0HPj0H7JTt6BDKJJcQiZ3ZVjxsTTd9ieM9ewvKCbC2a3n3F4C709dFeRYAcmYTNIC8zXaQt3cTlL/YGmF6cmU68lJmfijGADNjk80xDjn9bzNqFCvVBrRDUz0A9HiJt3Gb9wBEUQ+5XQ8R9yGjtkXuhElViwPqWwLbRIdgW5G4F9ozhH8THcWzUHUNT23VbZxkS9vww2Zaa16zeSAm299ZgJoj3JOy3pjYC0OtLa4Ajikp5xzsixrI0+Ynd7vUaR2DBn+8fV9utF+4GZ8BJsdJvGDly5/5A==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:18 -0800 (PST)
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
Subject: [PATCH v4 7/9] watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
Date: Tue,  6 Feb 2024 09:51:47 +0200
Message-Id: <20240206075149.864996-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The reset driver has been adapted in commit da235d2fac21
("clk: renesas: rzg2l: Check reset monitor registers") to check the reset
monitor bits before declaring reset asserts/de-asserts as
successful/failure operations. With that, there is no need to keep the
reset workaround for RZ/V2M in place in the watchdog driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---

Changes in v4:
- collected tag

Changes in v3:
- none

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 39 ++++--------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 29eb47bcf984..42f1d5d6f07e 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -8,7 +8,6 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -54,35 +53,11 @@ struct rzg2l_wdt_priv {
 	struct reset_control *rstc;
 	unsigned long osc_clk_rate;
 	unsigned long delay;
-	unsigned long minimum_assertion_period;
 	struct clk *pclk;
 	struct clk *osc_clk;
 	enum rz_wdt_type devtype;
 };
 
-static int rzg2l_wdt_reset(struct rzg2l_wdt_priv *priv)
-{
-	int err, status;
-
-	if (priv->devtype == WDT_RZV2M) {
-		/* WDT needs TYPE-B reset control */
-		err = reset_control_assert(priv->rstc);
-		if (err)
-			return err;
-		ndelay(priv->minimum_assertion_period);
-		err = reset_control_deassert(priv->rstc);
-		if (err)
-			return err;
-		err = read_poll_timeout(reset_control_status, status,
-					status != 1, 0, 1000, false,
-					priv->rstc);
-	} else {
-		err = reset_control_reset(priv->rstc);
-	}
-
-	return err;
-}
-
 static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
 {
 	/* delay timer when change the setting register */
@@ -187,13 +162,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
 	clk_prepare_enable(priv->pclk);
 	clk_prepare_enable(priv->osc_clk);
 
 	if (priv->devtype == WDT_RZG2L) {
-		int ret;
-
 		ret = reset_control_deassert(priv->rstc);
 		if (ret)
 			return ret;
@@ -205,7 +179,9 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
 	} else {
 		/* RZ/V2M doesn't have parity error registers */
-		rzg2l_wdt_reset(priv);
+		ret = reset_control_reset(priv->rstc);
+		if (ret)
+			return ret;
 
 		wdev->timeout = 0;
 
@@ -297,13 +273,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
-	if (priv->devtype == WDT_RZV2M) {
-		priv->minimum_assertion_period = RZV2M_A_NSEC +
-			3 * F2CYCLE_NSEC(pclk_rate) + 5 *
-			max(F2CYCLE_NSEC(priv->osc_clk_rate),
-			    F2CYCLE_NSEC(pclk_rate));
-	}
-
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2


