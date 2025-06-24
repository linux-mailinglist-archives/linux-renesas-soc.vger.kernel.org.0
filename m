Return-Path: <linux-renesas-soc+bounces-18663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FECAE6D8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 320CE3BC282
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F0B2E6D3E;
	Tue, 24 Jun 2025 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7IOj3hD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BF32E174A;
	Tue, 24 Jun 2025 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786240; cv=none; b=VZYhf90IA21LRwRY4kiG5P/lyb2NP/yBkI4tShWUhzoV3czKLqIJhEAymSScRbP51VjOuWMy3KTpJEDGG75Z3JPEiQTaIYbMcJoJU86fVnSdL/TIIzDZq5zKxvIfvT3ZCef2CX+Ya3ZOjZDYG2Wk4VtHwKCG18nfl/7/h6CO6H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786240; c=relaxed/simple;
	bh=l/vVJyND3aoVunSgh11DPC7260RGdTfh3kb4Ckw8MUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjQpTbpLCdl/GZ76l7Hg4WcLYOZar+83R9ivzdNnnuq3reJYUyNzUwUSOF1OcSagC242uv/YZYrhxEPw6ZtsZEeBECo3uLKRx0ApkBUNSi69vBYxiuF8taAzQ+xcVy+HC7cid7W40SfYgk6s5cz4uIendDGyYOp/Zo0dbCfmsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7IOj3hD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso623735e9.0;
        Tue, 24 Jun 2025 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786237; x=1751391037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luq8LQ/Sk4swSZCdRuUf69fldpW53iaSlHmnWlANK1w=;
        b=f7IOj3hDk6yx8azDtTrchYTu7QkslDoPCjmRpUOS2OVNayQ/ijyeNpmvXnMLJKpbOw
         EwcLL8oRfp9h81asXMiBralEmCIkVttO1PBR0DWCkMd/aBEIvqf/G3FcKQO9WOLaCwsT
         JAqdnpFCTZEXJkNUmF1fFZgtyL7i5c5PDN78GGA1lQLK1RM/14SYKqzufRknT1VweqxV
         xZV05B7gpoVTsb1zwjD8eOIKsimgsaMeH1TiB2zMTLR9l32m8v4ay2F1SkP3OaLYcqEX
         9d3epwk2dP1L6DVANQ3ZXnyeit6KHEq1ya5DPGoPPczSDK0Lin7tUz97AD7VqkVrecnO
         DhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786237; x=1751391037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luq8LQ/Sk4swSZCdRuUf69fldpW53iaSlHmnWlANK1w=;
        b=nduKTkUmi6TeTwmzYbd/5R72JUydtplcAn65skiqqopfHDg0deBMV7KhyJ5ZOB4Z6J
         b6z1Cl4Nd1xOJaulf6S/+MdHfLcXcVoT2SFoZMgyBxnoT8RVXXYoVpWrDgNbSrCfPfFD
         JLJ3ELL1zRAJFwradLT6XNyPu0Ch54VqHtTqyjjBfTFk6iI4C4dUS6OTk2QoZ43U5yfD
         SOaa5FB3jrib44miWqj1SsMSXhgTnvVUp3KHYYu+AOepSXWBTZGzgtGiGWgEVFyWwVaM
         oVHU0x3c8/SVg4SWNgbbD5eq9X96d7+G3QUL9YbiHOO7NaE+8M/Ay2KgwGczwxsLM9pN
         BryA==
X-Forwarded-Encrypted: i=1; AJvYcCV1twckTMqn2EHHrYro+JSptYpaULWZlv/h2UVcn22FW+ksiupIOfbKIT0GVUwIMHVec15gBaTiNcH9@vger.kernel.org, AJvYcCViEUGPoC19NImbXN0hKdGUUixZi+Q4N4WnVZpCSw2AvixKxux4BNBII6ems53+VcH3bEuj0iDyfR1m@vger.kernel.org, AJvYcCXpgMVq72uYChnpgkKiJ3czP16oWvX7ESa7M6PBYdQrulhnJOY7XRW1NN5IHZwsu5r8dxX+WH/5vdVKqZIh@vger.kernel.org
X-Gm-Message-State: AOJu0YyHKxKkLYnZTOgy7yb0X4ijiD4bN/+DVzu3u7EI/B9DE5puVbxY
	g1VNGmASZLhIKdtry/WvthcT1S21U0YaWEmqApHTvx8SLKIHEGJpCk26
X-Gm-Gg: ASbGnctpDos2awclhvkMTb14kC4FOVgWiPeCji4drKhlnwdYpHlHVIjIBooVm68fosa
	QKLWwkWUI7+AWSh9sSnIl4aVYBI+9EKz5diac2RHDZzoXVdscwsZzqezdcHSJ5X5b1tW5NzEDA6
	dROmrayokuZ6nuN7mTBVn6TBSliDuFzoLA3vxzRmmUIsAjzb9fjZxMFT8TJW4b9ZdlTyHyrFqiO
	52moEwrfJ2bW+nacIfOlC1353Y1dJEHoIR/6uoMsRzm9zXh5ykqLf5qQDaozaKQi7VSi+kzPb+T
	9SIq/Rw7vHMhO9gbUCEz9DD7+2QxCiOeE/WLTU+RbmHrzw8/faQ0dKlek286GV0HrYkRb5KMuBg
	hXGRa7wFevhWaPuvC4Wcr
X-Google-Smtp-Source: AGHT+IFCCLW/JiGEeOvp8jfgqeOZBKEfYo5R3b0PNhVie8ASPNtfyEuDUx6mcxIaAYS4BtU3Tn2XQg==
X-Received: by 2002:a05:600c:46c6:b0:451:df07:d8e0 with SMTP id 5b1f17b1804b1-4537b77f48bmr45295675e9.11.1750786236901;
        Tue, 24 Jun 2025 10:30:36 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:36 -0700 (PDT)
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
Subject: [PATCH 3/6] clk: renesas: r9a09g057: Add support for xspi mux and divider
Date: Tue, 24 Jun 2025 18:30:27 +0100
Message-ID: <20250624173030.472196-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The mux smux2_xspi_clk{0,1} used for selecting spi and spix2 clocks and
pllcm33_xspi divider to select different clock rates. Add support for
both.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index da908e820950..39065d63df61 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G057_GBETH_1_CLK_PTP_REF_I,
+	LAST_DT_CORE_CLK = R9A09G057_SPI_CLK_SPI,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -33,9 +33,14 @@ enum clk_ids {
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
+	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV4_PLLCM33,
 	CLK_PLLCM33_DIV16,
+	CLK_SMUX2_XSPI_CLK0,
+	CLK_SMUX2_XSPI_CLK1,
+	CLK_PLLCM33_XSPI,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -78,6 +83,14 @@ static const struct clk_div_table dtable_2_4[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -99,6 +112,8 @@ static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
 static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
+static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
+static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
 
 static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -116,10 +131,16 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
+	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_DDIV(".pllcm33_div4_pllcm33", CLK_PLLCM33_DIV4_PLLCM33,
 		 CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
+	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
+	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
+		  dtable_2_16),
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
-- 
2.49.0


