Return-Path: <linux-renesas-soc+bounces-22221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E4B966A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DED83AAF2D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0906259C83;
	Tue, 23 Sep 2025 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEQT7DYo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC82B246BA4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638733; cv=none; b=dLTBxJp9XaUDZmu6YPot0QfXgC8aiFO+84kihK6N7p/mvoD+24tCr1zi0mNqaj04qc1y1aEpyjOGzs4E6z3O7zvwEAdcgW1tatapfvc2v7N8mWVvazrnLRTwtwfZnd5upEe8lSsuzY9LaRKDxmjR3zNDBs5bz62YMwA3CPEvmpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638733; c=relaxed/simple;
	bh=BhWuoBkwSqw7NsnaFxyyeGWfpXdoxScAEzI75wSxdoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePInMVCs7kH0oxQlOz4tUlN7uOeq9jvYtJx8ivoeWUdHl83Cbf0R5L5ZAflF6FrHA9a4K8fxu7tqBwLYANT2ZhIQ+hA7h8hygSmA0kGvZbYkmj5caErUjrL1oEgz0WDXdR8E08os3fP60C69mN5Z6j74OT09gskh4uanaO+woRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEQT7DYo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46db5bb2e9dso11294785e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638730; x=1759243530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ1YIkKOG5ZcKxrbiXISvB8CTGBUs6wL4teYcebD1Q4=;
        b=FEQT7DYo2hX02tuLV5h9xVUq8L8/PTrNHeHKOao3zglT9cFp7OdON9cerOzn74Tz4L
         wMkKfzBxmkYGrSF8ZJniLluh2Eex33Tol/Qp1uHHO43oGX2/B+owFsyC/5znuntrSQFI
         Mg1PfoFHNWs+xuWXTNpfxs+s0jqydcU73fR2xxjM8bCwaUc2ouWuSR1YpT/CeA8/Yy5L
         OACGw0kTxn56QbLAA1WhwiK37IIpapXHz75I2jbfndtRksxvu3LdqKxsSqpLDZoybfJ9
         KMA2Vd3YBpfsVIa8VCrHDt2RSkriAEIcl4BGIOUG7J7E9/y+bWrbhmD0Ih6x9vxVBCsA
         MwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638730; x=1759243530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZ1YIkKOG5ZcKxrbiXISvB8CTGBUs6wL4teYcebD1Q4=;
        b=s6s7FJYPw1te52GXJ0TR4HpATkXyf7A+bqzVgmc/IWvXARNeFygyxFIDSX80lSZvMv
         sOK6Tow+XNGxLwtSDv4elRKHjuAns9239QzDjkhTm2UhAg4PK3Da7xz0wXSwwnXPJCPl
         siPBF8Tyk8AO9kqASqgM6ihiHpNBNpQOBHmYX/Ufzc6b9/a1tUIbPa4JQzN4RG/pr4D0
         l+XzeUcMN6bQCuLunDbjer5EJmXoIsSj3MwLrRCI33EO2WpFuDrhJYF7O/Pr7XktnxPP
         F329Ltt4Ae8C2RvCJsFsLRoOQEwSY0/8EH5FH4GxOQGDdwa13+oplOpGUvADNyBHds6M
         xuig==
X-Forwarded-Encrypted: i=1; AJvYcCXj5/LXowuvi3lfbmb30En2xsqUNWeP6XzDuIoekaLlolejHR+wXzMnVYlYV6dPxH7SuxBCOyFn6emja4lXRFDbcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+B2v/HGU/M094Bh2I4GUliQlCL+gDBLCju4amCMiOdfIZSki
	arBd0tyTD0ANp1iHvHwsrD2dKeZvntUxEqrBdReRrBwKe9TPEb5AIc22ZiV/A+Ue
X-Gm-Gg: ASbGncts9mBV4Y3MDlNcRJcnxwX35HCtML6WxGOcjJGxrPnqqHnT1Gx9MAOlfH8/AGM
	YQQFkl/yDzOwVitOkr1LPXp7qm2ifILZilnWrqlqcNm/H7JT5gODz8ChNXolC7a3Q44TarG2rdU
	GWOtAbdvGd2H/q1DpwCnJO4oLtMtUi6cM/zose6isK6MJMaX+Bq5nMYyHaolwBvoSwD1ft9ahwb
	qz1XYE3qo442kTbdYsCE10sRjFCs/ZZdTMo9wdLuuH5tqLSAw9b0cgzLgJFxVrb6KAJetlxUGSK
	XF58kmz6jTGGqeQQVlqyxU6PQys1Hbr+oYEfzYxDGfX4pIkPWZ7MGfb0rUIzKua25ASFwQcFdVR
	7ieBNXTfGz2B8G3D/We3Qg2v1AYwIQ8Xkt/a6cbsJbgBTNWJEyTTflVIBcEKH2A0Ed4GXrJnOkZ
	GM9A==
X-Google-Smtp-Source: AGHT+IGulPwH5fOVINKa0rDW3oB4wGGljY9HIdmcQhZBQGeWIV8NPJpIlAmFtXu7jcdUNxVdFZrEVQ==
X-Received: by 2002:a05:6000:2203:b0:3ee:11d1:2a1e with SMTP id ffacd0b85a97d-405cb2f1435mr2813593f8f.10.1758638729848;
        Tue, 23 Sep 2025 07:45:29 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm238940435e9.1.2025.09.23.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:45:29 -0700 (PDT)
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
Subject: [PATCH v3 4/8] pwm: rzg2l-gpt: Add calculate_prescale() callback to struct rzg2l_gpt_info
Date: Tue, 23 Sep 2025 15:45:08 +0100
Message-ID: <20250923144524.191892-5-biju.das.jz@bp.renesas.com>
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

RZ/G2L GPT the prescale factors are continuous power of 4 whereas on RZ/G3E
it is power of 2 but discontinuous. Add calculate_prescale() callback to
struct rzg2l_gpt_info for handling this difference.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index d1baac37c771..0af3aaf1917a 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -90,6 +90,7 @@
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs_mask;
 	u8 prescale_pow_of_two_mult_factor;
 };
@@ -138,8 +139,7 @@ static void rzg2l_gpt_modify(struct rzg2l_gpt_chip *rzg2l_gpt, u32 reg, u32 clr,
 			(rzg2l_gpt_read(rzg2l_gpt, reg) & ~clr) | set);
 }
 
-static u8 rzg2l_gpt_calculate_prescale(struct rzg2l_gpt_chip *rzg2l_gpt,
-				       u64 period_ticks)
+static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 {
 	u32 prescaled_period_ticks;
 	u8 prescale;
@@ -296,7 +296,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		period_ticks = rzg2l_gpt->period_ticks[ch];
 	}
 
-	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	wfhw->prescale = info->calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtpr = pv;
 	if (is_small_second_period)
@@ -498,6 +498,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs_mask = GENMASK(26, 24),
 	.prescale_pow_of_two_mult_factor = 2,
 };
-- 
2.43.0


