Return-Path: <linux-renesas-soc+bounces-11816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A8A00C2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46901619E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88C91FC0EC;
	Fri,  3 Jan 2025 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="k/gZQEJt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A871FBEA9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922313; cv=none; b=TG9v2OpUOB3kX6WLJ7lXDUe6XTzYrBKxsnJ6Br0Spl7Hvmc9QobuT8b3Yt4NThAXL6Blk7q+/QWtfdxBBLm4uXbBrlmhlrhIBucY6NcY5yAOszBGPYwtCJu7FCZ/fHD4L9a+WQZ1oLzSZGfYc+qUVe835wc81a+RV5MpuqKnb1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922313; c=relaxed/simple;
	bh=rKeDJdkJUvYXPSfCRoD0lCN7VYkcnSZTWQUumgyTv/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9ZfsiBsz7OYD3td7CWeg/wbE3RITtP8CXAg9POp/rhzFO6gMi5cYRBOR7VXG9KM7XT3Tb2BlVq9+6tkyr5QAILfOy3BaUAvEfKoaJowCVvqe26qVatrS/kUifcr+py1O3e/Hs0YJKSEdCvWKcoh6I1DRav8OlmBZrclFjaAvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=k/gZQEJt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1941762566b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922310; x=1736527110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=;
        b=k/gZQEJtA+7erqO0VL71gsC9OEB1TUiEe3Dx7ue0FuvNGsZOnEH0+ZryT0kxWczm8M
         XELKmsV1Yjn1bbdjBx/x9anoTcTS8VfmLBMr6+h9Iexrh8iUkih3EwGEZjC8cf0q7BsN
         BpyyqxWZtwlFPs34r//r+6q/y8nNQ3qyV75hW4OrFjzkNmhivEXyasDqwtLkkhPgyilC
         +T0ZbO/EKcuZ2ee41u6udGg2IPQWKmzYgOoLC6OUPBiYKO/wRo0LB/wWudPdtxHZQV03
         YSCKCdEKHXpmPhuVE8gPUMatpoQrgMjZv19Cna20WSqBMOw9zcsrWvqNHgX7bZXJq8Mx
         n/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922310; x=1736527110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=;
        b=H1iBPGJ/+VIY2W3eTl5JbiwHhPf90c5Vr1von3EP2fS0H1S5if2Dp2TWciSBLF5mOn
         XaxIIVa+/caeAFbhJqBNM4Fod559A2E4ssq40Url4HJGNGMM9nFJsu1IcZHKHB0EjOrE
         kHvWA0OLbRhWpuq+zvBWbwrh7+Q7M5NYt2XL9jz/oilfL8HCtvrYXH6eYh+R7uzJWbv+
         Cpz9TjkpOANT0F9x0WNHK+907S8mC8oInmLQW4qOgt6WPZzyCct5BpqgFiLrbbuQ+DQD
         3tID7nEA27qEq4GLIlmVmfU4PTZGL0IYueKG7s6oZ+S4w4/Sc5dsInlGc0RkxJdvLYYj
         cBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuuMkfVYaUCCYahvZpACk1v8Tit0495ggB6YweZlx9dnjaH9ARE+tHEoLp3jNQONbxh2grzvGop1oXKsiyWaODSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZvUqcIuPjK1HzrF1Ui/zOBVIgxX2n7KveesGN0DkoInEsWCA
	VV/vsUljgKSrcr0B7lkGYXAEPUHjd623Lx7RuGOOdqQzT15UXz+ZG8dBhnng6MM=
X-Gm-Gg: ASbGncuGHUxHQt7caI+gLMP3j7Fv5QXr9SOeJ2hAnr4b1ORMcbPXaqmR9YT0HHJeCuA
	Pfu03OMc8QiYP/ESZocPjkHRPSXAG2MWV5WJqoUfY+T2Qcr0fu2V7l7NUT69Jf2KTPW2bdRR1bp
	T0Sn7J7JTv6U+ONKPhyd99yANORRRIiLUmUjR9NLBO59GEhOtAgkPNYJFwNQZbVXXB+jWsf75js
	sUX9m8JhZH14fZKkCdWG80YEjU36PqWbQzfJRObx6ub0NUXxkXpIMWLI6TyRVvIo3uHabRlIoBE
	WQt8D93RDbw=
X-Google-Smtp-Source: AGHT+IEDncREyuqiaeFdEZrch8doNfoioGsr8GniNw17HEMgfl8Mb5jP1IALi9TIgf4Be+b+F0vcRQ==
X-Received: by 2002:a17:907:944f:b0:aac:439:10ce with SMTP id a640c23a62f3a-aac2ba3c11amr5503329166b.27.1735922310189;
        Fri, 03 Jan 2025 08:38:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/6] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the TSU IP
Date: Fri,  3 Jan 2025 18:38:00 +0200
Message-ID: <20250103163805.1775705-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for the TSU IP available on the
Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 0e7e3bf05b52..bc44e08e7eb9 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -241,6 +241,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
+	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -279,6 +280,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GPIO_SPARE_RESETN, 0x898, 2),
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
+	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -353,6 +355,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(4)), 0),
 	DEF_PD("adc",		R9A08G045_PD_ADC,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
+	DEF_PD("tsu",		R9A08G045_PD_TSU,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
-- 
2.43.0


