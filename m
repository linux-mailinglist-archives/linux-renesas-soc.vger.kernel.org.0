Return-Path: <linux-renesas-soc+bounces-12855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A783A2871D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 10:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F06B16A802
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 09:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0DB22A7F7;
	Wed,  5 Feb 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MONBK2bc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0702288CA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749328; cv=none; b=FoodN/TbdnXEojFTjqkb02kXpudblIXZvdno0phyrLO8darVPgqDyVJkpdfA9zIGthBaaul4kfrfebql/huKstiz9dbENPU2JuEfpJ1FpKdVuFxS4vZoZLv0vfS5PX5o9fku7F4GZdjiapJpyqTnNCp6AWxYKGsRLK3UwVqGDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749328; c=relaxed/simple;
	bh=UyuZ63AebhUpU/in3ALgxcHCnsp1FQfXWKq6EW4qYdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NsSf5Nny1hZua+AmOFzahXrsQ3g0QBKRat0f5OW8TgpjD3jRWIWaQ2i0Fqy+5+rrYJjmJXhcZRhsOOJ0QIWk/FdvLcUBtwDtLwk05phy+zd1tlzL00V7UBaibhaT3UIiqbBKOznl25vfCV/pCqGEyjL/P9eDh/Bp9TkMptCo6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MONBK2bc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so6313552a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Feb 2025 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738749324; x=1739354124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LosAM8MKixrze+DKy3KPUaCIuTYER6dudsHxBAM96I4=;
        b=MONBK2bcr5K5cMLVTlo3gEvZ5wyJa1BdixHUJ5NYQy590ELKINXrXg9e3Lk3Ofk2Wa
         SzDe8yMuDp4rC7NyVRqhBG7NyP6xSfPVSBmaRC17iwjhWvwTIJZaaW9NXENIEdTimd+b
         WwsYCsbkEgcqXAEGfv7/BIf4V2VjreD0CzTR7v3zaKLbv7IRrrV293scZVZenYHsN2RM
         noSVO8bES9Rl5Jc3OiYRRF1mH1YZYZzvgBl4MFFCX1TaHXG5fJhHsql+vc0EX/LF7nr5
         XaIKFiPeRI1jdtwAfEf0nSzDKIY6rmTv42XnphNs6zZQyfdCAu4U2qSonqpE46h1iD7y
         9ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749324; x=1739354124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LosAM8MKixrze+DKy3KPUaCIuTYER6dudsHxBAM96I4=;
        b=b+EsQHpum8m6sYdrVdpJOb6dhKxWUn6C/GwdeH6njKmgErkRf18rBbZo8W3f1GWUcV
         jxsqhck5llbJAbhpTGXV9AY6YCfry44busKjzj1RNO+VFD/eWmJSMItpxvfD731EvuLL
         NdEy+A9FIHngBrHPS75RwMNE/q40Y1cYos5ToR/GeYaypPKBcbe0D28WX4kpGbe+ouKO
         eYGxMKxNxOpW1WPWGIRsY4sbktZ44HCbFhwObdVvzwdH4tHTbng88RXqiKKI6dPorUTI
         WWidgQp4CMJfBobW5VjdvWXdmCksTAmWDc4W0n9O+EYpYeiOTG6Pb3wh6Jl3+09eXD0t
         8PQA==
X-Forwarded-Encrypted: i=1; AJvYcCWr2y1RPmDkch8NcWTsnBc6oSzTb70BhdaYr69ZvBlfXD9TLeRKO2VbfFUrRIsamfghW6ifuwgL69NUFKXU4soMNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5sTIW7al28IO3JngjwouVzxtoFa0xnxGDnG2uVr/ExiWVYj1k
	bq+s++mjhG+g5yACuJswy83eBHVlToPW8JrHWAXMr8eJW9efq0hORXLQyit6yCc=
X-Gm-Gg: ASbGncumn+FlpMOAjBPybp1XDVorMbv60BTrJA/r5sjZeg2xCrSSB2BAE3sSeWGcGQK
	DmjnmU9YI6tOPpY6xriT6adYMHWDJZKxuC7ZW+lgxZYdx38DTBUoaAGO1Suxg3rL7ryaxjVNGLf
	kj+Hr9n1pPKIGnQ66LNKNqp5yCKBg2R9wo/56/5d8Zru6eIa9M248fNKFfmQfbvG7vQEPmWE87h
	NwAXoz8sLGXdhkMU0mySOIOXiRd+jEJVC+qgvekO0LJxZpEkPsnRHsnBKGaAQ0/dMpLXWkNQNOl
	N12ho/wPauwIZGFZqlYWHDvulul7+lkOJNStHgxPUF64MQ==
X-Google-Smtp-Source: AGHT+IFa23Ek/09ua5oWaqm4xkzUASaUOHIN061he97UBtBQrBAR3KC7IXfPrH98pn40XLsEElBz+w==
X-Received: by 2002:a17:906:b008:b0:ab7:63fa:e4a8 with SMTP id a640c23a62f3a-ab763fafe8amr111455066b.0.1738749323599;
        Wed, 05 Feb 2025 01:55:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7de5sm1075030666b.35.2025.02.05.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:55:23 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: alexandre.belloni@bootlin.com
Cc: claudiu.beznea@tuxon.dev,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] rtc: renesas-rtca3: Disable interrupts only if the RTC is enabled
Date: Wed,  5 Feb 2025 11:55:19 +0200
Message-ID: <20250205095519.2031742-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If the RTC is not enabled and the code attempts to disable the interrupt,
the readb_poll_timeout_atomic() function in the
rtca3_alarm_irq_set_helper() may timeout, leading to probe failures.
This issue is reproducible on some devices because the initial values of
the PIE and AIE bits in the RCR1 register are undefined.

To prevent probe failures in this scenario, disable RTC interrupts only
when the RTC is actually enabled.

Fixes: d4488377609e ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index a056291d3887..dd50bcf79823 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -586,17 +586,14 @@ static int rtca3_initial_setup(struct clk *clk, struct rtca3_priv *priv)
 	 */
 	usleep_range(sleep_us, sleep_us + 10);
 
-	/* Disable all interrupts. */
-	mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
-	ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
-	if (ret)
-		return ret;
-
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_HR24;
 	val = readb(priv->base + RTCA3_RCR2);
-	/* Nothing to do if already started in 24 hours and calendar count mode. */
-	if ((val & mask) == mask)
-		return 0;
+	/* Only disable the interrupts if already started in 24 hours and calendar count mode. */
+	if ((val & mask) == mask) {
+		/* Disable all interrupts. */
+		mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
+		return rtca3_alarm_irq_set_helper(priv, mask, 0);
+	}
 
 	/* Reconfigure the RTC in 24 hours and calendar count mode. */
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_CNTMD;
-- 
2.43.0


