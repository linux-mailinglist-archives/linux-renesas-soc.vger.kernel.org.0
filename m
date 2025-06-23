Return-Path: <linux-renesas-soc+bounces-18614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C37AE37ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 10:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EB883A4860
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 08:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D022126E;
	Mon, 23 Jun 2025 08:09:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2AD218584;
	Mon, 23 Jun 2025 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666196; cv=none; b=sFaLXdU0WHs0tAeyM4Zsb+k3RkxRJ9t8yKWfsHy1GcdbheOSah0QBGdmkeNssIfjtptp4lvpQGtXu1f5ustJs9LRgeQw1+dp9TSa+enRLd5quzmdcuKkTSfmLmQ4iz4ubtmjoseO34W1zkW18+gk7EYtMI2mw0+sHPEhC2xzkq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666196; c=relaxed/simple;
	bh=xl2UmOcf/mvqk2s1cxYrkcvcbwoO31HgYIKmpXP6o8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TL2OnfKIJ7gyL6L1cGg0NYFD5QbQ9oSbv1kstrYTedtuo7U3/4p9uxrhBh2CijtBiOPLmpRmi4QgjRVbuQhzJb0enKPuBWaznqB15lOVVp62DDLtzZOoW1zSWMq4MZ13suEuDmVyTeZTph9aH5Bkemthp5pbjTTIiVULleG56PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3+B9fp7ASRe6TyIIM1rvGA==
X-CSE-MsgGUID: 257OVfLuTvGBQKzdKBZJ/Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jun 2025 17:04:45 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.157])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 785A740103C9;
	Mon, 23 Jun 2025 17:04:40 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	netdev@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v3 1/3] clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs
Date: Mon, 23 Jun 2025 10:04:03 +0200
Message-ID: <20250623080405.355083-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com>
References: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH 0-1)
IPs found on the RZ/G3E SoC. This includes various PLLs, dividers, and mux
clocks needed by these two GBETH IPs.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

v2:
No changes but resending without dt-bindings patch

v3: 
Uses underscores instead of dashes in clock names

 drivers/clk/renesas/r9a09g047-cpg.c | 64 +++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 21699999cedd..41bae823a0c6 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -29,6 +29,7 @@ enum clk_ids {
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 	CLK_PLLVDO,
+	CLK_PLLETH,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -46,6 +47,15 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV2,
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
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
@@ -85,7 +95,18 @@ static const struct clk_div_table dtable_2_64[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_100[] = {
+	{0, 2},
+	{1, 10},
+	{2, 100},
+	{0, 0},
+};
+
 /* Mux clock tables */
+static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxc_rx_clk" };
+static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txc_tx_clk" };
+static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxc_rx_clk" };
+static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txc_tx_clk" };
 static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
 static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
 
@@ -100,6 +121,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
+	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
@@ -122,6 +144,18 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
+
+	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
+	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
+	DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0, CLK_PLLETH_DIV_250_FIX,
+		  CSDIV0_DIVCTL0, dtable_2_100),
+	DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1, CLK_PLLETH_DIV_250_FIX,
+		  CSDIV0_DIVCTL1, dtable_2_100),
+	DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCTL2, smux2_gbe0_txclk),
+	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
+	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
+	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
@@ -139,6 +173,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G047_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
 	DEF_FIXED("spi_clk_spi", R9A09G047_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2),
+	DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G047_GBETH_0_CLK_PTP_REF_I,
+		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G047_GBETH_1_CLK_PTP_REF_I,
+		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
@@ -214,6 +252,30 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("gbeth_0_clk_tx_i",		CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_clk_rx_i",		CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_clk_tx_180_i",		CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_clk_rx_180_i",		CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_aclk_csr_i",		CLK_PLLDTY_DIV8, 11, 12, 5, 28,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_aclk_i",		CLK_PLLDTY_DIV8, 11, 13, 5, 29,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_1_clk_tx_i",		CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_clk_rx_i",		CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_clk_tx_180_i",		CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_clk_rx_180_i",		CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_aclk_csr_i",		CLK_PLLDTY_DIV8, 12, 2, 6, 2,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
+						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -255,6 +317,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
+	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.25.1


