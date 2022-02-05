Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30BDA4AA7B8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Feb 2022 09:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379685AbiBEIkY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 5 Feb 2022 03:40:24 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:42802 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S241462AbiBEIkU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Feb 2022 03:40:20 -0500
X-IronPort-AV: E=Sophos;i="5.88,345,1635174000"; 
   d="scan'208";a="109051479"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2022 17:40:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.77])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1505440062C7;
        Sat,  5 Feb 2022 17:40:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Date:   Sat,  5 Feb 2022 08:40:06 +0000
Message-Id: <20220205084006.7142-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clock structure for RZ/V2L is almost identical to RZ/G2L SoC. The only
difference being RZ/V2L has an additional registers to control clock and
reset for the DRP-AI block.

This patch reuses r9a07g044-cpg.c, as the common clock IDS and rest IDS are
same between RZ/G2L and RZ/V2L and adding a separate r9a07g054_cpg_info to
take care of DRP-AI clocks/resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
This patch depend upon [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/clock?h=next-20220204&id=4decd2e54b61686787f36b727d2772e067a46ea5
v4->v5:
* Rebased on latest clk-driver
* Added base commit ID
v3->v4:
* Added common/drp split for core clocks and resets
v2->v3:
* reuse r9a07g044-cpg.c for RZ/V2L
v1->v2
* Updated divider values for PLL2/3
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c | 539 +++++++++++++++-------------
 drivers/clk/renesas/rzg2l-cpg.c     |   6 +
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 312 insertions(+), 242 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index be6e6ae7448c..c281f3af5716 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -34,6 +34,7 @@ config CLK_RENESAS
 	select CLK_R8A779F0 if ARCH_R8A779F0
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_R9A07G044 if ARCH_R9A07G044
+	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -163,6 +164,10 @@ config CLK_R9A07G044
 	bool "RZ/G2L clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A07G054
+	bool "RZ/V2L clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
@@ -195,7 +200,7 @@ config CLK_RCAR_USB2_CLOCK_SEL
 	  This is a driver for R-Car USB2 clock selector
 
 config CLK_RZG2L
-	bool "Renesas RZ/G2L family clock support" if COMPILE_TEST
+	bool "Renesas RZ/{G2L,V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
 # Generic
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 8b34db1a328c..d5e571699a30 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
+obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 46359afef0d4..140766986151 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -11,12 +11,13 @@
 #include <linux/kernel.h>
 
 #include <dt-bindings/clock/r9a07g044-cpg.h>
+#include <dt-bindings/clock/r9a07g054-cpg.h>
 
 #include "rzg2l-cpg.h"
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A07G044_CLK_P0_DIV2,
+	LAST_DT_CORE_CLK = R9A07G054_CLK_DRP_A,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -80,252 +81,285 @@ static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
 static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
 
-static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
-	/* External Clock Inputs */
-	DEF_INPUT("extal", CLK_EXTAL),
+static struct {
+	const struct cpg_core_clk common[44];
+#ifdef CONFIG_CLK_R9A07G054
+	const struct cpg_core_clk drp[0];
+#endif
+} const core_clks __initconst = {
+	.common = {
+		/* External Clock Inputs */
+		DEF_INPUT("extal", CLK_EXTAL),
 
-	/* Internal Core Clocks */
-	DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_EXTAL, 1, 1),
-	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
-	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
-	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
-	DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
-	DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
+		/* Internal Core Clocks */
+		DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_EXTAL, 1, 1),
+		DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
+		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
+		DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+		DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
+		DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
 
-	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
-	DEF_FIXED(".pll5_fout3", CLK_PLL5_FOUT3, CLK_PLL5, 1, 6),
+		DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
+		DEF_FIXED(".pll5_fout3", CLK_PLL5_FOUT3, CLK_PLL5, 1, 6),
 
-	DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
+		DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
 
-	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
-	DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
-	DEF_FIXED(".clk_533", CLK_PLL2_SDHI_533, CLK_PLL2, 1, 3),
-	DEF_FIXED(".clk_400", CLK_PLL2_SDHI_400, CLK_PLL2_800, 1, 2),
-	DEF_FIXED(".clk_266", CLK_PLL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
+		DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+		DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
+		DEF_FIXED(".clk_533", CLK_PLL2_SDHI_533, CLK_PLL2, 1, 3),
+		DEF_FIXED(".clk_400", CLK_PLL2_SDHI_400, CLK_PLL2_800, 1, 2),
+		DEF_FIXED(".clk_266", CLK_PLL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
 
-	DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
-	DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
+		DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
+		DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
 
-	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
-	DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
-	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
-	DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
-	DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
-		sel_pll3_3, ARRAY_SIZE(sel_pll3_3), 0, CLK_MUX_READ_ONLY),
-	DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
-		DIVPL3C, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+		DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+		DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
+		DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
+		DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
+		DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
+			sel_pll3_3, ARRAY_SIZE(sel_pll3_3), 0, CLK_MUX_READ_ONLY),
+		DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
+			DIVPL3C, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 
-	DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_FOUT3, 1, 2),
-	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
-	DEF_MUX(".sel_gpu2", CLK_SEL_GPU2, SEL_GPU2,
-		sel_gpu2, ARRAY_SIZE(sel_gpu2), 0, CLK_MUX_READ_ONLY),
+		DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_FOUT3, 1, 2),
+		DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
+		DEF_MUX(".sel_gpu2", CLK_SEL_GPU2, SEL_GPU2,
+			sel_gpu2, ARRAY_SIZE(sel_gpu2), 0, CLK_MUX_READ_ONLY),
 
-	/* Core output clk */
-	DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
-		CLK_DIVIDER_HIWORD_MASK),
-	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
-		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
-	DEF_FIXED("P0_DIV2", R9A07G044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
-	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
-	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
-		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
-	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
-	DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
-		DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
-	DEF_FIXED("M0", R9A07G044_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
-	DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
-	DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
-		sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
-	DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
-	DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
-	DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
-		   sel_shdi, ARRAY_SIZE(sel_shdi)),
-	DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
-		   sel_shdi, ARRAY_SIZE(sel_shdi)),
-	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
-	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
-	DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
-		CLK_DIVIDER_HIWORD_MASK),
+		/* Core output clk */
+		DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
+			CLK_DIVIDER_HIWORD_MASK),
+		DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
+			dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+		DEF_FIXED("P0_DIV2", R9A07G044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
+		DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
+		DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
+			DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+		DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
+		DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
+			DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+		DEF_FIXED("M0", R9A07G044_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
+		DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
+		DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
+			sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
+		DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
+		DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
+		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
+			   sel_shdi, ARRAY_SIZE(sel_shdi)),
+		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
+			   sel_shdi, ARRAY_SIZE(sel_shdi)),
+		DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
+		DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
+		DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
+			CLK_DIVIDER_HIWORD_MASK),
+	},
+#ifdef CONFIG_CLK_R9A07G054
+	.drp = {
+	},
+#endif
 };
 
-static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
-	DEF_MOD("gic",		R9A07G044_GIC600_GICCLK, R9A07G044_CLK_P1,
-				0x514, 0),
-	DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
-				0x518, 0),
-	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
-				0x518, 1),
-	DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK, R9A07G044_CLK_P1,
-				0x52c, 0),
-	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
-				0x52c, 1),
-	DEF_MOD("ostm0_pclk",	R9A07G044_OSTM0_PCLK, R9A07G044_CLK_P0,
-				0x534, 0),
-	DEF_MOD("ostm1_clk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
-				0x534, 1),
-	DEF_MOD("ostm2_pclk",	R9A07G044_OSTM2_PCLK, R9A07G044_CLK_P0,
-				0x534, 2),
-	DEF_MOD("wdt0_pclk",	R9A07G044_WDT0_PCLK, R9A07G044_CLK_P0,
-				0x548, 0),
-	DEF_MOD("wdt0_clk",	R9A07G044_WDT0_CLK, R9A07G044_OSCCLK,
-				0x548, 1),
-	DEF_MOD("wdt1_pclk",	R9A07G044_WDT1_PCLK, R9A07G044_CLK_P0,
-				0x548, 2),
-	DEF_MOD("wdt1_clk",	R9A07G044_WDT1_CLK, R9A07G044_OSCCLK,
-				0x548, 3),
-	DEF_MOD("wdt2_pclk",	R9A07G044_WDT2_PCLK, R9A07G044_CLK_P0,
-				0x548, 4),
-	DEF_MOD("wdt2_clk",	R9A07G044_WDT2_CLK, R9A07G044_OSCCLK,
-				0x548, 5),
-	DEF_MOD("spi_clk2",	R9A07G044_SPI_CLK2, R9A07G044_CLK_SPI1,
-				0x550, 0),
-	DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
-				0x550, 1),
-	DEF_MOD("sdhi0_imclk",	R9A07G044_SDHI0_IMCLK, CLK_SD0_DIV4,
-				0x554, 0),
-	DEF_MOD("sdhi0_imclk2",	R9A07G044_SDHI0_IMCLK2, CLK_SD0_DIV4,
-				0x554, 1),
-	DEF_MOD("sdhi0_clk_hs",	R9A07G044_SDHI0_CLK_HS, R9A07G044_CLK_SD0,
-				0x554, 2),
-	DEF_MOD("sdhi0_aclk",	R9A07G044_SDHI0_ACLK, R9A07G044_CLK_P1,
-				0x554, 3),
-	DEF_MOD("sdhi1_imclk",	R9A07G044_SDHI1_IMCLK, CLK_SD1_DIV4,
-				0x554, 4),
-	DEF_MOD("sdhi1_imclk2",	R9A07G044_SDHI1_IMCLK2, CLK_SD1_DIV4,
-				0x554, 5),
-	DEF_MOD("sdhi1_clk_hs",	R9A07G044_SDHI1_CLK_HS, R9A07G044_CLK_SD1,
-				0x554, 6),
-	DEF_MOD("sdhi1_aclk",	R9A07G044_SDHI1_ACLK, R9A07G044_CLK_P1,
-				0x554, 7),
-	DEF_MOD("gpu_clk",	R9A07G044_GPU_CLK, R9A07G044_CLK_G,
-				0x558, 0),
-	DEF_MOD("gpu_axi_clk",	R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
-				0x558, 1),
-	DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
-				0x558, 2),
-	DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
-				0x570, 0),
-	DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
-				0x570, 1),
-	DEF_MOD("ssi1_pclk",	R9A07G044_SSI1_PCLK2, R9A07G044_CLK_P0,
-				0x570, 2),
-	DEF_MOD("ssi1_sfr",	R9A07G044_SSI1_PCLK_SFR, R9A07G044_CLK_P0,
-				0x570, 3),
-	DEF_MOD("ssi2_pclk",	R9A07G044_SSI2_PCLK2, R9A07G044_CLK_P0,
-				0x570, 4),
-	DEF_MOD("ssi2_sfr",	R9A07G044_SSI2_PCLK_SFR, R9A07G044_CLK_P0,
-				0x570, 5),
-	DEF_MOD("ssi3_pclk",	R9A07G044_SSI3_PCLK2, R9A07G044_CLK_P0,
-				0x570, 6),
-	DEF_MOD("ssi3_sfr",	R9A07G044_SSI3_PCLK_SFR, R9A07G044_CLK_P0,
-				0x570, 7),
-	DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
-				0x578, 0),
-	DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
-				0x578, 1),
-	DEF_MOD("usb0_func",	R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
-				0x578, 2),
-	DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
-				0x578, 3),
-	DEF_COUPLED("eth0_axi",	R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
-				0x57c, 0),
-	DEF_COUPLED("eth0_chi",	R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
-				0x57c, 0),
-	DEF_COUPLED("eth1_axi",	R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
-				0x57c, 1),
-	DEF_COUPLED("eth1_chi",	R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
-				0x57c, 1),
-	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
-				0x580, 0),
-	DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
-				0x580, 1),
-	DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK, R9A07G044_CLK_P0,
-				0x580, 2),
-	DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK, R9A07G044_CLK_P0,
-				0x580, 3),
-	DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
-				0x584, 0),
-	DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
-				0x584, 1),
-	DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK, R9A07G044_CLK_P0,
-				0x584, 2),
-	DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK, R9A07G044_CLK_P0,
-				0x584, 3),
-	DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK, R9A07G044_CLK_P0,
-				0x584, 4),
-	DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
-				0x588, 0),
-	DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
-				0x588, 1),
-	DEF_MOD("rspi0",	R9A07G044_RSPI0_CLKB, R9A07G044_CLK_P0,
-				0x590, 0),
-	DEF_MOD("rspi1",	R9A07G044_RSPI1_CLKB, R9A07G044_CLK_P0,
-				0x590, 1),
-	DEF_MOD("rspi2",	R9A07G044_RSPI2_CLKB, R9A07G044_CLK_P0,
-				0x590, 2),
-	DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
-				0x594, 0),
-	DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
-				0x598, 0),
-	DEF_MOD("adc_adclk",	R9A07G044_ADC_ADCLK, R9A07G044_CLK_TSU,
-				0x5a8, 0),
-	DEF_MOD("adc_pclk",	R9A07G044_ADC_PCLK, R9A07G044_CLK_P0,
-				0x5a8, 1),
-	DEF_MOD("tsu_pclk",	R9A07G044_TSU_PCLK, R9A07G044_CLK_TSU,
-				0x5ac, 0),
+static const struct {
+	struct rzg2l_mod_clk common[62];
+#ifdef CONFIG_CLK_R9A07G054
+	struct rzg2l_mod_clk drp[0];
+#endif
+} mod_clks = {
+	.common = {
+		DEF_MOD("gic",		R9A07G044_GIC600_GICCLK, R9A07G044_CLK_P1,
+					0x514, 0),
+		DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
+					0x518, 0),
+		DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
+					0x518, 1),
+		DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK, R9A07G044_CLK_P1,
+					0x52c, 0),
+		DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
+					0x52c, 1),
+		DEF_MOD("ostm0_pclk",	R9A07G044_OSTM0_PCLK, R9A07G044_CLK_P0,
+					0x534, 0),
+		DEF_MOD("ostm1_clk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
+					0x534, 1),
+		DEF_MOD("ostm2_pclk",	R9A07G044_OSTM2_PCLK, R9A07G044_CLK_P0,
+					0x534, 2),
+		DEF_MOD("wdt0_pclk",	R9A07G044_WDT0_PCLK, R9A07G044_CLK_P0,
+					0x548, 0),
+		DEF_MOD("wdt0_clk",	R9A07G044_WDT0_CLK, R9A07G044_OSCCLK,
+					0x548, 1),
+		DEF_MOD("wdt1_pclk",	R9A07G044_WDT1_PCLK, R9A07G044_CLK_P0,
+					0x548, 2),
+		DEF_MOD("wdt1_clk",	R9A07G044_WDT1_CLK, R9A07G044_OSCCLK,
+					0x548, 3),
+		DEF_MOD("wdt2_pclk",	R9A07G044_WDT2_PCLK, R9A07G044_CLK_P0,
+					0x548, 4),
+		DEF_MOD("wdt2_clk",	R9A07G044_WDT2_CLK, R9A07G044_OSCCLK,
+					0x548, 5),
+		DEF_MOD("spi_clk2",	R9A07G044_SPI_CLK2, R9A07G044_CLK_SPI1,
+					0x550, 0),
+		DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
+					0x550, 1),
+		DEF_MOD("sdhi0_imclk",	R9A07G044_SDHI0_IMCLK, CLK_SD0_DIV4,
+					0x554, 0),
+		DEF_MOD("sdhi0_imclk2",	R9A07G044_SDHI0_IMCLK2, CLK_SD0_DIV4,
+					0x554, 1),
+		DEF_MOD("sdhi0_clk_hs",	R9A07G044_SDHI0_CLK_HS, R9A07G044_CLK_SD0,
+					0x554, 2),
+		DEF_MOD("sdhi0_aclk",	R9A07G044_SDHI0_ACLK, R9A07G044_CLK_P1,
+					0x554, 3),
+		DEF_MOD("sdhi1_imclk",	R9A07G044_SDHI1_IMCLK, CLK_SD1_DIV4,
+					0x554, 4),
+		DEF_MOD("sdhi1_imclk2",	R9A07G044_SDHI1_IMCLK2, CLK_SD1_DIV4,
+					0x554, 5),
+		DEF_MOD("sdhi1_clk_hs",	R9A07G044_SDHI1_CLK_HS, R9A07G044_CLK_SD1,
+					0x554, 6),
+		DEF_MOD("sdhi1_aclk",	R9A07G044_SDHI1_ACLK, R9A07G044_CLK_P1,
+					0x554, 7),
+		DEF_MOD("gpu_clk",	R9A07G044_GPU_CLK, R9A07G044_CLK_G,
+					0x558, 0),
+		DEF_MOD("gpu_axi_clk",	R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
+					0x558, 1),
+		DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
+					0x558, 2),
+		DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
+					0x570, 0),
+		DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
+					0x570, 1),
+		DEF_MOD("ssi1_pclk",	R9A07G044_SSI1_PCLK2, R9A07G044_CLK_P0,
+					0x570, 2),
+		DEF_MOD("ssi1_sfr",	R9A07G044_SSI1_PCLK_SFR, R9A07G044_CLK_P0,
+					0x570, 3),
+		DEF_MOD("ssi2_pclk",	R9A07G044_SSI2_PCLK2, R9A07G044_CLK_P0,
+					0x570, 4),
+		DEF_MOD("ssi2_sfr",	R9A07G044_SSI2_PCLK_SFR, R9A07G044_CLK_P0,
+					0x570, 5),
+		DEF_MOD("ssi3_pclk",	R9A07G044_SSI3_PCLK2, R9A07G044_CLK_P0,
+					0x570, 6),
+		DEF_MOD("ssi3_sfr",	R9A07G044_SSI3_PCLK_SFR, R9A07G044_CLK_P0,
+					0x570, 7),
+		DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
+					0x578, 0),
+		DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
+					0x578, 1),
+		DEF_MOD("usb0_func",	R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
+					0x578, 2),
+		DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
+					0x578, 3),
+		DEF_COUPLED("eth0_axi",	R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
+					0x57c, 0),
+		DEF_COUPLED("eth0_chi",	R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
+					0x57c, 0),
+		DEF_COUPLED("eth1_axi",	R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
+					0x57c, 1),
+		DEF_COUPLED("eth1_chi",	R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
+					0x57c, 1),
+		DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
+					0x580, 0),
+		DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
+					0x580, 1),
+		DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK, R9A07G044_CLK_P0,
+					0x580, 2),
+		DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK, R9A07G044_CLK_P0,
+					0x580, 3),
+		DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
+					0x584, 0),
+		DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
+					0x584, 1),
+		DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK, R9A07G044_CLK_P0,
+					0x584, 2),
+		DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK, R9A07G044_CLK_P0,
+					0x584, 3),
+		DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK, R9A07G044_CLK_P0,
+					0x584, 4),
+		DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
+					0x588, 0),
+		DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
+					0x588, 1),
+		DEF_MOD("rspi0",	R9A07G044_RSPI0_CLKB, R9A07G044_CLK_P0,
+					0x590, 0),
+		DEF_MOD("rspi1",	R9A07G044_RSPI1_CLKB, R9A07G044_CLK_P0,
+					0x590, 1),
+		DEF_MOD("rspi2",	R9A07G044_RSPI2_CLKB, R9A07G044_CLK_P0,
+					0x590, 2),
+		DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
+					0x594, 0),
+		DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
+					0x598, 0),
+		DEF_MOD("adc_adclk",	R9A07G044_ADC_ADCLK, R9A07G044_CLK_TSU,
+					0x5a8, 0),
+		DEF_MOD("adc_pclk",	R9A07G044_ADC_PCLK, R9A07G044_CLK_P0,
+					0x5a8, 1),
+		DEF_MOD("tsu_pclk",	R9A07G044_TSU_PCLK, R9A07G044_CLK_TSU,
+					0x5ac, 0),
+	},
+#ifdef CONFIG_CLK_R9A07G054
+	.drp = {
+	},
+#endif
 };
 
-static struct rzg2l_reset r9a07g044_resets[] = {
-	DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
-	DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
-	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
-	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
-	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
-	DEF_RST(R9A07G044_OSTM0_PRESETZ, 0x834, 0),
-	DEF_RST(R9A07G044_OSTM1_PRESETZ, 0x834, 1),
-	DEF_RST(R9A07G044_OSTM2_PRESETZ, 0x834, 2),
-	DEF_RST(R9A07G044_WDT0_PRESETN, 0x848, 0),
-	DEF_RST(R9A07G044_WDT1_PRESETN, 0x848, 1),
-	DEF_RST(R9A07G044_WDT2_PRESETN, 0x848, 2),
-	DEF_RST(R9A07G044_SPI_RST, 0x850, 0),
-	DEF_RST(R9A07G044_SDHI0_IXRST, 0x854, 0),
-	DEF_RST(R9A07G044_SDHI1_IXRST, 0x854, 1),
-	DEF_RST(R9A07G044_GPU_RESETN, 0x858, 0),
-	DEF_RST(R9A07G044_GPU_AXI_RESETN, 0x858, 1),
-	DEF_RST(R9A07G044_GPU_ACE_RESETN, 0x858, 2),
-	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
-	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
-	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
-	DEF_RST(R9A07G044_SSI3_RST_M2_REG, 0x870, 3),
-	DEF_RST(R9A07G044_USB_U2H0_HRESETN, 0x878, 0),
-	DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
-	DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
-	DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
-	DEF_RST(R9A07G044_ETH0_RST_HW_N, 0x87c, 0),
-	DEF_RST(R9A07G044_ETH1_RST_HW_N, 0x87c, 1),
-	DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
-	DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
-	DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
-	DEF_RST(R9A07G044_I2C3_MRST, 0x880, 3),
-	DEF_RST(R9A07G044_SCIF0_RST_SYSTEM_N, 0x884, 0),
-	DEF_RST(R9A07G044_SCIF1_RST_SYSTEM_N, 0x884, 1),
-	DEF_RST(R9A07G044_SCIF2_RST_SYSTEM_N, 0x884, 2),
-	DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
-	DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
-	DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
-	DEF_RST(R9A07G044_SCI1_RST, 0x888, 1),
-	DEF_RST(R9A07G044_RSPI0_RST, 0x890, 0),
-	DEF_RST(R9A07G044_RSPI1_RST, 0x890, 1),
-	DEF_RST(R9A07G044_RSPI2_RST, 0x890, 2),
-	DEF_RST(R9A07G044_CANFD_RSTP_N, 0x894, 0),
-	DEF_RST(R9A07G044_CANFD_RSTC_N, 0x894, 1),
-	DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
-	DEF_RST(R9A07G044_GPIO_PORT_RESETN, 0x898, 1),
-	DEF_RST(R9A07G044_GPIO_SPARE_RESETN, 0x898, 2),
-	DEF_RST(R9A07G044_ADC_PRESETN, 0x8a8, 0),
-	DEF_RST(R9A07G044_ADC_ADRST_N, 0x8a8, 1),
-	DEF_RST(R9A07G044_TSU_PRESETN, 0x8ac, 0),
+static const struct {
+	struct rzg2l_reset common[84];
+#ifdef CONFIG_CLK_R9A07G054
+	struct rzg2l_reset drp[1];
+#endif
+} rzg2l_resets = {
+	.common = {
+		DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
+		DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
+		DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
+		DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
+		DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
+		DEF_RST(R9A07G044_OSTM0_PRESETZ, 0x834, 0),
+		DEF_RST(R9A07G044_OSTM1_PRESETZ, 0x834, 1),
+		DEF_RST(R9A07G044_OSTM2_PRESETZ, 0x834, 2),
+		DEF_RST(R9A07G044_WDT0_PRESETN, 0x848, 0),
+		DEF_RST(R9A07G044_WDT1_PRESETN, 0x848, 1),
+		DEF_RST(R9A07G044_WDT2_PRESETN, 0x848, 2),
+		DEF_RST(R9A07G044_SPI_RST, 0x850, 0),
+		DEF_RST(R9A07G044_SDHI0_IXRST, 0x854, 0),
+		DEF_RST(R9A07G044_SDHI1_IXRST, 0x854, 1),
+		DEF_RST(R9A07G044_GPU_RESETN, 0x858, 0),
+		DEF_RST(R9A07G044_GPU_AXI_RESETN, 0x858, 1),
+		DEF_RST(R9A07G044_GPU_ACE_RESETN, 0x858, 2),
+		DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
+		DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
+		DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
+		DEF_RST(R9A07G044_SSI3_RST_M2_REG, 0x870, 3),
+		DEF_RST(R9A07G044_USB_U2H0_HRESETN, 0x878, 0),
+		DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
+		DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
+		DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
+		DEF_RST(R9A07G044_ETH0_RST_HW_N, 0x87c, 0),
+		DEF_RST(R9A07G044_ETH1_RST_HW_N, 0x87c, 1),
+		DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
+		DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
+		DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
+		DEF_RST(R9A07G044_I2C3_MRST, 0x880, 3),
+		DEF_RST(R9A07G044_SCIF0_RST_SYSTEM_N, 0x884, 0),
+		DEF_RST(R9A07G044_SCIF1_RST_SYSTEM_N, 0x884, 1),
+		DEF_RST(R9A07G044_SCIF2_RST_SYSTEM_N, 0x884, 2),
+		DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
+		DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
+		DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
+		DEF_RST(R9A07G044_SCI1_RST, 0x888, 1),
+		DEF_RST(R9A07G044_RSPI0_RST, 0x890, 0),
+		DEF_RST(R9A07G044_RSPI1_RST, 0x890, 1),
+		DEF_RST(R9A07G044_RSPI2_RST, 0x890, 2),
+		DEF_RST(R9A07G044_CANFD_RSTP_N, 0x894, 0),
+		DEF_RST(R9A07G044_CANFD_RSTC_N, 0x894, 1),
+		DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
+		DEF_RST(R9A07G044_GPIO_PORT_RESETN, 0x898, 1),
+		DEF_RST(R9A07G044_GPIO_SPARE_RESETN, 0x898, 2),
+		DEF_RST(R9A07G044_ADC_PRESETN, 0x8a8, 0),
+		DEF_RST(R9A07G044_ADC_ADRST_N, 0x8a8, 1),
+		DEF_RST(R9A07G044_TSU_PRESETN, 0x8ac, 0),
+	},
+#ifdef CONFIG_CLK_R9A07G054
+	.drp = {
+	},
+#endif
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
@@ -336,8 +370,8 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Core Clocks */
-	.core_clks = r9a07g044_core_clks,
-	.num_core_clks = ARRAY_SIZE(r9a07g044_core_clks),
+	.core_clks = core_clks.common,
+	.num_core_clks = ARRAY_SIZE(core_clks.common),
 	.last_dt_core_clk = LAST_DT_CORE_CLK,
 	.num_total_core_clks = MOD_CLK_BASE,
 
@@ -346,11 +380,34 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
 
 	/* Module Clocks */
-	.mod_clks = r9a07g044_mod_clks,
-	.num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
+	.mod_clks = mod_clks.common,
+	.num_mod_clks = ARRAY_SIZE(mod_clks.common),
 	.num_hw_mod_clks = R9A07G044_TSU_PCLK + 1,
 
 	/* Resets */
-	.resets = r9a07g044_resets,
-	.num_resets = ARRAY_SIZE(r9a07g044_resets),
+	.resets = rzg2l_resets.common,
+	.num_resets = ARRAY_SIZE(rzg2l_resets.common),
+};
+
+#ifdef CONFIG_CLK_R9A07G054
+const struct rzg2l_cpg_info r9a07g054_cpg_info = {
+	/* Core Clocks */
+	.core_clks = core_clks.common,
+	.num_core_clks = ARRAY_SIZE(core_clks.common) + ARRAY_SIZE(core_clks.drp),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a07g044_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = mod_clks.common,
+	.num_mod_clks = ARRAY_SIZE(mod_clks.common) + ARRAY_SIZE(mod_clks.drp),
+	.num_hw_mod_clks = R9A07G054_STPAI_ACLK_DRP + 1,
+
+	/* Resets */
+	.resets = rzg2l_resets.common,
+	.num_resets = ARRAY_SIZE(rzg2l_resets.common) + ARRAY_SIZE(rzg2l_resets.drp),
 };
+#endif
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index edd0abe34a37..486d0656c58a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -952,6 +952,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
 		.compatible = "renesas,r9a07g044-cpg",
 		.data = &r9a07g044_cpg_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A07G054
+	{
+		.compatible = "renesas,r9a07g054-cpg",
+		.data = &r9a07g054_cpg_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 5729d102034b..ce657beaf160 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -203,5 +203,6 @@ struct rzg2l_cpg_info {
 };
 
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
+extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
 
 #endif

base-commit: 3fbefb9570325500dbf3faff80ded6d0d46f48b2
prerequisite-patch-id: 9521891b1a8f39d55cd061f9bd88c89b2af0fa45
-- 
2.17.1

