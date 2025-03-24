Return-Path: <linux-renesas-soc+bounces-14755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BEBA6DA16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964FE16E802
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 12:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50CA25EF9A;
	Mon, 24 Mar 2025 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OTVh+lHc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105F25E830
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742819205; cv=none; b=UxlRJQxyZHT3+iq4navvyb44DiEzftemq+8enPtUtSRCHgW4a7JMWRsw4o/s8d84AkpgWupIDyMa/UUNAChDjx06WSyBwvcG5zjqoyNYtb8C0dJvX7dky39jzNlm9J3ZaK10NdUtXhBX7B0oOD3u0jZORjBIA8pq9SBhjPGLM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742819205; c=relaxed/simple;
	bh=7H04Zj9dfcpDfaqboI+ReMx9thHZjBGdzhXtznFfaIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4EhQUDNXu6QXT/6UopLBiMHxlUAgQsJaKVz0E+saSGiR2Tj5yFMA/DexSjTY7pzDc6iIHBfpJ8wl8prppbXZ56ACvA7TUKT/At8vpN7qBwucUwMmlJPQR69L+w3VLDdfgYqBBqzqqf0L45qq5UhK3Ms7KXGKP8sQX8XLCvJp/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OTVh+lHc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso31634725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742819202; x=1743424002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tinDb82Hg/cL/rLLrkoOUK4oALU+HSZjNBXFVyGDLBE=;
        b=OTVh+lHcQATxUxUI5ISBqTaZPqB7EgrG82ShJMyClLMjRCBbrxxIyNZiN0YeD1cpoo
         QgpwtvtSTO/HYDzle12auuRsE67tBHXYegO2m955cYsKc3RR12IdkShy4RlkIZsLe9Vh
         r/7MsrCioOYWFaeHbPAqMLUDnZb/DRPTmxcX1UoRWuM7O+Qd2+cfETTEe2fAcX/4l24t
         ydiEotGd1TnciKnOe/++cW2oTp14kMpe2/121g39x5DVfIxiRK3mFT+ZC1/00UR7j9PO
         8Flzx/8gxTjY9zBIv72v6vcxai+McvdW0rENc5/DUtXM+3xELQSal8OlUZdyCIizoO66
         e9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742819202; x=1743424002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tinDb82Hg/cL/rLLrkoOUK4oALU+HSZjNBXFVyGDLBE=;
        b=g9ovCLnGvCbpppziGwsX+40YczAvjVynVumHz6vEdRsxCBa8wf8J4rrkvQU6vqqCmD
         abVUs2jhTX9n/Wc0ZHBQEA3XY1ky3wtNCsZ1Mz5SXv184NOtP8XQpcBZdg9HDeP1/ahA
         f8QG7Sh0Q/pqVRxN3+psPlbrAqoRzAlrDbykYCYI9vIXjA6o0MsFHgtWSGboA0N1sip4
         KqccWXxAarnwMzh8EvqbTg0kL1uvwwjMuMqUN75fVbhQy7GsuPDtIIBNg7jMCF7xaw8F
         /vuYXKpWlTyuxOTOvM+/KrDHWI4DpHZPMqiZdzRc9JU6r7Hh/sU6xL98FTzjaMekOX7Z
         oOXw==
X-Forwarded-Encrypted: i=1; AJvYcCV0fsRmRE9e12aFp1IxBeR2LMFssPNqgzS0YV741hUt3619twflLdP5yRPk5uLJ0cqUlvBDin6t/YpeYLuEV5DK8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx93ZAsx74nQpLjLcpnFuVKj5NNsdHKSE9rLtaj3u6zsR/ewALF
	D58a651Pb9sKSVeLsOzShhZPvQK2rYiY3bBgGA9Jp9wc2dWHV+SnwFb77EUZO/4=
X-Gm-Gg: ASbGnctQGyR4MPR7ODWfaMN5whGU37ThySAHJVCm5JRFl0swHBUSY0u0BoIlN9zOZBz
	N/uqpvlZq7j0CnrATKh8m5W+qeVVUKhq+nJDbV597J3149iJ7kolpIubgWp7Sjxq3Iz3l8tWJ9l
	ygPp2zBDN3SMYgNkL053jPl3ULRo5sYd2FmEGITrxEYf+sAQKgn7SjODLp/YYEh+cH9Rujstxuw
	D1rseDhx5lLomGRcfSyXIhG0awsuDQHgm6WzaqUNua4iVbb+e2coOOdN5+sW4Oj5WW+PcfY1gi5
	udBLeJLoU5Mo+wr2KTfBR+xktCvpE7kk/JHAJBmA2rW7xwx8l0Ofn2VseQW6M9VqaU9UlCUWRug
	AaNCk2uOZ
X-Google-Smtp-Source: AGHT+IHcSv65sB0v7RWUQm1j0qlh5lCjs9w6YcBrjLtA5IMtXqerZCXxE7wpguWt/oUrGng/6ctEjA==
X-Received: by 2002:a05:600c:8719:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-43d50a4ae7dmr91654135e9.26.1742819202163;
        Mon, 24 Mar 2025 05:26:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef16csm10729080f8f.86.2025.03.24.05.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:26:41 -0700 (PDT)
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
Subject: [PATCH v4 2/2] iio: adc: rzg2l: Cleanup suspend/resume path
Date: Mon, 24 Mar 2025 14:26:27 +0200
Message-ID: <20250324122627.32336-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324122627.32336-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324122627.32336-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 761ba19b83a7..3c96684fff68 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -89,7 +89,6 @@ struct rzg2l_adc {
 	struct completion completion;
 	struct mutex lock;
 	u16 last_val[RZG2L_ADC_MAX_CHANNELS];
-	bool was_rpm_active;
 };
 
 /**
@@ -584,14 +583,9 @@ static int rzg2l_adc_suspend(struct device *dev)
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
@@ -600,9 +594,7 @@ static int rzg2l_adc_suspend(struct device *dev)
 	return 0;
 
 rpm_restore:
-	if (adc->was_rpm_active)
-		pm_runtime_force_resume(dev);
-
+	pm_runtime_force_resume(dev);
 	return ret;
 }
 
@@ -620,11 +612,9 @@ static int rzg2l_adc_resume(struct device *dev)
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
@@ -633,10 +623,7 @@ static int rzg2l_adc_resume(struct device *dev)
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


