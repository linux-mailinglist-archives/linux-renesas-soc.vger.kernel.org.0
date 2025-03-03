Return-Path: <linux-renesas-soc+bounces-13894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D0A4BD6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1D2C1896C9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2421F37C3;
	Mon,  3 Mar 2025 11:04:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32781F0E28;
	Mon,  3 Mar 2025 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999893; cv=none; b=gnPAN5Dc+GoQvEWIloUEjOjYjHih87/tU/HskZtnWI6CpaXJP6C31hDtZupWZoS2cV4rna3WyihFMSCmgwwfr6D4EgojBpHFeqNJ44w80i9W+wqppHooy4I6GO2iwdjf6ABnCtRe16dYzJ4evK3HxJckTjhDziMYcWVzA9F408U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999893; c=relaxed/simple;
	bh=yR+YKysROohEErlYC99ff2Gs7mo6f9I6da75QvNX/24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoqTmCv0ezDXculPkjnVxMVlvKlz2hF7UYm2JDL6ltAAqhaQgm/9zadxL490cH83SN7GyHXQ9Xlb3kepDHk6bh2dcXP1bCZ+8ocYP/VHv5W7jiQ0qo4YM7fAOWgyGO4voOqFKPGQD5ztb/IN6lwhzXEsK9bi6U3tLcfTt1/Zxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +KgX7OR3QaWgGVwbigCV5w==
X-CSE-MsgGUID: IgNT63C+SDuEGBDk/ac2Mw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2025 20:04:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.114])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 18564400C742;
	Mon,  3 Mar 2025 20:04:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/4] clk: renesas: r9a09g047: Add XSPI clock/reset
Date: Mon,  3 Mar 2025 11:04:22 +0000
Message-ID: <20250303110433.76576-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g047-cpg.c | 15 +++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 05d8ccc81157..438077b13198 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -35,9 +35,11 @@ enum clk_ids {
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
+	CLK_PLLCM33_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
+	CLK_PLLCM33_XSPI_DIV2,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -106,10 +108,13 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
+
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_SDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
 		 dtable_2_16),
+	DEF_FIXED(".pllcm33_xspi_div2", CLK_PLLCM33_XSPI_DIV2, CLK_PLLCM33_XSPI, 1, 2),
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
@@ -178,6 +183,14 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(10, BIT(14))),
 	DEF_MOD("canfd_0_clkc",			CLK_PLLCLN_DIV20, 9, 14, 4, 30,
 						BUS_MSTOP(10, BIT(14))),
+	DEF_MOD("spi_hclk",			CLK_PLLCM33_GEAR, 9, 15, 4, 31,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_aclk",			CLK_PLLCM33_GEAR, 10, 0, 5, 0,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_COUPLED("spi_clk_spi",		CLK_PLLCM33_XSPI_DIV2, 10, 1, 5, 1,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_COUPLED("spi_clk_spix2",		CLK_PLLCM33_XSPI, 10, 1, 5, 2,
+						BUS_MSTOP(4, BIT(5))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
 						BUS_MSTOP(8, BIT(2))),
 	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
@@ -230,6 +243,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
 	DEF_RST(10, 1, 4, 18),		/* CANFD_0_RSTP_N */
 	DEF_RST(10, 2, 4, 19),		/* CANFD_0_RSTC_N */
+	DEF_RST(10, 3, 4, 20),		/* SPI_HRESETN */
+	DEF_RST(10, 4, 4, 21),		/* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 1f0e67f33cf9..3e95236b3b63 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -68,6 +68,7 @@ struct smuxed {
 #define CPG_CDDIV4		(0x410)
 #define CPG_CSDIV0		(0x500)
 
+#define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
-- 
2.43.0


