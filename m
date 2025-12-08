Return-Path: <linux-renesas-soc+bounces-25660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C27DCCAD91C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A01B0304DE88
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4992D8378;
	Mon,  8 Dec 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+ti9FUk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202E2D94B2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207303; cv=none; b=lpPN+kJ+LSdnJfXhvMipCDEEhFUbpTJ9zSr5k1jalzEvHraA4Nh2CdQQM7U80hLxreOrL+aVLRzXLaMr/rnGzbpUEWC56jtcMryPf5lRLDJQG0fYSQgji/CwsepyYFeXXWi7dBY9z8C6piJBYcBI0mCKZAELIr8mqeaVsDJ090A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207303; c=relaxed/simple;
	bh=ZySL4AaKcPct8+xQngHUl687RLkZDPY5G13LCNOJ9qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAMz3zdP9pXZJxOFX44us200GqNSzm/BKB6Hv56WsdMRwKId7GSkdp+XUvHwmlpgdjTN8UapsXL4xP7aZ1cPRbkJn7kRU/1Mxr/Ctf7XHNWe4k/cVYn8U5f5Knkd1X4KlmyrXwOXtEkmik0/SysIOT7s/kG/rYaXbdxIJAOIUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+ti9FUk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so5974970a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207299; x=1765812099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC17qmBanT6eMZ4oYKmegq6u5Sp1tiXwqNyarpnc6Sc=;
        b=G+ti9FUkn6sGR+zQhWGCZd2GcnDXZ+BXdaTuYQ5WXnNsh9xmr19UEB81rOeE1DcdUT
         4JAMK+ltWYb1sH0kic4gdqAa/yC9UUT4qva+BE9+gn4MjMMtQWqQ6K70CVXsfpEGPCFJ
         PcYiqfZkNPEenxlqLqIVaz4yX0Dw44qMCzf8QyFDjtOR+PlVNu6iyQSxW0ee1GXYkam/
         3QhBSSEDZH5eLQu7cc1KZNbVMdly3v4MjQmU3OGsdOSJXJjK7j2Q6E+dow6sznQ6q8E+
         haZkk7hNo8kK/0ilfwyziMEB1gPUaeaIZ1P7wkBIfQ6/AtLgh1A6tFziEaBB3UyQEHqY
         q0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207299; x=1765812099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FC17qmBanT6eMZ4oYKmegq6u5Sp1tiXwqNyarpnc6Sc=;
        b=fw92TLPl63wNtimsDVP9BX5v+s8aa2+3EeH3ruvSYU36P9qP0hYtB8R0969WZVUibw
         Mz1i7eGHrG/RjJKkeGjIY1Ccw90x8NmtDusrGbzTbKxrmVzfjm9yDmuq7pcuytNaqvwK
         +7es0VK6qR8BJXevjjWQE8G5qvZW9gsuNjGCW60n+7HzUTjJUGggOfZU3g7bM/nol8EE
         h3CjMCnRZBzs3F3onaBz6ugbPNOkRSuoZ/SImSh4okV+OJDMCDoseNbBQxGG7VDPSsLs
         sH577WvprjhSQc5wzObbGGXkUdi51bwjmpnVzfluVJ1+Rs7xcw0L4Tr099F4ottscSxb
         6XfA==
X-Forwarded-Encrypted: i=1; AJvYcCXXvQRqk2NFfIJpPuJdSpLizfEQDuM8qao/RoAv6bWXgZfVdMTUCli9xoutTKj7KPgEOtgHiX7NAGMs0DshUQH9GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz/nAxPKG/gsG/w9K3xFDnXud3VuqqTTenYaaBfctp2+O3y9aJ
	j+TEgY9RL0lw4pT6dDpxlDKUucsEoSKK6ZvU79g3rKjiLZpM2b+qaQCf
X-Gm-Gg: ASbGncsuMThLHtsPLtgaxPLwMr+/tod0na3oc/+IYFri5gyU/qvEV72IyBqpjB+FbDF
	SX/UgIRPUrmtLj00sfeYRdGPcpO7Tirss0YDAoL/AiIVMGmLE5R/+QPzKkU4ChtWlRFWl7FhPM3
	Yv2DT2/Fs4KmlFHEkOPfOntHdPAP1isl0LXNB9F2Ful42HvAYKa0sZK0sMfPcbYupw6CPchYmZG
	pE+SGGj7slvgIQsl/ETzpAnqpEwmFSmCpANDf8LQ6LiSNChlIOVNJdRHjMmbHo20Vetw0GrRmkT
	RB9QXb8TnSysyiD+c5IdOGgNWc4uwBoHcnT7hebd1HEuCTuCo/mv3T9pYich9Ymc9dlOTV+8sy/
	YQNl/ctJAGhPN2t+EjH6RZ/AiWFaObyv1YvfcyBsU9u/Yx9gTaJmD+029FvIHOTj3204uUsVkBS
	UZRNQdV4ohmMGf1WKpTeLJE7sF9l2vELfm/ESz0jQubevB6MOLaQZuEYPRx5Gt1zzJTD1E/nAE2
	WfTFzLRi4EV2+t9
X-Google-Smtp-Source: AGHT+IEuVsAowzX2HEzzHJz1UT9rGTyNQECkkWfzii1fOwFC1ra9h58iVZ2xBp1lIlJPlUAaEDk5bg==
X-Received: by 2002:a05:6402:1941:b0:640:a356:e797 with SMTP id 4fb4d7f45d1cf-6491a3e85d2mr7239496a12.13.1765207298781;
        Mon, 08 Dec 2025 07:21:38 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:38 -0800 (PST)
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
Subject: [PATCH v4 4/9] pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
Date: Mon,  8 Dec 2025 15:21:21 +0000
Message-ID: <20251208152133.269316-5-biju.das.jz@bp.renesas.com>
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

RZ/G3E GPT IP has prescale factor power of 2 where as that of RZ/G2L is 4.
Add prescale_mult variable to struct rzg2l_gpt_info for handling this
difference.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit header and description
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 5a8e5a3eb1b1..47324c9fa6dd 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -79,6 +79,7 @@
 
 struct rzg2l_gpt_info {
 	u32 gtcr_tpcs;
+	u8 prescale_mult;
 };
 
 struct rzg2l_gpt_chip {
@@ -221,6 +222,7 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 					      u32 val, u8 prescale)
 {
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	u64 tmp;
 
 	/*
@@ -230,15 +232,18 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
-	tmp = (u64)val << (2 * prescale);
+	tmp = (u64)val << (info->prescale_mult * prescale);
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
+					1 << (info->prescale_mult * prescale)),
 		     U32_MAX);
 }
 
@@ -249,6 +254,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -287,7 +293,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	}
 
 	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
-	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	pv = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtpr = pv;
 	if (is_small_second_period)
 		return 1;
@@ -295,7 +301,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, USEC_PER_SEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	dc = rzg2l_gpt_calculate_pv_or_dc(info, duty_ticks, wfhw->prescale);
 	wfhw->gtccr = dc;
 
 	/*
@@ -489,6 +495,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+	.prescale_mult = 2,
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-- 
2.43.0


