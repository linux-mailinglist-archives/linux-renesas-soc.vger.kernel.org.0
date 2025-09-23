Return-Path: <linux-renesas-soc+bounces-22222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28650B9666F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF0F188AD82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C13259C92;
	Tue, 23 Sep 2025 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwUF5Wkz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F31A9F90
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638733; cv=none; b=qR0psPxMGg2+Q8rQu+4Epoh5z//Q9akmIlO6pDjf3jGkerWlE884YfpNhiuoGDFGlMWCKf1NBhot5maSRNRrSjWMtrK2+xGFVO4yVZ8kfGLZxE2uZKmt+BhNQRCJTuLyhrQ2j//tJw6ipd4u3kfwD0uz2jDG/GPIGLrP2syoxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638733; c=relaxed/simple;
	bh=PzTUGS3rsi6YZUQn0pGItTVR2WZEHdiGxiZsu870EA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPp8nP8uHm2jMEDiVQdEhvQ/CIPWknZ4DkKx2RTARAegyTwZK3OftTl48b0+NHKm3L50AQTBkYz+s1qPebBpZF0fBEdoxjyiQgR5ZaZEPhdnEXHudTPcUDmRzaQbIxIbBRSXhgkW60J8yJ2VzPfchoEF/eK6W1QoZzLIoGidQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwUF5Wkz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so54900705e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638729; x=1759243529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4anwDx9v8HakV13d09macXf0BjQ85fB9OQZaHSABwj8=;
        b=AwUF5Wkz6XghTj5KI+h0SCDJbB7WQCUfkUyJIV2XSLgXo/Iu+z/20jfOF6r0zXqsx0
         nl3W1gIXM2QJoJucqRyUplTBxVieVhDQIGv+yCgMoiDePMGustSd9+wK12ORx4jqNe/4
         DDdszVstt3D38054YvKcBhkdCH/RA+EbXhMJoOuANTg6hJs0VAAmm02SV2PRVqkNltEJ
         UOm2jZN3hpq1QtSYYXJrBOHwTRPMOWIVFfWsH6bfpqjTmodsjPSJx8WKM/jhsV7MnYFS
         2nB8Oyr5kXySerFfYLk9o9nSuUiSHDTH6xnOB4Z2hIlfURX/EaVZNTcVKr23pHIFlbda
         vSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638729; x=1759243529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4anwDx9v8HakV13d09macXf0BjQ85fB9OQZaHSABwj8=;
        b=s601b6X27srDOkR1jpAM3DYCz3AnEX79ttENspn7rYPAMjY8tZ/2h/l76HEko7dv8I
         lxP/JFzHAcEVZtNn7cUmO6Lc8tDT9Wkrns2UemgNh3gMbSfhAXXwetB1XW5ptAYusJ2h
         59M2B8/X9w9hTPLntzrPK+VroozUQexCowXwijdyDSvCnHminbmF9Kvs5y0qHeX2uPzO
         7d6oG1u3X8mwIqOENEvnPAhB8wjPvm+LcYqcSfpvNKfchmjXzOfy+7ZXxRmk+wchEtqa
         r4m/oR5bdOrv4yjO4zjH8/78hyGaNVP4Qa2bR7/AxBt07HpNXoXwe+bgVj8i66cBNqU8
         HF3g==
X-Forwarded-Encrypted: i=1; AJvYcCXWo94j6xfyMZshNBYvJLlqAh7TyIL4/es1THR7jOunCKANz0cGe1fZlc6/RsYWq8DDYfscI4yJaETo4tSF9WSOZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOz2NlnJtZe2A859A98lsw1gmXkLiFVPLJaf+ZGCJOc9HhnZD2
	CjAWXdjrKrNz/1QfmGO9o8KOPu/6v5jROIJGD16w29iO/BlWPg4La+SM
X-Gm-Gg: ASbGncszjKacRWWKcmNt7+mQu4g2JPx1OBHHOt7VaML1naWINft/pgeYjd3hjoiB0Sz
	2He3kzm1fTud5CqqxcCKnThPtcxqJX60xaXICSjuQ8VwjbzsTNv3a5kv51KTRcVwqHABsRwZ+wK
	ojKC7/lE1hH7YPaWLkaapc8vkJw7s2c0PSTgbuDhOqxMoH+pVPd03D+oe6zgXFbJ3I0hV8szAGD
	MQrjZxk4YkjEnTz2jPeiZLaL2lwATHyGM0EEKuahyiU1Eh4RvvzxZOb/HHGs8cVuEJy1O62dSDY
	N3L5DDCsBeLokXsY2rnJO5opZK6kAXpxlYgHmEN/c1oIy3ygna3HoAJfnW1pR9xT9nQieilIrLs
	XlHC7MXLQQGdSl6uJDdXPe8LDvlsw9NuSJujvxv7E52YotSf+J27vZXu/UTdaNB1Qf3WfI6uGDy
	5HEQ==
X-Google-Smtp-Source: AGHT+IEoPP6mKCiiA6RwSLS+InzvMGsDizgIiADIxBNHLgXuqyF6vVEwKBgbDeUyQkGB/UlkMhrHkg==
X-Received: by 2002:a05:600c:3152:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-46e1d994a15mr31555955e9.3.1758638729239;
        Tue, 23 Sep 2025 07:45:29 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm238940435e9.1.2025.09.23.07.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:45:28 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 3/8] pwm: rzg2l-gpt: Add prescale_pow_of_two_mult_factor variable to struct rzg2l_gpt_info
Date: Tue, 23 Sep 2025 15:45:07 +0100
Message-ID: <20250923144524.191892-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
References: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E GPT IP has prescale factor power of 2 where as that of RZ/G2L is 4.
Add prescale_pow_of_two_mult_factor variable to struct rzg2l_gpt_info for
handling this difference.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 1d09fb01c72f..d1baac37c771 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -91,6 +91,7 @@
 
 struct rzg2l_gpt_info {
 	u32 gtcr_tpcs_mask;
+	u8 prescale_pow_of_two_mult_factor;
 };
 
 struct rzg2l_gpt_chip {
@@ -229,6 +230,7 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 					      u32 val, u8 prescale)
 {
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	u64 tmp;
 
 	/*
@@ -238,15 +240,18 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
-	tmp = (u64)val << (2 * prescale);
+	tmp = (u64)val << (info->prescale_pow_of_two_mult_factor * prescale);
 	tmp *= USEC_PER_SEC;
 
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
 
-static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
+static u32 rzg2l_gpt_calculate_pv_or_dc(const struct rzg2l_gpt_info *info,
+					u64 period_or_duty_cycle, u8 prescale)
 {
-	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * prescale)),
+	return min_t(u64,
+		     DIV_ROUND_DOWN_ULL(period_or_duty_cycle,
+					1 << (info->prescale_pow_of_two_mult_factor * prescale)),
 		     U32_MAX);
 }
 
@@ -257,6 +262,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -291,7 +297,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	}
 
 	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
-	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	pv = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtpr = pv;
 	if (is_small_second_period)
 		return 1;
@@ -299,7 +305,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, USEC_PER_SEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	dc = rzg2l_gpt_calculate_pv_or_dc(info, duty_ticks, wfhw->prescale);
 	wfhw->gtccr = dc;
 
 	/*
@@ -493,6 +499,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.gtcr_tpcs_mask = GENMASK(26, 24),
+	.prescale_pow_of_two_mult_factor = 2,
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-- 
2.43.0


