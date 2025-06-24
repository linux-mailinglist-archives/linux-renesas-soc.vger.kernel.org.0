Return-Path: <linux-renesas-soc+bounces-18661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF7AE6D83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0EB3BB351
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DDA2E1730;
	Tue, 24 Jun 2025 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dePwlZjD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3F2E62AD;
	Tue, 24 Jun 2025 17:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786239; cv=none; b=J8NA2G3eG3+1P+Y/xiqQG4fg5BMp910+AsUZRzzaGflnXEd+rb6EV10Lhm3vIZoyt6lAuQ2FPIVSyHLjo7X5aCA0+uKhcDOYVy1JKkWya5mwcTOtc3Pb/K9RJccqFB2UluTWFDC3H0etODGjbNTNPQhAX372+QWSRODka+zKgyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786239; c=relaxed/simple;
	bh=EqMVIG1JOtHwWia9MJuvoy/KovUnFn37vw4qAziiz4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awgm+QTBdIoydbw/0bksM69JJ6wduSyyzktFkSuzIBUJ9pVpeS2AgIzexY/LCwZbk8KyDeuTW8tHt8glvG04Bh3vLmt4NexUFyfli9wH7iDC/PuSLAqXqTMKJ5tlXrN/rEUieou1GU4hTn+HBE0MT+bXevkXIz2UQX2JYMV9Qh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dePwlZjD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so604705e9.1;
        Tue, 24 Jun 2025 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786236; x=1751391036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqz+iNobaWbEhtWCmAaZZYdYmVmSQ8nu4QIVj4Qe7zQ=;
        b=dePwlZjDzVXmgDxLPzrcD+h+FoEXUn3fBSSeXClPlyyflI2R7I5+vOU8A0yoMyUZck
         WXOXqTm/DGbDMm+0sekDTipOYQQD6+UdDalHDFE/DUCzzCpPyzE2xSKBq4kJW1BLRKL9
         U2Cz19ifD0OS9xjkLjo9R3tfPI/v4jL+ufc56Iy3eAozFcf8/po5j1UKTzSKVqNC5IQR
         mf9w+sNCZ5HQaM35o4lGm2MeyOPa8fqhv+EeEtVp27w5raAnPN/NscKRuplX2rOfDnfC
         H3HaWP6VnS//9/xKBofoAV7khaW0atOrHLe8P6/exUq5rdqDnlSG6p9+epLFmh2aCHTh
         oB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786236; x=1751391036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqz+iNobaWbEhtWCmAaZZYdYmVmSQ8nu4QIVj4Qe7zQ=;
        b=vW3zRLOcBf2BYbkFaTpkFSY2s4ZKFwsdjIWR8l840bFhi8jKm6OjOqh5PlC/TcYhHA
         jQntpjiZwR0w6KQrgPQa0Asgkj0+qv1TDs97EB1eqNE1TJSXC7dTA7kvfMVCbMmMXypf
         8bowwWV+u4dUsf6J0gDK93eC0WxdLonBDSEPvsGvGD1obaW0odpuAB+UKsShfODMEaGf
         /E8kjBGzv9xRT9yL2rYZLZlnmw+6mHJmaISVhewyIkEiGOcHn0XOs9LdNzTipjo7p2qi
         idLks2WvMevtFmiEMGvhBA1l+2RnLfXQwiHnmMyYkjZjLe0ioX0WlsX0mHB1kWDz4vPE
         zpkg==
X-Forwarded-Encrypted: i=1; AJvYcCVSi+ooRO9zfvRFmZUK+9VohXTp8pjWQ1LxSXMqZ3Nd9a6UoJRBc4QCnFSvrqfupIXAnhlsgK9B4EjnFZNM@vger.kernel.org, AJvYcCVtLp8wqSK8h3vuGzRT3lJ1tuHCTJBLA583PvvUZtE3EsptIr3UbhXDvekIjoBqkcVzoAG/rjzBeJCp@vger.kernel.org, AJvYcCXmvDDtiShLdTFxmF9b+twkbIs3h/s52+SXY7Qn+PKCSZAnrMJUyG8vRlgMaoCz/V6IDFti4PGSc+0x@vger.kernel.org
X-Gm-Message-State: AOJu0YzUv60kU68GyVQ7gtsNwZYFkCfg0W812dHgiGJR4yrJrjGm1Uu4
	iuk3hiuJqZytzKOxn8xAb+Oblemis6lYZ4Toculv5/ebt5QAYG2gEHU1
X-Gm-Gg: ASbGncu72DlBTHpU6jY4b8xjrGI3DPMTSJXLJsWg3oza6Bk8LQZ+1FhYOD/te4c7DSq
	A1qA44SgvSPfPkjq4YoXlep3RWfj6oV+NimirAtCcFRsnwxyC8K9OOC04JoSsoMSwP6MnglpHN7
	7qvcTX/0uTlzQnhemfs82cDk0rJckN1XaNLXIMO+FllMiL89OCe+RFY687o1RxdzJ2a/gp0spqd
	NuWyAuoNUw8Ff2ZBaLPBn9sW1dU+6NtvuI1zyWdO5cf24nNP9sR2pS+ZRldTMtsxFl1yBIRteko
	rCBaLs3Ud0b2Tapey5zci50EKrEbsIgRrvlfPkSeIYoTsRKHOVow8iqh97WqQsPdmaLoXfK76pr
	fRjJ63DXy8utRrw7to4SQ
X-Google-Smtp-Source: AGHT+IFqRfnkaDMljjTZKvzSN2yE18iPaQTZP9HNlSeLmYzZ/JnoVxD/fxNVWlcGycMmYOGnQ5N+yg==
X-Received: by 2002:a05:600c:620b:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4537c362937mr38278455e9.5.1750786235642;
        Tue, 24 Jun 2025 10:30:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:34 -0700 (PDT)
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
Subject: [PATCH 2/6] clk: renesas: r9a09g056: Add support for xspi mux and divider
Date: Tue, 24 Jun 2025 18:30:26 +0100
Message-ID: <20250624173030.472196-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g056-cpg.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index e370ffb8c1e2..040acd4ae5dd 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G056_GBETH_1_CLK_PTP_REF_I,
+	LAST_DT_CORE_CLK = R9A09G056_SPI_CLK_SPI,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -32,7 +32,13 @@ enum clk_ids {
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV3,
+	CLK_PLLCM33_DIV4,
+	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
+	CLK_SMUX2_XSPI_CLK0,
+	CLK_SMUX2_XSPI_CLK1,
+	CLK_PLLCM33_XSPI,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -62,6 +68,14 @@ static const struct clk_div_table dtable_1_8[] = {
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
@@ -83,6 +97,8 @@ static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
 static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
+static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
+static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
 
 static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -99,7 +115,14 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
+	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
+	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
+	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
+	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
+		  dtable_2_16),
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
-- 
2.49.0


