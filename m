Return-Path: <linux-renesas-soc+bounces-15491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A482BA7E4AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11914189A4A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D45204F7C;
	Mon,  7 Apr 2025 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdAI2e7m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9C204598
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039695; cv=none; b=GNLKwdrqVGEw6XCfBTKvldjZKGz1HdKpIHFXxfiJX4MIeYn1qgIcy3lg1xE5A/HSNPysSXPz1qePxhXZlqkGctJQwT9zZa76zujQxl8ERJcO7cseEHvGuu1H014JLS0lZlTD6UGXDomeoAgHVQ7slmIwyLVtX/XOufUcnboEXCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039695; c=relaxed/simple;
	bh=KZB+pX8+Z+t02Vyu3JiH1fIAeOGA3SvV4prne66BLo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLVZENIxtweNpOYjNsbdJA/k+5QsCg4JVNz+FNnR0spIhLyMqZblm7SVQPJHJKyUtkivui/g6G4N3G3bBR/16nBx0DpQpAJjl9lxFPrSFaT8WwJ40qLVqOQJHdGaGpaBUqhUJzWAYHkueaSmM1h6rVqutmWvi4KQc5ZRXahT+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdAI2e7m; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so41053901fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039690; x=1744644490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa0NqKrTJ654Zn0Q1P84Jb3f7w9bMHpFgeDh4gI/15Y=;
        b=HdAI2e7mDs1MEGlnG9DCsAZAN6uv0tgrwh0PSd6SBdIzNZ+h/bI9WrQsuMfu3fQL18
         U7OfNz7jdvi2bdtbxaVOGmT9QldDz8Rt6Fjd8tM87Nymhv+D6pcLrEym3BD8GcFzZaRD
         MPTrWww2ybXBfNJwwU98KOIF52xHJVylIbymjn2QH2fy1QOM+qoVb+O/k9WKpu+yHcZG
         GMdg6tZcfwB0xAdmVWnq6WRhgqZncDirSyizjfrNlAmVN9GWvR8NsrnTdSL7FyXef4u6
         hUW9tAOjwyaXzfLsy4JHkD2UWzenYg+tXhGiYPgu+Mx8gwf3qaabaiJ0EmlTcvg4XGR+
         9nDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039690; x=1744644490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa0NqKrTJ654Zn0Q1P84Jb3f7w9bMHpFgeDh4gI/15Y=;
        b=UdQ+3dT1wLeQ7EtEe90MG4UF4AMXtquhB4LOgveffM/8wugAzzksOYdkin9I3pWFuv
         6BZyFFTgoRHrBQRMAx0N2pOZbhxe2BI/64SbI3+9/NSU8zP9JapJ83i6j9QwdDyeHNGI
         DedXiub43JSKe3JpMLMLfjO1nCWT8zF3+Q9q9CLtjMoB8UYaIa8crJTXm2JlFS1aJY/V
         672YetNPtNpxwbNul5Puqgfc99qS7Sw719zcIZseli0kf//mUshFU7iCyOYs8+VbAnTH
         gh+9N759BV4MUhpdjNYMKeqNT72gXKl6f2yMXIVS3d19QqkhvYSzE5wWXC+eM3S6nsqZ
         hdaw==
X-Forwarded-Encrypted: i=1; AJvYcCVTftvWsfuXltwipOFBAOcgRain5Wf5QURB4TEqLuZTUlMEDYSFe0vXBfXfB7zmApKyZfqBPpMDDd3kA1PI+WxRkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEexv0dH+5opmQ7I638BZD4l0MTQu/1iU/ee2hJcGrQJTKfn2v
	Mq/ZeqQWKFcXGjc7cTF0tLw9sRdF488K7gYBoUq4RArxkQFvcEloFCDbkLHFU4A=
X-Gm-Gg: ASbGncv7HeyRxmfvSQ7XXQv6PJ7Yc3dsYgM7OX6GaYNxGqKcRUS+YZx+gqpMvsgaF/l
	ubxo7ZJJDKwWpfOVCjCQ+u7z9FbGxydB3YmFyWxudwjtvHiw0vZ9j++KkHWF4HbNJBpR/m0sbHg
	31dS/MSkkrQBCvqEdC+h1PiITZCajq7Pt/29mOEafrpnhOb3zzocJ63vbORrRWcDmwn2ItJ8PrI
	6VY5eAkYJ2vH1C9TjY+KYrzKCIIykg8NmgPwFcO09IphwtW/kFCYmk4mCWqijYlW460ekjmj8ge
	rb5JH093QHSZA3KHfDqPCBHolmZ3ETgjfZKAo+LC0kN8qAQVcSWKWfKMb5y1dHu8s2Jirz8lNYz
	iU+NwoZTAg9qBRWM3cPdbCJxQAzqVqw==
X-Google-Smtp-Source: AGHT+IFeOmjZZCVinZE9PYC+J15PmJZZVU9CLynwj9bgWoY1cdAzycB5GWB7cxZRv+fyPdkRgXGDbg==
X-Received: by 2002:a05:651c:3130:b0:30b:cef8:de87 with SMTP id 38308e7fff4ca-30f0a0ec55dmr40033581fa.4.1744039689698;
        Mon, 07 Apr 2025 08:28:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:09 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] mmc: core: Add support for graceful host removal for eMMC
Date: Mon,  7 Apr 2025 17:27:54 +0200
Message-ID: <20250407152759.25160-5-ulf.hansson@linaro.org>
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

An mmc host driver may allow to unbind from its corresponding host device.
If an eMMC card is attached to the host, the mmc core will just try to cut
the power for it, without obeying to the eMMC spec.

Potentially this may damage the card and it may also prevent us from
successfully doing a re-initialization of it, which would typically happen
if/when we try to re-bind the mmc host driver.

To fix these problems, let's implement a graceful power-down of the card at
host removal.

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/mmc.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index c41cee7ef267..48656dadf93b 100644
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


