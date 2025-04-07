Return-Path: <linux-renesas-soc+bounces-15490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80537A7E4C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1903189C1DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44F0204F6F;
	Mon,  7 Apr 2025 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXgppfrF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68881FFC74
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039694; cv=none; b=s1oSfgwas8HUPlAR00g9f8Bc34IUtvseGxgYjnFZLjtVQu+4L21C5QRfnxfK3xBqetcXbSHHwtSOaNV5BHbaW0Yp8f63cdNMZoeHTp9tzWDmWVb3X7wfstPKeauLkALJPBMl6WdoFCemA7pDELE9H8CyWQTWP8aV6ikZXISbFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039694; c=relaxed/simple;
	bh=Ijknpk5Uk4hIjq83+lZpg+DXsxI0t9quWol4n7s82Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk1+3nCFP4ueUdxcTSmpsyRj1JR0BF+LDf8vMtge+/SGx7hdflxkxMOQsNtUpwP49cXW6SqMlHMkVuVni97Mi1YdHFsL3fFDAfyqTPT1gF7XWfrahAYcGICaf7YVLNC0LGTWkajEKuWhrrJclr7sLaPTvL7tPTpEVWJkCk+8ITo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXgppfrF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30beedb99c9so42394401fa.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039691; x=1744644491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gicrhysR2QFFxxlVaKRKpkwXL5D7hQu+/seU1sSHjg=;
        b=TXgppfrFtNPf8da4F7uAvFWqVrsHkeQNDYtI2xo4entXqZpt2yjyH+KnOTJ2Pxm8qf
         UzsRa9oLlXwwevmkU8+s0U7XXZlnKc5Fi7aN1wEzPZSWeD0bQIXCr7ORdfBNCojAiPlt
         Hgt/CsA8zyC1kI7XWa6w9b7aLYkCg9r8q36Mea5IVL4UQUyhBq1SNZc43ZT3GeQftdA9
         H8ejQO5c4fHVPAy2fE32jQJ3R4g1xPtyceDMyvuhorbeC5nTHEOMN8UazEhY78EZ4YG/
         YVI8DVRZdNKP3t4Itk0opmuvlnP3nTUH1FxdAD8eKQ6U3m23t64C93F7MNINzhceBaJe
         2RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039691; x=1744644491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gicrhysR2QFFxxlVaKRKpkwXL5D7hQu+/seU1sSHjg=;
        b=NqNrYqWC6KRpj8GainS6PO1UzJb3q1PdpDEXX41UUKD92K1nFlTGQASIA/fojZ9A0e
         uHmlx89anT4tdS0Pc0+vCtG8M7J9NLzcR52MUNPy+kNgm2YQO8FH2VmuQTDYRK8RnGtI
         WNan2CMb15+DPG4Ubwoy3SpeyPOVDkiaoMBX2dEWk2eH34nHlwon6WiqOpDlUrZ0gJ70
         2AhUZ5qErDR828LAttu1pOjd0PDzWCAQgYCvo1TmCWxSLkiIKyusIRW9sITLBZC3zLar
         MC2i2W5FhX4st1J48kmXbOiPwzPd40Kr+vl85mFDFjG4qa3CSWTsIiQajFSCkIsK3kt3
         L2cA==
X-Forwarded-Encrypted: i=1; AJvYcCWTecQUTbApg7KPCAw/xhZjXHtY5BKAVPbM6HM1cltvBWL4LyLA2RhO4bCEiyd6kCdPH+BPl5usaqYUVNHR5y5xpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqLFodkKqbThJ9o2pQmT0qB/LgS3bk30LLYH+PW3MYtgmSYaif
	FoSD00JCijzKOG43C221W/2KEJtM7zaRI7doIChgl2jR4LmR8gjeOTgMfNStVrg=
X-Gm-Gg: ASbGncuR4XepyGT4Z50ulT/JN8Oh0M0RtCmiWi2/Amy9htZKd6z8oPZP/SWi6wp2qCB
	c/+WHVNtwEhYFOh/ky0utET/cpugc06FiG7loPFKnzz/7k6vlyck8wz627HZbOT280xlXiXNNLQ
	ar1oFQVoC2Becc1xssUR4HOLT5FW9A6OsRbsKNjw9msO8GijxniVpWGoWz6/myZOgYzbgz4r7ik
	JJPY44xveGeuCiBIHixe/NbOYZ4UeQuPL5PBrL6ydvt5LQYbXhwvnkVHEyzQJIscQbLQfoBkE2Y
	EvcthzX2ca/yUNV6ie85d7P96+KiG1g+DLmVvKWmlWggh+AKHyQAL4m8+37IqwfHcas3ejS7zwN
	DAoBfAcbiFpHSC6NVhzk=
X-Google-Smtp-Source: AGHT+IHhIxQb3ouOtoDhkU3Fmd8/KhI6GFSskoCR2n+C2BKMnFkWdfA/ZJhkp0ALJ+c5RIpyY/oQvA==
X-Received: by 2002:a2e:bc1b:0:b0:302:22e6:5f8 with SMTP id 38308e7fff4ca-30f16539e48mr25655121fa.22.1744039690725;
        Mon, 07 Apr 2025 08:28:10 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:10 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] mmc: core: Add support for graceful host removal for SD
Date: Mon,  7 Apr 2025 17:27:55 +0200
Message-ID: <20250407152759.25160-6-ulf.hansson@linaro.org>
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
If an SD card is attached to the host, the mmc core will just try to cut
the power for it, without obeying to the SD spec that potentially may
damage the card.

Let's fix this problem by implementing a graceful power-down of the card at
host removal.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/sd.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index 8eba697d3d86..cb4254a43f85 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -1596,15 +1596,6 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 	return err;
 }
 
-/*
- * Host is being removed. Free up the current card.
- */
-static void mmc_sd_remove(struct mmc_host *host)
-{
-	mmc_remove_card(host->card);
-	host->card = NULL;
-}
-
 /*
  * Card detection - card is alive.
  */
@@ -1630,7 +1621,8 @@ static void mmc_sd_detect(struct mmc_host *host)
 	mmc_put_card(host->card, NULL);
 
 	if (err) {
-		mmc_sd_remove(host);
+		mmc_remove_card(host->card);
+		host->card = NULL;
 
 		mmc_claim_host(host);
 		mmc_detach_bus(host);
@@ -1730,6 +1722,19 @@ static int _mmc_sd_suspend(struct mmc_host *host)
 	return err;
 }
 
+/*
+ * Host is being removed. Free up the current card and do a graceful power-off.
+ */
+static void mmc_sd_remove(struct mmc_host *host)
+{
+	get_device(&host->card->dev);
+	mmc_remove_card(host->card);
+
+	_mmc_sd_suspend(host);
+
+	put_device(&host->card->dev);
+	host->card = NULL;
+}
 /*
  * Callback for suspend
  */
-- 
2.43.0


