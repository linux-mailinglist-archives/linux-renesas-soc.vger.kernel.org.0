Return-Path: <linux-renesas-soc+bounces-17054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44449AB58F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012FE1894FA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140CA2BE7AC;
	Tue, 13 May 2025 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf917HXh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30A245008;
	Tue, 13 May 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151206; cv=none; b=Sf9vgy4b2vYaXV2wWMQNQSW9U5y/0bJ6H4DrFd0C9kIB3r7wc184IikYYOAoEKsPXQnceJnefDFp4AGFPtJNlIAf/+ssoFRcuJ1IrONp37hMF9os885evGYqQZ32ne6D9W+jI0FihvcDQbAakNomWQUCBfFIlM4bEX9OCGCypw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151206; c=relaxed/simple;
	bh=Rp+eIdADM/nkDaSGzqkO3OHPcwqxVLISWejxOsH3XFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMDXXxqdtOLPDCjeKzywDKnrqEzWH5H9BiTQO2th8hRjKCNcGY2UQPjjegGk4ZamznIA+IcKdk/CX77EA8UCgWuYm4un8KuALDHds89gu9/Rw+dfTPqLURHQ+k/kZFrbELaNwkOXa47tVfCBvmLClPgrTtQYpNvJOyhxiiUNZuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf917HXh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso37924555e9.0;
        Tue, 13 May 2025 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747151201; x=1747756001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOxHk/73nK91rx9FCQs18rpM0IVD1C67FeXMDSvIFJI=;
        b=Bf917HXhEqmWEs6H5VyNKZK1dlOhiOcTcgdjMFq7CzXkLa+BOmwxF9G6ePXI8u3gj1
         KLzM8fs8xTZkoIRGi7/SmXnvPJUShExfalmgFgwGX1o5fF4LRG/gFA241UWljVSlJFaD
         +DyRo3DISd64tf3QAJ8d8hyCQmuLcTZzAoTgkyYNAONPnOObMNGEQq7ESkNKQg5BbPT8
         PVp1tNhH9aCocTQpauVOgIfvOVDUHUrkhatc1Go+E+3vhFGNwemnkZVFHbQBLViENtHV
         edySA13yDTjPPWbSjdXmKO02nsNP8iFYskfxnYzmgqPvU+L7zuIEZ3ounc4Zqbm5jY4b
         /bMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151201; x=1747756001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOxHk/73nK91rx9FCQs18rpM0IVD1C67FeXMDSvIFJI=;
        b=MAA/+E41E7cWA/4nyMa4jxVelgdR0Cm6kZvvnwoqo3xfxnFEbTUiebovrwLcm3HraG
         eR9JzLzbZnPjuxmyGVLm3xWHaWNAYf/bzgx1IoIq3quGq0S5c8F4r4aAP0jsQiNT1Cdq
         Paq5FIyXNY38yaC8gqG1+YmIF+q/y7+P0sQ9ak3+L87oFtL7Vw8pM3hUYlUDcLbYaURd
         q2L0OhiSYGVS+vpU3Jlw+6qLzX6AudnkbmLXUvlPCQczS8dnDOFLvR9YeH4xstrBXjW1
         xfUPyOrKeAMi+Ulq59wzuGS2dnSJ2VqzvztCbBZJ2TiuluIqUn+4S3T9WWT4Qk0m7BRo
         eTRw==
X-Forwarded-Encrypted: i=1; AJvYcCXMSQbc4r/pK1FQrcCQszwR7pEzcnBgvmY/WSSRl5NWfok+rODCgbDtRhjjijze2abjCocUf00hqZKW9+c=@vger.kernel.org, AJvYcCXt0KUcb01gx2GajoXUFlxCOI5BNHpKRlfk3A80aearT3V08txaVpErPu8WcEtsqoOnyu6zPiCppz1BebG34/4JYNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxke9X4fWKU2dSLR1SHRhZ56PKy0/mPi5rF0+7JrF8p3c0LTUmU
	JUwLxXwzy6qQCadq3EVqIxGgajSgKoaJJ+/nbt8JyBgVcAT25e4kIuUgVqmW
X-Gm-Gg: ASbGncup8u+gn+IaHESfqTneSP21cSf+Anz5UJIuTKWZqyGx3myqB4AI1TCyqSN+SiR
	Kwsc9qp2b35Mwik/FlETYeT0edzRj2bURFgOfiOJW9lNFmEyo+wZm3tRWRVfpPMXfqVjDoTUZjg
	cKrP9iDvqnp69xt/ys6F383OTxsKgkrtgDmoDGBsktl1Xp/OR0e5/09uOml8TifXA/txtWcWz9m
	wulYhSMSQp7xCFQGp8Wn1Yon8t95YOQTju9aiw9ophs5nW3qOVhx9XqWJPfUgZWrW40LEglj6H4
	0akUDlPqc2vagfD5RzbL/W9rJr3oLWQ4wyKAcFrGDWYCC4bdiWXbShaTe3+7X7MLT0lXMwFolCk
	QgTFQlsNZ4Q==
X-Google-Smtp-Source: AGHT+IHjA9kxBNqFGlWJrtqwm6tF0CAfbIQ3Z6o5d+j7aDhFhNJbRe+H0Oj29V2beUpcVT9tGT+ZXA==
X-Received: by 2002:a05:600c:c07:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-442d6d18abfmr155256055e9.5.1747151201323;
        Tue, 13 May 2025 08:46:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm183724645e9.31.2025.05.13.08.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:46:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] clk: renesas: r9a09g056-cpg: Add clock and reset entries for GBETH0/1
Date: Tue, 13 May 2025 16:46:31 +0100
Message-ID: <20250513154635.273664-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for GBETH instances. Include core clocks for
PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
used as clock sources for the GBETH IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index e2712a25c43a..5582041455c5 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -28,6 +28,7 @@ enum clk_ids {
 	CLK_PLLCLN,
 	CLK_PLLDTY,
 	CLK_PLLCA55,
+	CLK_PLLETH,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV16,
@@ -35,6 +36,15 @@ enum clk_ids {
 	CLK_PLLCLN_DIV8,
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV4,
+	CLK_PLLDTY_DIV8,
+	CLK_PLLETH_DIV_250_FIX,
+	CLK_PLLETH_DIV_125_FIX,
+	CLK_CSDIV_PLLETH_GBE0,
+	CLK_CSDIV_PLLETH_GBE1,
+	CLK_SMUX2_GBE0_TXCLK,
+	CLK_SMUX2_GBE0_RXCLK,
+	CLK_SMUX2_GBE1_TXCLK,
+	CLK_SMUX2_GBE1_RXCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -57,6 +67,19 @@ static const struct clk_div_table dtable_2_64[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_100[] = {
+	{0, 2},
+	{1, 10},
+	{2, 100},
+	{0, 0},
+};
+
+/* Mux clock tables */
+static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
+static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
+static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
+static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
+
 static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
@@ -68,6 +91,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
+	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
@@ -77,6 +101,18 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
+
+	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
+	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
+	DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
+		  CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_100),
+	DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
+		  CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_100),
+	DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCTL2, smux2_gbe0_txclk),
+	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
+	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
+	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G056_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
@@ -89,6 +125,10 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_DDIV("ca55_0_coreclk3", R9A09G056_CA55_0_CORE_CLK3, CLK_PLLCA55,
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G056_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+	DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G056_GBETH_0_CLK_PTP_REF_I,
+		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G056_GBETH_1_CLK_PTP_REF_I,
+		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
@@ -120,6 +160,30 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_180_i", CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_180_i", CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD("gbeth_0_aclk_csr_i",		CLK_PLLDTY_DIV8, 11, 12, 5, 28,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_aclk_i",		CLK_PLLDTY_DIV8, 11, 13, 5, 29,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_tx_i", CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_rx_i", CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_tx_180_i", CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_rx_180_i", CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD("gbeth_1_aclk_csr_i",		CLK_PLLDTY_DIV8, 12, 2, 6, 2,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
+						BUS_MSTOP(8, BIT(6))),
 };
 
 static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
@@ -130,6 +194,8 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
+	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 };
 
 const struct rzv2h_cpg_info r9a09g056_cpg_info __initconst = {
-- 
2.49.0


