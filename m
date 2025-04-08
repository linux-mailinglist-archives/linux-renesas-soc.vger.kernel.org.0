Return-Path: <linux-renesas-soc+bounces-15554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD7A801A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 13:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E71357A6E5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 11:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6534E219301;
	Tue,  8 Apr 2025 11:39:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAA0224AEB;
	Tue,  8 Apr 2025 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112350; cv=none; b=FEzEtGRs2aZoRg5JN6dHiuJNb247O5RlOpxxg6WLcR/iBG/IlBIyi9Xx5yRRGC94r5LJ+V0ifwgJTqyA+YHe4SmiuF6p/DhNGn890A5UafNGTgKBbilamY/V9ETml+/EoB0vFlhUFACDoBqR+SO3Ptb/sM2ZFNIWCcRKZtUs8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112350; c=relaxed/simple;
	bh=3ocL9zCtnOLBfKP5GnoT5dV2BU9f2MZjaGUtKsG7Y0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSnT98Wxb2gK5/rNAMAYC1TifUR0KPIhoFs0NoO8W0SOYRCzHl0J+QCGOgWKOdZdwz7dqhfn1XT+XfgoVVEV0NX4IjCZMuejPmFyYmLoTqs2NU5MyJZKDeMod7B3KewZwqJRfle7FLIr53WNDUyIFs040FQBA2OURtQtj7DyFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +bJbOWRNRNeQso5jtz6dIg==
X-CSE-MsgGUID: 1I/VSMtsTv2505k4r/ZwgQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Apr 2025 20:39:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 99B3B40138ED;
	Tue,  8 Apr 2025 20:38:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: biju.das.au@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 2/2] clk: renesas: r9a09g047: Add XSPI clock/reset
Date: Tue,  8 Apr 2025 12:38:45 +0100
Message-ID: <20250408113845.130950-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408113845.130950-1-biju.das.jz@bp.renesas.com>
References: <20250408113845.130950-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * spi_clk_spix2 is handled as module clock with RPM.
 * Dropped CDDIV0_DIVCTL1 as it is already merged in clk tree.
---
 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 741ee025ce02..d3d1ce39db8e 100644
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
@@ -106,6 +107,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
+
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
@@ -179,6 +182,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
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
@@ -233,6 +242,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
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


