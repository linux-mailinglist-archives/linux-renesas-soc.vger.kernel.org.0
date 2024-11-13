Return-Path: <linux-renesas-soc+bounces-10488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E789C70D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 14:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 667DA28A06B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 13:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E467201264;
	Wed, 13 Nov 2024 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kKnKaG2b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03873201013
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504957; cv=none; b=rYGDS5lrVv80PwdHWQAtPSo1vVysMmAtTB1GWNx6seX0CuYrYgL3Qaw5Td4JxMzrYa2O2CjyGs+vi1yu8ba/tdKPwkBVK65taGCLGSAI7L+hVGmMmdE+oCmFxY6hd3c+gRMXn+46aTlDF+Zy/P6Mr84PQzHzWNvH+ieADqI11JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504957; c=relaxed/simple;
	bh=TSqSzOs8Q7BMfa4saTar0ZRCzZC0f5vyfoNlajUePmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XPVGauVxJjz39j4RVr91IuqIhpJwmrmI4WU/vwE8gBdvTmtwPxfLoy/k9UY0zcSjUgqSgxP0hLqIzxI+/BRvQrLZnsYaP45kEL/CoSwn3Z8zDgK1xaw2AAMMTeTB/DiqaStFMdNtiCAvbBgLvMPi3W1h4hjglHM3N29VQbJRQgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kKnKaG2b; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so56430075e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504953; x=1732109753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sa3H1f/E/g0KGrtcmKvCv12Jkl936NP4UC4pZY9H8c=;
        b=kKnKaG2bzadX4UwnSHcO8CXdNKaiWXHMAVYJjthK0gAm4HGIEwiS0S6a1FQlnCWKvK
         mNQEGpr8XrymSvEXG5VCV3TIuXqORXY2gfnLe5YeZIW45bGeRkKfsygEiqe80N6y5gvL
         C4kyjkwszwb1acrefO+dw/WUYQ8hvnVKOPnrW4juTm14naOmdvlb+waV3CwD6NMmY1F9
         Dzzz45vCwvgRMEyvLYlffysmTlH0HYekWmY/YBxdkAFyScobNGf62mcvjW+/hOgWAh4N
         HGzP769AZ7qojvnslMrrkOPMjW+n6dmwE+TJ2RxsWSwen1NZZhFE7DPGi7DRt7wREFFZ
         KbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504953; x=1732109753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Sa3H1f/E/g0KGrtcmKvCv12Jkl936NP4UC4pZY9H8c=;
        b=SjDAQaal3uW0f6Au6Xzaj8WvkwRjP5jaS2ud5Yx0DEf2lqnK1Sn0hhW8fNL5NeDxNi
         vTYbUSBJh6TO33Xr2vFMLN/0OgJA0ju17lbj5a2wqZXiAznLgPzI+U1agwTXNczpuTdH
         cb0bZFGi9h281ha90mwNdBg06dO60ucOHSq3ack/FeQpLll/TumzOAKDSTZBPygPKds9
         9e9osQbKaAVODRgVcfWPHtTTniOOqp2ISr44ianswXQfKl8iNVIlAcw1r247/aL3QYBA
         1Mp+AGOM4vm1ahBOTDiKwWUhFUAcsGZU1m7V4ekD6pCKvMUJmEyTZA+Z0iw49tXkxlG0
         vWlQ==
X-Gm-Message-State: AOJu0Yw/oL76fvj9RMgJhnrvuKMD1+VzNhNSNE7jbY5DRNGaonngDWwo
	E6Fm+nnbfZ7qgQTmL8LXJDD9gSNfri+T+xHgzendx/Eo4plS87T41PdN0w8tCG8=
X-Google-Smtp-Source: AGHT+IEYHJzqM5FW299ZAdbK6T7DVikcehfuphKy8vP+A1ZGKFW5gkq6w5nT2ifGCWhjngi1zECKUQ==
X-Received: by 2002:a05:600c:4e0e:b0:431:59b2:f0d1 with SMTP id 5b1f17b1804b1-432cce6825amr58718565e9.4.1731504953372;
        Wed, 13 Nov 2024 05:35:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 04/25] clk: versaclock3: Add support for the 5L35023 variant
Date: Wed, 13 Nov 2024 15:35:19 +0200
Message-Id: <20241113133540.2005850-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add support for the 5L35023 variant of the Versa 3 clock generator.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/clk/clk-versaclock3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1398d16df5d0..9fe27dace111 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p = {
 	.se2_clk_sel_msk = BIT(6),
 };
 
+static const struct vc3_hw_cfg vc3_5l = {
+	.pll2_vco = { .min = 30000000UL, .max = 130000000UL },
+	.se2_clk_sel_msk = BIT(0),
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
+	{ .compatible = "renesas,5l35023", .data = &vc3_5l },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2


