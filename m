Return-Path: <linux-renesas-soc+bounces-25657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A5CAD90D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66472303D6B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F832D8378;
	Mon,  8 Dec 2025 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coJ9tWc4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797432D5C92
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207302; cv=none; b=JdjfcLEX9GiHt4j32fTPhnwRZXQufHse1pkM3Po9Bf8bSrxcLU/j5v8/YvY9n2tGdErKY1klnsfXfnM5E9TKMsXtq0ssINlLuZ/oazVlExmgkvvqRGrzBJa/SrTOifzjTBTPQgCm/MLo/i3V3C01eik+12gVNkgJmXG+prGNmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207302; c=relaxed/simple;
	bh=yC9dK5PLL0sxoIdkuOVKQsR0vXkZ/QCrw2Uzq8x7NGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5VA3HaHeLLbrUa62lbT/7BbHF3hmLoA7Kyio+eHhEMufB5RELHeNOBLOmHp/yXxKqaTY6+Zh1t1p25ITSd187tmbT9EK9NpahZlDHahgupcRGQFSE/5sD7QwidRORazVB8Jx7J7blwTDfTUQIXByZ+KwQSslP0UsYxm0oyLn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coJ9tWc4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so6715511a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207298; x=1765812098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9GPskOC3TR0+mGQ5C/hrC2LUXi6vFwQXgZvOQ0leuk=;
        b=coJ9tWc4/wk6b3tIKygZKozMds5MWlK5ln9NPDYi7FxpymxJMUQMPWBejEDOOxkXXr
         3vQHuGkppcB2TDcGzayokdz7Vqcapzg/MUPDLSDU/1HiqJdL8kuIJIWs25CnPFkv/7Gl
         5aLGxFaGwFzcBcMpaRz5jdm1H1pegHhZGbGI1G310fVItpMgJr65Msd++U0AWXFLR5yq
         L1qui7/W4PBzbdckJ/GlJwOhiT6bmoMnFIAb3f8lLlTYIv4R4j+2M5feBEYKq27E3WtP
         c8vBlFIwGifgVh+HyVM2bwB5BG5aPPlLVZZ58dTnHVOPgo9wKMd2KvpBR/V5m1zO50KW
         xojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207298; x=1765812098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9GPskOC3TR0+mGQ5C/hrC2LUXi6vFwQXgZvOQ0leuk=;
        b=vl169FqzfSCXXimfnh4bKdbwBwmiB/2U/qTrgHKn7r8wNl7F/crUZS4KUkj+Rg+DXM
         AvcXqoHEfwPjQUGYI48ln3kf9fGMPSplqpmpYigUvtJUEwfoRWUbHCTtSD/gj9coI4iI
         6ewVdeiv7IhlXl8mDAuApWLF30navhQLWVjnHD1ZXzmAmvRq2jUvD6x1R8jtUu3riiTA
         rVB59kZnROFFX2NqmbjroRX3VVxYdCkugpgOcVjeVgtDCzQHAQRiMXyr8ke86gM7Kf9T
         bZ1Xo2sedc89+tuhtm04jYKk3+2JPQ3WH6VrpXrT5O3pM/TDJsA3dyLXlHN4szism9qF
         YU6w==
X-Forwarded-Encrypted: i=1; AJvYcCXyY2zNs5LEBAG/qd/4I7XJl0V+5dlHHyM+3Sw9kXJyXogOyNXNsQzB9cs4AHWbnmLnyIOp+tq+jhTZNJnJXIX1OA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jqV06YEQ0k+GHbZjS6YsPRdSIec9O6TXqMUH2u02xiwb8Utr
	nXP1yJNwxMDhu4ki6+c50awy2iLl6HXSK4x82Y9X13zUkWrWuiMsAXWS
X-Gm-Gg: ASbGncuQUnVPlv7QsnzgZZmsS8ZGR/FADTFDXhRctgee/dTvfL1duiLyL9kChME8aMm
	XL+WcmyARaPOOs4Ug97p/3xNZP1EJvV9tRDsTj34dU5ZAriOm+YvqE6VjGNdkGp14xzipXL2aaI
	8u4tTjcb/G4jm0Gyf9Ec6r3by06+zvtEFV+174p/l2sVXhIGVAojwU+o7tpSNuR7FYYtjTpCYN9
	fnNav5ajJGhYT9V1ZoWv052VYvzpHIFuPrCUv+C2iYXPMV4OgCHevm/MuPmJOGcwn88yJoSdAY7
	Yr25++wuH9QNxAvcqnKzDyQRbotxPqaRpArD7YLGe52tM+K3k/gff3EI8mALjywQMpkcz6qOLda
	pF5HEpYMlvSNDgNXQvztRPRRgg4d8MaOSyIgG74g+NYP7smR2k85w+FQzkKdJ8oe2T+/OH8eqv3
	9aW10wG2SkvjZIDgzTh2p6jdRfrq9YKKFiLUjkpbkXOnrmNGhIM9l5zUtnGRY8vkzqJKr30O4Vp
	AUXbuG2bS83JHDb
X-Google-Smtp-Source: AGHT+IGu2CJWQwJJwYyagOeeKTCTPxbyAu6sf7466Ua2+NYdJZv26hEknGzBLIiHp+r7PdM071NJ0Q==
X-Received: by 2002:a05:6402:34c8:b0:640:c3c4:45f3 with SMTP id 4fb4d7f45d1cf-6491a3dec62mr7193048a12.6.1765207297571;
        Mon, 08 Dec 2025 07:21:37 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:37 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/9] pwm: rzg2l-gpt: Implementation of the waveform callbacks
Date: Mon,  8 Dec 2025 15:21:19 +0000
Message-ID: <20251208152133.269316-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
References: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Convert the rzg2l-gpt driver to use the new callbacks for hardware
programming.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated rzg2l_gpt_is_ch_enabled() fit into 80-character limit for
   consistency with other functions.
v2->v3:
 * Prepared as a series.
 * Created separate patch for fix for reinitialization of the cache
   variable in disable().
 * .round_waveform_tohw() do not fail if the requested period is too small
   but use the smallest possible value.
 * Added lock in rzg2l_gpt_read_waveform().
 * wfhw is reinitialized in rzg2l_gpt_read_waveform if channel is disabled
 * Optimizated rzg2l_gpt_is_ch_enabled() to avoid redundant reads to 
   RZG2L_GTCR(ch).
 * .write_waveform() returns error incase of invalid period for second
   channel.
v1->v2:
 * Dropped modifing hardware from .round_waveform_tohw() callback.
v1:
 * https://lore.kernel.org/all/20250805065032.193766-1-biju.das.jz@bp.renesas.com/
---
 drivers/pwm/pwm-rzg2l-gpt.c | 192 ++++++++++++++++++++++--------------
 1 file changed, 118 insertions(+), 74 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 4856af080e8e..2f424a7b05cc 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -86,6 +86,13 @@ struct rzg2l_gpt_chip {
 	u32 channel_enable_count[RZG2L_MAX_HW_CHANNELS];
 };
 
+/* This represents a hardware configuration for one channel */
+struct rzg2l_gpt_waveform {
+	u32 gtpr;
+	u32 gtccr;
+	u8 prescale;
+};
+
 static inline struct rzg2l_gpt_chip *to_rzg2l_gpt_chip(struct pwm_chip *chip)
 {
 	return pwmchip_get_drvdata(chip);
@@ -153,7 +160,8 @@ static void rzg2l_gpt_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	rzg2l_gpt->channel_request_count[ch]--;
 }
 
-static bool rzg2l_gpt_is_ch_enabled(struct rzg2l_gpt_chip *rzg2l_gpt, u8 hwpwm)
+static bool rzg2l_gpt_is_ch_enabled(struct rzg2l_gpt_chip *rzg2l_gpt, u8 hwpwm,
+				    u32 *gtcr)
 {
 	u8 ch = RZG2L_GET_CH(hwpwm);
 	u32 val;
@@ -162,6 +170,9 @@ static bool rzg2l_gpt_is_ch_enabled(struct rzg2l_gpt_chip *rzg2l_gpt, u8 hwpwm)
 	if (!(val & RZG2L_GTCR_CST))
 		return false;
 
+	if (gtcr)
+		*gtcr = val;
+
 	val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTIOR(ch));
 
 	return val & RZG2L_GTIOR_OxE(rzg2l_gpt_subchannel(hwpwm));
@@ -220,54 +231,38 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
 
-static int rzg2l_gpt_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			       struct pwm_state *state)
-{
-	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
-
-	state->enabled = rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm);
-	if (state->enabled) {
-		u32 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
-		u32 ch = RZG2L_GET_CH(pwm->hwpwm);
-		u8 prescale;
-		u32 val;
-
-		val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCR(ch));
-		prescale = FIELD_GET(RZG2L_GTCR_TPCS, val);
-
-		val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
-		state->period = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, val, prescale);
-
-		val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
-		state->duty_cycle = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, val, prescale);
-		if (state->duty_cycle > state->period)
-			state->duty_cycle = state->period;
-	}
-
-	state->polarity = PWM_POLARITY_NORMAL;
-
-	return 0;
-}
-
 static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
 {
 	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * prescale)),
 		     U32_MAX);
 }
 
-/* Caller holds the lock while calling rzg2l_gpt_config() */
-static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			    const struct pwm_state *state)
+static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
+					 struct pwm_device *pwm,
+					 const struct pwm_waveform *wf,
+					 void *_wfhw)
+
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
-	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
+	struct rzg2l_gpt_waveform *wfhw = _wfhw;
+	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
 	u64 period_ticks, duty_ticks;
 	unsigned long pv, dc;
-	u8 prescale;
+
+	guard(mutex)(&rzg2l_gpt->lock);
+	if (wf->period_length_ns == 0) {
+		*wfhw = (struct rzg2l_gpt_waveform){
+			.gtpr = 0,
+			.gtccr = 0,
+			.prescale = 0,
+		};
+
+		return 0;
+	}
 
 	/* Limit period/duty cycle to max value supported by the HW */
-	period_ticks = mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz, USEC_PER_SEC);
+	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, rzg2l_gpt->rate_khz, USEC_PER_SEC);
 	if (period_ticks > RZG2L_MAX_TICKS)
 		period_ticks = RZG2L_MAX_TICKS;
 	/*
@@ -278,21 +273,25 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (rzg2l_gpt->channel_request_count[ch] > 1) {
 		u8 sibling_ch = rzg2l_gpt_sibling(pwm->hwpwm);
 
-		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch)) {
+		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch, NULL)) {
 			if (period_ticks < rzg2l_gpt->period_ticks[ch])
-				return -EBUSY;
+				is_small_second_period = true;
 
 			period_ticks = rzg2l_gpt->period_ticks[ch];
 		}
 	}
 
-	prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
-	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
+	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	wfhw->gtpr = pv;
+	if (is_small_second_period)
+		return 1;
 
-	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, USEC_PER_SEC);
+	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, USEC_PER_SEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, prescale);
+	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	wfhw->gtccr = dc;
 
 	/*
 	 * GPT counter is shared by multiple channels, we cache the period ticks
@@ -301,6 +300,61 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 */
 	rzg2l_gpt->period_ticks[ch] = period_ticks;
 
+	return 0;
+}
+
+static int rzg2l_gpt_round_waveform_fromhw(struct pwm_chip *chip,
+					   struct pwm_device *pwm,
+					   const void *_wfhw,
+					   struct pwm_waveform *wf)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
+
+	wf->period_length_ns = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, wfhw->gtpr,
+								  wfhw->prescale);
+	wf->duty_length_ns = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, wfhw->gtccr,
+								wfhw->prescale);
+	wf->duty_offset_ns = 0;
+
+	return 0;
+}
+
+static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
+				   struct pwm_device *pwm,
+				   void *_wfhw)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	struct rzg2l_gpt_waveform *wfhw = _wfhw;
+	u32 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
+	u32 ch = RZG2L_GET_CH(pwm->hwpwm);
+	u32 gtcr;
+
+	guard(mutex)(&rzg2l_gpt->lock);
+	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
+		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
+		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
+		if (wfhw->gtccr > wfhw->gtpr)
+			wfhw->gtccr = wfhw->gtpr;
+	} else {
+		*wfhw = (struct rzg2l_gpt_waveform) { };
+	}
+
+	return 0;
+}
+
+static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
+				    struct pwm_device *pwm,
+				    const void *_wfhw)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
+	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
+	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
+	u32 gptr;
+
+	guard(mutex)(&rzg2l_gpt->lock);
 	/*
 	 * Counter must be stopped before modifying mode, prescaler, timer
 	 * counter and buffer enable registers. These registers are shared
@@ -319,14 +373,20 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 		/* Select count clock */
 		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, prescale));
+				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
 
 		/* Set period */
-		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), pv);
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
+	} else {
+		if (wfhw->gtpr) {
+			gptr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
+			if  (wfhw->gtpr <  gptr)
+				return -EBUSY;
+		}
 	}
 
 	/* Set duty cycle */
-	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch), dc);
+	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch), wfhw->gtccr);
 
 	if (rzg2l_gpt->channel_enable_count[ch] <= 1) {
 		/* Set initial value for counter */
@@ -335,44 +395,28 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		/* Set no buffer operation */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTBER(ch), 0);
 
-		/* Restart the counter after updating the registers */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch),
-				 RZG2L_GTCR_CST, RZG2L_GTCR_CST);
-	}
-
-	return 0;
-}
-
-static int rzg2l_gpt_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			   const struct pwm_state *state)
-{
-	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
-	bool enabled = pwm->state.enabled;
-	int ret;
-
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
-
-	guard(mutex)(&rzg2l_gpt->lock);
-	if (!state->enabled) {
-		if (enabled)
-			rzg2l_gpt_disable(rzg2l_gpt, pwm);
-
-		return 0;
+		if (wfhw->gtpr)
+			/* Restart the counter after updating the registers */
+			rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch),
+					 RZG2L_GTCR_CST, RZG2L_GTCR_CST);
 	}
 
-	ret = rzg2l_gpt_config(chip, pwm, state);
-	if (!ret && !enabled)
+	if (wfhw->gtpr && !rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, NULL))
 		rzg2l_gpt_enable(rzg2l_gpt, pwm);
+	else if (!wfhw->gtpr && rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, NULL))
+		rzg2l_gpt_disable(rzg2l_gpt, pwm);
 
-	return ret;
+	return 0;
 }
 
 static const struct pwm_ops rzg2l_gpt_ops = {
 	.request = rzg2l_gpt_request,
 	.free = rzg2l_gpt_free,
-	.get_state = rzg2l_gpt_get_state,
-	.apply = rzg2l_gpt_apply,
+	.sizeof_wfhw = sizeof(struct rzg2l_gpt_waveform),
+	.round_waveform_tohw = rzg2l_gpt_round_waveform_tohw,
+	.round_waveform_fromhw = rzg2l_gpt_round_waveform_fromhw,
+	.read_waveform = rzg2l_gpt_read_waveform,
+	.write_waveform = rzg2l_gpt_write_waveform,
 };
 
 static int rzg2l_gpt_probe(struct platform_device *pdev)
-- 
2.43.0


