Return-Path: <linux-renesas-soc+bounces-25319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE8C91A97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 11:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38A63A2AD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 10:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFADB30BF74;
	Fri, 28 Nov 2025 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIkBV5Kz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A6D3064A4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326078; cv=none; b=qj74CouDaY3uBK0mKvYnaDZvSCFTCBTtJaiGKA7A/LnZW1RXDQVmrcjs5vMp3rEjvCRS5Lvs3wfJgKjT7aFBHgzNCISMTB5p8EETI6HHXQhyr+iN5csvHMyCvVEyFxF+X45TIKjlxZfVsbJf6e7y8Ommn2HqZKwoMyao5D/72ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326078; c=relaxed/simple;
	bh=Nr3kZ/HF5zyZbLaxHUFd9elQcfYv1nZr9CQnhzIapLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJXxjTGaYbex48nWlzVGj/xatHvbtebC6y3ndjTjEVGdpsaSXs1wwG5gYgTKqq8eVpd6GlHMddTDnSSr8ISqs68Ml+ynxvhbfml7VUrmBFt0wI5v6REXB0SAbIGr4p0fVqgzfTlazEXLstfif+2OREfxw73Rlh7KpvYKL+uyRTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIkBV5Kz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso7038095e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 02:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326075; x=1764930875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lhouRhotWS79iDGPjdxxwL/t0zVc/0DaotbFAa/0cPA=;
        b=VIkBV5Kzu7tJQ/OoMrpj1KpqZm1Orpwt6bld/lbcSvrlojhLiHEE2vloEtmlDK/YT2
         HBK5PlNGJJKy3iR0FqVaVy8W7D9KUDTa32gItbZT7fvLdojWjTbhjQRT8J45zZChvEtv
         oUT5DXXfRGG9BWYSP/jUz0NApzH7XDUyqYk+ZB0McJUB0FNG9LD1aG5/VPdCVeYXfztr
         xPrcH2PCW6Sw0almOMg00+gzrt1s077QrJqkeX/DEhkApsSvyFm2zod2M+U+Hhq4N3hE
         maw8mIwoN3eor8Q1UQe5at8nAXXBwa9sYueknMKtixKQoOCJR6gOjPKhp1b7/1QNeNc2
         x+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326075; x=1764930875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhouRhotWS79iDGPjdxxwL/t0zVc/0DaotbFAa/0cPA=;
        b=jXU/n6FRedG74F2PQYiN6aPiwUaYpnCGXbobVJV8y4+37nFmdfpvNXLeRNgf5sfAmS
         lgy2zdmj8lF6l/mMMsN8SuVaGnUGRXCNzji9Ja/YKmPNLhOT37/2Scp3FFluW0Va5LzB
         Mu/4VrQfzzwBIigA1ZG+m3Fm+YVU2EvXnyg1TDGLlV8yJliqLWci7rR4+/Bwqu2nkQ+o
         c6aMzsvV0lU/SY83QvdybEJ4z0DBpFT52iAQ6aC7sZMyRRHAPneKR6dQ4xH+4cCNjAbD
         SjdRAlc+j4Gv9z961b1s15vsXRlolFN8maqeV6sigczLb1lq70ra4XZ/RqPmhjYJQR6f
         /4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9rAyCnPLRTT+TKeB7FVgGhir4OIFQqT5NvfuOrG3Lic/eCI8KWAth1MIvdL4K9qPssuS/nIOnaSySg6mCyrA3Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SCGFi5+/EiRHdD3Q08+M0UeBFKYGRGdXIbkdaqL6n842I1by
	C+SIRDShv/uLsLDic92J95T9QJqHCbKwKERgaFtKwmrBg5aXDpzGAMiA
X-Gm-Gg: ASbGncv1I1pfg3+UCyAKV70Th/wPxQ+zhxr5iv8uKyQwBl/OOSxxLrGkrSBQEp5u5np
	8aklzDnZPus1rHGWY6SWXx3BQGTSaGSWAsOHc45pkHx8ld4prfxAjlEsCESAunWtpocy8zF6rzt
	myMMgqisxiDOMgvH8s9Nhpd8XZzUyMscYODZJ6DfsynuxJNVEZouEiy+7B8cYnaGHASJrX1TOJO
	dmAoPyvpqbeifnocxt392/wa/eg5817/ERe6T/ZpAp1hPgXWkXCHpKbFocdy8ZkjYbh+tCcfu+y
	Mms9ioOgZi80MiPwzCoIf3t4bYCPRi+VImsoOEx1LvFi4k/QN4pcncfgmdmg55RCOEtr+h6HXXf
	M6AFRrvCzzOEBVGhWlZ4TMfh0PrHsbPwl4XQNANUiE/gvYSt20sQ21X5IMN/GfKT5ssfVDLbS47
	svut1/cPvvLJycqriPsil1t15uJ/49sTS4VrXSVXI/C90BCNIOrQuZKPiHg2RT7nVvQfpLGGM=
X-Google-Smtp-Source: AGHT+IHir1b+DDMbUUz0Rnn+6Rv+vd0HuVHQ1NU+NGKS5JANMfYRts8vSUr48Pqq9d7LAQJ5AgaI2A==
X-Received: by 2002:a05:600c:8b16:b0:477:94e3:8a96 with SMTP id 5b1f17b1804b1-477c01b512cmr222762125e9.20.1764326074567;
        Fri, 28 Nov 2025 02:34:34 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm88426585e9.1.2025.11.28.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:34:34 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4] pwm: rzg2l-gpt: Implementation of the waveform callbacks
Date: Fri, 28 Nov 2025 10:34:29 +0000
Message-ID: <20251128103431.161591-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
 * Rebased the patch.
 * rzg2l_gpt_is_ch_enabled() fit into 80-character limit for consistency
   with other functions.
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

base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
-- 
2.43.0


