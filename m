Return-Path: <linux-renesas-soc+bounces-17005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E1AB43E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A5F16481E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A72297102;
	Mon, 12 May 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9fjwkGE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9163296D2E;
	Mon, 12 May 2025 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075392; cv=none; b=DPSMy/8MGKP8aWcf0wUasjV/LMh/1kV4HXvuLPSuXp0uZZEl8e3X1Md37e1L+RVFDy/ao9Z1cWaupbox4OAmWMNnIsJZQ80lBwgP+8Clbn1S2lnnzC5Kc4u4PWbjhFm4kHVHWB6DqxrF38d9N5BObLH7HjONNSrLWymOD5+zuSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075392; c=relaxed/simple;
	bh=lY5aLtCni7q6rIgVuqoKqLTTUjk3cpznh3nx6uOaBww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTcYko6Ux2dgL8GXKmbGiJAGgOC08WMKweuqhe4Gpjj/7HC0uwqT5kPNQRqThIZBHlLsA7v4GpAM/+S061ItYJ7/vWTiTCKzwX9jMSW+yM0u6Bp5IdTvXEuV/zzxHUs64diMg/jMKptQb3CDc/iVnnksCmjm50UddTIJNlMta/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9fjwkGE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so2656402f8f.0;
        Mon, 12 May 2025 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747075389; x=1747680189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azMvcNcz3TPSpcIeI7nA8x1lWHBnDiML7/XRfEHnVf0=;
        b=T9fjwkGEH3ks2PQh8IU3F2r7R4R6zaAtM4V+r8UsWAWN5y2Bx6cru0CjAaUoVpCoM+
         3C2e1ygkaPACVgj9BFeax3QjDGY0RpWjk00Jcp4Wa+P31F3Fwf109FyiVvxDSoNLxJ9x
         g8h6Sq0LR95r1zi9v7EAhtEINXjY9pIDp8ZMRAA6GX7piYHaL0utRMrqhJb9od7p5Onr
         pKcNsp+cQ9G17IYl0VbIV4JFJivWH4WWXd4hqg7VgoHbpn2dEUYaqKUeejSnzYbFDe5z
         97aJ7AFdSF/0+abEIbfGIMoJd/KI9urLu6A07y3UwRtQpb7Gb6rG69QrI+UKdZ9JvO2N
         MZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075389; x=1747680189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azMvcNcz3TPSpcIeI7nA8x1lWHBnDiML7/XRfEHnVf0=;
        b=h5pq/0txNlf2mbOwAzMXiMzq3UPknFsrBU+EMkMuUekR5IfAf4gykdL2WdSdBHLp73
         49QmISNQrBvk3ptxU0BWNg/wZjTZyxWSkpbjs9wyT82UY8O/Pjmo2EgO1Kr2ALMzCWMp
         T6VYzvkfJz8cRRm6jOuhaDQLt/TqGVyQV6US/+z2cWCgj0W81Cz6D43Ks/R0LMveRuOl
         4XWlGniqlux/7fGLgnmLSoSh6LCtz43CvNBhQO1nkx8192OcliK6mui3MKdWviD1/472
         65NfBCXnlkpdKBPD7eQRvlEF1359VcvRBOXEVM1apGmXOzF7tvUck7Ik/45Eeg/Dq9V2
         uqXA==
X-Forwarded-Encrypted: i=1; AJvYcCU6bril4NoyjmBCXOmTIsb8T4MkC7dTImLK5NA04oak5pyqLcUlQw7eYIEy5/vI8lr3eWnLrTRGPIZsMsoK5sl6/j0=@vger.kernel.org, AJvYcCUzN/vVlsinUNk58EF4aq9BplrwFD8+q58JeqXcjdL1RQY89bhbLRjZ2e5PIGqp53aMShE5DqB8ATDB@vger.kernel.org, AJvYcCVnr/Bi3xrGWpKp2c80cRzkMcwX07FQxkOB7QDBEmKW/BSlzODgILYMHr4lsxiTdCfCsUQioOPmIZj3@vger.kernel.org, AJvYcCWLPYs8AmfVmteebgkf6KD9eSxb5hvj5rMngfk9ascu3kGyRna1adZv+itsSJmXnF8kdAhgTo56nH6ZJO3B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1v4rkWbUpp4v3a3cht3Os57ZruKEZfre+MaWddH1yPpoQ9SwA
	lxxxz6O0kXL48vBD2/93j6ajOYHh3q0NW7qvwdShsIpXGTX4KYl1
X-Gm-Gg: ASbGncvughurNv+sNLFAM4jriYOoHndNv97yPOOY9IN0vkc7PqelCPPGBQp0s+/JpN6
	gWf9zh5ZUMiag+f6G6zRTmleNBcE1kAZ6cBWgnDDc8yH48Wi7lCz6CIRJcMB5Q4Q0WXTeyW13B9
	3Uc4qLQpdvezgzsFBQdJCrxymlr2KAAs1xhPul4jkOrnxgv4G7AQI1FKKfygUY7lBnA0RpbE7O9
	Y05Gh4ehBKBE5GF/H1cDsIBQI/QhQiK7JcHqyR9918p+ocwmk675mkQYvlF5yCR4UfLqvU9QA04
	cDWrzMqyYztYdMdwD2bt8orwyP8SFWwEmpJV9IV97BlsAlvwyfNaMPh7F3XIcJ/VdYOQFJu2koY
	i
X-Google-Smtp-Source: AGHT+IGFClg3IwDwx4DURAlaVvKP/mmEHxfypUn+RQTuJTpjwIaYcxr0sukduLrQJznf3IjTHsg3cQ==
X-Received: by 2002:adf:e647:0:b0:3a1:f78a:42f7 with SMTP id ffacd0b85a97d-3a1f78a49dfmr9352353f8f.32.1747075388933;
        Mon, 12 May 2025 11:43:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd53sm13309203f8f.1.2025.05.12.11.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:43:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/4] clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
Date: Mon, 12 May 2025 19:43:00 +0100
Message-ID: <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the DSI and LCDC peripherals.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear

v1->v2:
- Changed CSDIV0_DIVCTL2 to the NO_RMW
---
 drivers/clk/renesas/r9a09g057-cpg.c | 63 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  3 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index da908e820950..a79b67181f11 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,7 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI,
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
@@ -58,6 +60,9 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_DIV_PLLETH_LPCLK,
+	CLK_CSDIV_PLLETH_LPCLK,
+	CLK_PLLDSI_SDIV2,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -78,6 +83,26 @@ static const struct clk_div_table dtable_2_4[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_32[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{8, 18},
+	{9, 20},
+	{10, 22},
+	{11, 24},
+	{12, 26},
+	{13, 28},
+	{14, 30},
+	{15, 32},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -94,6 +119,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -113,6 +146,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+	DEF_FIXED(".cdiv4_plleth_lpclk", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk_gear", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
+	DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
+		       CSDIV1_DIVCTL2, dtable_2_32),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
@@ -319,6 +359,22 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(7))),
 	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
 						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_vclk1",			CLK_PLLDSI_SDIV2, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_lpclk",			CLK_CSDIV_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_PLLDSI_SDIV2, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
 	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -380,11 +436,16 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
 };
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	/* Core Clocks */
 	.core_clks = r9a09g057_core_clks,
@@ -402,4 +463,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	.num_resets = ARRAY_SIZE(r9a09g057_resets),
 
 	.num_mstop_bits = 192,
+
+	.plldsi_limits = &rzv2h_cpg_pll_dsi_limits,
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 6f662fa86ac4..e7570db1ccf5 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -28,6 +28,7 @@ struct pll {
 	})
 
 #define PLLCA55		PLL_PACK(0x60, 1)
+#define PLLDSI		PLL_PACK(0xc0, 1)
 #define PLLGPU		PLL_PACK(0x120, 1)
 
 /**
@@ -122,6 +123,8 @@ struct smuxed {
 
 #define CSDIV0_DIVCTL0	DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
+#define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.49.0


