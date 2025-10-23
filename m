Return-Path: <linux-renesas-soc+bounces-23542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A221C037DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39C53B1D45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A61B27057D;
	Thu, 23 Oct 2025 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbQ+8exx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507DA26561E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253672; cv=none; b=pQbQUGpQ0rUwHecu3m5pstExDtreQWCfeP/NhcY16nU3WRR6D6uxpCY/wyQ+5opT4SuPZWpnJ/rSCo690jVviocCjRqcDBw73NsapBtrKiwF9shfRkyTKY8+X+L3anOYth50h4g4ux8m/cmb0pbz6KRqpGdBdhjkxd3kBvZBBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253672; c=relaxed/simple;
	bh=VG5xTxtOlY8s5209sseFM8GLLXO2TnYoDm0l81zo/F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sl2CRXmATc4HCRq0qR1C+6upXNrEXiVePncx7AFlNE12Yj1qhJWSxdlNeKTLYmIRZCx6vUb4WTl3a4lfsvklP8Tdgzmjly7v7kuWR5WY0tQU+IpY1sLDSBCxVUXGhbtcgqBnDxchEdP+17wXwb36Ykl/3o6XRL6UOY29IEnDjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbQ+8exx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7810289cd4bso1281214b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253670; x=1761858470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7lMbmizVXQgfdEOJpOkficpkqONpSevCLg9k0st7Os=;
        b=JbQ+8exxMQzSHSNfcLuEmXjANIYOzy17A8KIEv2R9PNvMyEhvl0sfDY9wac/5+dO4Q
         Z/6kCGuEV6j/X004WVyACV4CGG+BoOK2mKeu9T9GFZOSB84k4szhnWpFmrVnTxAKV0D6
         UjL/FdzRCE1TalhQ/jwhAGxPpX6iO1tUxobomvEU8ilb7z/jvv1zoijEHBVVwr58O8BH
         OHk82qW3nn/j4VbaIy7SnvBDBD5srDoY7X1CTvLOcLqEDDJ6wibBgISRP6n5T/pILxF9
         xTjAxGGm8nvQ4IywZCmeSNXOhS0ONO2gdm2pXLCX6uLKn7SOMW+kEZrzxerTot4hdraO
         /vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253670; x=1761858470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7lMbmizVXQgfdEOJpOkficpkqONpSevCLg9k0st7Os=;
        b=wgfyWVZMvSFvC9a1KYJDCxIFPU5ZSZHWQXxQclMNgZS2dXiI7SuB9Oc6ttjpiqUsdE
         EzytQlhkwQKqzCDUlKfSnrucnPXExErWshPfNF9rAFfIe+f2Acc6LeBzpRDPRSHwTAGZ
         qNNAyUquCU8JQYQaurAunaKlkNoaRRyf47Xb8TwNROv4qRM50YYGDFEzvj0K8Eju9Iz1
         6GADZWJ9UFX+mQyx8YmLCeMv/V1FZ3BNF+hzuK2nR7LRcIrwc+0E4ZodXIyCTyRrHu8K
         vEgF4C8090NZWt2qkMQl8GovjdCGX9iYL2FqozXZTaHlDKWWnz+Gj80ws4k6bLezO+7m
         nezA==
X-Gm-Message-State: AOJu0YybVyQ4T7CGMERP9fIwGZ75su6iJQtFB0LoVo06XrZLUtTBMmnX
	oagBdTAqAkE0ZrwuCSL4zDGyX3GddSRBzGILKQqwa8up2NymTNoHam9t
X-Gm-Gg: ASbGncueJ/5NxLfwFLcPuLKfkTE6uWfNbcm5oBBxNcXlLmatOW01GUvNqfyi2+/KauJ
	Pb1NaBuCRzh4nXbqlTKnxUd0pRME2sx59HqQgms84+oEw2NyihqRmverrSK5QUS6KYAHd9Iy/YF
	SmYlZY7g2Fcj5Jav+3wpUrwqrZZaLwIAdSzlO42p9dtUgsT2l4t0I2X+m+nowIHXWFpemrz0gA+
	A31G7/H08X/0cLlbV88F6G43VQJMudB/uRe8dQYqNg/5sUTPyxv6qoX+zfstLyKoo+s4Pu6C2wq
	ueH+1MhISC//jfR/WEImeYMtdn1BbDBqK/FGYJxFURUmMHrzJaDXWZ4AEaBBQsWlMN9wIvGqqj0
	MGXPBinZ5089xIydKHEdneASN9uPiM0UoBy6xZkn8W/sP9nl0CQB4ixMMV14Va4FyTb8Kdum1tS
	PMN4O5cv76FTSaTNwhF7s=
X-Google-Smtp-Source: AGHT+IHvIKfZJGdNmxxGtyGt9ruUw9r4pmEoTeeY+UcIEiweB7OrudRnk/Alt8AeYUIRMePPpFSXtQ==
X-Received: by 2002:a05:6a00:4c83:b0:781:2656:1d6b with SMTP id d2e1a72fcca58-7a220b1eb48mr31025384b3a.24.1761253669572;
        Thu, 23 Oct 2025 14:07:49 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm3461246b3a.58.2025.10.23.14.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:07:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC modules
Date: Thu, 23 Oct 2025 22:07:22 +0100
Message-ID: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset definitions required to support the DSI and LCDC
hardware blocks on the RZ/V2N SoC. This includes new core clocks, clock
dividers, module clocks, and reset entries, as well as PLL and divider
configurations specific to these peripherals.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 64 +++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 55f056359dd7..70b73d410135 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -29,6 +30,7 @@ enum clk_ids {
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 	CLK_PLLETH,
+	CLK_PLLDSI,
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
@@ -47,6 +49,7 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
+	CLK_PLLDTY_DIV16,
 	CLK_PLLETH_DIV_250_FIX,
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
@@ -55,6 +58,9 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_CDIV4_PLLETH_LPCLK,
+	CLK_PLLETH_LPCLK_GEAR,
+	CLK_PLLDSI_GEAR,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -77,6 +83,26 @@ static const struct clk_div_table dtable_2_16[] = {
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
@@ -93,6 +119,17 @@ static const struct clk_div_table dtable_2_100[] = {
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
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
+#define PLLDSI		PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -113,6 +150,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -134,6 +172,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
+	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 
 	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
 	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
@@ -145,6 +184,12 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+	DEF_FIXED(".cdiv4_plleth_lpclk", CLK_CDIV4_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk_gear", CLK_PLLETH_LPCLK_GEAR, CLK_CDIV4_PLLETH_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
+	DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
+		       CSDIV1_DIVCTL2, dtable_2_32),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
@@ -289,6 +334,22 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_vclk1",			CLK_PLLDSI_GEAR, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK_GEAR, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_PLLDSI_GEAR, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
 	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -335,6 +396,9 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
-- 
2.43.0


