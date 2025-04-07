Return-Path: <linux-renesas-soc+bounces-15489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64BA7E4E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3DC425F58
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C527A204C0F;
	Mon,  7 Apr 2025 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/X6XMk/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B22040BF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039693; cv=none; b=RjFGhbfaYKTuWE6UPiU2UegW6SlqwlV6EnMnyYwJe8ctVO26VzhaOusu+KyMJ/BBOBk0VmPKuq49tmSCpvKP5Jqtw08TTjnxwtB6hrqVkvv6wV64OS80QUSSK0UqRqvk0VTbplVxkJuzogqMCjekUVN1m9qlJTDmTysr0S0or+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039693; c=relaxed/simple;
	bh=6z5WCu9BKEtjznjzzsmgKzbsHck7/xCTm4ZcI9BylgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgfWBe+pvQcERt2Zd/muKb+a71KSErrThIlapUJVZ+BeZYuZxj29jAuF0/EDf6jpMoDHuh6OqIvSlxQ26+AMgb8x7Azglx6Jo5t0U6TanUAN27zx/WggxKK1gvtSI4iy9GddcQll5d+C+YiDA7VFy/FGUKaJ5Ks56Nyzt6zWGVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/X6XMk/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ddad694c1so48118541fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039688; x=1744644488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFgvCtbiUg2Axc8JMkDx3HvUYjKIsrcxL/JNSE1oUNI=;
        b=s/X6XMk/75K9Gj3zRaB/0v0dyUzD88BJWMAWmkAwaPRsV+atJbPDRWp9NHg4tyvsjs
         lfeDwP3wQTd4fp+rr/0qhAIjqBNq9DR0VGUp2ng9HULTpHM6XaARToYW+EZx6qXVQ68t
         ytcRa+skw/uI1gABLngvZnKXVYRTrfwS2FWx8LqkJhhoOmcbpuWNWXT3v1KmkGXJZsWc
         g2IJoz/PZcaCGDXptQRrIxP6xwMIvmic5pitZ167NFi6LLDb+iIgpEjgJjpFVSPTDNXI
         2/e8Q1rXsfBNw2vmd5k7P6uRWF84wEZ5TJPMEt7M3UTXzyTSNGV+tC8QPxm7gqIr5qh4
         mJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039688; x=1744644488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFgvCtbiUg2Axc8JMkDx3HvUYjKIsrcxL/JNSE1oUNI=;
        b=uoRPAaQddxaO4p2wfc4YOK02xB0r0Wr/HfTikV9mbP6ndkOgq6lixBv3DH2UlXsgvx
         Aa91QJYrjjm67MuqCMTHgmILVhBKtUXzlY0fi/dmPUnldoEPtxjJ372qSA2uRrq5Kltj
         5nGEDhUlCqEEhb37PGJbHzdgwqalHxwBB+7VHPtzdzb4pWB7ijY41z4el2ga6dvs9feP
         ztE2qzEwkqx5cp0TKRY9HJ/Dy5nmUxhPaKMqIeWg1vRfWr5S/r934bRq7Tr2FVYLO3bv
         TOBUBIeRQmQoh0WkxhjB86SkyctB+a57PogkRDBfZtQ80s/fhhzff2Pc4sxmh+Ti7HE4
         IXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJZEwZJ5s8KvAfLXLLV80XWfvmNbAcrAmfihkB98voKbcV9Sa40NadINVY2Jg1rAHN/rUZl44m75PTO4Qx1DE/UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzrPMElJlNAMCUR9FWeYqWz1kQ1/6eBa4o/UQuN4Q4UW9EqPts
	ttofeG54patz/htSDU+homoFDoNdL/DVMF4agcgNcq37r0vcj+01Tafc/wLmBSU=
X-Gm-Gg: ASbGncuo++tGb+YF6EpnDrVIgH5wheOf1ddbizfBKvB20wka80oMq05roupZSYVADh6
	nke96oKfMgH6d/uPR3adzwoLSvGzdnJYJgphJteU96khHlYDd1xXggQvnj8dxB/0izyp8beA1Dd
	DKd3/9apqRqrdqSPSxiMlfePs+2PAdh5UqBhjkUZkZKRXlLlCa7oRowAG5zQ2C51ttiqiPv69Rg
	bvCgg+mFVQ5PMkk8iKYJ5d0LInhNjH+XQ4YvFebw/SuNDy7fztgVRUkXA6CcbDQM0m2FuplOuTB
	FucKgZ9EzKSlQ+ZZ7a+qSaHd4iNFdxRJ7/9Hi/MuIRfKLnBEN/w4HFXs9YEi8MSOne2lfxeaRlo
	EnsndbEQRVzc91YtdYN8=
X-Google-Smtp-Source: AGHT+IFdkzDl7qG+++GgExUEpecThyhFzUirOW/vapvpkFtPwvl1pIIZxAmc9QEAxBzudyVIXtO/Ig==
X-Received: by 2002:a05:651c:158c:b0:30c:2e22:c893 with SMTP id 38308e7fff4ca-30f0bf50edemr39634651fa.23.1744039688540;
        Mon, 07 Apr 2025 08:28:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:08 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] mmc: core: Convert into an enum for the poweroff-type for eMMC
Date: Mon,  7 Apr 2025 17:27:53 +0200
Message-ID: <20250407152759.25160-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407152759.25160-1-ulf.hansson@linaro.org>
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/mmc.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index ee65c5b85f95..c41cee7ef267 100644
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
 
 static bool mmc_host_can_poweroff_notify(const struct mmc_host *host,
-					 bool is_suspend)
+					 enum mmc_poweroff_type pm_type)
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
-	    mmc_host_can_poweroff_notify(host, is_suspend))
+	    mmc_host_can_poweroff_notify(host, pm_type))
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
@@ -2203,11 +2211,11 @@ static int mmc_shutdown(struct mmc_host *host)
 	 * us to send the preferred poweroff-notification cmd at shutdown.
 	 */
 	if (mmc_can_poweroff_notify(host->card) &&
-	    !mmc_host_can_poweroff_notify(host, true))
+	    !mmc_host_can_poweroff_notify(host, MMC_POWEROFF_SUSPEND))
 		err = _mmc_resume(host);
 
 	if (!err)
-		err = _mmc_suspend(host, false);
+		err = _mmc_suspend(host, MMC_POWEROFF_SHUTDOWN);
 
 	return err;
 }
@@ -2231,7 +2239,7 @@ static int mmc_runtime_suspend(struct mmc_host *host)
 	if (!(host->caps & MMC_CAP_AGGRESSIVE_PM))
 		return 0;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
 	if (err)
 		pr_err("%s: error %d doing aggressive suspend\n",
 			mmc_hostname(host), err);
-- 
2.43.0


