Return-Path: <linux-renesas-soc+bounces-10845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A99E1AA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AACF166869
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361661EBFE0;
	Tue,  3 Dec 2024 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KxiOJtlL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C431EB9F3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224435; cv=none; b=db9MwJF61kQkX+hHau0FAiezAyh7ZxNxqxmPsPPec9ocVQTXWY0HAo7O4BiUn0e2/aXHWz3q35PyYSaAIt4jhBDd9GZyj27JfI1/xN+T55oKxW5LHHLuPSx9VX2NZA+Y71liBHPbUVSSZIX3PZ89yDSdmPA5NGFPK7o7AGgtRzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224435; c=relaxed/simple;
	bh=0Xg5mKYCFN3B/HDWUQU/ZSVkSB67Sy7/5+wdEAjCrSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zn6d9n2R1TqmiIl5mDbbvwUV2a2p5+QJwlwTeeGgfPZat3mTxkEvAEWn3zP2XAfj+18MZOAOrZnwriPo6vYmEZofm7Wffw30ddVYip+d7PoQXSo6NKe35eo8RZnm2LiR3h6PmwJ8GiT6pGP22lm4reoPVBhGjfA9e9FoxWdh9Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KxiOJtlL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434aa472617so45957035e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 03:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224432; x=1733829232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvFz9DjYjIp3me/Tgm2Fhi7Oa0TCrW8QzQ1Z7YJsdLs=;
        b=KxiOJtlLwDMoKrium6ef6e1IJsLH5H1zBUrwPVffCUoTaG1RMN/J9uW8FCjkQKr6c7
         zwQlWoko282fwbaUxgmPvBnIU3vorz47kP4xHNJjj+PP8NuXv3puMNdiB59KmzqmAYL3
         eDnDBaQuz+34nKRubZVJnSlBByyGYaj+m755qKqInKqaXWjz3R/7hM1ENdHbF6hw4Xcz
         df6JdDIsqH/ISGAhQhcV062LmrJ0AqhdkvIRT6gXSqqq+VQLzdznyUV41UCkBJrdSSc1
         cdZsRL0tQJFWyIiIyGO6ACYMhmR0ZT4OkBs9kaO3U5ermBuFEmOpKBOD7xksMdJQi6Vk
         zUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224432; x=1733829232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvFz9DjYjIp3me/Tgm2Fhi7Oa0TCrW8QzQ1Z7YJsdLs=;
        b=v2fn0QHmsFmjEx6yylw3aszR/sxvJ8CMhd4H3iX787mIXOxIaY8Zu5WVhL3Eyn8UbA
         WWr90UqGJktDkig6ttR6fhZfYDTiHuk52vTJ8r9efmH/MyNu6tL+SO9wS580SrHVpGwF
         +aQ6LPb55LYO0q4Y6lCML4WCXVd+4EYUlqw7eK/KB6P2GS2UuqbHB41AiDzaGmQ576gE
         5diQec70nxP/3zfb62gnv5A4w/e9WiwPORpHVmi4uHpP0Jzkg/wU6SOMMsfbg04JzG4S
         L3sXT2iKeyWG8KzxmEda7EudJsShnRYk3YqkcqnovH9T+bJC4pi9VqzrPqpvB2W9qzfV
         xUGg==
X-Forwarded-Encrypted: i=1; AJvYcCV/GMf19AWbiS/dUESY4PYKQ+YG07Rpc9Ce5w1ZGH+8FhtkxrOVwD/zaJTw2YhS9dHHhHw2pfnOFgyoClYMyzOENg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJ3bua5lrIn0hNCAZ85c4sUH8LsG51mTl8Cx3++73VefKRSYP
	L7pBduz04ltXNsT7l65XUnlMUc/kuKZGljggXJAAWfYDU+pZBvBXEhW31+rFq8Q=
X-Gm-Gg: ASbGnct0GDHw8lZWJ39sJQrf6d9Ke5IcsVWWfopSWD5p6ei4edL942tTfkDYgeX8utt
	sohDo8r4AzcXVT8DjB+gEtUea/rpdeN8qaj1ULf0BE03ocnRmGtgBMEF5P0jEH+Mi4J+yxq963R
	Pa/w5h8l7p1TYz6xO+Hz4lKyEeHmeTTyRSdEc0DZDDvOyK4NpI7T99hLa8sPaEC3FFf+TfU9A/5
	j+rORXE9/4RzZxiIPRtsoGV7sNe9DpOmJ+DcIbajlet4HxVlRmGmdwEImxipqDe/bM02oC6sGG5
	1gZf
X-Google-Smtp-Source: AGHT+IGgDCTuXxyE1Ce9iuzVhaTM/jeSa87WbRODLSiXYZ5sQsvdyKc8VfhYoZmPD2oC0EiFlyZLeQ==
X-Received: by 2002:a05:6000:1566:b0:385:f840:e613 with SMTP id ffacd0b85a97d-385fd429c22mr1719988f8f.51.1733224431788;
        Tue, 03 Dec 2024 03:13:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/14] iio: adc: rzg2l_adc: Add support for Renesas RZ/G3S
Date: Tue,  3 Dec 2024 13:13:12 +0200
Message-Id: <20241203111314.2420473-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add ADC support for the Renesas RZ/G3S SoC. The key features of this IP
include:
- 9 channels, with one dedicated to reading the temperature reported by the
  Thermal Sensor Unit (TSU)
- A different default ADCMP value, which is written to the ADM3 register.
- Different default sampling rates
- ADM3.ADSMP field is 8 bits wide
- ADINT.INTEN field is 11 bits wide

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/iio/adc/rzg2l_adc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 634073e7241f..dd2ef8203966 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -525,7 +525,16 @@ static const struct rzg2l_adc_hw_params rzg2l_hw_params = {
 	.adivc = true
 };
 
+static const struct rzg2l_adc_hw_params rzg3s_hw_params = {
+	.num_channels = 9,
+	.default_adcmp = 0x1d,
+	.default_adsmp = { 0x7f, 0xff },
+	.adsmp_mask = GENMASK(7, 0),
+	.adint_inten_mask = GENMASK(11, 0),
+};
+
 static const struct of_device_id rzg2l_adc_match[] = {
+	{ .compatible = "renesas,r9a08g045-adc", .data = &rzg3s_hw_params },
 	{ .compatible = "renesas,rzg2l-adc", .data = &rzg2l_hw_params },
 	{ /* sentinel */ }
 };
-- 
2.39.2


