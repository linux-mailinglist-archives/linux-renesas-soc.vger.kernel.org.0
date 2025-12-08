Return-Path: <linux-renesas-soc+bounces-25661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DDCAD925
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CEB9301D672
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C4B2EC081;
	Mon,  8 Dec 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNOr3P8e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92872DA776
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207304; cv=none; b=ckAfl45fjyVf7xELcZAsmeMiFBYb7Dgd3sHPrFo4jtCxCJRcBtEprFvAoA7Fpzp9icmskLFzCSCUKG89oKofM/frwjTzZ4c06IkbcJopfznuPSPe5q9yKJ0JtqY/I70dfzLI2I18m9s6xvEw+wyDa4m+YobhXJgs5ZwHzCa20do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207304; c=relaxed/simple;
	bh=zLLetJqM12TY1c7+MFbtwNOwfn3AnlzzYAStgZhqwt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLXarb15AuLvSs4dmhUqolg877zQpWTZeDm5ndvQKfQAyNmXzJ9YOdC0r66cN4FE93H2EcHn+C1jNtzDI8Pjo7GkG+gE1TrgPc7A5q26p3ilwbkfJxHgP96ecxK68/ehnmi0S6MkdrgHmnz4JcvvpuZpV1P+lF2xDyW3YoLcyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNOr3P8e; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73875aa527so659389066b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207300; x=1765812100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUXCkzxCQ0NLPbJywbDmd+GQ+c8nxVNpBJevzMxZvNw=;
        b=KNOr3P8eerR2Pm60KQhgHiYqYRDrU/w8F/X/b8I7d/qnOYQbVavz164pm7yVWlzzlF
         d0GkctEzTvN7cOxKAZk1ys0A7lvKhOVrVIVZzX0hCYvjp09KTve18+Wguxv12YiXe1Ln
         T6RS/BZ01saz3+SfbDq74/Q1gmAMQWPTclG10XBg3ZNHrcWa1MQpPR2jXROUdbwT9iBz
         dT3+xcKUUIizV9cjF+WLhUqYzLkU4ZN38Z6u7EZ2oSkErsseKL3uH3uwEB3qHSMejLcE
         olnFrJcOuFrUayI4P2fJXLzPvab6KEPIewtjegEMojsjzYFJSQd5PfZizAjV6SuutjSv
         g57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207300; x=1765812100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GUXCkzxCQ0NLPbJywbDmd+GQ+c8nxVNpBJevzMxZvNw=;
        b=SRK6eYF1TjF4i0aBeqDa3hWMO2du4/yoZ1Plsg5fWvJr2edQXCaxa5azX0ZEWT3DHo
         2wSpl0mlS9LZ5wVTqSieD38kFVbD+pf51JuyIKKyajkOUWdyG4p+o30KG5HPxl5dPSPR
         Qi6tF+g+6xpal9i3Mi7DmycN0GKIZiEGQe98jF6Eq9UAQk1oIPQyw0PvX5UJflVXTkc2
         RiRInaosNx3/MdWbJWeDEm0b4xA4BCl8SLM8xme0zb7q7yZK+xmHmgVEjVrVPt7A9xsX
         CwXdzec+W0rVo9LSdg9Sk/q0s3n9RKsYDlsC6kSn0zKbAm02q+AdO1c4zcYWwzs1BkAY
         faNg==
X-Forwarded-Encrypted: i=1; AJvYcCVxv822qoo7K8XrNDERCEW1HEMzWRPqpJOUnTGuzhrg1QIjCHxJnpGTtQux04EC0NmOraCLvye09v7FnexS/kNOPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY64v7fVZeEhBqR4KUDdTDqCFp87cbx+aCEkKOdBuLMZF2p6P9
	2xkDP+xWgJ3LJbk/qoGvNPNXbC6UTPg1UcORYZ/pABiXNVcL+y1dwBtV
X-Gm-Gg: ASbGncspgjseQKoeGrifaHYwY0u3NanjSmVkIrw0yHctxU0/VqLltO+17mGHgC54jVb
	/UhMpG5SkqfB44rIpbPqqXHINxpv3spRqhJbrbNzxoz65uncS41vlct/9q7o03CKJLoU5/auLG+
	9DX67X6D9jK2/yCR4M3vdCU3Zy1FcI9/Zrm8CyB51P9QREhHO74SQCq/c9fBSeTghMV+jRpQ7qm
	tteaMJ33pJhY8O0+2dlo/yuJ9Hu1/1f/qf0Kae/JPJ45zMEkjG8t+JjEc/VJG14W67H62OLSdyw
	GLOupT7Q7r9LMs9xgaTHkRxXRhfrJk/ZIaR7mUbuS1pg8SJDcnlLQgXKZs9sEbC7Z5+SorMAGgg
	eyw898/dCp0w1wjZKJ9vmThZ8FtetMqjd4tIocZLGSRXaJeOqSzrgjY+UREiWDp/afp+pgrSX3N
	yPhcTBjFigrtj4wPzW5WsajIsN75+RNrvi3PiOw38nEljPZnZocqU1EVckd+CuSi3uEYtRQkJbv
	emKXcVhoPD7x/yK
X-Google-Smtp-Source: AGHT+IFxf04tp4ZANgUPLE9H0eJNVOFCAkMovTKf8QoOV0OScvm/yK9ltFfxmGvGU9Bx0es0K3wD/g==
X-Received: by 2002:a17:906:478a:b0:b73:6d57:3e06 with SMTP id a640c23a62f3a-b7a2428bd90mr702125066b.7.1765207299441;
        Mon, 08 Dec 2025 07:21:39 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:39 -0800 (PST)
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
Subject: [PATCH v4 5/9] pwm: rzg2l-gpt: Add calculate_prescale() callback to struct rzg2l_gpt_info
Date: Mon,  8 Dec 2025 15:21:22 +0000
Message-ID: <20251208152133.269316-6-biju.das.jz@bp.renesas.com>
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

RZ/G2L GPT the prescale factors are continuous power of 4 whereas on RZ/G3E
it is power of 2 but discontinuous. Add calculate_prescale() callback to
struct rzg2l_gpt_info for handling this difference.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 47324c9fa6dd..791900f6de3d 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -78,6 +78,7 @@
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
 	u8 prescale_mult;
 };
@@ -131,8 +132,7 @@ static void rzg2l_gpt_modify(struct rzg2l_gpt_chip *rzg2l_gpt, u32 reg, u32 clr,
 			(rzg2l_gpt_read(rzg2l_gpt, reg) & ~clr) | set);
 }
 
-static u8 rzg2l_gpt_calculate_prescale(struct rzg2l_gpt_chip *rzg2l_gpt,
-				       u64 period_ticks)
+static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 {
 	u32 prescaled_period_ticks;
 	u8 prescale;
@@ -292,7 +292,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		}
 	}
 
-	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	wfhw->prescale = info->calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtpr = pv;
 	if (is_small_second_period)
@@ -494,6 +494,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
 	.prescale_mult = 2,
 };
-- 
2.43.0


