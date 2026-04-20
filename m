Return-Path: <linux-renesas-soc+bounces-31397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B9FBIwE5mkIqgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:48:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658342991D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 183CD3056D07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E7539C000;
	Mon, 20 Apr 2026 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS9gX5C+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6B39B955
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681821; cv=none; b=awjWRZK4GWKkyak6+QQ52RlgjJholmxLkYYQg3cSgkjALHfJaCxYfiAKc/fyZe3rkKhURDScsPaCOlhjvm/toCZYJA4Qyh5wTwpwRZuO983nOkMUHoF+Xm3D0b2LOcrV3R1fyxUOn8fMAglemjvlsNRdO5DYkSOfX2nDWF9IBQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681821; c=relaxed/simple;
	bh=2aEt/uAkd6FnonntTQK2OKrXN9HmT8hxFDkSCFrA00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fF+sodjcj/bPnTGPYC1Mh6iioMuzrUQdx6A2Pq1UYawrcqDiA6kFJy3TZfMiBvGuH9J8iS63lGZge7ORP37t1gFQQ0gOyWA4pzQuebm+f5qHDH3TetoGljeUf7VmZf19bSITR0vvN1crxNZ+VU4BUfRnMHtSFdJpFXlhLfIRuoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS9gX5C+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891b0786beso8090645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681818; x=1777286618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE92/ZrBwPqbca7eJ2htSzW/89KuFYZSCYN2VEEIChk=;
        b=PS9gX5C+3CFCYF4tpLhmPkBbpONxdwqOmSNZWquzr/Fg2vq5AJCYdbL6+t5Plo7Yrf
         ZfCWDz3cnLppacJZSaCVyumVcU9pwx1zcXJnetWn+AmGRvdcw8yBgdik+0TQk7YWfS77
         P3MI7XWJGam+6QletyPnHznkBvvSANowXI/5zwqF1/ZxCXTQIhbZdDqFHlcOd9B9LlIU
         q9gvi2z5RhIWAdOXY/ZotbmosQ3sataxo+ULkzP5pijqf/+7of/344zUf2YUhTcLqgaS
         wBLdgjQje6ZyzA2hJrV0Fd3rYycZoO7ZgVIfrEEMXFtAsCnIjXsP9KEPRhzlbf49Yo9J
         ylJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681818; x=1777286618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VE92/ZrBwPqbca7eJ2htSzW/89KuFYZSCYN2VEEIChk=;
        b=boyKdzcYwr5yx7lxokvxiCHn/6RuoUMVJGZ8WjFpl2J6sqTRawCCeczNdXt3l85K3S
         00T2UQBgpGFZf4tXHpJra1zeyuqmvRpOG18Emii1Mt//Vey/pFI99w9OjwmNZ5IAnVI9
         XFaYb9UVUdhHDdJjWeh+Cqy9TqVPgCMCuKBPOdN1TrG5ZcKRZ8Ds0Xq4fZ0uL83mmneu
         VVajgmIUkPYSk+6z2vjsr+716eUJsxN0CdTZBh/14gCHkJnBr/Bg2KqP7E80QVwPwS75
         U2oK4i44D3/+dgKePWHUJjVeKEoM7Wh0cQwrdeFVQtjiY+MUkKhMO8CFF90d1NtAWXG/
         fAAA==
X-Forwarded-Encrypted: i=1; AFNElJ+filup/i6le6RJo04LzKkHOBulOg+SXLjyi5+cVUIRMp2Z0RQFVLrcbxO8p5J5jl3dyzE4jgTtlxPr+mB/03y32w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4gOw3/S1y3f2Ess6SjAwGz61rX/CN0vtbTS/sEaA3MEXzSe4
	AhWkRgy7Nibv0omQ4mxnOVQRPYlqytag90FsSpbIRUV+9f0Vc6mBc6J0
X-Gm-Gg: AeBDietfzfeRtnVQa7xhgKdf2uu6OxT1nk1d0kYsH1NM4VetJ6/8+j5EZ3osG7d9JVM
	EQ/yXah8gT6g4ftjaEtkY8gloSinrUgYUE6rENZIbFDLgv7lkTo5QRUg84n3JSa0LEoKcSW7FFl
	3hNSkgPgnsxSnuxm41Zhz9Yf6z/19bi5CyalKm9HgcyzuyJk6iYU8eMFA5atRXfAghqTDqKG8Cr
	ujUR4e0KeM0FGC/ntNadi18UuiggSBBYLkawfAkSUJ9Bb5dgH6f6gXr2pYpgc31G01GAgkBCXfR
	QiGt+sSQ3EYChBVSIXRuIiUSBmiop79X3M52RI+xukWNwrV3lsTfq5efgfaFE96ximLIWQOHBGJ
	mkPH3h8xXmwmjCPEC7bHBuopdUZDld8KpiIkKgpF+llF20QDvG5saWbehDVy2t2Z+P7g3w/Ucff
	1iqMcw70EkfQmQdQ0GxgHbEZYgtMIIE+bbkaBIsA2zO/Dqk2ZEFobEc2vHRT/pb/g5NN6oLA==
X-Received: by 2002:a05:600c:620d:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-4891d23468bmr39960955e9.5.1776681818169;
        Mon, 20 Apr 2026 03:43:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:37 -0700 (PDT)
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
Subject: [PATCH v5 3/9] pwm: rzg2l-gpt: Drop unused rzg2l_gpt_chip parameter from rzg2l_gpt_calculate_prescale()
Date: Mon, 20 Apr 2026 11:43:20 +0100
Message-ID: <20260420104332.153640-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
References: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31397-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6658342991D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The rzg2l_gpt parameter was passed to rzg2l_gpt_calculate_prescale() but
never used inside the function. Remove it and update the sole call site
accordingly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 71ae2f891fd2..659044fa3d2f 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -132,8 +132,7 @@ static void rzg2l_gpt_modify(struct rzg2l_gpt_chip *rzg2l_gpt, u32 reg, u32 clr,
 			(rzg2l_gpt_read(rzg2l_gpt, reg) & ~clr) | set);
 }
 
-static u8 rzg2l_gpt_calculate_prescale(struct rzg2l_gpt_chip *rzg2l_gpt,
-				       u64 period_ticks)
+static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 {
 	u32 prescaled_period_ticks;
 	u8 prescale;
@@ -300,7 +299,7 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		}
 	}
 
-	prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
 
 	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, USEC_PER_SEC);
-- 
2.43.0


