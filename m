Return-Path: <linux-renesas-soc+bounces-19219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB2AF9476
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 15:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11D1D1898BCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 13:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516813093A3;
	Fri,  4 Jul 2025 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D9jdVYep"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C6307487
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636623; cv=none; b=XrDwavsw0UT/kZOiRaCY6ot96D33P9/eWW+jzn5ABoF4V6/bLL9ggLI1BWU6f0kfPxTR3TkkGSVxYE+yHbbXDGWCXbedTVKkmdH2epSS+bsPRyk8+mscHpBbMIwmqUjM6foZO60XtjEREzY29tHrzchGVwsM9vPM4o4Uc49uhgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636623; c=relaxed/simple;
	bh=iDNeoFWbnOu6JiRCy33x25V/X/0K/OXRsGRb2l46KKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbT2eapT+jMLPUxPA8qzG/pp8RoZsJFV1a//q0jGrS2DsCP79TIhVBU+HEWsn0BA/2y+jOXSMnM4fFjGhrHtpjRRJQ3qhVC6TKZerpAmddnpd/78H6OceVVb5cGu0cP6iBBjw+vVgE4l2G8pkBxzvGjawbgyMUFnKPQ/pUra1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D9jdVYep; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so1975819a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636618; x=1752241418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJQLhw7UMuVJIuTkgyC29Tps9FrojKr9PAZj69GitMU=;
        b=D9jdVYeppjKc+vwGCWGkcgSoyleJQSHF1CCQElcVyYO8cOEdpm33VdKozEh0IW61Hs
         LswjTaUopnz3kt9P7KODa9nVxdj0Jbr/e90yoY+UkqiiZ2f1lf7agQeu2MNC33p7PA1Y
         tudhzFMuV5mj3gGabvtBLXz6tNWdMWivxVQpq9cHyc01Y/He28sUAvS35LUHUyEc9Mm7
         +iRwmHLWNDoa8ziRZ2/BO/FI0wjCyPe4zrLqRgNNqQLDkEZXlJm004xiH2ExemEfdZ6J
         whtL1z0UjkcBP7tsC7IPgeC0lAqxOR+CJwUot46UBZzn5YwszarsudoExDG9pcoaFkln
         Rr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636618; x=1752241418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJQLhw7UMuVJIuTkgyC29Tps9FrojKr9PAZj69GitMU=;
        b=AAncWySxNVrLMuaDDFDAC3gsg8xO7x98gEmG8JnLvzuh6XjbPFhHhmJQVey7uuVP7N
         XLWvPAxeoKP4Pq+Mlfqnahw6CHcSDr9ZbOwsydKe2UbOlmflPcZiDtMt9bsb3unUwGZI
         LwKRkYUIxXi0VQjw0s01H8WnoDAOkb127kycAHGm8fyVrgq5/HZtDOLmo5znsADqfBrs
         7o/k/CJlta7x0+0wE7AL7LImvnPYDvD6URmtZ3I1nsTFwmICpev1ExMEk912Q+kXbaYJ
         AhPXAC828xcUHKjfXulC1h/EktaNA7NCGzufyPX1+taG48LqWp1/iNwusfVQez16Tu20
         0lgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZu89WNUI7ZoGd2KF8K5ci8LB78gGA2C/G43HI5g5nUvF0JQ0zMTipGzqd18UWqnMSwe6Tj77l0v5qlTvgxNlHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSFLhMtR8tQcEITMw7jKhgVgP7fgC4HY0VclsDaX+D5LOuTqSN
	e04wPIP/wTw4NJhbQRh7xc7n5wsVgNoc4lWlaoeZR5h8pUkre1ApSII2t2CgEYjpLRo=
X-Gm-Gg: ASbGncsoWgd2SiiUHkJSJMVJCgAi/zi/LpNqNRuHo8sTzvIJ8j6UWa4Z5m5jM/Z8Gop
	WPVmFycfNPx2n7q3u2tLsW49KwwGXrdSinL0gr+LZzlNmXwL5CYPXlUHTCCo6lYOoyZG9IJxugn
	g44Tb2D9scFKxnegkNIUuQe1FYk0tVtjjUbspRS9YO3UTqq9PDVlYtOa6Qe4Nnn+SbT0malpRFE
	Bb8S1GM/Dvvvz9Ds4wrsCVwMc/PuhVTJ8o72wu1hXHnWyyqhl0JN7jv/SYsT7OkUx+4mFXrnUPI
	LdOY4uhtCc64OxNQXBq2Lrh2NrxujzclN6zRt/nUvgf8/0VgHbK+u9PUZyEE9uEjW6P4Xi2MfP3
	YMuzm8PHqAg0LwlQ=
X-Google-Smtp-Source: AGHT+IFmnCggGV95WVDV31y5h3M2NpRe97SpRagpCJwbG4xn8d52kLyDjb4REJMt66zNRO1MU6no9w==
X-Received: by 2002:a05:6402:a00f:b0:60c:679e:b957 with SMTP id 4fb4d7f45d1cf-60fcc630848mr2454597a12.1.1751636618016;
        Fri, 04 Jul 2025 06:43:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/3] clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
Date: Fri,  4 Jul 2025 16:43:27 +0300
Message-ID: <20250704134328.3614317-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add MSTOP configuration for all the module clocks on the RZ/G2L
based SoCs (RZ/G2L, RZ/G2LC).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 152 ++++++++++++++--------------
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 2 files changed, 77 insertions(+), 76 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index c851d4eeebbe..8c508e4bcb33 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -242,163 +242,163 @@ static const struct {
 } mod_clks = {
 	.common = {
 		DEF_MOD("gic",		R9A07G044_GIC600_GICCLK, R9A07G044_CLK_P1,
-					0x514, 0, 0),
+					0x514, 0, MSTOP(BUS_REG1, BIT(7))),
 		DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
-					0x518, 0, 0),
+					0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
 		DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
-					0x518, 1, 0),
+					0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
 		DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK, R9A07G044_CLK_P1,
-					0x52c, 0, 0),
+					0x52c, 0, MSTOP(BUS_REG1, BIT(2))),
 		DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
-					0x52c, 1, 0),
+					0x52c, 1, MSTOP(BUS_REG1, BIT(3))),
 		DEF_MOD("ostm0_pclk",	R9A07G044_OSTM0_PCLK, R9A07G044_CLK_P0,
-					0x534, 0, 0),
+					0x534, 0, MSTOP(BUS_REG0, BIT(4))),
 		DEF_MOD("ostm1_pclk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
-					0x534, 1, 0),
+					0x534, 1, MSTOP(BUS_REG0, BIT(5))),
 		DEF_MOD("ostm2_pclk",	R9A07G044_OSTM2_PCLK, R9A07G044_CLK_P0,
-					0x534, 2, 0),
+					0x534, 2, MSTOP(BUS_REG0, BIT(6))),
 		DEF_MOD("mtu_x_mck",	R9A07G044_MTU_X_MCK_MTU3, R9A07G044_CLK_P0,
-					0x538, 0, 0),
+					0x538, 0, MSTOP(BUS_MCPU1, BIT(2))),
 		DEF_MOD("gpt_pclk",	R9A07G044_GPT_PCLK, R9A07G044_CLK_P0,
-					0x540, 0, 0),
+					0x540, 0, MSTOP(BUS_MCPU1, BIT(4))),
 		DEF_MOD("poeg_a_clkp",	R9A07G044_POEG_A_CLKP, R9A07G044_CLK_P0,
-					0x544, 0, 0),
+					0x544, 0, MSTOP(BUS_MCPU1, BIT(5))),
 		DEF_MOD("poeg_b_clkp",	R9A07G044_POEG_B_CLKP, R9A07G044_CLK_P0,
-					0x544, 1, 0),
+					0x544, 1, MSTOP(BUS_MCPU1, BIT(6))),
 		DEF_MOD("poeg_c_clkp",	R9A07G044_POEG_C_CLKP, R9A07G044_CLK_P0,
-					0x544, 2, 0),
+					0x544, 2, MSTOP(BUS_MCPU1, BIT(7))),
 		DEF_MOD("poeg_d_clkp",	R9A07G044_POEG_D_CLKP, R9A07G044_CLK_P0,
-					0x544, 3, 0),
+					0x544, 3, MSTOP(BUS_MCPU1, BIT(8))),
 		DEF_MOD("wdt0_pclk",	R9A07G044_WDT0_PCLK, R9A07G044_CLK_P0,
-					0x548, 0, 0),
+					0x548, 0, MSTOP(BUS_REG0, BIT(2))),
 		DEF_MOD("wdt0_clk",	R9A07G044_WDT0_CLK, R9A07G044_OSCCLK,
-					0x548, 1, 0),
+					0x548, 1, MSTOP(BUS_REG0, BIT(2))),
 		DEF_MOD("wdt1_pclk",	R9A07G044_WDT1_PCLK, R9A07G044_CLK_P0,
-					0x548, 2, 0),
+					0x548, 2, MSTOP(BUS_REG0, BIT(3))),
 		DEF_MOD("wdt1_clk",	R9A07G044_WDT1_CLK, R9A07G044_OSCCLK,
-					0x548, 3, 0),
+					0x548, 3, MSTOP(BUS_REG0, BIT(3))),
 		DEF_MOD("spi_clk2",	R9A07G044_SPI_CLK2, R9A07G044_CLK_SPI1,
-					0x550, 0, 0),
+					0x550, 0, MSTOP(BUS_MCPU1, BIT(1))),
 		DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
-					0x550, 1, 0),
+					0x550, 1, MSTOP(BUS_MCPU1, BIT(1))),
 		DEF_MOD("sdhi0_imclk",	R9A07G044_SDHI0_IMCLK, CLK_SD0_DIV4,
-					0x554, 0, 0),
+					0x554, 0, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi0_imclk2",	R9A07G044_SDHI0_IMCLK2, CLK_SD0_DIV4,
-					0x554, 1, 0),
+					0x554, 1, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi0_clk_hs",	R9A07G044_SDHI0_CLK_HS, R9A07G044_CLK_SD0,
-					0x554, 2, 0),
+					0x554, 2, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi0_aclk",	R9A07G044_SDHI0_ACLK, R9A07G044_CLK_P1,
-					0x554, 3, 0),
+					0x554, 3, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi1_imclk",	R9A07G044_SDHI1_IMCLK, CLK_SD1_DIV4,
-					0x554, 4, 0),
+					0x554, 4, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("sdhi1_imclk2",	R9A07G044_SDHI1_IMCLK2, CLK_SD1_DIV4,
-					0x554, 5, 0),
+					0x554, 5, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("sdhi1_clk_hs",	R9A07G044_SDHI1_CLK_HS, R9A07G044_CLK_SD1,
-					0x554, 6, 0),
+					0x554, 6, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("sdhi1_aclk",	R9A07G044_SDHI1_ACLK, R9A07G044_CLK_P1,
-					0x554, 7, 0),
+					0x554, 7, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("gpu_clk",	R9A07G044_GPU_CLK, R9A07G044_CLK_G,
-					0x558, 0, 0),
+					0x558, 0, MSTOP(BUS_REG1, BIT(4))),
 		DEF_MOD("gpu_axi_clk",	R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
 					0x558, 1, 0),
 		DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
 					0x558, 2, 0),
 		DEF_MOD("cru_sysclk",   R9A07G044_CRU_SYSCLK, CLK_M2_DIV2,
-					0x564, 0, 0),
+					0x564, 0, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("cru_vclk",     R9A07G044_CRU_VCLK, R9A07G044_CLK_M2,
-					0x564, 1, 0),
+					0x564, 1, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("cru_pclk",     R9A07G044_CRU_PCLK, R9A07G044_CLK_ZT,
-					0x564, 2, 0),
+					0x564, 2, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("cru_aclk",     R9A07G044_CRU_ACLK, R9A07G044_CLK_M0,
-					0x564, 3, 0),
+					0x564, 3, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("dsi_pll_clk",	R9A07G044_MIPI_DSI_PLLCLK, R9A07G044_CLK_M1,
-					0x568, 0, 0),
+					0x568, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_sys_clk",	R9A07G044_MIPI_DSI_SYSCLK, CLK_M2_DIV2,
-					0x568, 1, 0),
+					0x568, 1, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_aclk",	R9A07G044_MIPI_DSI_ACLK, R9A07G044_CLK_P1,
-					0x568, 2, 0),
+					0x568, 2, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_pclk",	R9A07G044_MIPI_DSI_PCLK, R9A07G044_CLK_P2,
-					0x568, 3, 0),
+					0x568, 3, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_vclk",	R9A07G044_MIPI_DSI_VCLK, R9A07G044_CLK_M3,
-					0x568, 4, 0),
+					0x568, 4, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_lpclk",	R9A07G044_MIPI_DSI_LPCLK, R9A07G044_CLK_M4,
-					0x568, 5, 0),
+					0x568, 5, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_COUPLED("lcdc_a",	R9A07G044_LCDC_CLK_A, R9A07G044_CLK_M0,
-					0x56c, 0, 0),
+					0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 		DEF_COUPLED("lcdc_p",	R9A07G044_LCDC_CLK_P, R9A07G044_CLK_ZT,
-					0x56c, 0, 0),
+					0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 		DEF_MOD("lcdc_clk_d",	R9A07G044_LCDC_CLK_D, R9A07G044_CLK_M3,
-					0x56c, 1, 0),
+					0x56c, 1, MSTOP(BUS_PERI_VIDEO, BIT(9))),
 		DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
-					0x570, 0, 0),
+					0x570, 0, MSTOP(BUS_MCPU1, BIT(10))),
 		DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 1, 0),
+					0x570, 1, MSTOP(BUS_MCPU1, BIT(10))),
 		DEF_MOD("ssi1_pclk",	R9A07G044_SSI1_PCLK2, R9A07G044_CLK_P0,
-					0x570, 2, 0),
+					0x570, 2, MSTOP(BUS_MCPU1, BIT(11))),
 		DEF_MOD("ssi1_sfr",	R9A07G044_SSI1_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 3, 0),
+					0x570, 3, MSTOP(BUS_MCPU1, BIT(11))),
 		DEF_MOD("ssi2_pclk",	R9A07G044_SSI2_PCLK2, R9A07G044_CLK_P0,
-					0x570, 4, 0),
+					0x570, 4, MSTOP(BUS_MCPU1, BIT(12))),
 		DEF_MOD("ssi2_sfr",	R9A07G044_SSI2_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 5, 0),
+					0x570, 5, MSTOP(BUS_MCPU1, BIT(12))),
 		DEF_MOD("ssi3_pclk",	R9A07G044_SSI3_PCLK2, R9A07G044_CLK_P0,
-					0x570, 6, 0),
+					0x570, 6, MSTOP(BUS_MCPU1, BIT(13))),
 		DEF_MOD("ssi3_sfr",	R9A07G044_SSI3_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 7, 0),
+					0x570, 7, MSTOP(BUS_MCPU1, BIT(13))),
 		DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
-					0x578, 0, 0),
+					0x578, 0, MSTOP(BUS_PERI_COM, BIT(5))),
 		DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
-					0x578, 1, 0),
+					0x578, 1, MSTOP(BUS_PERI_COM, BIT(7))),
 		DEF_MOD("usb0_func",	R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
-					0x578, 2, 0),
+					0x578, 2, MSTOP(BUS_PERI_COM, BIT(6))),
 		DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
-					0x578, 3, 0),
+					0x578, 3, MSTOP(BUS_PERI_COM, BIT(4))),
 		DEF_COUPLED("eth0_axi",	R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
-					0x57c, 0, 0),
+					0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 		DEF_COUPLED("eth0_chi",	R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
-					0x57c, 0, 0),
+					0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 		DEF_COUPLED("eth1_axi",	R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
-					0x57c, 1, 0),
+					0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 		DEF_COUPLED("eth1_chi",	R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
-					0x57c, 1, 0),
+					0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 		DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
-					0x580, 0, 0),
+					0x580, 0, MSTOP(BUS_MCPU2, BIT(10))),
 		DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
-					0x580, 1, 0),
+					0x580, 1, MSTOP(BUS_MCPU2, BIT(11))),
 		DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK, R9A07G044_CLK_P0,
-					0x580, 2, 0),
+					0x580, 2, MSTOP(BUS_MCPU2, BIT(12))),
 		DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK, R9A07G044_CLK_P0,
-					0x580, 3, 0),
+					0x580, 3, MSTOP(BUS_MCPU2, BIT(13))),
 		DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 0, 0),
+					0x584, 0, MSTOP(BUS_MCPU2, BIT(1))),
 		DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 1, 0),
+					0x584, 1, MSTOP(BUS_MCPU2, BIT(2))),
 		DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 2, 0),
+					0x584, 2, MSTOP(BUS_MCPU2, BIT(3))),
 		DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 3, 0),
+					0x584, 3, MSTOP(BUS_MCPU2, BIT(4))),
 		DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 4, 0),
+					0x584, 4, MSTOP(BUS_MCPU2, BIT(5))),
 		DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
-					0x588, 0, 0),
+					0x588, 0, MSTOP(BUS_MCPU2, BIT(7))),
 		DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
-					0x588, 1, 0),
+					0x588, 1, MSTOP(BUS_MCPU2, BIT(8))),
 		DEF_MOD("rspi0",	R9A07G044_RSPI0_CLKB, R9A07G044_CLK_P0,
-					0x590, 0, 0),
+					0x590, 0, MSTOP(BUS_MCPU1, BIT(14))),
 		DEF_MOD("rspi1",	R9A07G044_RSPI1_CLKB, R9A07G044_CLK_P0,
-					0x590, 1, 0),
+					0x590, 1, MSTOP(BUS_MCPU1, BIT(15))),
 		DEF_MOD("rspi2",	R9A07G044_RSPI2_CLKB, R9A07G044_CLK_P0,
-					0x590, 2, 0),
+					0x590, 2, MSTOP(BUS_MCPU2, BIT(0))),
 		DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
-					0x594, 0, 0),
+					0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
 		DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
 					0x598, 0, 0),
 		DEF_MOD("adc_adclk",	R9A07G044_ADC_ADCLK, R9A07G044_CLK_TSU,
-					0x5a8, 0, 0),
+					0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),
 		DEF_MOD("adc_pclk",	R9A07G044_ADC_PCLK, R9A07G044_CLK_P0,
-					0x5a8, 1, 0),
+					0x5a8, 1, MSTOP(BUS_MCPU2, BIT(14))),
 		DEF_MOD("tsu_pclk",	R9A07G044_TSU_PCLK, R9A07G044_CLK_TSU,
-					0x5ac, 0, 0),
+					0x5ac, 0, MSTOP(BUS_MCPU2, BIT(15))),
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 0a71c5ec24b6..55e815be16c8 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -34,6 +34,7 @@
 #define CPG_BUS_PERI_COM_MSTOP	(0xB6C)
 #define CPG_BUS_PERI_CPU_MSTOP	(0xB70)
 #define CPG_BUS_PERI_DDR_MSTOP	(0xB74)
+#define CPG_BUS_PERI_VIDEO_MSTOP (0xB78)
 #define CPG_BUS_REG0_MSTOP	(0xB7C)
 #define CPG_BUS_REG1_MSTOP	(0xB80)
 #define CPG_BUS_TZCDDR_MSTOP	(0xB84)
-- 
2.43.0


