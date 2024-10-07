Return-Path: <linux-renesas-soc+bounces-9504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799A99283F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 11:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8A41F2352C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 09:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B355018C013;
	Mon,  7 Oct 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gq/JQ/WT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32B18E776
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728293705; cv=none; b=ZdiKdHle/TCYR4cWpWNmcIvYBgClRrxczHq5zTz+N7eq460Zt1GF/S1zuLWOjg6empJutbPk+T7JrPEk1UIJABMPhuAfcAC3v+VnagCdOVrb+tEiEUcqNXW/w7GP5goo1y4p+zUUaX4flyQxMK0BySd7oNHSL5uQAPPElwmqt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728293705; c=relaxed/simple;
	bh=zQa76wpiXIsouesGr7IaCgvgkc2npLW+g6Olkm8nps8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZUOR/Z+cmOg11rEy1mj41Ux5i9AHE4Ugl1mcn6eZiGKntoAytu6jzFmqmbwSdn5suA2Ovz3Qn1YSt2Fh4W6JRLY/nl4UQ3eVSyeOAF/UAoM6vedwviZFyYF/U7U3XZUf22UAZY7M2a9gK0J9poarDey4rszatbZkQaWBdxL0os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gq/JQ/WT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=PKyGBesbdIV5AX
	SvReZxuT8cszHR5cidgM6bBQIweHA=; b=gq/JQ/WThhcmPjAWSODh155nQpGuhx
	TAZhisT0NvuFt0S0zYLeo6RHvSSHBTH3c7U3m5m18x6lQQzVFo8+WRxxfcMPR7Zw
	EmhRmJsa4F2T1ZB6cRiNoVxw5wx/GiSayF+drIbVQyMo+LnqkQlGgDazubV6ZxRr
	oWi5I4hIvG6dFCS2RsUvYVbjBwLcPNCPtny5GOqHbnVaJGPPXBHRuA2GZKfgZD9I
	X/wTFuMPmcIkLmsA9aVc9hq7WvYpXGyh3ExZrkT0e11mfAg+mpLhMxWGfp8ORkBc
	7yJG+qxTWfaYxFYtN51GukCPCVaqNO76OUeNnReBEQ/10k+zBp+UwrzA==
Received: (qmail 73395 invoked from network); 7 Oct 2024 11:34:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2024 11:34:52 +0200
X-UD-Smtp-Session: l3s3148p1@oTmVu98juscgAwDPXxi/APzxl2QXB/xr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [RFC PATCH] mmc: suspend MMC also when unbinding
Date: Mon,  7 Oct 2024 11:31:09 +0200
Message-ID: <20241007093447.33084-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unbinding a MMC host, the card should be suspended. Otherwise,
problems may arise. E.g. the card still expects power-off notifications
but there is no host to send them anymore. Shimoda-san tried disabling
notifications only, but there were issues with his approaches [1] [2].

Here is my take on it, based on the review comments:

a) 'In principle we would like to run the similar operations at "remove"
    as during "system suspend"' [1]
b) 'We want to support a graceful power off sequence or the card...' [2]

So, _mmc_suspend gets extended to recognize another reason of being
called, namely when unbinding happens. The logic of sending a
notification or sending the card to sleep gets updated to handle this
new reason. Controllers able to do full power cycles will still do that.
Controllers which can only do power cycles in suspend, will send the
card to sleep. Finally, mmc_remove() calls _mmc_suspend now with the new
reason 'unbind'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
[2] https://patchwork.kernel.org/project/linux-mmc/patch/1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
---

RFC to see if the direction is proper. Obvious improvements are removing
the debug printout and check if the forward declaration can be avoided.
This was lightly tested on a Renesas Salvator board. Accessing the eMMC
after unbind/bind and suspend/resume showed no regressions.

 drivers/mmc/core/mmc.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 6a23be214543..bd4381fa182f 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -32,6 +32,12 @@
 #define MIN_CACHE_EN_TIMEOUT_MS 1600
 #define CACHE_FLUSH_TIMEOUT_MS 30000 /* 30s */
 
+enum mmc_pm_reason {
+	MMC_PM_REASON_SHUTDOWN,
+	MMC_PM_REASON_SUSPEND,
+	MMC_PM_REASON_UNBIND,
+};
+
 static const unsigned int tran_exp[] = {
 	10000,		100000,		1000000,	10000000,
 	0,		0,		0,		0
@@ -2032,11 +2038,13 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
 	return err;
 }
 
+static int _mmc_suspend(struct mmc_host *host, enum mmc_pm_reason reason);
 /*
  * Host is being removed. Free up the current card.
  */
 static void mmc_remove(struct mmc_host *host)
 {
+	_mmc_suspend(host, MMC_PM_REASON_UNBIND);
 	mmc_remove_card(host->card);
 	host->card = NULL;
 }
@@ -2104,11 +2112,16 @@ static int _mmc_flush_cache(struct mmc_host *host)
 	return err;
 }
 
-static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
+static int _mmc_suspend(struct mmc_host *host, enum mmc_pm_reason reason)
 {
 	int err = 0;
-	unsigned int notify_type = is_suspend ? EXT_CSD_POWER_OFF_SHORT :
-					EXT_CSD_POWER_OFF_LONG;
+	unsigned int notify_type = reason == MMC_PM_REASON_SUSPEND ?
+				   EXT_CSD_POWER_OFF_SHORT : EXT_CSD_POWER_OFF_LONG;
+	bool can_pwr_cycle_now = (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) ||
+				  ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND) &&
+				    reason == MMC_PM_REASON_SUSPEND);
+
+pr_info("%s: suspend reason %d, can pwr cycle %d\n", mmc_hostname(host), reason, can_pwr_cycle_now);
 
 	mmc_claim_host(host);
 
@@ -2119,9 +2132,9 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 	if (err)
 		goto out;
 
+	/* Notify if pwr_cycle is possible or power gets cut because of shutdown */
 	if (mmc_can_poweroff_notify(host->card) &&
-	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
-	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
+	    (reason == MMC_PM_REASON_SHUTDOWN || can_pwr_cycle_now))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
@@ -2144,7 +2157,7 @@ static int mmc_suspend(struct mmc_host *host)
 {
 	int err;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_PM_REASON_SUSPEND);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2191,7 +2204,7 @@ static int mmc_shutdown(struct mmc_host *host)
 		err = _mmc_resume(host);
 
 	if (!err)
-		err = _mmc_suspend(host, false);
+		err = _mmc_suspend(host, MMC_PM_REASON_SHUTDOWN);
 
 	return err;
 }
@@ -2215,7 +2228,7 @@ static int mmc_runtime_suspend(struct mmc_host *host)
 	if (!(host->caps & MMC_CAP_AGGRESSIVE_PM))
 		return 0;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_PM_REASON_SUSPEND);
 	if (err)
 		pr_err("%s: error %d doing aggressive suspend\n",
 			mmc_hostname(host), err);
-- 
2.45.2


