Return-Path: <linux-renesas-soc+bounces-24257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AACC3BCCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75CEC1B231CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEDA345CC6;
	Thu,  6 Nov 2025 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OwSx66OX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A30345743
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439626; cv=none; b=HVClKJ/QsmIczfuo61X+9niQuY1X/onFZ2VmYF9BBCjI8sQDi+/5+LUY70a7H8eBkTtvHhmdTgIS2aH6B4nSp5Jjp2+enzxH2rpWk3Uh3+L5KT/S6tcjLKOUqLJddlFsfH5iNQKo6iFuNr2obxoovXQBbPIcFfmcW7sJTwcyyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439626; c=relaxed/simple;
	bh=hEEq3L/ae0gzj3WOpTnXOnr4UtTzIJ6EJy/sUAFo6Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=La+G8mSyADddhKg7RjIDDLrvjTINjcNOLAvD6BAvDpP/80JediTR/4lHMyOOtAo7FtbEhpxyHduJtK1kil4Xbx0APRuDBRnrsO4rftp6qyXgcSTj+sTX9JGPZgt6ijuVTfctpXzuIgvsqjFngWrQnv0VVd7x8k2+chcAhlaMyW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OwSx66OX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4711b95226dso12303885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439623; x=1763044423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRcWCjtMlDilsyvDCHSRbviA39Wwxv3mD4ityVRjVRs=;
        b=OwSx66OXXlLrGcWhuoOoB2voImus+qS3NzEXEyxNNZ/EJgnxpEX/lft7HS7LjNn6vt
         b2ZEd6emmxeyUzzpAMz6Z5h3ESPvict9FNkHyiQFljCeyZ7PbZZBFoFQAOnPYvHi0zVf
         l5jMnXb4EzpFMiQ0zf9MpK0Op3MtQ4Vbr/txKpdBg9BEEHeWhddht+KRG8ALwLifSsQk
         MMUs3uHx1XtL0S0Z9Ks28MQX1uSM4UrYpsuPFLm/WFh7y14QAEoJxYCIe/Ue/uKxszWl
         usbiGv+DZ/mHHeLAyKIj+RpiQ1vMZuFrv6p1im4wPYfWdAASPRfgcSRjd8Zke03XlkYo
         I+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439623; x=1763044423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRcWCjtMlDilsyvDCHSRbviA39Wwxv3mD4ityVRjVRs=;
        b=rmJjDE2st03/gmGe0DkaEUpnIUYmTRV+CsQ+EUd6ntHL/W3+D78i6/mqhmVb1Blir1
         Ten1wurVudutQn4yMxVIOt7nSivs9SkIRSbMt7uiYpKmqT9t1o5urxCGyAXjPegPF0Mi
         ZNmMlkQZFIcT8jp+qzuGTTqflEGFxgDJY0/oBCGDsSDTu4FybVgAiQhewcRmR69oAsSI
         cqzT2hRYFiAihnZN+zMPGtj3pOcyed1bi31QrOiEKgVzF2/C4qaRYIv70i7FFAOhlqXx
         2/9zLEMIXVGrUSqRRZSEqGQ4Okvmkbla1exAbJRf2e4ZEIKLbFw1+aeL1HT+fNZ2NPZo
         Klcw==
X-Forwarded-Encrypted: i=1; AJvYcCXRr4Jfifj4COTsOxKLQPcgtAkMlyP6RKAE5+SD8v++N/rW5C1JiKK0gPpJNMF3DpqRyRG2KPC4GAtKkJudLl+a0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSt4GPDUh1TtvXTj1hoCUVQ8i1jcE5nf1dGniRzQxYLMqmgUWA
	KN//2WXB5xGFjurl1mBSa9v3oPvbA4cGtgYmRWbqoyGMqwIR07ygJ9Xm0CP2cqfESq8=
X-Gm-Gg: ASbGncsBtInZVuvyOCbvIHc4cDi9AAzRibdFCTSa4vEJHT4CEUaWyXsgy+7fdJfqDep
	JUHB1IEwB7g5RzLwBd3AjY0ZQV00Ipvvir3SxZsO6yqPp7hEaKgAvxmjF2emIK06uZyfWJIYKQk
	y5SGV29UJjMYmr+/n/aHoce/09o3Iq4wYwmA9JLG9lnEfz4dCPS+uI2TYVaaHoJhc8UybD2peCa
	OckRa4ybjgmvA6vXJ+pxkHMhhMOiBvoq7nDJTMjN7OxeNNTo91r+7tDCr+QfcDm0nsfaKitmiqL
	qcBTXcYZbBoQvoqQNQ9wskuRc0VQiubCE0a4VUPBknOXGJaWBoDe3/+LCQMWdbXaxkKPpc729UX
	t9PWNweILuz3WEzO+0jtfg7UA8OG7Q9HSxffKSrmMnyZpJbXylF+yKWtyBIiAPUJ6h4MD1gd4TH
	f8IQQl4ppRn5acbx5IHE4syDgH7KR9Cw==
X-Google-Smtp-Source: AGHT+IFjOZpe3RBTW3YYsSQc4NlYdBXBAEieg3vjxoeBZFVhu0BwVjWkzVC4rsJ6iid+BIBeXNryvA==
X-Received: by 2002:a05:600c:828a:b0:477:e66:4077 with SMTP id 5b1f17b1804b1-4775ce2bceamr65761525e9.29.1762439620830;
        Thu, 06 Nov 2025 06:33:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477622661c4sm50001595e9.0.2025.11.06.06.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:33:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/2] reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_field_update_bits()
Date: Thu,  6 Nov 2025 16:33:26 +0200
Message-ID: <20251106143327.3049052-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106143327.3049052-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251106143327.3049052-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Propagate the return value of regmap_field_update_bits() to avoid losing
any possible error. With this, the return type of
rzg2l_usbphy_ctrl_set_pwrrdy() was updated accordingly.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 4ecb9acb2641..9ce0c1f5d465 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -117,13 +117,13 @@ static const struct regmap_config rzg2l_usb_regconf = {
 	.max_register = 1,
 };
 
-static void rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
-					 bool power_on)
+static int rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
+					bool power_on)
 {
 	u32 val = power_on ? 0 : 1;
 
 	/* The initialization path guarantees that the mask is 1 bit long. */
-	regmap_field_update_bits(pwrrdy, 1, val);
+	return regmap_field_update_bits(pwrrdy, 1, val);
 }
 
 static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
@@ -138,6 +138,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	struct regmap *regmap;
 	const int *data;
 	u32 args[2];
+	int ret;
 
 	data = device_get_match_data(dev);
 	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
@@ -161,7 +162,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	if (IS_ERR(pwrrdy))
 		return PTR_ERR(pwrrdy);
 
-	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
+	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+	if (ret)
+		return ret;
 
 	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
 }
-- 
2.43.0


