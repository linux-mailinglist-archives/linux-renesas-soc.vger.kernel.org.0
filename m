Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8DD39ADBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 00:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhFCWUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 18:20:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:9907 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230265AbhFCWUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 18:20:32 -0400
X-IronPort-AV: E=Sophos;i="5.83,246,1616425200"; 
   d="scan'208";a="83182173"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jun 2021 07:18:46 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E9574410B534;
        Fri,  4 Jun 2021 07:18:42 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 09/12] clk: renesas: Add support for R9A07G044 SoC
Date:   Thu,  3 Jun 2021 23:17:55 +0100
Message-Id: <20210603221758.10305-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define the clock outputs supported by RZ/G2L (R9A07G044) SoC
and bind it with RZ/G2L CPG core.

Based on a patch in the BSP by Binh Nguyen
<binh.nguyen.jz@renesas.com>.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c     | 372 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.c |   6 +
 drivers/clk/renesas/renesas-rzg2l-cpg.h |   2 +
 5 files changed, 386 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a07g044-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5a0d934f43a4..d1fc44fe755d 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -32,6 +32,7 @@ config CLK_RENESAS
 	select CLK_R8A77995 if ARCH_R8A77995
 	select CLK_R8A779A0 if ARCH_R8A779A0
 	select CLK_R9A06G032 if ARCH_R9A06G032
+	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -156,6 +157,10 @@ config CLK_R9A06G032
 	help
 	  This is a driver for R9A06G032 clocks
 
+config CLK_R9A07G044
+	bool "RZ/G2L clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index a9c299686b4a..5c6c5c721d98 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_R8A77990)		+= r8a77990-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
+obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
new file mode 100644
index 000000000000..9a481d01cf69
--- /dev/null
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G2L CPG driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a07g044-cpg.h>
+
+#include "renesas-rzg2l-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A07G044_OSCCLK,
+
+	/* External Input Clocks */
+	CLK_XINCLK,
+
+	/* Internal Core Clocks */
+	CLK_OSC_DIV1000,
+	CLK_PLL1,
+	CLK_SEL_PLL1,
+	CLK600,
+	CLK_PLL2,
+	CLK_PLL2_1,
+	CLK_SEL_PLL2_1,
+	CLK800FIX_C,
+	CLK800FIX_CDIV2,
+	CLK200FIX_C,
+	CLK200_C,
+	CLK100FIX_C,
+	CLK_PLL2_2,
+	CLK_SEL_PLL2_2,
+	CLK533_C,
+	CLK533_CDIV2,
+	CLK533FIX_C,
+	CLK533FIX_CDIV2,
+	CLK533FIX_LPCLK,
+	CLK_PLL3,
+	CLK_PLL3_1,
+	CLK_SEL_PLL3_1,
+	CLK800FIX_CD,
+	CLK800FIX_DIV2,
+	CLK200FIX_CD,
+	CLK200_CD,
+	CLK100FIX_CD,
+	CLK100_CD,
+	CLK_PLL3_2,
+	CLK_SEL_PLL3_2,
+	CLK_PLL3_3,
+	CLK_SEL_PLL3_3,
+	CLK533_CD,
+	CLK533FIX_CD,
+	CLK_PLL4,
+	CLK_SEL_PLL4,
+	CLK_PLL5,
+	CLK_PLL5_1,
+	CLK_SEL_PLL5_1,
+	CLK_PLL5_3,
+	CLK_SEL_PLL5_3,
+	CLK_PLL5_2,
+	CLK_SEL_PLL5_2,
+	CLK_SEL_PLL5_4,
+	CLK_250,
+	CLK_PLL6,
+	CLK_PLL6_1,
+	CLK_SEL_PLL6_1,
+	CLK_SEL_G1_1,
+	CLK_SEL_G1_2,
+	CLK_SEL_G2,
+	CLK_PLL6_DIV2,
+	CLK_SEL_PLL6_2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+/* Divider tables */
+static const struct clk_div_table divdsilpcl[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+};
+
+static const struct clk_div_table dtable_2b[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+};
+
+static const struct clk_div_table dtable_3b[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{4, 32},
+};
+
+static const struct clk_div_table dtable_4b[] = {
+	{0, 1},
+	{1, 2},
+	{2, 3},
+	{3, 4},
+	{4, 5},
+	{5, 6},
+	{6, 7},
+	{7, 8},
+	{8, 9},
+	{9, 10},
+	{10, 11},
+	{11, 12},
+	{12, 13},
+	{13, 14},
+	{14, 15},
+	{15, 16},
+};
+
+/* MUX clock tables */
+static const char * const sel_pll1[]	= { "xinclk", ".pll1" };
+static const char * const sel_pll2_1[]	= { "xinclk", ".pll2_1" };
+static const char * const sel_pll2_2[]	= { "xinclk", ".pll2_2" };
+static const char * const sel_pll3_1[]	= { "xinclk", ".pll3_1" };
+static const char * const sel_pll3_2[]	= { "xinclk", ".pll3_2" };
+static const char * const sel_pll3_3[]	= { ".sel_pll3_2", ".pll3_3" };
+static const char * const sel_pll4[]	= { ".osc_div1000", ".pll4" };
+static const char * const sel_pll5_1[]	= { "xinclk", ".pll5_1" };
+static const char * const sel_pll5_3[]	= { "xinclk", ".pll5_3" };
+static const char * const sel_pll5_4[]	= { ".sel_pll5_1", ".sel_pll5_3" };
+static const char * const sel_pll5_2[]	= { "xinclk", ".pll5_2" };
+static const char * const sel_pll6_1[]	= { "xinclk", ".pll6" };
+static const char * const sel_g1_1[]	= { ".sel_pll6_1", ".clk600" };
+static const char * const sel_g1_2[]	= { ".clk533fix_cd", ".clk800fix_div2" };
+static const char * const sel_g2[]	= { ".sel_g1_1", ".sel_g1_2" };
+static const char * const sel_pll6_2[]	= { ".pll6_div2", ".clk250" };
+static const char * const sel_eth[]	= { "xinclk", ".sel_pll6_2" };
+static const char * const sel_shdi[]	= { ".clk800fix_c", ".clk533_c",
+					    ".clk800fix_cdiv2", ".clk533_cdiv2" };
+
+static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",	 CLK_XINCLK),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_XINCLK, 1, 1),
+	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_XINCLK, 1, 1000),
+	DEF_PLL(".pll1", CLK_PLL1, CLK_TYPE_SAM_PLL, CLK_XINCLK,
+		PLL146_CONF(0), PLL146_STBY(0), PLL146_MON(0)),
+	DEF_PLL(".pll2", CLK_PLL2, CLK_TYPE_SI_PLL, CLK_XINCLK,
+		PLL235_CONF(0), PLL235_STBY(0), PLL235_MON(0)),
+	DEF_PLL(".pll3", CLK_PLL3, CLK_TYPE_SI_PLL, CLK_XINCLK,
+		PLL235_CONF(1), PLL235_STBY(1), PLL235_MON(1)),
+	DEF_PLL(".pll4", CLK_PLL4, CLK_TYPE_SAM_PLL, CLK_XINCLK,
+		PLL146_CONF(1), PLL146_STBY(1), PLL146_MON(1)),
+	DEF_PLL(".pll5", CLK_PLL5, CLK_TYPE_SI_PLL, CLK_XINCLK,
+		PLL235_CONF(2), PLL235_STBY(2), PLL235_MON(2)),
+	DEF_PLL(".pll6", CLK_PLL6, CLK_TYPE_SAM_PLL, CLK_XINCLK,
+		PLL146_CONF(2), PLL146_STBY(2), PLL146_MON(2)),
+	DEF_MUX(".sel_pll1", CLK_SEL_PLL1, SEL_PLL1,
+		sel_pll1, 2, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".clk600", CLK600, CLK_PLL1, 1, 2),
+	DEF_FIXED(".pll2_1", CLK_PLL2_1, CLK_PLL2, 1, 2),
+	DEF_MUX(".sel_pll2_1", CLK_SEL_PLL2_1, SEL_PLL2_1,
+		sel_pll2_1, 2, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".clk800fix_c", CLK800FIX_C, CLK_SEL_PLL2_1, 1, 2),
+	DEF_FIXED(".clk800fix_cdiv2", CLK800FIX_CDIV2, CLK800FIX_C, 1, 2),
+	DEF_FIXED(".clk200fix_c", CLK200FIX_C, CLK800FIX_C, 1, 4),
+	DEF_DIV(".clk200_c", CLK200_C, CLK200FIX_C,
+		DIVPL2B, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED(".clk100fix_c", CLK100FIX_C, CLK200FIX_C, 1, 2),
+	DEF_FIXED(".pll2_2", CLK_PLL2_2, CLK_PLL2, 1, 6),
+	DEF_MUX(".sel_pll2_2", CLK_SEL_PLL2_2, SEL_PLL2_2,
+		sel_pll2_2, 2, CLK_MUX_READ_ONLY),
+	DEF_DIV(".clk533_c", CLK533_C, CLK_SEL_PLL2_2,
+		DIVPL2C, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED(".clk533_cdiv2", CLK533_CDIV2, CLK533_C, 1, 2),
+	DEF_FIXED(".clk533fix_c", CLK533FIX_C, CLK_SEL_PLL2_2, 1, 1),
+	DEF_FIXED(".clk533fix_cdiv2", CLK533FIX_CDIV2, CLK533FIX_C, 1, 2),
+	DEF_FIXED(".clk533fix_lpclk", CLK533FIX_LPCLK, CLK533FIX_C, 1, 2),
+	DEF_FIXED(".pll3_1", CLK_PLL3_1, CLK_PLL3, 1, 2),
+	DEF_MUX(".sel_pll3_1", CLK_SEL_PLL3_1, SEL_PLL3_1,
+		sel_pll3_1, 2, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".clk800fix_cd", CLK800FIX_CD, CLK_SEL_PLL3_1, 1, 2),
+	DEF_FIXED(".clk800fix_div2", CLK800FIX_DIV2, CLK800FIX_CD, 1, 2),
+	DEF_FIXED(".clk200fix_cd", CLK200FIX_CD, CLK800FIX_CD, 1, 4),
+	DEF_FIXED(".clk100fix_cd", CLK100FIX_CD, CLK200FIX_CD, 1, 2),
+	DEF_FIXED(".pll3_2", CLK_PLL3_2, CLK_PLL3, 1, 6),
+	DEF_MUX(".sel_pll3_2", CLK_SEL_PLL3_2, SEL_PLL3_2,
+		sel_pll3_2, 2, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".pll3_3", CLK_PLL3_3, CLK_PLL3, 1, 8),
+	DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
+		sel_pll3_3, 2, CLK_MUX_READ_ONLY),
+	DEF_DIV(".clk533_cd", CLK533_CD, CLK_SEL_PLL3_3,
+		DIVPL3C, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED(".clk533fix_cd", CLK533FIX_CD, CLK_SEL_PLL3_2, 1, 1),
+	DEF_MUX(".sel_pll4", CLK_SEL_PLL4, SEL_PLL4, sel_pll4, 2, 0),
+	DEF_FIXED(".pll5_1", CLK_PLL5_1, CLK_PLL5, 1, 1),
+	DEF_MUX(".sel_pll5_1", CLK_SEL_PLL5_1, SEL_PLL5_1,
+		sel_pll5_1, 2, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".pll5_3", CLK_PLL5_3, CLK_PLL5, 1, 2),
+	DEF_MUX(".sel_pll5_3", CLK_SEL_PLL5_3, SEL_PLL5_3,
+		sel_pll5_3, 2, CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
+		sel_pll5_4, 2, 0),
+	DEF_FIXED(".pll5_2", CLK_PLL5_2, CLK_PLL5, 1, 6),
+	DEF_MUX(".sel_pll5_2", CLK_SEL_PLL5_2, SEL_PLL5_2,
+		sel_pll5_2, 2, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".clk250", CLK_250, CLK_SEL_PLL5_2, 1, 2),
+	DEF_MUX(".sel_pll6_1", CLK_SEL_PLL6_1, SEL_PLL6_1,
+		sel_pll6_1, 2, CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_g1_1", CLK_SEL_G1_1, SEL_G1_1,
+		sel_g1_1, 2, CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_g1_2", CLK_SEL_G1_2, SEL_G1_2,
+		sel_g1_2, 2, CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_g2", CLK_SEL_G2, SEL_G2, sel_g2, 2, 0),
+	DEF_FIXED(".pll6_div2", CLK_PLL6_DIV2, CLK_PLL6, 1, 2),
+	DEF_MUX(".sel_pll6_2", CLK_SEL_PLL6_2, SEL_PLL6_2,
+		sel_pll6_2, 2, CLK_MUX_HIWORD_MASK),
+
+	/* Core output clk*/
+	DEF_DIV("I", R9A07G044_CLK_I, CLK_SEL_PLL1,
+		DIVPL1, NULL, CLK_DIVIDER_POWER_OF_TWO |
+		CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("I2", R9A07G044_CLK_I2, CLK200FIX_CD,
+		DIVPL3CLK200FIX, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_G2, DIVGPU, NULL,
+		CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("S0", R9A07G044_CLK_S0, CLK_SEL_PLL4, 1, 2),
+	DEF_FIXED("S1", R9A07G044_CLK_S0, CLK_SEL_PLL4, 1, 4),
+	DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK533_CD, 1, 2),
+	DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK533_CD, 1, 4),
+	DEF_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
+		sel_shdi, 4, CLK_MUX_HIWORD_MASK),
+	DEF_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
+		sel_shdi, 4, CLK_MUX_HIWORD_MASK),
+	DEF_FIXED("M0", R9A07G044_CLK_M0, CLK200FIX_CD, 1, 1),
+	DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_SEL_PLL5_1, 1, 1),
+	DEF_FIXED("M2", R9A07G044_CLK_M2, CLK533FIX_CD, 1, 2),
+	DEF_2DIV("M3", R9A07G044_CLK_M3, CLK_SEL_PLL5_4,
+		 DIVDSIA, DIVDSIB, dtable_2b, dtable_4b, 0),
+	DEF_DIV("M4", R9A07G044_CLK_M4, CLK533FIX_LPCLK, DIVDSILPCL,
+		divdsilpcl, CLK_DIVIDER_HIWORD_MASK),
+	DEF_MUX("HP", R9A07G044_CLK_HP, SEL_ETH, sel_eth, 2, CLK_MUX_HIWORD_MASK),
+	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK800FIX_C, 1, 10),
+	DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK100FIX_CD, 1, 1),
+	DEF_DIV("P0", R9A07G044_CLK_P0, CLK100FIX_C, DIVPL2A,
+		dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("P1", R9A07G044_CLK_P1, CLK200FIX_CD,
+		DIVPL3B, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_DIV("P2", R9A07G044_CLK_P2, CLK100FIX_CD,
+		DIVPL3A, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("AT", R9A07G044_CLK_AT, CLK800FIX_CD, 1, 2),
+};
+
+static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
+	DEF_MOD("gic",		R9A07G044_CLK_GIC600,
+				R9A07G044_CLK_P1,
+				0x514, BIT(0), (BIT(0) | BIT(1))),
+	DEF_MOD("ia55",		R9A07G044_CLK_IA55,
+				R9A07G044_CLK_P1,
+				0x518, (BIT(0) | BIT(1)), BIT(0)),
+	DEF_MOD("syc",		R9A07G044_CLK_SYC,
+				CLK_XINCLK,
+				0x528, BIT(0), BIT(0)),
+	DEF_MOD("dmac",		R9A07G044_CLK_DMAC,
+				R9A07G044_CLK_P1,
+				0x52c, (BIT(0) | BIT(1)),
+				(BIT(0) | BIT(1))),
+	DEF_MOD("sysc",		R9A07G044_CLK_SYSC,
+				CLK_XINCLK,
+				0x530, (BIT(0) | BIT(1)),
+				(BIT(0) | BIT(1) | BIT(2))),
+	DEF_MOD("ssi0",		R9A07G044_CLK_SSI0,
+				R9A07G044_CLK_P0,
+				0x570, (BIT(0) | BIT(1)), BIT(0)),
+	DEF_MOD("ssi1",		R9A07G044_CLK_SSI1,
+				R9A07G044_CLK_P0,
+				0x570, (BIT(2) | BIT(3)), BIT(1)),
+	DEF_MOD("ssi2",		R9A07G044_CLK_SSI2,
+				R9A07G044_CLK_P0,
+				0x570, (BIT(4) | BIT(5)), BIT(2)),
+	DEF_MOD("ssi3",		R9A07G044_CLK_SSI3,
+				R9A07G044_CLK_P0,
+				0x570, (BIT(6) | BIT(7)), BIT(3)),
+	DEF_MOD("src",		R9A07G044_CLK_SRC,
+				R9A07G044_CLK_P0,
+				0x574, BIT(0), BIT(0)),
+	DEF_MOD("usb0",		R9A07G044_CLK_USB0,
+				R9A07G044_CLK_P1,
+				0x578, (BIT(0) | BIT(2) | BIT(3)),
+				(BIT(0) | BIT(2) | BIT(3))),
+	DEF_MOD("usb1",		R9A07G044_CLK_USB1,
+				R9A07G044_CLK_P1,
+				0x578, (BIT(1) | BIT(3)),
+				(BIT(1) | BIT(3))),
+	DEF_MOD("eth0",		R9A07G044_CLK_ETH0,
+				R9A07G044_CLK_HP,
+				0x57c, BIT(0), BIT(0)),
+	DEF_MOD("eth1",		R9A07G044_CLK_ETH1,
+				R9A07G044_CLK_HP,
+				0x57c, BIT(1), BIT(1)),
+	DEF_MOD("i2c0",		R9A07G044_CLK_I2C0,
+				R9A07G044_CLK_P0,
+				0x580, BIT(0), BIT(0)),
+	DEF_MOD("i2c1",		R9A07G044_CLK_I2C1,
+				R9A07G044_CLK_P0,
+				0x580, BIT(1), BIT(1)),
+	DEF_MOD("i2c2",		R9A07G044_CLK_I2C2,
+				R9A07G044_CLK_P0,
+				0x580, BIT(2), BIT(2)),
+	DEF_MOD("i2c3",		R9A07G044_CLK_I2C3,
+				R9A07G044_CLK_P0,
+				0x580, BIT(3), BIT(3)),
+	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
+				R9A07G044_CLK_P0,
+				0x584, BIT(0), BIT(0)),
+	DEF_MOD("scif1",	R9A07G044_CLK_SCIF1,
+				R9A07G044_CLK_P0,
+				0x584, BIT(1), BIT(1)),
+	DEF_MOD("scif2",	R9A07G044_CLK_SCIF2,
+				R9A07G044_CLK_P0,
+				0x584, BIT(2), BIT(2)),
+	DEF_MOD("scif3",	R9A07G044_CLK_SCIF3,
+				R9A07G044_CLK_P0,
+				0x584, BIT(3), BIT(3)),
+	DEF_MOD("scif4",	R9A07G044_CLK_SCIF4,
+				R9A07G044_CLK_P0,
+				0x584, BIT(4), BIT(4)),
+	DEF_MOD("sci0",		R9A07G044_CLK_SCI0,
+				R9A07G044_CLK_P0,
+				0x588, BIT(0), BIT(0)),
+	DEF_MOD("sci1",		R9A07G044_CLK_SCI1,
+				R9A07G044_CLK_P0,
+				0x588, BIT(1), BIT(1)),
+	DEF_MOD("canfd",	R9A07G044_CLK_CANFD,
+				R9A07G044_CLK_P0,
+				0x594, BIT(0), (BIT(0) | BIT(1))),
+	DEF_MOD("gpio",		R9A07G044_CLK_GPIO,
+				CLK_XINCLK,
+				0x598, BIT(0),
+				(BIT(0) | BIT(1) | BIT(2))),
+	DEF_MOD("adc",		R9A07G044_CLK_ADC,
+				R9A07G044_CLK_TSU,
+				0x5a8, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
+};
+
+static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A07G044_CLK_GIC600,
+};
+
+const struct rzg2l_cpg_info r9a07g044_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a07g044_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a07g044_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a07g044_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a07g044_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
+	.num_hw_mod_clks = R9A07G044_CLK_MIPI_DSI_PIN + 1,
+};
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index f096b9d0548c..05e6d61128d6 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -952,6 +952,12 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzg2l_cpg_match[] = {
+#ifdef CONFIG_CLK_R9A07G044
+	{
+		.compatible = "renesas,r9a07g044-cpg",
+		.data = &r9a07g044_cpg_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
index 8e7117e7f79b..de49de9b2383 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -212,4 +212,6 @@ struct rzg2l_cpg_info {
 	unsigned int num_crit_mod_clks;
 };
 
+extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
+
 #endif
-- 
2.17.1

