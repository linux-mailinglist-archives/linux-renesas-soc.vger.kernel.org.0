Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C174A8912
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 17:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352439AbiBCQvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 11:51:39 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27029 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1352419AbiBCQvh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 11:51:37 -0500
X-IronPort-AV: E=Sophos;i="5.88,340,1635174000"; 
   d="scan'208";a="109261238"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Feb 2022 01:51:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B607D4007F20;
        Fri,  4 Feb 2022 01:51:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Date:   Thu,  3 Feb 2022 16:51:30 +0000
Message-Id: <20220203165130.7206-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clock structure for RZ/V2L is almost identical to RZ/G2L SoC. The only
difference being RZ/V2L has additional registers to control the clock and
reset for the DRP-AI block.

This patch reuses r9a07g044-cpg.c, as the common clock IDS are the same
between RZ/G2L and RZ/V2L and adding a separate r9a07g054_cpg_info to
take care of DRP-AI clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
* reuse r9a07g044-cpg.c for RZ/V2L
v1->v2
* Updated divider values for PLL2/3
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c | 291 ++++++++++++++++------------
 drivers/clk/renesas/rzg2l-cpg.c     |   6 +
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 177 insertions(+), 129 deletions(-)

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
index 79042bf46fe8..f12454013685 100644
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
@@ -149,131 +150,142 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 		CLK_DIVIDER_HIWORD_MASK),
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
 
 static struct rzg2l_reset r9a07g044_resets[] = {
@@ -346,11 +358,34 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
 
 	/* Module Clocks */
-	.mod_clks = r9a07g044_mod_clks,
-	.num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
+	.mod_clks = mod_clks.common,
+	.num_mod_clks = ARRAY_SIZE(mod_clks.common),
 	.num_hw_mod_clks = R9A07G044_TSU_PCLK + 1,
 
 	/* Resets */
 	.resets = r9a07g044_resets,
 	.num_resets = ARRAY_SIZE(r9a07g044_resets),
 };
+
+#ifdef CONFIG_CLK_R9A07G054
+const struct rzg2l_cpg_info r9a07g054_cpg_info = {
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
+	.mod_clks = mod_clks.common,
+	.num_mod_clks = ARRAY_SIZE(mod_clks.common) + ARRAY_SIZE(mod_clks.drp),
+	.num_hw_mod_clks = R9A07G054_STPAI_ACLK_DRP + 1,
+
+	/* Resets */
+	.resets = r9a07g044_resets,
+	.num_resets = ARRAY_SIZE(r9a07g044_resets),
+};
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
-- 
2.17.1

