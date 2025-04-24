Return-Path: <linux-renesas-soc+bounces-16303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1DA9A57E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 10:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 952A31889744
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B831FECAA;
	Thu, 24 Apr 2025 08:14:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A271E7640;
	Thu, 24 Apr 2025 08:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482458; cv=none; b=IjMr5Li+1mhTaoVNSfM4yz22XFFEomXXKsc/O9nxxoxaSq77a+rpJTioLnAKOinkgjRMef0Z1FnNa1a2NzSB8j5x4nK9yEkc9+mIUFrSTgGLgJZ9ySRnH4Vi/SACPJKVoqE/y4LgzuVV00PNoGmuR8953+uYLGjWZmeowFK1+sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482458; c=relaxed/simple;
	bh=BgXdcwZeAS+1Y9/1PrqklBHdT9ro08B2MHcbESWsvyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2ckO4efla8awIHMH65WqQPA3krImpvXdbMwsnJfx/4R0hML3BiBoJXSb/yZcAXkxyeO+nzR2dV5cSGxnd9UWbczj5BAqG2kRwd+4gKkr3NuVH6zK3rbFqsH7nfCrX9rALO1A7eigZnGAGFBB9zGJPXqTjn119vm1rFu4LanzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: JpKla5mHR6ac6zuU+gBI6Q==
X-CSE-MsgGUID: gcyyNyeWSoiicI70oWMA8Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2025 17:14:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 00F0E41BF1F3;
	Thu, 24 Apr 2025 17:14:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/3] clk: renesas: r9a09g047: Add XSPI clock/reset
Date: Thu, 24 Apr 2025 09:13:56 +0100
Message-ID: <20250424081400.135028-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add XSPI clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Moved "spi_clk_spi" from patch#2.
v1->v2:
 * spi_clk_spix2 is handled as module clock with RPM.
 * Dropped CDDIV0_DIVCTL1 as it is already merged in clk tree.
---
 drivers/clk/renesas/r9a09g047-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index be387548664a..21699999cedd 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -35,6 +35,7 @@ enum clk_ids {
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
+	CLK_PLLCM33_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
@@ -107,6 +108,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
+
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
@@ -135,6 +138,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV("ca55_0_coreclk3", R9A09G047_CA55_0_CORECLK3, CLK_PLLCA55,
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G047_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+	DEF_FIXED("spi_clk_spi", R9A09G047_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2),
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
@@ -180,6 +184,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(10, BIT(14))),
 	DEF_MOD("canfd_0_clkc",			CLK_PLLCLN_DIV20, 9, 14, 4, 30,
 						BUS_MSTOP(10, BIT(14))),
+	DEF_MOD("spi_hclk",			CLK_PLLCM33_GEAR, 9, 15, 4, 31,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_aclk",			CLK_PLLCM33_GEAR, 10, 0, 5, 0,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD_NO_PM("spi_clk_spix2",		CLK_PLLCM33_XSPI, 10, 1, 5, 2,
+						BUS_MSTOP(4, BIT(5))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
 						BUS_MSTOP(8, BIT(2))),
 	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
@@ -240,6 +250,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
 	DEF_RST(10, 1, 4, 18),		/* CANFD_0_RSTP_N */
 	DEF_RST(10, 2, 4, 19),		/* CANFD_0_RSTC_N */
+	DEF_RST(10, 3, 4, 20),		/* SPI_HRESETN */
+	DEF_RST(10, 4, 4, 21),		/* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
-- 
2.43.0


