Return-Path: <linux-renesas-soc+bounces-16558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E077AA5B19
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 08:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 159CA7A5488
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 06:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E883326C386;
	Thu,  1 May 2025 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bj3W5sqs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3A268FF1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081226; cv=none; b=mEjW8Gzfu4A9OB8E2qvmjJXBLAu2eNLOYJfvzNRBdVv2aNDhf0gb4i5hEAxrhSSvJg6cxx6AGXsZH+txTbNf45EInCVj9e3NJNMmi81is2KtjrsU/j5pDaFPy9SowHvKtCifJUdbhhv8rm0cSAtJEeThNtA4uHvJnjq0lTSU0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081226; c=relaxed/simple;
	bh=Kux+D10H2xVO7KgjxHpD1/TLY3kK6HIETOTjYkCSiXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRftUUDNYTGjrTKx3jjNi0sjQViEwFat2kPxoVRutrzOfgOSZpkHwkJ+A7S4Z6DQZI8jgmEGPFGlLM6+soplmFiqLEF4gBkEcprIMYKBLnZglGb6m8w1CpbgHR8rMrfh8x8yUBc3b+vrv8NO7eaMT06+Xn6j4uRXJEnGCh5ylSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bj3W5sqs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EyZiMS5Buw/s+8rzr2+sLRbPIJwuHcJ9z9Hfq+4pFlU=; b=Bj3W5s
	qsI5KsL89q/vziUBg48H1MFKf1M5GrYPAsvMklKn+bofb48adNZzLgcgEC4KAvYK
	duVK7oOwGbxLOStM83lPKEEjTW9U6nEDDLtWc+frLRtgDeJ7nUNCAt6sDpxA77Sg
	LbEirDCQv9ysBNqc2LP3z3Ats0cJSb751Z2JgnjBnHqdUVzUA0dnY4gMSVab2YNq
	iNHaahcSQmw4DcXJk5w9IMFzlnoIeYn1oG0BXBm9h/Jvjg6LzkMd96l9aKPGEMee
	NgxfLOzX/RkmoGvpXzL0+gUe9jIGFgbqPjq3NSxqj7cBhRSExx5HXMHzXwv8A3qx
	gV0n2P4XmapFCT2w==
Received: (qmail 958480 invoked from network); 1 May 2025 08:33:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 08:33:41 +0200
X-UD-Smtp-Session: l3s3148p1@fLn3Ng00UuAujnsd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH 3/4] mmc: rename mmc_host_uhs() to mmc_host_can_uhs()
Date: Thu,  1 May 2025 08:33:28 +0200
Message-ID: <20250501063325.7262-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
References: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is not obvious that this functions checks capabilities. Rename it to
include '_can' like other capability helpers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/host.h | 2 +-
 drivers/mmc/core/sd.c   | 8 ++++----
 drivers/mmc/core/sdio.c | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/host.h b/drivers/mmc/core/host.h
index 00ca88389ef9..c112191cad6a 100644
--- a/drivers/mmc/core/host.h
+++ b/drivers/mmc/core/host.h
@@ -54,7 +54,7 @@ static inline int mmc_boot_partition_access(struct mmc_host *host)
 	return !(host->caps2 & MMC_CAP2_BOOTPART_NOACC);
 }
 
-static inline int mmc_host_uhs(struct mmc_host *host)
+static inline int mmc_host_can_uhs(struct mmc_host *host)
 {
 	return host->caps &
 		(MMC_CAP_UHS_SDR12 | MMC_CAP_UHS_SDR25 |
diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index 08ab076fe2f9..ec02067f03c5 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -455,7 +455,7 @@ static void sd_update_bus_speed_mode(struct mmc_card *card)
 	 * If the host doesn't support any of the UHS-I modes, fallback on
 	 * default speed.
 	 */
-	if (!mmc_host_uhs(card->host)) {
+	if (!mmc_host_can_uhs(card->host)) {
 		card->sd_bus_speed = 0;
 		return;
 	}
@@ -867,7 +867,7 @@ int mmc_sd_get_cid(struct mmc_host *host, u32 ocr, u32 *cid, u32 *rocr)
 	 * to switch to 1.8V signaling level. If the card has failed
 	 * repeatedly to switch however, skip this.
 	 */
-	if (retries && mmc_host_uhs(host))
+	if (retries && mmc_host_can_uhs(host))
 		ocr |= SD_OCR_S18R;
 
 	/*
@@ -1509,7 +1509,7 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 	 * signaling. Detect that situation and try to initialize a UHS-I (1.8V)
 	 * transfer mode.
 	 */
-	if (!v18_fixup_failed && !mmc_host_is_spi(host) && mmc_host_uhs(host) &&
+	if (!v18_fixup_failed && !mmc_host_is_spi(host) && mmc_host_can_uhs(host) &&
 	    mmc_sd_card_using_v18(card) &&
 	    host->ios.signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
 		if (mmc_host_set_uhs_voltage(host) ||
@@ -1524,7 +1524,7 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 	}
 
 	/* Initialization sequence for UHS-I cards */
-	if (rocr & SD_ROCR_S18A && mmc_host_uhs(host)) {
+	if (rocr & SD_ROCR_S18A && mmc_host_can_uhs(host)) {
 		err = mmc_sd_init_uhs_card(card);
 		if (err)
 			goto free_card;
diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index 4b19b8a16b09..0f753367aec1 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -198,7 +198,7 @@ static int sdio_read_cccr(struct mmc_card *card, u32 ocr)
 			if (ret)
 				goto out;
 
-			if (mmc_host_uhs(card->host)) {
+			if (mmc_host_can_uhs(card->host)) {
 				if (data & SDIO_UHS_DDR50)
 					card->sw_caps.sd3_bus_mode
 						|= SD_MODE_UHS_DDR50 | SD_MODE_UHS_SDR50
@@ -527,7 +527,7 @@ static int sdio_set_bus_speed_mode(struct mmc_card *card)
 	 * If the host doesn't support any of the UHS-I modes, fallback on
 	 * default speed.
 	 */
-	if (!mmc_host_uhs(card->host))
+	if (!mmc_host_can_uhs(card->host))
 		return 0;
 
 	bus_speed = SDIO_SPEED_SDR12;
@@ -669,7 +669,7 @@ static int mmc_sdio_init_card(struct mmc_host *host, u32 ocr,
 	WARN_ON(!host->claimed);
 
 	/* to query card if 1.8V signalling is supported */
-	if (mmc_host_uhs(host))
+	if (mmc_host_can_uhs(host))
 		ocr |= R4_18V_PRESENT;
 
 try_again:
-- 
2.47.2


