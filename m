Return-Path: <linux-renesas-soc+bounces-25155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72685C895C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D3B3B7146
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 10:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A63320A0D;
	Wed, 26 Nov 2025 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZS/8Mve"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60D31A577
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153797; cv=none; b=PZ8PThSudmXEhRWttMtzGyCJmVUBKWqusFME3NH25hXilbm6T0a/ErprK5dpzs51X+C532Ei2KXDVZiHpXjizBzGXkMdyCQn2Rk+Ul1/JLWu4nHlO+TAEL9N++ZOibBc6bIIo/SW92NliHQFUjPwe8VvAzGgRHlrboS8QESj2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153797; c=relaxed/simple;
	bh=NR1VVRcQZA6ma1hDRE/H83eikDZdbd6qzrIOtMB/wxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgqUZqjv2gJe+GZG6Ja86CH+hPL83w2jpkPFTmA9FyOChNzTuEslUQYCoKgZ/jSidzB3QGdqL/fvGtcu4RBcjdoWeneJnyMQuqo1S+RGxOqHUTvMGknl+jHi0gbi4knhqfdQgfKdrxT0jFa2PBGulvYyg0YUIMrLZnTgOSsp8wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZS/8Mve; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so43335585e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 02:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764153794; x=1764758594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mq5CbEjd8GhLwp2NrMaZDK+wqJGPSJKuaRnVHfJbPQ=;
        b=NZS/8Mve6UfbFNYmswdgd2TR1RYBC+CwG+73zXlwFJd121CViR1lSSW7zAnFyi8661
         yTZpKzfuGrC+E+o5uYfH+hcPaDjM5csOZP5sSEmsSNTmyFuGdvjJdbSkJdzDtSMHLwdx
         +9mPiptp8XNUVVQVq58aark8KJpNGfsz+d4q2XxCPutmMflRuitUn8/xSJI8Do+QcO9E
         aFDM+NlcJ7riWu6AF09rkQB9mLtW1IvGE9L6c4xDbWF4fqAQMXJ0pU0uWxv0J1g+Xy0R
         iz80lXB4EO7GrO8ehV1hOh43mXD4nO0sO16jaGR+ucmIfi0yz/1HXEmVZFlkc4MkFYfD
         7UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153794; x=1764758594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mq5CbEjd8GhLwp2NrMaZDK+wqJGPSJKuaRnVHfJbPQ=;
        b=VDIeFdgoGlIHaQI+J5JKxFQCi0uaPStDXcidV4Up07KH5edfvtk1+IRujs+5zODYCC
         DqTueS029VAexDskc8Pa6wVkzebt7+5dsh8/m1pW8aYcimkw8Rt2Mb1q8hfsGWYJNRn0
         9Vhvk9DemGIHGvbwJXo2RSSp5yUKyYvbEP0VdmQ6GeHJwoq1tBlqCDqR4p8b3FW1Y0nu
         p/5PNtCe7W4LzhirswlPbQGJ/2QUW8aHIxYyg/pYzHLyHtHR++UXGmTriUpCjOOCn/XK
         lF5N6/KsxCulpg4NcZGI1UVhhl0HguZKuOr/rS/aIqVypBqSL1ayvyryvzYm6SX6oNNh
         qRnw==
X-Forwarded-Encrypted: i=1; AJvYcCUpjdwL+e8h25YanKjC7Dq4mhd8aekEhR9MnUGpvDaxqJYC9gd0K9AO7NOQ4Xwzc6c6fAfhPxFGBm8FAwNxmsBAWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbsSKZ5tTc8/NQfTYNvdUsIDUEkvXZ+9+9NpzuDkkCl99Dapgi
	0k50+q7bpa8/SOqF9NjvuIEM4MaEtcZ0Jr8zufGX3b173W56xAS2T3B8
X-Gm-Gg: ASbGncsGL07ZZ1bpPVzTMKAKKd7PALAoedMcsS8omDTk9F3kt0TXz0FoqDOpSve3diZ
	9/sXXPjUnpxCRzCnYH+Y8c1kyXUOLT1jkEz4+WXYJNEaIA+6bsZ1ewkUFyrX4QMrpmyQXd2a0Fu
	q0iWKcygOFD9YgIGR+uee8nM0DZquKB9ytvRFVwfw3OyY+3ebZGAoOgBwhalc+ppKK/dZXHe1Ct
	OZw62OtRVvnVAIvBEmQUHO9Tcczju2V8T9mBx0FmbrhZ5NVo8WrZWNALKNuIw8+RcEb/TTvNIp1
	uYaO0U+ZGXKTg/NnPczDEJbysSIPDsnwjCFVQwOW7wnv3Y26Nc3gk85sCqWh5kt58ewbw7kfiu2
	ebvIh3bT85zGx7ciXXHVgSDnPjPK41iJzLtAtq/CQP+7/YazxmASyLT67cHuradC/iXO+H8EKCm
	QanNptn8sRG3pQj7nROEUkTOOK+Av3PSfJ027tXHNEV7TNLKXMZhmaEMaUzpBsfT1MQ9y+XJKMo
	nA=
X-Google-Smtp-Source: AGHT+IGDQCBktlHP7XlaQJx6GpqJtsNTrxHBS+ivjHzh6Kcd83OVbwN6YnaySf7vK/vLpTylz9wT/w==
X-Received: by 2002:a05:600c:c490:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-477c10c8596mr182627435e9.1.1764153793699;
        Wed, 26 Nov 2025 02:43:13 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0c3a28sm36441245e9.9.2025.11.26.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:43:13 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v6] pwm: rzg2l-gpt: Allow checking period_tick cache value only if sibling channel is enabled
Date: Wed, 26 Nov 2025 10:42:48 +0000
Message-ID: <20251126104308.142302-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The rzg2l_gpt_config() tests the rzg2l_gpt->period_tick variable when
both channels of a hardware channel are in use. This check is not valid
if rzg2l_gpt_config() is called after disabling all the channels, as it
tests against the cached value. Hence, allow checking and setting the
cached value only if the sibling channel is enabled.

While at it, drop else after return statement to fix the check patch
warning.

Cc: stable@kernel.org
Fixes: 061f087f5d0b ("pwm: Add support for RZ/G2L GPT")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated commit header and description.
 * Added rzg2l_gpt_sibling() for finding sibling channel.
 * Replaced local variable other_sub_ch->sibling_ch.
 * Dropped setting rzg2l_gpt->period_ticks[ch] in rzg2l_gpt_disable() as
   it is not needed.
 * Dropped else after return statement to fix the check patch
   warning.
v4->v5:
 * Updated commit description and code comment to give more details on why
   reinitialising the cached value to zero
 * Added a check in rzg2l_gpt_config(), to prevent setting the cached value, if
   the other channel is not enabled.
v3->v4:
 * Split the patch as separate from [1] for easy merging.
 * Updated commit description
 * Added comments about the fix in rzg2l_gpt_disable()
v3:
 * New patch

[1] https://lore.kernel.org/all/20250915163637.3572-1-biju.das.jz@bp.renesas.com/#t
---
 drivers/pwm/pwm-rzg2l-gpt.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 360c8bf3b190..4856af080e8e 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -96,6 +96,11 @@ static inline unsigned int rzg2l_gpt_subchannel(unsigned int hwpwm)
 	return hwpwm & 0x1;
 }
 
+static inline unsigned int rzg2l_gpt_sibling(unsigned int hwpwm)
+{
+	return hwpwm ^ 0x1;
+}
+
 static void rzg2l_gpt_write(struct rzg2l_gpt_chip *rzg2l_gpt, u32 reg, u32 data)
 {
 	writel(data, rzg2l_gpt->mmio + reg);
@@ -271,10 +276,14 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * in use with different settings.
 	 */
 	if (rzg2l_gpt->channel_request_count[ch] > 1) {
-		if (period_ticks < rzg2l_gpt->period_ticks[ch])
-			return -EBUSY;
-		else
+		u8 sibling_ch = rzg2l_gpt_sibling(pwm->hwpwm);
+
+		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch)) {
+			if (period_ticks < rzg2l_gpt->period_ticks[ch])
+				return -EBUSY;
+
 			period_ticks = rzg2l_gpt->period_ticks[ch];
+		}
 	}
 
 	prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
-- 
2.43.0


