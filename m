Return-Path: <linux-renesas-soc+bounces-18666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90555AE6D97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AFCF1BC6514
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD042E8E03;
	Tue, 24 Jun 2025 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuTrj5fZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685D2E7F15;
	Tue, 24 Jun 2025 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786244; cv=none; b=h3PrgSd+V4IJyAeO1x3t1b3JYusUnuOhLwVHnMiNErRtIOFAjKa0omnARFH6pliaJKZ2WYQ1sOHd3Ron8m4M+q3DbiGTomic4axTO7qYWXgsuwcQbeOXkoSsLGDcW+US+94zGPgchG0nbDz52zGmklcdi390UqGreh/dY/l+d2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786244; c=relaxed/simple;
	bh=bVpyKh2OGLR1IfVlI82c34tSoNUWSnovZDukhTkq9hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+5srF+36nuuw8tpW1GjZkCk6cM1nIQBrmONKJIP30Go320GtNpy8Z3MDzZ0Jh2gBcCtBU5Xthjs6tcuu4pQ2IN2r3wcVnRsH7ytXgl+DIyvb8iL/LYAypbEoH/PBkO9d8o6dKK4+Eb0cJAa71XJ5tIX0eNZplb1qGaGyXyu2/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuTrj5fZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so31603715e9.2;
        Tue, 24 Jun 2025 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786241; x=1751391041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sizNG302uNzqBwHnfp9gUMkakWcmyU9KTTtYGCYjjI=;
        b=OuTrj5fZHmufzcFFz7tIfhfJauny5yz35mMsObEnvFu+zcrn0zZbCHp6IUHsj8BZKr
         pdipQiXaJBpvKEukWBz0mxpqlw/nWoSXaVG7sUVnSQVn9lcW9Vp747g7X/q4HsuaJQR4
         SyEjsuDWrm/N/D+mtyyCIq+iomM0TSoGTUvABVAF2wExBcshEqhsaUALs0uCKejHMLGz
         WWJT0Z2Tq4JQtDt+iqnWvHIvZKydnnb9bvr6NIwAwAbIYoIRA2AQDtCgTf+LtwBtNhHO
         ltoPknh2R3d3h5n/goCMmLg89/A4FHTLDRfcQQax1+aYEhRDEUxLBn7Ag4Pk7ZJrNK+B
         9fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786241; x=1751391041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sizNG302uNzqBwHnfp9gUMkakWcmyU9KTTtYGCYjjI=;
        b=kUaX/ogNUJ8IgexrdRp7fQdcWqfyI7FFQR0jkYm8iVQAUmVrwGS6R2y8vLAisRtCkI
         kZxg283tZzSQFWIFPqVt85FLT0BRFM9aw9t2p9sYcdkLT9R0CqQZchDd9+1bAH5rYjEK
         DcAlxPniDxr1CLO+HCIaFGz7jbwl2jmUY+ozwvNbNPGBgOmHzgZ0Z+QCyhHqOCpa1nLP
         wzuM2VQZbHgqpioYCLSZjiSoxJlnAJjEBfZsZmkWL8m3MvBbW9K7b2YmVVlwF98wJ9Vt
         w+j97oAQjkB41jTeuUnRcbXbwXLN934iG4C4zydJ2Q8BGEfh1ZGxWAT4BBIxA3kZEblU
         LVIg==
X-Forwarded-Encrypted: i=1; AJvYcCVYe9oTwGBARy6z05+BAg2+UvT9kRQP4Z2bKmffyxOHKhx6QVim+Nssas2q52Mz36D794T/gKfXo9X8@vger.kernel.org, AJvYcCWfIc4tR6NTuapHu0wFdTJipnmSY0yKc2C1tRW1JceRe76MPJGEpt5UkTJ/2qJQzCPuG0LykbmjK7trHs3Z@vger.kernel.org, AJvYcCXCVake5KoAznxWw8z6MSK4a3ISXrKUlN4W/LkFQULvruGkJMSEJsyllBXxbDjoI34X9v46pUywLEWu@vger.kernel.org
X-Gm-Message-State: AOJu0YxfW77UlOhcmAemPoXDpZTdHTwvmKyQJLXhNHQ5S22aiMEcubCu
	zmU0mqFNsP2aSQM/KpKV35dT1vKb6ikLCrw+XIbQcB0tDOemoNo7/nhL
X-Gm-Gg: ASbGnctY2csRhP2h1u9joW0Du6g9zMS1rtemiD225bgHi7moyeSNIjBU2jrqBZhAw1o
	iZV7UeOUjV+1DIpR2+KttKT8ltLlZFOyQXFk+Ubxn64rSJESFRdHZh7/z1IcMxWFsRBAf9GmCPn
	i2ujzjHPK6kwI5OgfLWQw1R5rZYS5boEUbMRMhsT9VgaCH0Kq3DGw+AUDKYOVINLN9m9EEygIFd
	nrOyOh+t7cGWTBwQ+CZRIgs7h9qoZ926D9Bu73jEBCqx7oOnV8YAKmj8hysYln03nPzPwWbbIuL
	YR3NtqLE/8FvpvW0myMJY0xVpNf5cPNLx0xBufrPS01/ExjOZqEz0ddRTI2CzPYEMybCpmy/b/P
	iB0B3Inp9kWA6dJ13uO4n
X-Google-Smtp-Source: AGHT+IGVwaFG2zwbfdjJCGhHl2fr6igkI5o4Pnd2sZaB9w5IHAowPOOtyUGrl+22pchXIJm3NSuXtA==
X-Received: by 2002:a05:600c:1c27:b0:453:62e9:125a with SMTP id 5b1f17b1804b1-4537a2f1c30mr62382915e9.18.1750786240629;
        Tue, 24 Jun 2025 10:30:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] clk: renesas: r9a09g057: Add XSPI clock/reset
Date: Tue, 24 Jun 2025 18:30:30 +0100
Message-ID: <20250624173030.472196-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the XSPI interface on the R9A09G057 SoC.

While at it, rename CLK_PLLCM33_DIV4_PLLCM33 to CLK_PLLCM33_GEAR to align
with the terminology used in the hardware manual.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 39065d63df61..687c25f76852 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -36,8 +36,8 @@ enum clk_ids {
 	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
-	CLK_PLLCM33_DIV4_PLLCM33,
 	CLK_PLLCM33_DIV16,
+	CLK_PLLCM33_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
@@ -134,7 +134,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
-	DEF_DDIV(".pllcm33_div4_pllcm33", CLK_PLLCM33_DIV4_PLLCM33,
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR,
 		 CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
@@ -189,10 +189,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2,
+			     FIXED_MOD_CONF_XSPI),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
-	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_DIV4_PLLCM33, 0, 0, 0, 0,
+	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_GEAR, 0, 0, 0, 0,
 						BUS_MSTOP(5, BIT(9))),
 	DEF_MOD("dmac_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 1, 0, 1,
 						BUS_MSTOP(3, BIT(2))),
@@ -258,6 +260,12 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(1, BIT(7))),
 	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
 						BUS_MSTOP(1, BIT(8))),
+	DEF_MOD("spi_hclk",			CLK_PLLCM33_GEAR, 9, 15, 4, 31,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_aclk",			CLK_PLLCM33_GEAR, 10, 0, 5, 0,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_clk_spix2",		CLK_PLLCM33_XSPI, 10, 1, 5, 2,
+						BUS_MSTOP(4, BIT(5))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
 						BUS_MSTOP(8, BIT(2))),
 	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
@@ -380,6 +388,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
 	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
+	DEF_RST(10, 3, 4, 20),		/* SPI_HRESETN */
+	DEF_RST(10, 4, 4, 21),		/* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
-- 
2.49.0


