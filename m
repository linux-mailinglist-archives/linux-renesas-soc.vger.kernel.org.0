Return-Path: <linux-renesas-soc+bounces-11808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 973FDA00A30
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 15:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65B3A1640E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DCD1FAC3E;
	Fri,  3 Jan 2025 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="I+pq1zuu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81F81FAC40
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735912866; cv=none; b=NMzN1nBHkce9/19SrxzmcnC3Tduwwrbt/CKdJZUIZcqxiRdXQcPWT6yroM30K5OBmWedPKL+pCZSuYLF3RaoPKu+0kj0kj7BgOtLdwnC/vAgH/HyRQ77SwhuSnack9URSlMuAkcdMH1SFl0/8j/zXvqdUVd//c/qlBsBdNQwiU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735912866; c=relaxed/simple;
	bh=Fmy27Bnmn3Uj8FkD7cvCCt580n5f2IKg/FvXHV0a6+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oqz0bCVhi/GkLJg0w4yxG9DbB2FmIwxulbm4qYfc3ggHr173Kbc2fvI79fhDwMmQwMNgW9JxsCvAkvkAcAe96UQ5Ul9fyo8lQ+bby76mnKY1Qdz/BXyqtRxiqRqd5KTilWU/+DI121ciE1s9Ie5V/H8onYvP0f94OMZAT+rycBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=I+pq1zuu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso23602223a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735912859; x=1736517659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qluG0ViCE8ATiodOgOOl8Lv8eXopMgs1l45mWqKjsY=;
        b=I+pq1zuuau9nyQ6nQUz8NVH2lctcF/cobeGYcUVXMH5KZ2LPxvOj5WsZLbuX6dTkfr
         ErKG3RQ8whc/OuOusIJrRX3f6IzlBAo6zXAfGQK07foxC1G4VzeGunXjDEFNH1WtMAyu
         3LuhoEaOWbbkOLJVxHj27UBtFAqj7z0RsuH11S2UNqWiivYXkqUYdqrUFoBTQUKarSVR
         BB9pppsbgj8FGYQhpkjSSOtZyMRWwhxHA2bgVdv5IPCDFUqckN6jsNvvmU7PB8883krO
         fODycMsFCBwwzbyE4KmC9jk8cQaiJKWb4LhrMKzrF8OcipEULCjXF0JEsE0j3Uap88ee
         XQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735912859; x=1736517659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qluG0ViCE8ATiodOgOOl8Lv8eXopMgs1l45mWqKjsY=;
        b=o4OvYnEVUI4r0tQExI5yPhkOW8ztlrExmAViYbFZ6p5XZY9RNfQSdjYL2H26M/gOni
         3HHeDmbamguR1c2+EILCx/ywdsrStciC+9IxsFOJxLE5fouZF9ar6gJj5luQK0YN1a1B
         bTOZQTLIikDQum/21Jh1dtUX0Q1y1w6P0xXl6V+KA81fRde0baWfzg7spwEP7jzpE5Js
         H2DOIn3nIZt4hcss2h06rfe6Wso+ejB5iLsdd1f5Fd01XRmqWQw2/W+nj//sVTzWPNsp
         ju0zRotmTxFFuJgocs0zo/TdwdLjjAlTR1LIV5Zgq+vt4V5kD1zlxv9JLJOWnlD6tYtW
         eGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4MsUxP8/yFE0NAtde9qL+tnqosvSJtpt0mCt72CfU8Yup6sCXaqiNbjVnlCOoEcyqGhmhGhct1KbQ/xAdnQT1BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyya5wSYyTc92MkU+skhScPGjI2zxqhg+MqhRNYUwpWt3ap4IX
	LAH1b7AKKwtCbBDaR5HZHV6duAPD81yjCakkzh3AhrpC7dUVPTEVKqq9E1bL5a4=
X-Gm-Gg: ASbGncuRtS28P9g19Uw5iczpxHBdhAKWsx0h5GsgVXcE+n1/RxJn4Fn0urMRrN59Iuj
	kTfFNWKVz7I8yRW9Rbc2UJh0aMyALifCKQXb7UJw2ZNHs3wkTbTnBLESJ1cCN8Rn9/QWR6AMsMo
	lWUAsuEuH8PfyKxe6ILTJchbn4lIW41iThuLMaTJzg74gpq2FM2MkI/s84cegNN2r10Ku7lYVEz
	dSwQvN/rbCiBH/NO8CwkCp8spgH3xSGMGv7YeinbQRtGoBwUuJJALDh45sv8xn6aGJVMMnjhr3W
	ssjhrHZ5jNw=
X-Google-Smtp-Source: AGHT+IG1Xlx6lYKDq/Jh3aaztieX8SW5bSS3JbGGOUo0jKzSzCn1vGsHxn6qMMerERmHlKGSZGu+PA==
X-Received: by 2002:a05:6402:2346:b0:5d8:17da:dcf0 with SMTP id 4fb4d7f45d1cf-5d81e523027mr36220171a12.4.1735912859111;
        Fri, 03 Jan 2025 06:00:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19502384a12.42.2025.01.03.06.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:00:57 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	ulf.hansson@linaro.org
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] iio: adc: rzg2l: Cleanup suspend/resume path
Date: Fri,  3 Jan 2025 16:00:42 +0200
Message-ID: <20250103140042.1619703-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103140042.1619703-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103140042.1619703-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index f12f3daf08cc..8289b872b165 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -88,7 +88,6 @@ struct rzg2l_adc {
 	struct completion completion;
 	struct mutex lock;
 	u16 last_val[RZG2L_ADC_MAX_CHANNELS];
-	bool was_rpm_active;
 };
 
 /**
@@ -563,14 +562,9 @@ static int rzg2l_adc_suspend(struct device *dev)
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
@@ -579,9 +573,7 @@ static int rzg2l_adc_suspend(struct device *dev)
 	return 0;
 
 rpm_restore:
-	if (adc->was_rpm_active)
-		pm_runtime_force_resume(dev);
-
+	pm_runtime_force_resume(dev);
 	return ret;
 }
 
@@ -599,11 +591,9 @@ static int rzg2l_adc_resume(struct device *dev)
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
@@ -612,10 +602,7 @@ static int rzg2l_adc_resume(struct device *dev)
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


