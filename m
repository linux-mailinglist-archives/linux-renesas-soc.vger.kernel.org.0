Return-Path: <linux-renesas-soc+bounces-2132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9161843CB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09AE01C22240
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD016D1BA;
	Wed, 31 Jan 2024 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FttZaTYi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E3069E09
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696984; cv=none; b=r5lf7iBZBQ3a9ypxJMRchBAxXSfJI6iPCTdXmgaJRX3xnBy9lzzNmZmhevAZZkdxjZBpnUm74Qi292n+U8HJMKLoxSj04ke3nmKK2E8Yu3xDUKAP+M+3IOdCF8UblByVUYqC9Aybokgiv7elmF5aRq4kKdIzZpInwnyu5l4k0oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696984; c=relaxed/simple;
	bh=p0l+lgLWjmzKz7GXbaFwccVzaKR/+3YxWU3+fBEg3To=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gf1GFmuqlYQTyW6vATSrkXecC+WQsgar2Q0iK4OfHdN0zqUqkOdrFIS90w1WgokNoSs4paoLaulkZbfaydwRlLE6uDbPamWBJOv6edw3EXnLwT9SgyTmo+VHdfaVnyrbih31LMsyMgtwz4TZXLyuy5EKAWtaU8ITn2BoWIf/NIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FttZaTYi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so4532732a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696981; x=1707301781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgKvFA/cFIibrDf0plTzRbx0APcUTA89+vLJXcU5S/c=;
        b=FttZaTYiN9H8bp9vK2cyoSoZVMnxLRqs7HVSjeUso/AklhGHyWyECrJeR+KFBK+So3
         ujKxhTThumq6808fR5Uyj85F4uZShX7YKOPDIafPQJJclZWRcYSbQ2o9LILoR8nUXKf1
         hWbE4o4NyvgerbFZkX2uFOsUbSkXFgdqyR/W3BpX3Jb5LFQ0x0+6aIumu2+Hf4zKwUSl
         x3XZZt/Q27jOgIBMbYdYxxFOnsVHexkXpssSwRaNvnPUGXKwxi5LdsWKNYKNJZa9WtiV
         pD5LYznGWytszacxqvlYx5ePTDED3A4tKeI9iHezC80GoyWsyBGt0+atklKL3C1m5Qmn
         c4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696981; x=1707301781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgKvFA/cFIibrDf0plTzRbx0APcUTA89+vLJXcU5S/c=;
        b=mkjVANVSliutFAW82KPs0aG3SDO7ulDmCsLK1JRH/NLEbSW9IFWElEJX9M8rDmZ8mb
         QmXoQJSMmfgyBFhystayLXXfIulmYsqkVBalapVhPSrKyUHe8Jz+kITirFM69sxJVXKE
         a/pGZYI0mM3QnaBc0sYe+WdM62ZG6ktDcELMB5Z/TwTPPGk35a12n2CBbZLB3MQ3U5/t
         +B/C1RdAp0K0u/BOjjBw/gRfZdX+Je8FYnh/klD7wfimdXK+jqLDIIqMMIUKnC9eF+Zs
         ZN96N3stv5ry/WYVRRird/rveSFuyHv6mC5YrhPOAbMSnoUOe+GBaEPYci2mhJaP6bql
         tB4Q==
X-Gm-Message-State: AOJu0YyZ6eAU3aChnpuay71Hl7fbjn7P5559QKbPhuh0ad5mNU5tL1+c
	jtR/O4ZsVdNimsF7XUoE4+FWpYODB37fU/SKqd5PaljNkzntm9Chwucj4H/8MPU=
X-Google-Smtp-Source: AGHT+IGZH/v/Bu5W2LKkI0EIu6OdXLnlN73qtxwIFIFlKMROs2Wq4UCb34rjO37iQLeNTqTv0mCbCg==
X-Received: by 2002:a05:6402:358b:b0:55e:d846:ab4b with SMTP id y11-20020a056402358b00b0055ed846ab4bmr945599edc.20.1706696980847;
        Wed, 31 Jan 2024 02:29:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWBmyi2eVTs4LrFvU5FzkykRNJbiE1M9TVGENQGFFbEvqR6chaoqj8TvClonEQWX7cE5KHLDZ5Ji14p/eNonSmbXlrz6PxQOZQMvmKHWM89lDX4XtBhlRgTM79vGVJPrFFwKyWQPg9U2SLaKGYfRCA0Pv9MIZThvOKt/KGYdvAg8jNiK+o/dHcDgWDJrfjEgyswrKSU8zx1L5wVpHcTMqNHCQpUabtLKcU49uwqQc6A3M8z3aa3GFy6Z3cQsNeCfJIsM9s++QNggENAPydECw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id p16-20020aa7d310000000b0055f3b11d0adsm1618989edq.55.2024.01.31.02.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:29:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a07g04{3,4}: Fix typo for sel_shdi variable
Date: Wed, 31 Jan 2024 12:29:30 +0200
Message-Id: <20240131102930.1841901-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fix typo for sel_shdi variable.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 6 +++---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 075ade0925d4..60f6dfeb328c 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -87,7 +87,7 @@ static const struct clk_div_table dtable_1_32[] = {
 /* Mux clock tables */
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
-static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
+static const char * const sel_sdhi[] = { ".clk_533", ".clk_400", ".clk_266" };
 
 static const u32 mtable_sdhi[] = { 1, 2, 3 };
 
@@ -136,9 +136,9 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2, sel_pll6_2),
 	DEF_FIXED("SPI0", R9A07G043_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 	DEF_FIXED("SPI1", R9A07G043_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
-	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_shdi,
+	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_sdhi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_shdi,
+	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_sdhi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G043_CLK_SD0, 1, 4),
 	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G043_CLK_SD1, 1, 4),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index bc822b9fd7ce..48404cafea3f 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -106,7 +106,7 @@ static const struct clk_div_table dtable_16_128[] = {
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll5_4[] = { ".pll5_foutpostdiv", ".pll5_fout1ph0" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
-static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
+static const char * const sel_sdhi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
 
 static const u32 mtable_sdhi[] = { 1, 2, 3 };
@@ -176,9 +176,9 @@ static const struct {
 		DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2, sel_pll6_2),
 		DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 		DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
-		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_shdi,
+		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_sdhi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_shdi,
+		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_sdhi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 		DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
 		DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
-- 
2.39.2


