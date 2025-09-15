Return-Path: <linux-renesas-soc+bounces-21862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE216B58236
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 18:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6BE202110
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 16:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132FA27D786;
	Mon, 15 Sep 2025 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu/0jxRE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376EC27877D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954204; cv=none; b=ObUFjlMoHJ8Pk9KpewjW3h4A2p7VMZbxoBZ2i9J8mbnEKCtOv9xxo/aZPCCLFoK08duk3Czimdbl72Mc+Vca3Hrw4XSOBp7W7gGMYBp9ydA+AUA8k8LLqOWlF1E89o5l3xdWqEvCOgjxVyW+yAjf6A1IVw46GA3vW4c56dpNt/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954204; c=relaxed/simple;
	bh=rDWLxp6tmGy89TUxrq+v7glS2m9ke2bHRuQBeHmGTns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLTM/IrJYM6UK2b4ISvdxxLC4SNgxwvlZ5+ZYG5hNAxXC0NqSwm7o+KOWBPslTkUE6AldAi/ESdRYNoIV+93/IYb2FCYVErfdPgts8H60yjQCZFsc2DJoJ2GPzBDkY46prOtqbYuPGUaxi9IaLQxZy9qY4CKINiSNp0PSrCLYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu/0jxRE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ec4d6ba0c7so26550f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757954200; x=1758559000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OJ3rWm1NdBVBDGSPXlmB4CHoSkVBFKI7NjDh4TZsv8=;
        b=mu/0jxRE7SNdVRabpCMVCRH0wq8ZfsJ3qJDGacQ6Iawy4lzClqq/W0BJOFTRkdyfr4
         WHAEaCxkZ/Gc13TkNktOX0pFap9a43kiMuzg9BwAKe4ApWaTNKy0P51pwi6us3njl3DT
         QF5oLdrgiw6JLjakK4XNJhnnCTGninwxOaE4Vz7D+mTzrZtWoYnLYtcXfU7zDJK8w0Mx
         xZGbHn/obFn9YPdYLzRIgchZULj09n/lXD0KUu1i1NklfAx4P9Jv2IGCwSPUAOSpVyfQ
         f0QP3/0DGmPaPs8J8YfF8m4WvBJ9zsdjYAaDTQWOZvEJIk08x6Hx4iLSutvq0ngjSVcd
         VzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954200; x=1758559000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OJ3rWm1NdBVBDGSPXlmB4CHoSkVBFKI7NjDh4TZsv8=;
        b=QM2ZMpqGAgBxdXFh0iNX1y4UG0z3PPaUXdp1RI2cnchGdhtex+5YeBypi6YwZDvKtJ
         W6H15i+BCxIPiH9jT7t+j2eKPGfHxNPkw/4anbhCUMyEETCrTlhnnkmX6jqriloHLy/m
         /mT9ESQFa3pdzc7bwvGmRyPbagY0O4/dsq/rssa91khYFlJQwe2esQytTVPJu7LnbxqG
         n5q+MF02yjbNiMBAmzCxfwdu3OPcWLzHAt4ALWSms0WflWFawUXMG8y1LywqD5hu8PWU
         KOP2jvAyM5OtT92p3oBQVYQhDvjzQlDZPPN/cHcXqIm/Z+R0y9VdDQKDUl6TPib10kU5
         hfKw==
X-Forwarded-Encrypted: i=1; AJvYcCXbqWKm2ZVJ9epncZCf1TG7SIOR7aeUfUM+Oi8eQKwOJWO3Ru4t5vi2VhJn4bh0NBYZEIQ3px4MJfpxyIGIQVSDWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2XpNlVbTLE4TTLsYmcuUD12AxxIVAKKkhzAANun3LRi1MYB4u
	s8ucKp5HQ6lG9mL1J0P2V+qMIRbkLXBjgaj0UsehQVKHlthn8stPtIor
X-Gm-Gg: ASbGnctVUwjuJfNU6j8WIf8rtB65yikBzyNgrwD4TQNC22O6dXKqm0XbBVhiskWUgGf
	1gPX0kfPxoFBa7yDAYf4NwVl4CjnHOXboz3GiFJCbMzJhUO/akZ10Ii4SiEv5z7pJCzFIjEILFU
	uO7wOsBOoWbT38Mocj7FHp/8RV2AwsoPFXB6gAaJcWTuI4IQ/EMr4Z62KZyaUYojnWwQbsRZe8Z
	pi1msfDVWPyvplhjud3snQ4pUBbjsvnigdHJTNwrKULRLBqeheeBAAfBjHGIzt3dgfThF4CpQYL
	0Z5eNqY2+1oUcyge/Yv0RlrdQaS9IYdFKv1PNbkJ8okhOplF/OxCjeZTWoXHKZBsDLmUrd55Wdi
	gwwCgNYxEHakBO7qwHn2uVi4HaltjCqpKXAMxp66VaQcPwIyd2OUmJE52rQC0nKF4iNh5VoOxID
	8LfQ==
X-Google-Smtp-Source: AGHT+IED6gF8qcEvOi7QA8TOlT4uJTio9AlnSyt9wukyF4ICcxPu7tcLpX/0qcZhpWhffKIb1KG2SA==
X-Received: by 2002:a05:6000:230b:b0:3d4:2f8c:1d37 with SMTP id ffacd0b85a97d-3e76579656amr13722725f8f.26.1757954200319;
        Mon, 15 Sep 2025 09:36:40 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8f4d644adsm9521728f8f.52.2025.09.15.09.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:36:40 -0700 (PDT)
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
Subject: [PATCH v3 1/2] pwm: rzg2l-gpt: Reinitialize cache value
Date: Mon, 15 Sep 2025 17:36:30 +0100
Message-ID: <20250915163637.3572-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915163637.3572-1-biju.das.jz@bp.renesas.com>
References: <20250915163637.3572-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Reinitialize the cache value to 0 during disable().

Fixes: 061f087f5d0b ("pwm: Add support for RZ/G2L GPT")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 360c8bf3b190..b2452e50d618 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -190,8 +190,10 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 	/* Stop count, Output low on GTIOCx pin when counting stops */
 	rzg2l_gpt->channel_enable_count[ch]--;
 
-	if (!rzg2l_gpt->channel_enable_count[ch])
+	if (!rzg2l_gpt->channel_enable_count[ch]) {
 		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_CST, 0);
+		rzg2l_gpt->period_ticks[ch] = 0;
+	}
 
 	/* Disable pin output */
 	rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTIOR(ch), RZG2L_GTIOR_OxE(sub_ch), 0);
-- 
2.43.0


