Return-Path: <linux-renesas-soc+bounces-13568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B807AA41E8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CBE618888E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB8224BBFC;
	Mon, 24 Feb 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QI8gFbgB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352FE219315
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740398784; cv=none; b=deo2tBfm1VNxJ2ffFrEVRv58nHhslV/aPZPZ89v0CxN1iYZ+ptDzyHYIEkUP5bJFzvVdxurdWnlQQXp+Sde3RQwiJJeiL5ZxdI9gncQ4NKIYhqq615Fd1Krh7+DLEiCQ8C59SJebmPVMi/JsmjnP8cTmIlOocv1TG//1ijQzxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740398784; c=relaxed/simple;
	bh=/OXCCaiMIfBgjpPO5dyE52LobwDitgatoc1I5sb44Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRur+WtOUA1CEpObN/EKUYlYG4TqOQLXiR3aU65veqoQy/NVBnzXK8vISJtiFewoohCwSwIZRg3KLXOfGz9NrGN1OmKGb6EL5gnmN6J9Ai875Dlt+R3KS2yyBN2LI4N5sME9UQfNScoptzAT1FmZHafBeCH/uGNGiuM36xuD84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QI8gFbgB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so6205599a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 04:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740398780; x=1741003580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn8DuFDyF+SFBNU3jtJDhoU8b7Q3rosoyNz7MlbxIOg=;
        b=QI8gFbgBFtFuFspJ89KWBVsXxpeilFqMG83TBQWwKEeM6TXEP4kU7+/i9jSnRGVWZk
         I4fnKP1VaGfeTIUp4IzOx4iz6zKLH13XXr9rQosf3doqjKXbnF73Rn9BTtVEXKclV7/1
         BDGdRBLCKIRA56Owzz+CXJfDTlr0zYH/CmB3KLiXxECK6ahdFyIDx8Qik7nlWM7bR5PE
         ewU/F5FjfbnMAUht9tqSQ24nOGZ1XIv0yLTJW/qvDvSNabrpE++X9UrTbEqzD5O7wkjT
         Gse70GVBOhZpSEC9Ez9meMqn3tOclDbu6eaJqbG/gRhOZkKCXKWOVFPWYH7q8Kjik5O1
         b0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740398780; x=1741003580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn8DuFDyF+SFBNU3jtJDhoU8b7Q3rosoyNz7MlbxIOg=;
        b=UuIcDDtzErgFDE3UPrr4KJJ5crbrsMdgBl41lVUc0dNlFi2kAGcKC+RTODWikPZ635
         LvUAg4AbzH96bdksbQ6V7NqmQo5Vmmdby3wbmpDDPdA96WJdenBqR4HKFpNNBaJwpldj
         qghdp+fYXLwpGBrozH/CvDtiVF40q8fNMTduqZEOj6MIBR23eIDzR/uq7A/eCobdVps6
         zQEbCdy9wMygkBh7LhfrTKepPUUCpjSHbblGWQQP8pILr6CfN0ezByHznHwszMxqb2uj
         RqgY98KPg4OWXi4fhveIHo5mR4RxSV1qohz6IYiqvAvil4liSGjymWJm/H6mynIJfgci
         Ls6w==
X-Forwarded-Encrypted: i=1; AJvYcCUeQgIZARymFMnGJcq6ehqi9SUBJSZCn+ZfZHJEjZBh3UxtvchPnxUPlBaFNAeTABAWkaXCyW6lKbUiLjsuoeuJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI5xBbryf0veagfiD8c0AMcySTwwuZ/86JZtO3BQwKhiYCGxZx
	FkLfwiORmMQTKLyOyaOFq71tRkSc4dV8E27ChzPUFeea0FkyINYQmzSt2vc2b6gPmO/lOh3KC4j
	kR6Q=
X-Gm-Gg: ASbGncvCaPp83XT25haivdCMrVbFAw2TMDDW82ANqno8gKzJx0QGncxLAegzVGbsHyK
	cqKWK8Vu0FtW3r2d2D5SmRD8GJ8zB/O/T5t/t0dbT26rCPX8uQ1ssldGv9pzfqSb17EkiuGe9Mi
	ERGd6/uT8UScbQ/3sJH6S6EXQBO70+gVL1hsQ+qhOg0aDoIPmD6qqs33q8ugh22B/F0YSeNZnLp
	Um5SbkJjRf4v4riHI3oMTFc4iyV90xLIkWb/kX+t5GVbO9fWuzd2Hk4WCAyKEHqc8PqOWFZ05LQ
	GsBqwTFVeW71y1cqgVfP3h/iw6rLzwbX3kI0phZlSmOGR9zG8UOO5SY=
X-Google-Smtp-Source: AGHT+IF6ufEEXBnwaT978L4U9guhAhq/s+ersstnwG6QXXp3lNvszxpsm0hovWS4qA+ZCTAtcjWuLQ==
X-Received: by 2002:a05:6402:3585:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5e0b71124e6mr34011616a12.17.1740398780418;
        Mon, 24 Feb 2025 04:06:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb978e2c9dsm1598901966b.65.2025.02.24.04.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 04:06:19 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 2/2] iio: adc: rzg2l: Cleanup suspend/resume path
Date: Mon, 24 Feb 2025 14:06:07 +0200
Message-ID: <20250224120608.1769039-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224120608.1769039-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224120608.1769039-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 7db04416e1cf..5236ca0da167 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -89,7 +89,6 @@ struct rzg2l_adc {
 	struct completion completion;
 	struct mutex lock;
 	u16 last_val[RZG2L_ADC_MAX_CHANNELS];
-	bool was_rpm_active;
 };
 
 /**
@@ -594,14 +593,9 @@ static int rzg2l_adc_suspend(struct device *dev)
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
@@ -610,9 +604,7 @@ static int rzg2l_adc_suspend(struct device *dev)
 	return 0;
 
 rpm_restore:
-	if (adc->was_rpm_active)
-		pm_runtime_force_resume(dev);
-
+	pm_runtime_force_resume(dev);
 	return ret;
 }
 
@@ -630,11 +622,9 @@ static int rzg2l_adc_resume(struct device *dev)
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
@@ -643,10 +633,7 @@ static int rzg2l_adc_resume(struct device *dev)
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


