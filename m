Return-Path: <linux-renesas-soc+bounces-18864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39692AEC139
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44400174FE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D3D2ED857;
	Fri, 27 Jun 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+3QJII3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FFD2EBDF2;
	Fri, 27 Jun 2025 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056970; cv=none; b=ksyZ7z2PO/nuPu42KHM/AcRkP4j6ThPCe/EKaS8wnp36Htoc9C3JyyXuBCs/3g40QeP8wD6pr9CtvTWX7E85Ht7hqna4UoB4jFg95sXVqJuU57FdEvoNp2rcN28eienwaOmB9GfHV84MBdeq79RjmgG+yrqjGjhdqOIzTOyRuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056970; c=relaxed/simple;
	bh=NRNTXcmffK5GNIEJs7C7ab+QS0nWK5YFSRbltrVpEFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1Yh2rK0m3gHXpeFPI6gVW0Wf0BMv+9lZFIGZFsVe5wKoKE2sxkTjTDus4vFAOa1QXlXHHZMfIra+pR1qmhD+1kHvYStekpgYjBXP/yVcsboVR1qdTLF2QocvWjVKBTE55z2wMFtZOBG2Ld8/8gmKIOP8+Cqf1V1bdAoNa6GAos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+3QJII3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1510149f8f.3;
        Fri, 27 Jun 2025 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056967; x=1751661767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojWYtXhTBnZCePjODquNhVDvb0M/amgnGcB3U0tL9QU=;
        b=R+3QJII32EUoA/9P1BIu0nP1F+i9muiNWlC1RAT6zNnY2OjgeT9ZJyLgxrcn4oNOAu
         y5ZkKdrmqX5BqOs612zb1XdNH/Tnw+gh0jr3mK9JtF/CqYwKz43kRYFFl98xMtQMm7Ed
         dTPqbwX8f8qFIa2oVh4q37RJkfQFCWmKj8fX6v84clNauh+GU7wBXkwaYhtwXs4heVNg
         JH3kU1iXiszLiw59UAJ5gl3MKBkmN0E1pIcnn/qzFfUWhZn5UuuMM5LeZHrmXxYuysOA
         sOslo0amyc177/sz8QZ7+nyZ1SRhFgAzFfIooonTUTlEbU8myAd9i0WxS3GUdFhq5jQw
         aG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056967; x=1751661767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojWYtXhTBnZCePjODquNhVDvb0M/amgnGcB3U0tL9QU=;
        b=bbShCQ+1HJ347RHfDyWRFTAclZnJC2+G8BbRdU1a44rucoo+/KwkgnBTiCXZ/cJ/Nq
         rjVfXdD9QpNeWTN03zon+5iF13dsXshx+TMS7No6U6n7mquUbA5F+UtJFCBvyqyZnlZT
         VfAQxSP3PvLSVTN4OTHtuhWY92Hf6aD9d2PddDMOpbBSeiqxX4N+y0sjddgeUpUxQVpL
         klp/Xq7x4p7PkGq+LV85YYbhB0qFaVRDVd3L1/YwOBHncrnPrWn/r7rzuKDcxJs3qhBi
         Zs6I8OH0uD+M1dyKdkyWd1YRX+/30L7PZVKtad0biVQVcbIae6sO3RDbPTtHNvlXI99j
         JKhA==
X-Forwarded-Encrypted: i=1; AJvYcCUBpO8fptRDK7s3ttIiLPDpDCWTkaHxC305PV6yRiR3EBKYlDNTxcPWwr3pnvqi5aqVbdELn5Rwwedh@vger.kernel.org, AJvYcCX7z1IMlP8792BssBRmi9zO4DSgwWZH1bg5M/GIt0u76NsNChMB3Vy/HR86YH1IeKdds5yugFGN//bJ8UGH@vger.kernel.org, AJvYcCXgZ5FeQ6YNtrWUJKxldHJ+PU+acjRKv27SgEk9R2yw9zYrIDTtX7lQoDZ6s6ANlFKZKcrD+iY5AbpV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywox1H7SEASF6wUCDX1vFSu585C81NQL/ZjJTsuGw6FrFRSlaVW
	YlZkz2cVqdyv7moeJj6il7K5Ce0bBLEeQeCoEgK/XE5JeHNcE3DGDEwNNbYWNEiU
X-Gm-Gg: ASbGncuT+bDKy2E6oPC5BB+hvyacrMgT0hPjJuyZkuXFpYGZN/Y6bGrQVceV0R75KL7
	uSjzOA5GrKNywM0m1qs5+ZZvWO1H/F8gsQOU+ReeWp6O/Uar3zQYZndTieAs7toe08GHB7i1xtu
	5RE19EvPCoGx1+OTBCMmd9jaxQKt6xQ+QaOAXcnnJoqVXn20OJdHLhq9ms+CaWPFdYLIXLm87Xb
	UYT+Nbi0adqr2bw7MUAkqtp9rV9tEvuftFDKKQu2uw/g07mSMDGFcz46kMbgyQxwy6BrjPy1fmQ
	rSwVm8guMe/O4t33ynWAKx4iszMELLXR7W0T/JCyBS9RJ4QVigX+PH8mMes9ZcBVxwvpTQuaPb4
	O4cRWT2ukW2n1yviIB1VP
X-Google-Smtp-Source: AGHT+IFu+y5my8DxS9ewmHoe4HbsABmaGVFDcubbueMO2Wcs8MOmc910zGDP4Y3OF3kL0gXSdZJdWQ==
X-Received: by 2002:a05:6000:144d:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3a90c07daffmr4520861f8f.58.1751056966996;
        Fri, 27 Jun 2025 13:42:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:46 -0700 (PDT)
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
Subject: [PATCH v2 3/6] clk: renesas: r9a09g057: Add support for xspi mux and divider
Date: Fri, 27 Jun 2025 21:42:34 +0100
Message-ID: <20250627204237.214635-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1-> v2:
- No change.
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


