Return-Path: <linux-renesas-soc+bounces-11175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC869EB80C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464E41627E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C992239786;
	Tue, 10 Dec 2024 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bHzgadTq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A4234974
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850618; cv=none; b=QK5Bg8oQBMoKPwFodNEeVH7Z8xBZIgo13FxZvMP7W8f659JZuln0j+S+JnZZNJJ8L6wjtJr97l2iL/miLjB2dqF6ffVP8LsijwLBw4MHukXQ3bylbYr1keO3FOHfjvFJR304qGEyKi8rbGwAXPgi0OQuDAJzT2BL8moHk1jKoRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850618; c=relaxed/simple;
	bh=OTYVPrJXZsCibJypCZf8QK2KZMdsmtd9T0kWyznh0q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VYgWv7Fp1rKkggWQslalvWkgG164Hkp87SnvHmnOX4/UIPRVO/Uyoj7g47nnFvMD44gaBitC+JPZJyZXUZHCmgpHMbWTHqxiLSuwnkOv+IVQ1xwaSLZUaxDV2iKItGEPHr72JFKMJWVbizdYGRVo9bFXN28PyQZ+shbhrsM8K7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bHzgadTq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so9170536a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850613; x=1734455413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4VjqX7iwW/vu6N1WvzJJpy4sCnLnXPgQs452O7qiog=;
        b=bHzgadTqkHFD23BtqN2KbvqYcbXCWKNUpmCFiMAvclw4XLSAoYgrzQ3jl0PppOLaGC
         2guV1KrjMFb/xNpNtSVhLLhizXZkv/WVqDyhAK4+0zvCiKgaN8qASbW/DZ0ESOVWhcYr
         2mAtA2hpqZtUouIL8PyLmxSVpGapr/QtPWRkV0WIr3etRR7WM4oQ3uj4WFfeig3nJjR3
         RX4aMNwM5coMXfJy0wXFRf8RLOIrtDJelVmkR+EKSp/qt4GRM9CdKxhpTNeHCUhvtPuu
         kMcyUIziiPvWZFq77/6D46/4wGYT0Gm8pWaqHjIPImy5VHEVA5Cr+o1puS89MMbcjWzb
         0nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850613; x=1734455413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4VjqX7iwW/vu6N1WvzJJpy4sCnLnXPgQs452O7qiog=;
        b=OeFLAAA7LR8To6FkPtgISYHbByZKvl+qLgKtoh9XFyQQ/XWC9hirA/dTtnIrs4vM1g
         a0gkGLme38o27TJ+KRKQR9qaNZSOw0OhzLPaRBkIKOhuDLFBibu/2YlXbN8l0jCBwiQ7
         qyUkA6zlEp6vZ3ICjj3xqYUOU4SGqpMIm2i7UBBsu0EaQWCi37YG5EmAhJqt2Ynuw4XY
         J4pVnxiJQP7g1UTIwj6jBEbpAJBK1L17Fo21QEcYCNYFzlSxYXP3dNgDEDWISG07c87S
         zcpbUX8x6IqICq+Ys4tbHgTI0eEM1VOI5nFprf3AOZAaGy5UY5oL5nXv88izfrXC9nZv
         e/4A==
X-Forwarded-Encrypted: i=1; AJvYcCWq3hFl0lQwMPUjlVYPNjBpOxR0ImxmDlTf8BCkzNOtbqktdCOiF7PGmmmqWCst/0s3z+QTeOEpe2f7xTM7IMOkIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Wks9lT6jEkhtjET0PY2TTaRnnYX7FykTsMxhVLSRY2ceGmVg
	rHAboPV38599I0zvaAwiY71ZJCORF/oSQKvYSSJmAbvD9MVh4cbjVRnvGeLhbGI=
X-Gm-Gg: ASbGncuwTZ3h8z2NvBKxeQVaI4yBK1xEsGpFGcz7A9td8OpamSN427iHRjqlMm5+rXe
	KsHnz8YGMMqWaFS3pBeCK6qdOjbMmMVhVz3C3SJztezqbWqvudUEqAKR28slif2MjUbeISJo5I2
	FlpClUHPVHM91enaIMMjyGo/Twf/k1iVYT7XotTyv3VoAt7eM7yoAJR8pJ9iVsbtSvQ8CbZZq9g
	EgUdTzV2+fwBELK+LdMBm+IQ6mFKmOlksAVR7qXgOvzENEAE8tY8DZu4VnAVtifK9x7q0bRHReg
	j5AascQC
X-Google-Smtp-Source: AGHT+IF1pww2qqLE9zMCq4Z4/K+bkG+iAYWr1I2S2Beewnfd6QMcuan64k6kobi5emQ4TB2NMs4iTA==
X-Received: by 2002:a05:6402:13d4:b0:5d3:ba97:527e with SMTP id 4fb4d7f45d1cf-5d4185fea2fmr5584908a12.25.1733850612616;
        Tue, 10 Dec 2024 09:10:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:11 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 03/24] clk: versaclock3: Add support for the 5L35023 variant
Date: Tue, 10 Dec 2024 19:09:32 +0200
Message-Id: <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

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


