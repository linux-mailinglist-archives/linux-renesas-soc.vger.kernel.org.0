Return-Path: <linux-renesas-soc+bounces-14691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E6A6A810
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CEAB1B60916
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 14:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2151421D3C7;
	Thu, 20 Mar 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HguNeC+5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C1224233
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479257; cv=none; b=GenZ3nlrKOaAUISa/naFMBi5nU4EX8mbJ3H9K5qU/P5zs3y6i6rChUPNSgf0PxxROMu0qXZ7CNXF9bNuDi2Q12mV564duGZaN9rWFlhlIUEx3AyRVROc5aJ4bNpnCOXR0qOqZDtVo47UnNWK/KDqWw+fwwz8KGPSyRYM40x4g2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479257; c=relaxed/simple;
	bh=FLnJitILWx+gEhi0WoDSNfEnTW8g3N+Au1bp1k7MfuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWlKnMn1Nj8I/PpbYd+wBKuK1Et/v00uSG6nPO5RQaetOtwz2w3qhNg9zuLhynTVYCJdU8mGV6FnhGOH+ioZsjBQ2KpT1OB0Bfr4LweDBqhdZPwFF4s3XSXIZWwc2hj2wGlxU/ReklSyBC8Gof50AStvOxNulNPIsUmzMk8o8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HguNeC+5; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b12ad16eso938307e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742479253; x=1743084053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRcl21cexCWaRdVFTtOPv6NXKn2Krk/8VDxch080WVM=;
        b=HguNeC+5Asj8t7W5EQxp1P0Mdk38xtl486pVZ9ifvZMHfudMi0mhDGqRB/t8NUmkAp
         sg5epSaSWeY5vAl8uahHBCtAQt61C6Xf702+FxlWQjT7jDlCGH+hZDj8RWtzKpG15nuT
         HNF/689VhAfbmErOb/5EwIYFs4u6mwisVo2kvbzgnISS/HbAwUa61jDfNOfq3attw0E+
         MHcP1KDV+QLVMdRisNRftG8skh+DEXHKShUZJ6T6B95Dhmuqb0/utVc5MRrlvNiR9Q1F
         sGqhRIeiauB6tFC+IzAOCWB5dZUCSuDcV8K3Dovtrc2ishCUHYTqVMlvfphFPcn4s5Gy
         O/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479253; x=1743084053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRcl21cexCWaRdVFTtOPv6NXKn2Krk/8VDxch080WVM=;
        b=bFZ9BZ53eG2RcQsrMOWCpsesFbmIeO2GDoBpeBSKOFDNiQFsGm6jfm0t/3wHra3wV/
         lZCAX+h3xFpuB5F9Ha5aTQVR2zmcU2tBJyZIeXPg2uEipBpsdZ5QclWnl2nP18X87Dst
         FvH9O0HdJRzPmTlNTUVNkSBufQDM9nT5tfB/L+hCtPqU4xRwDzy4I+HW5wDZDpXS/cR+
         Mxs0EHjUq9PLtW6EFsRqqy+0UyUphCN1TjIJHYWnlaO865YhWyxuH7Yh9p8s8S9L3l0A
         NwlHo1ZOrT4wQsBUp4CaruuBtoQlisWE8Ga9/wQ24K/cOR9Me1GGFXaOTfpu5WjdF/lV
         CzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUyPYDadiO8M43aTOftyRrfmPgA7fzJjstCYaVErX6FqYeIWXcPSiR8x1i4MZoMdJQe0sed8mzB5uFcp0rzh57GA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlp2YZrHzFNVe2N1433FddakO1iIEP9totTHYIhGa1VuNDr04Q
	ZoS6TX8XzVuCrRxKbHXw88MuMZ5UE3ii3zo382aBuvphiE6/j0XlrqXicVwOWkc=
X-Gm-Gg: ASbGncumz1J9qQtjz1DA5pnQ17xGYvBoG6zRvhnwV1/dTqmURlTRzR9RU4eUJjmskIx
	0ZbRn9nWre+WWKpD1hVADTWiYKFkeH/GFS8tHwHlI7bZJ0iXhVXyuMVytoju5MTrlP7aNhB8GWc
	MEJAnZDC/g5E0P6xLiRO7qzab5wrOOL7V5iyOpEsOglnl3QbN1ouy/5zW4VtUYq0a+3SN7OGWrL
	V41di+WQ4tiqXxrAQsybOqc2GsftwFIBr9N1NPmn31kIOapQGQgllIp9K/LJMAiFLs8KKqgRzYD
	69k6iexRSFg/nq3qi1LcYP4/PIk5mSSMk/y56uR6zKl5tL48I+sm8+Z8G7FlZiK0Y2s2oDxMIfY
	cSVh5TeKHanjmlogBygY=
X-Google-Smtp-Source: AGHT+IHc1LVnOgavvev5XnkpmYMq0e6WzcUCiI3zOA5mhol2kloudBiNfkN+fIfm+6kKRlyIRy6cnQ==
X-Received: by 2002:a05:6512:2255:b0:549:4416:df02 with SMTP id 2adb3069b0e04-54ad0678646mr1146949e87.41.1742479252674;
        Thu, 20 Mar 2025 07:00:52 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864dd9sm2295029e87.148.2025.03.20.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:00:51 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] mmc: core: Convert into an enum for the poweroff-type for eMMC
Date: Thu, 20 Mar 2025 15:00:34 +0100
Message-ID: <20250320140040.162416-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320140040.162416-1-ulf.hansson@linaro.org>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we are only distinguishing between the suspend and the shutdown
scenarios, which make a bool sufficient as in-parameter to the various PM
functions for eMMC. However, to prepare for adding support for another
scenario in a subsequent change, let's convert into using an enum.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/core/mmc.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 400dd0449fec..60af88ac0213 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -33,6 +33,11 @@
 #define MIN_CACHE_EN_TIMEOUT_MS 1600
 #define CACHE_FLUSH_TIMEOUT_MS 30000 /* 30s */
 
+enum mmc_poweroff_type {
+	MMC_POWEROFF_SUSPEND,
+	MMC_POWEROFF_SHUTDOWN,
+};
+
 static const unsigned int tran_exp[] = {
 	10000,		100000,		1000000,	10000000,
 	0,		0,		0,		0
@@ -2015,15 +2020,16 @@ static bool mmc_can_poweroff_notify(const struct mmc_card *card)
 }
 
 static bool mmc_may_poweroff_notify(const struct mmc_host *host,
-				    bool is_suspend)
+				    enum mmc_poweroff_type pm_type)
 {
 	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE)
 		return true;
 
-	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND && is_suspend)
+	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND &&
+	    pm_type == MMC_POWEROFF_SUSPEND)
 		return true;
 
-	return !is_suspend;
+	return pm_type == MMC_POWEROFF_SHUTDOWN;
 }
 
 static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
@@ -2120,11 +2126,13 @@ static int _mmc_flush_cache(struct mmc_host *host)
 	return err;
 }
 
-static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
+static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 {
+	unsigned int notify_type = EXT_CSD_POWER_OFF_SHORT;
 	int err = 0;
-	unsigned int notify_type = is_suspend ? EXT_CSD_POWER_OFF_SHORT :
-					EXT_CSD_POWER_OFF_LONG;
+
+	if (pm_type == MMC_POWEROFF_SHUTDOWN)
+		notify_type = EXT_CSD_POWER_OFF_LONG;
 
 	mmc_claim_host(host);
 
@@ -2136,7 +2144,7 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 		goto out;
 
 	if (mmc_can_poweroff_notify(host->card) &&
-	    mmc_may_poweroff_notify(host, is_suspend))
+	    mmc_may_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
@@ -2159,7 +2167,7 @@ static int mmc_suspend(struct mmc_host *host)
 {
 	int err;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2202,11 +2210,11 @@ static int mmc_shutdown(struct mmc_host *host)
 	 * before we can shutdown it properly.
 	 */
 	if (mmc_can_poweroff_notify(host->card) &&
-	    !mmc_may_poweroff_notify(host, true))
+	    !mmc_may_poweroff_notify(host, MMC_POWEROFF_SUSPEND))
 		err = _mmc_resume(host);
 
 	if (!err)
-		err = _mmc_suspend(host, false);
+		err = _mmc_suspend(host, MMC_POWEROFF_SHUTDOWN);
 
 	return err;
 }
@@ -2230,7 +2238,7 @@ static int mmc_runtime_suspend(struct mmc_host *host)
 	if (!(host->caps & MMC_CAP_AGGRESSIVE_PM))
 		return 0;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
 	if (err)
 		pr_err("%s: error %d doing aggressive suspend\n",
 			mmc_hostname(host), err);
-- 
2.43.0


