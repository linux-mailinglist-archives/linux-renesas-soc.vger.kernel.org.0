Return-Path: <linux-renesas-soc+bounces-14692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA5A6A7D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3911485204
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B8922576E;
	Thu, 20 Mar 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiTQvwwU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA752253F8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479260; cv=none; b=NjtBJ2NnAohtBvR+HMhp3jEasVHT1NPsU8rLJhjUgGESV/MMNxwsYEAiK5N1wIbqMnOwht6MuoNqPL6mRYCWfUuu7Ojj0Mrl150WB1w4EQ5IFbM1HMdLuN6uxo2vFaMc6B7/oK6V6jcnXdq9PNsVUvWVNsbzRrCQSO7vVtYT8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479260; c=relaxed/simple;
	bh=5q7KCE9db7ERhm5lr7U4Yg37JmaxdnTD/f+2sXkyzxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZmVfsbfQ0ewgFwEiS2RLwZtcp2VyCnL/foSN81pr6qPqKOCT9zRzBmrwM4byV+wj2sn3YE/vm+2yeA1LIpuhnt4WZ1P5uRIb6m2VgJdDBscO1x0IA6NrVuMtmltWvhPBeWZo5NS9JSSZTXgk8hQB7F5aDzgJWXjaO2poyHGOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiTQvwwU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so976376e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742479256; x=1743084056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXE9dlseC0dhD7d4oX2r9ZUURR/ikgG5O0SCUhzKJLQ=;
        b=xiTQvwwUQMwy2rT+pjfqAWF6BwGiO35f3I4+17xJhhQRNv9pdDy/0/tTguJ2Cpd0c8
         CJ+SBoG56JHPylJmxEX6nXspuwd98YAs2wzXaGSVeuJQ5BVSrymVnYYvVJpbPe0D+IKf
         0lWWwnz0i8IlN5C9Z0umiA5mTxsmr8J0DBphm4fMb43o+DIxFlWp8gG5HbC2ulxzlUdq
         wmAjL5V2BWkJ66WfXdc4H2NSxvyVU+mZLYU68j8kREDg+uUKrGCizsy1JUupUnp+IyId
         qUh5OKBXbA/o0t8XoUKyggFwTtDi4sFzoTm7F+6NgQ+3TCy2Yv3gFT7x+X+djZ1JhIKH
         uA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479256; x=1743084056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXE9dlseC0dhD7d4oX2r9ZUURR/ikgG5O0SCUhzKJLQ=;
        b=G2FNGy3fhVrhTKQq7Mt2P+CenEiWJqbIUfgsPYlHnpLNMEdpu13onQgEDiWXgcG9Fo
         WBHTmEVz4WXpqh51cDibxSeoOADSTrzVLZ7oQLUqkt1QbHqEqL8cQpVmQE+u1lMqiZnJ
         FCuIMxJCZYAhbp4zr0iv+6gOMu0qE20HO7bk8qNyNwHH/zB/CQ6WIDglaihGDU8WeuNb
         tI0j7V7zmNfwrMJ3wVycyyEo6SA4f3TCmhQClpcoO96h2/p+RcRuUOqhlhQMMMe2KL8N
         dir+EJrTbic8+Lc5rBYzr5XubiAr6mzdQ+yj1b4hbGkrGwf+EycLbiZCxiAjNPcf2dt+
         1V+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKEQEEqjUo3FHbH9pD/V9J2VLcV0frM0Droe6mh3MdfhcT/bgX+/lNEKabQU/LO6hfzfNV0L8KgW+zpV7EDhaG2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8w6rqxDQh2KbAtl5up4mjG8+FoYbb/5ZVIPmmQ+K/kT2utgHi
	CJOtJC+zcij3DEXcHONW/KAr999Lbt6B6CiMsbuLd3KSeZx+HUA6bqfXi51WQ5k=
X-Gm-Gg: ASbGncv/+tgWfUcIqnYm2098Or3zlQwMdNUN7srsggMzTSAxQYPFG6zcppxw2vrDi2z
	ObrUxti+SKRnrpfvhKgZVnFBrftKPYAb35vHQ57J3tRYm+32gVLYeug/1oxm70t9/imlBbGwm0L
	V/JjoJ1Q1waPFmfmiVIO6ZJnt1jFG+lo/3EbmBTe7gitAXHsHg/NnZcTcV25vp/zr8SDl9SvXRm
	RwW8Vq9XjIDruSuUWlUYRuOqw/o9zJjqIWZmJnRa2UFSThG17fHFv9pDs2j1jn6w7wapPGFu8qp
	4UewGHjPyggBBwkLR7qSY4LfV0TipT75+IFXawj0QNg9LwEwbTNzyjlyzdGlLn/rM4GMOvPUDly
	A+CV8lXML9thlGSnJGUOVTOLpN1vLSw==
X-Google-Smtp-Source: AGHT+IHyRLgkNoCEkf9M1ICxzrsASm6on3//oo9APTxgLDD9aYJ0CrJh/ehpG879EGIFtCHQch+O4A==
X-Received: by 2002:a05:6512:b99:b0:54a:cc04:ea24 with SMTP id 2adb3069b0e04-54ad068688cmr1116238e87.46.1742479254697;
        Thu, 20 Mar 2025 07:00:54 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864dd9sm2295029e87.148.2025.03.20.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:00:54 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] mmc: core: Add support for graceful host removal for eMMC
Date: Thu, 20 Mar 2025 15:00:35 +0100
Message-ID: <20250320140040.162416-5-ulf.hansson@linaro.org>
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

An mmc host driver may allow to unbind from its corresponding host device.
If an eMMC card is attached to the host, the mmc core will just try to cut
the power for it, without obeying to the eMMC spec.

Potentially this may damage the card and it may also prevent us from
successfully doing a re-initialization of it, which would typically happen
if/when we try to re-bind the mmc host driver.

To fix these problems, let's implement a graceful power-down of the card at
host removal.

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/core/mmc.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 60af88ac0213..5a62a3d3df32 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -36,6 +36,7 @@
 enum mmc_poweroff_type {
 	MMC_POWEROFF_SUSPEND,
 	MMC_POWEROFF_SHUTDOWN,
+	MMC_POWEROFF_UNBIND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2054,15 +2055,6 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
 	return err;
 }
 
-/*
- * Host is being removed. Free up the current card.
- */
-static void mmc_remove(struct mmc_host *host)
-{
-	mmc_remove_card(host->card);
-	host->card = NULL;
-}
-
 /*
  * Card detection - card is alive.
  */
@@ -2088,7 +2080,8 @@ static void mmc_detect(struct mmc_host *host)
 	mmc_put_card(host->card, NULL);
 
 	if (err) {
-		mmc_remove(host);
+		mmc_remove_card(host->card);
+		host->card = NULL;
 
 		mmc_claim_host(host);
 		mmc_detach_bus(host);
@@ -2160,6 +2153,20 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 	return err;
 }
 
+/*
+ * Host is being removed. Free up the current card and do a graceful power-off.
+ */
+static void mmc_remove(struct mmc_host *host)
+{
+	get_device(&host->card->dev);
+	mmc_remove_card(host->card);
+
+	_mmc_suspend(host, MMC_POWEROFF_UNBIND);
+
+	put_device(&host->card->dev);
+	host->card = NULL;
+}
+
 /*
  * Suspend callback
  */
-- 
2.43.0


