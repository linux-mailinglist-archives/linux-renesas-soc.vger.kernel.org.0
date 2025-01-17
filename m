Return-Path: <linux-renesas-soc+bounces-12217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46226A14EAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 12:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8424B188ABE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 11:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DC01FECB6;
	Fri, 17 Jan 2025 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JaR/M2YS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208201FE455
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737114356; cv=none; b=aMeIPLElgx82X7Y3m6RBziSoX168waEL2Sdfqk+lVhOz2KWNaDmfQSCcF5kJanhJTqMcZ9DPKjD+CR3u8YLgpeqAs69uuGtc1eRqqjCyZiiADIfUZjb+JCxN45HHwhxLo2TribnobBaCs2ScSGeCAOCoM7QZr+fsIOQrZBgPYSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737114356; c=relaxed/simple;
	bh=Ic0dUSRBbSPcwd8A1dpe05r/cEGAMekPsiRX2TPIQhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y82DDFaGzEulUQlmej8LllBTFvDi6YIovfXcS98phNsjsxRkjtJmw+nZLaaQfePfSMmUvt01wT6wIKS09+kjSON5/yA51iKjqvNpmmTZ3IF5734pS4DnyahKJWLDqsTuChrpfye67w2V3mu0+RL5tRxaKlbPxZt1kRymSH1a8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JaR/M2YS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e3621518so904433f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737114353; x=1737719153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TZRktyyBG60hFO6UMKwaUx5vSkkWfjes2WCMQi2PJU=;
        b=JaR/M2YScD/mbjyMV/6qv+SVyyRek3pCsHiQ6Q/U1g6U62l5ykqkCYOubUyD7pDQDX
         iT/AwWjP9INYHi1zerf80LdCvNaZdZXgieYPxY8RFRJtJ1IJjW28N8iL9pEBNS1IBIx0
         scp38sPbaVaEUGnJoGqa8p4qwdm4VcagFjGQb+NLBNn9HlGKHfd4s4qVMt6D576LITGB
         eOZPypulGqBoZuXqQAptSW4ueOntDizr4FeuOhgW1UoAg7wQTd1fmsB2FGK2brEACrGf
         hRsHLtRGhLWP9o99egY+KzKlwIhyLz03tuTdcenyMycMEgt/TiIgeIBR+I5LZsXjwkDS
         o5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114353; x=1737719153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TZRktyyBG60hFO6UMKwaUx5vSkkWfjes2WCMQi2PJU=;
        b=F371HI6HGvGdfrrk4RjEO4+pNMDnHwhKFWG7kddOlrM+Q8rmFX9EzjIDttICFVGsru
         E8vDi/BFzXhCjLvPdSJ6mIfrOTY3d128GtoY/V5Aid+qJUDk9oYtPcsGFYkD3fY8BII5
         kd/KI9MYSgYwoMun0xpr6vZ7OEhCrCqtg5bqhHlDGcwLVWzCO4JqkQiHx1RFuUICid0b
         xkrQiBWx7DrLG63Bie/m5LnaeREZEo9ReePTumvnnt9GB5DbBdseh7pZcVjCKsM1zoeF
         fikB/SVukQuD6qmvedv7bOcloTK7epCKH68lW2WnjRfGRKWuTuR7QA3V4XrcYQGJSF6O
         etjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV48b5mE1LsWjLogUaceXMJCfhqygqPwIBKYdj4HODizgcXHluOZdci3Qv2s4LuZIOWccFD7k3McjuWwBm46946Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRU1vu5sMqBzFqBE2gVSvXmCSHPn8zGumV8xtXr6vonbXU917
	bjYpWK0d++8wTqueQBCPMAQ5/Fd9JjLJaN3O9ck00NDC9HVDcA9OnD9UIUKxFeg=
X-Gm-Gg: ASbGncvckNqGxsjShdZ/3i71DvCWfb1farGc2cx4VFdAqCmXg3kkz7H5Vul1EEp0Jpz
	Mt9o5VFecDmuor5aFsc2NHSboSdCLPRbIkA8t5kNCUtlpKzeTAVhG5D5dRkeswpTdSN0JYsfBG7
	MaI2xh64pesbGlcwd42vB11QNfY1dvINr3xGtvwFCb09AxUblNj3zFZIYsi5aLByGGysPfe4OAs
	Z8z4hOGpaKikhyp4ZYUAiE90B014oSKGrBea0+ckSTm1AtBE7BjVOo/0d6Xa+W9o5TNkFFQU+MS
	cI+2h1WvCLI=
X-Google-Smtp-Source: AGHT+IGVMbNBWKyEsgqUoHAN8pJLCCoglPmI1Y5TRMuv0rz7Lsw40J1JRHBIdaOY0OSqyYHQYiJtMw==
X-Received: by 2002:a05:6000:186f:b0:38a:8647:3dac with SMTP id ffacd0b85a97d-38bf57a68aemr2062457f8f.34.1737114353444;
        Fri, 17 Jan 2025 03:45:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aab8sm2348496f8f.57.2025.01.17.03.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 03:45:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/2] iio: adc: rzg2l: Cleanup suspend/resume path
Date: Fri, 17 Jan 2025 13:45:40 +0200
Message-ID: <20250117114540.289248-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250117114540.289248-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250117114540.289248-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to manually track the runtime PM status in the driver.
The pm_runtime_force_suspend() and pm_runtime_force_resume() functions
already call pm_runtime_status_suspended() to check the runtime PM state.

Additionally, avoid calling pm_runtime_put_autosuspend() during the
suspend/resume path, as this would decrease the usage counter of a
potential user that had the ADC open before the suspend/resume cycle.

Fixes: cb164d7c1526 ("iio: adc: rzg2l_adc: Add suspend/resume support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 4742a727a80c..99cb73347b18 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -89,7 +89,6 @@ struct rzg2l_adc {
 	struct mutex lock;
 	int irq;
 	u16 last_val[RZG2L_ADC_MAX_CHANNELS];
-	bool was_rpm_active;
 };
 
 /**
@@ -580,14 +579,9 @@ static int rzg2l_adc_suspend(struct device *dev)
 	};
 	int ret;
 
-	if (pm_runtime_suspended(dev)) {
-		adc->was_rpm_active = false;
-	} else {
-		ret = pm_runtime_force_suspend(dev);
-		if (ret)
-			return ret;
-		adc->was_rpm_active = true;
-	}
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
 
 	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
@@ -596,9 +590,7 @@ static int rzg2l_adc_suspend(struct device *dev)
 	return 0;
 
 rpm_restore:
-	if (adc->was_rpm_active)
-		pm_runtime_force_resume(dev);
-
+	pm_runtime_force_resume(dev);
 	return ret;
 }
 
@@ -616,11 +608,9 @@ static int rzg2l_adc_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (adc->was_rpm_active) {
-		ret = pm_runtime_force_resume(dev);
-		if (ret)
-			goto resets_restore;
-	}
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		goto resets_restore;
 
 	ret = rzg2l_adc_hw_init(dev, adc);
 	if (ret)
@@ -629,10 +619,7 @@ static int rzg2l_adc_resume(struct device *dev)
 	return 0;
 
 rpm_restore:
-	if (adc->was_rpm_active) {
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
-	}
+	pm_runtime_force_suspend(dev);
 resets_restore:
 	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
-- 
2.43.0


