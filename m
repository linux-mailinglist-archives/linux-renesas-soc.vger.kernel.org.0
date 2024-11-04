Return-Path: <linux-renesas-soc+bounces-10271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D499BAF7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 10:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9442812AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314971925B0;
	Mon,  4 Nov 2024 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eSBZnrV9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48E1632DD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712147; cv=none; b=BZxWOAkDNAieVDq9acTxmccn13wla5uM7sqUMT1eyUzO1w7LkBA8NAFhVVUwQ3pGPaZ04glLlqFCTCTs7VtBZX0Ig+i2+GQ3FsjV4fMK0X2TqA/SzhUfG/aluRs4bnfJ/fVAh06ClhrckslP3lr/+hO7tAGIAloDMZcMcGC319o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712147; c=relaxed/simple;
	bh=oYozuXtt5Z6JeaX0RlqqKPM9/MUDkhOMD8Gopuv+7rI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHt2FKFyhF6jWxpD37rAqlhRVGUrAX3SIlu4GjOPzMFi5OLQ6zGbPknB300JGZxMluflcIfUSj4Gv0gogOk1wXcmcvSZnq9N+qza/xXVSBMRU0PXPrkYwpQ0zpMMp/9iAPDq1aac/itDZ+hEgpr/G0wA9vjpVtMgjNC+XWeELbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eSBZnrV9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=x9c7Uglnj8/t49
	OIveEXApQV0J7ESUNlFMNmSWSa7E0=; b=eSBZnrV9iipdLIVWdUS8udF/TjMK3j
	nnmMcFB95Q/hX7G/fwwFFhP5zwzo4k0/uxDWq0015bELWSh6RJp5KVJhHPtRbzf+
	+IZXf9hnOm44Hn7RcsO4hAD/wzFnbzVAMKjBCoCF18u6GiTx6ya0OQuClzLChi2i
	MX0qJN88sHE4gpwSsvzaEBOrBQmLAZwaqjZVwpA9Ja707MaKruOb+ChCiISp2MYm
	Kcn/NQDhwxOJobE4OaQsPtk8aRbYagkTMo68xFqFcwjgwjjlg2VRH+yivgPkW8xD
	ZvCVs2hgts4EIlHnUwGEL4YQZzKY7CgG7FyV9ZcKIR3WoGFY54xqcE7A==
Received: (qmail 319331 invoked from network); 4 Nov 2024 10:22:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2024 10:22:21 +0100
X-UD-Smtp-Session: l3s3148p1@H75k0hIm9r7VHA60
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [RFC PATCH v2] mmc: suspend MMC also when unbinding
Date: Mon,  4 Nov 2024 11:18:42 +0200
Message-ID: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>
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

So, first, mmc_remove_card() gets improved to mark the card as "not
present" and to call the bus specific suspend() handler.

Then, _mmc_suspend gets extended to recognize another reason of being
called, namely when a card removal happens. Building upon the now
updated mmc_remove_card(), this is the case when the card is flagged as
"not present".

The logic of either sending a notification or sending the card to sleep
gets updated to handle this new reason. Controllers able to do full
power cycles will still do a full power cycle. Controllers which can
only do power cycles in suspend, will send the card to sleep.

All this is for MMC. SD/SDIO are unaffected because they are not using
the 'card present' flag.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
[2] https://patchwork.kernel.org/project/linux-mmc/patch/1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
---

Lightly tested with a Renesas R-Car S4 Spider board. It bascially works
as expected. Serious testing postponed until the generic direction of
this is approved :)

 drivers/mmc/core/bus.c |  3 +++
 drivers/mmc/core/mmc.c | 29 +++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
index 0ddaee0eae54..52704d39c6d5 100644
--- a/drivers/mmc/core/bus.c
+++ b/drivers/mmc/core/bus.c
@@ -403,5 +403,8 @@ void mmc_remove_card(struct mmc_card *card)
 		host->cqe_enabled = false;
 	}
 
+	card->state &= ~MMC_STATE_PRESENT; // TBD: mmc_card_clear_present()
+	host->bus_ops->suspend(host);
+
 	put_device(&card->dev);
 }
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 6a23be214543..2bcf9ee0caa8 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -32,6 +32,12 @@
 #define MIN_CACHE_EN_TIMEOUT_MS 1600
 #define CACHE_FLUSH_TIMEOUT_MS 30000 /* 30s */
 
+enum mmc_pm_reason {
+	MMC_PM_REASON_SHUTDOWN,
+	MMC_PM_REASON_SUSPEND,
+	MMC_PM_REASON_REMOVAL,
+};
+
 static const unsigned int tran_exp[] = {
 	10000,		100000,		1000000,	10000000,
 	0,		0,		0,		0
@@ -2104,11 +2110,16 @@ static int _mmc_flush_cache(struct mmc_host *host)
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
+	pr_info("%s: suspend reason %d, can pwr cycle %d\n", mmc_hostname(host), reason, can_pwr_cycle_now);
 
 	mmc_claim_host(host);
 
@@ -2119,9 +2130,9 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 	if (err)
 		goto out;
 
+	/* Notify if pwr_cycle is possible or power gets cut because of shutdown */
 	if (mmc_can_poweroff_notify(host->card) &&
-	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
-	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
+	    (can_pwr_cycle_now || reason == MMC_PM_REASON_SHUTDOWN))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
@@ -2142,9 +2153,11 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
  */
 static int mmc_suspend(struct mmc_host *host)
 {
+	enum mmc_pm_reason reason = mmc_card_present(host->card) ?
+				    MMC_PM_REASON_SUSPEND : MMC_PM_REASON_REMOVAL;
 	int err;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, reason);
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


