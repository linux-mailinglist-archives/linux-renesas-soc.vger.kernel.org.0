Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB222173C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 18:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbgGGQSw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 12:18:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44391 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728959AbgGGQSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 12:18:51 -0400
X-IronPort-AV: E=Sophos;i="5.75,324,1589209200"; 
   d="scan'208";a="51328928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2020 01:18:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 130CE4015EE5;
        Wed,  8 Jul 2020 01:18:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/14] clk: renesas: cpg-mssr: Add r8a774e1 support
Date:   Tue,  7 Jul 2020 17:18:10 +0100
Message-Id: <1594138692-16816-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Add support for the RZ/G2H (R8A774E1) SoC to the Renesas Clock
Pulse Generator / Module Standby and Software Reset driver.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r8a774e1-cpg-mssr.c | 348 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h  |   1 +
 5 files changed, 361 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a774e1-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 9eb79bf90643..28e8730ce263 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -15,6 +15,7 @@ config CLK_RENESAS
 	select CLK_R8A774A1 if ARCH_R8A774A1
 	select CLK_R8A774B1 if ARCH_R8A774B1
 	select CLK_R8A774C0 if ARCH_R8A774C0
+	select CLK_R8A774E1 if ARCH_R8A774E1
 	select CLK_R8A7778 if ARCH_R8A7778
 	select CLK_R8A7779 if ARCH_R8A7779
 	select CLK_R8A7790 if ARCH_R8A7790
@@ -84,6 +85,10 @@ config CLK_R8A774C0
 	bool "RZ/G2E clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A774E1
+	bool "RZ/G2H clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN3_CPG
+
 config CLK_R8A7778
 	bool "R-Car M1A clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index a4066f9b34ef..c7c03ab9a6a3 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_CLK_R8A77470)		+= r8a77470-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774A1)		+= r8a774a1-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774B1)		+= r8a774b1-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774C0)		+= r8a774c0-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A774E1)		+= r8a774e1-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7778)		+= clk-r8a7778.o
 obj-$(CONFIG_CLK_R8A7779)		+= clk-r8a7779.o
 obj-$(CONFIG_CLK_R8A7790)		+= r8a7790-cpg-mssr.o
diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
new file mode 100644
index 000000000000..ee95c5882f61
--- /dev/null
+++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a774e1 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ *
+ * Based on r8a7795-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a774e1-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen3-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A774E1_CLK_CANFD,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL3,
+	CLK_PLL4,
+	CLK_PLL1_DIV2,
+	CLK_PLL1_DIV4,
+	CLK_S0,
+	CLK_S1,
+	CLK_S2,
+	CLK_S3,
+	CLK_SDSRC,
+	CLK_RPCSRC,
+	CLK_RINT,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a774e1_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",      CLK_EXTAL),
+	DEF_INPUT("extalr",     CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_GEN3_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll0",       CLK_PLL0, CLK_TYPE_GEN3_PLL0, CLK_MAIN),
+	DEF_BASE(".pll1",       CLK_PLL1, CLK_TYPE_GEN3_PLL1, CLK_MAIN),
+	DEF_BASE(".pll2",       CLK_PLL2, CLK_TYPE_GEN3_PLL2, CLK_MAIN),
+	DEF_BASE(".pll3",       CLK_PLL3, CLK_TYPE_GEN3_PLL3, CLK_MAIN),
+	DEF_BASE(".pll4",       CLK_PLL4, CLK_TYPE_GEN3_PLL4, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2,     CLK_PLL1,       2, 1),
+	DEF_FIXED(".pll1_div4", CLK_PLL1_DIV4,     CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED(".s0",        CLK_S0,            CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED(".s1",        CLK_S1,            CLK_PLL1_DIV2,  3, 1),
+	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
+	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
+	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
+
+	DEF_BASE("rpc",		R8A774E1_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A774E1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A774E1_CLK_RPC),
+
+	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
+
+	/* Core Clock Outputs */
+	DEF_GEN3_Z("z",		R8A774E1_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("z2",	R8A774E1_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
+	DEF_FIXED("ztr",        R8A774E1_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
+	DEF_FIXED("ztrd2",      R8A774E1_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
+	DEF_FIXED("zt",         R8A774E1_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
+	DEF_FIXED("zx",         R8A774E1_CLK_ZX,    CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED("s0d1",       R8A774E1_CLK_S0D1,  CLK_S0,         1, 1),
+	DEF_FIXED("s0d2",       R8A774E1_CLK_S0D2,  CLK_S0,         2, 1),
+	DEF_FIXED("s0d3",       R8A774E1_CLK_S0D3,  CLK_S0,         3, 1),
+	DEF_FIXED("s0d4",       R8A774E1_CLK_S0D4,  CLK_S0,         4, 1),
+	DEF_FIXED("s0d6",       R8A774E1_CLK_S0D6,  CLK_S0,         6, 1),
+	DEF_FIXED("s0d8",       R8A774E1_CLK_S0D8,  CLK_S0,         8, 1),
+	DEF_FIXED("s0d12",      R8A774E1_CLK_S0D12, CLK_S0,        12, 1),
+	DEF_FIXED("s1d2",       R8A774E1_CLK_S1D2,  CLK_S1,         2, 1),
+	DEF_FIXED("s1d4",       R8A774E1_CLK_S1D4,  CLK_S1,         4, 1),
+	DEF_FIXED("s2d1",       R8A774E1_CLK_S2D1,  CLK_S2,         1, 1),
+	DEF_FIXED("s2d2",       R8A774E1_CLK_S2D2,  CLK_S2,         2, 1),
+	DEF_FIXED("s2d4",       R8A774E1_CLK_S2D4,  CLK_S2,         4, 1),
+	DEF_FIXED("s3d1",       R8A774E1_CLK_S3D1,  CLK_S3,         1, 1),
+	DEF_FIXED("s3d2",       R8A774E1_CLK_S3D2,  CLK_S3,         2, 1),
+	DEF_FIXED("s3d4",       R8A774E1_CLK_S3D4,  CLK_S3,         4, 1),
+
+	DEF_GEN3_SD("sd0",      R8A774E1_CLK_SD0,   CLK_SDSRC,     0x074),
+	DEF_GEN3_SD("sd1",      R8A774E1_CLK_SD1,   CLK_SDSRC,     0x078),
+	DEF_GEN3_SD("sd2",      R8A774E1_CLK_SD2,   CLK_SDSRC,     0x268),
+	DEF_GEN3_SD("sd3",      R8A774E1_CLK_SD3,   CLK_SDSRC,     0x26c),
+
+	DEF_FIXED("cl",         R8A774E1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
+	DEF_FIXED("cr",         R8A774E1_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
+	DEF_FIXED("cp",         R8A774E1_CLK_CP,    CLK_EXTAL,      2, 1),
+	DEF_FIXED("cpex",       R8A774E1_CLK_CPEX,  CLK_EXTAL,      2, 1),
+
+	DEF_DIV6P1("canfd",     R8A774E1_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
+	DEF_DIV6P1("csi0",      R8A774E1_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
+	DEF_DIV6P1("mso",       R8A774E1_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
+	DEF_DIV6P1("hdmi",      R8A774E1_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
+
+	DEF_GEN3_OSC("osc",     R8A774E1_CLK_OSC,   CLK_EXTAL,     8),
+
+	DEF_BASE("r",           R8A774E1_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
+};
+
+static const struct mssr_mod_clk r8a774e1_mod_clks[] __initconst = {
+	DEF_MOD("fdp1-1",		 118,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fdp1-0",		 119,	R8A774E1_CLK_S0D1),
+	DEF_MOD("tmu4",			 121,	R8A774E1_CLK_S0D6),
+	DEF_MOD("tmu3",			 122,	R8A774E1_CLK_S3D2),
+	DEF_MOD("tmu2",			 123,	R8A774E1_CLK_S3D2),
+	DEF_MOD("tmu1",			 124,	R8A774E1_CLK_S3D2),
+	DEF_MOD("tmu0",			 125,	R8A774E1_CLK_CP),
+	DEF_MOD("vcplf",		 130,	R8A774E1_CLK_S2D1),
+	DEF_MOD("vdpb",			 131,	R8A774E1_CLK_S2D1),
+	DEF_MOD("scif5",		 202,	R8A774E1_CLK_S3D4),
+	DEF_MOD("scif4",		 203,	R8A774E1_CLK_S3D4),
+	DEF_MOD("scif3",		 204,	R8A774E1_CLK_S3D4),
+	DEF_MOD("scif1",		 206,	R8A774E1_CLK_S3D4),
+	DEF_MOD("scif0",		 207,	R8A774E1_CLK_S3D4),
+	DEF_MOD("msiof3",		 208,	R8A774E1_CLK_MSO),
+	DEF_MOD("msiof2",		 209,	R8A774E1_CLK_MSO),
+	DEF_MOD("msiof1",		 210,	R8A774E1_CLK_MSO),
+	DEF_MOD("msiof0",		 211,	R8A774E1_CLK_MSO),
+	DEF_MOD("sys-dmac2",		 217,	R8A774E1_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A774E1_CLK_S3D1),
+	DEF_MOD("sys-dmac0",		 219,	R8A774E1_CLK_S0D3),
+	DEF_MOD("cmt3",			 300,	R8A774E1_CLK_R),
+	DEF_MOD("cmt2",			 301,	R8A774E1_CLK_R),
+	DEF_MOD("cmt1",			 302,	R8A774E1_CLK_R),
+	DEF_MOD("cmt0",			 303,	R8A774E1_CLK_R),
+	DEF_MOD("tpu0",			 304,	R8A774E1_CLK_S3D4),
+	DEF_MOD("scif2",		 310,	R8A774E1_CLK_S3D4),
+	DEF_MOD("sdif3",		 311,	R8A774E1_CLK_SD3),
+	DEF_MOD("sdif2",		 312,	R8A774E1_CLK_SD2),
+	DEF_MOD("sdif1",		 313,	R8A774E1_CLK_SD1),
+	DEF_MOD("sdif0",		 314,	R8A774E1_CLK_SD0),
+	DEF_MOD("pcie1",		 318,	R8A774E1_CLK_S3D1),
+	DEF_MOD("pcie0",		 319,	R8A774E1_CLK_S3D1),
+	DEF_MOD("usb3-if0",		 328,	R8A774E1_CLK_S3D1),
+	DEF_MOD("usb-dmac0",		 330,	R8A774E1_CLK_S3D1),
+	DEF_MOD("usb-dmac1",		 331,	R8A774E1_CLK_S3D1),
+	DEF_MOD("rwdt",			 402,	R8A774E1_CLK_R),
+	DEF_MOD("intc-ex",		 407,	R8A774E1_CLK_CP),
+	DEF_MOD("intc-ap",		 408,	R8A774E1_CLK_S0D3),
+	DEF_MOD("audmac1",		 501,	R8A774E1_CLK_S1D2),
+	DEF_MOD("audmac0",		 502,	R8A774E1_CLK_S1D2),
+	DEF_MOD("hscif4",		 516,	R8A774E1_CLK_S3D1),
+	DEF_MOD("hscif3",		 517,	R8A774E1_CLK_S3D1),
+	DEF_MOD("hscif2",		 518,	R8A774E1_CLK_S3D1),
+	DEF_MOD("hscif1",		 519,	R8A774E1_CLK_S3D1),
+	DEF_MOD("hscif0",		 520,	R8A774E1_CLK_S3D1),
+	DEF_MOD("thermal",		 522,	R8A774E1_CLK_CP),
+	DEF_MOD("pwm",			 523,	R8A774E1_CLK_S0D12),
+	DEF_MOD("fcpvd1",		 602,	R8A774E1_CLK_S0D2),
+	DEF_MOD("fcpvd0",		 603,	R8A774E1_CLK_S0D2),
+	DEF_MOD("fcpvb1",		 606,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fcpvb0",		 607,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fcpvi1",		 610,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fcpvi0",		 611,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fcpf1",		 614,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fcpf0",		 615,	R8A774E1_CLK_S0D1),
+	DEF_MOD("fcpcs",		 619,	R8A774E1_CLK_S0D1),
+	DEF_MOD("vspd1",		 622,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vspd0",		 623,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vspbc",		 624,	R8A774E1_CLK_S0D1),
+	DEF_MOD("vspbd",		 626,	R8A774E1_CLK_S0D1),
+	DEF_MOD("vspi1",		 630,	R8A774E1_CLK_S0D1),
+	DEF_MOD("vspi0",		 631,	R8A774E1_CLK_S0D1),
+	DEF_MOD("ehci1",		 702,	R8A774E1_CLK_S3D2),
+	DEF_MOD("ehci0",		 703,	R8A774E1_CLK_S3D2),
+	DEF_MOD("hsusb",		 704,	R8A774E1_CLK_S3D2),
+	DEF_MOD("csi20",		 714,	R8A774E1_CLK_CSI0),
+	DEF_MOD("csi40",		 716,	R8A774E1_CLK_CSI0),
+	DEF_MOD("du3",			 721,	R8A774E1_CLK_S2D1),
+	DEF_MOD("du1",			 723,	R8A774E1_CLK_S2D1),
+	DEF_MOD("du0",			 724,	R8A774E1_CLK_S2D1),
+	DEF_MOD("lvds",			 727,	R8A774E1_CLK_S0D4),
+	DEF_MOD("hdmi0",		 729,	R8A774E1_CLK_HDMI),
+	DEF_MOD("vin7",			 804,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin6",			 805,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin5",			 806,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin4",			 807,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin3",			 808,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin2",			 809,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin1",			 810,	R8A774E1_CLK_S0D2),
+	DEF_MOD("vin0",			 811,	R8A774E1_CLK_S0D2),
+	DEF_MOD("etheravb",		 812,	R8A774E1_CLK_S0D6),
+	DEF_MOD("sata0",		 815,	R8A774E1_CLK_S3D2),
+	DEF_MOD("gpio7",		 905,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio6",		 906,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio5",		 907,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio4",		 908,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio3",		 909,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio2",		 910,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio1",		 911,	R8A774E1_CLK_S3D4),
+	DEF_MOD("gpio0",		 912,	R8A774E1_CLK_S3D4),
+	DEF_MOD("can-fd",		 914,	R8A774E1_CLK_S3D2),
+	DEF_MOD("can-if1",		 915,	R8A774E1_CLK_S3D4),
+	DEF_MOD("can-if0",		 916,	R8A774E1_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A774E1_CLK_RPCD2),
+	DEF_MOD("i2c6",			 918,	R8A774E1_CLK_S0D6),
+	DEF_MOD("i2c5",			 919,	R8A774E1_CLK_S0D6),
+	DEF_MOD("adg",			 922,	R8A774E1_CLK_S0D1),
+	DEF_MOD("i2c-dvfs",		 926,	R8A774E1_CLK_CP),
+	DEF_MOD("i2c4",			 927,	R8A774E1_CLK_S0D6),
+	DEF_MOD("i2c3",			 928,	R8A774E1_CLK_S0D6),
+	DEF_MOD("i2c2",			 929,	R8A774E1_CLK_S3D2),
+	DEF_MOD("i2c1",			 930,	R8A774E1_CLK_S3D2),
+	DEF_MOD("i2c0",			 931,	R8A774E1_CLK_S3D2),
+	DEF_MOD("ssi-all",		1005,	R8A774E1_CLK_S3D4),
+	DEF_MOD("ssi9",			1006,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi8",			1007,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi7",			1008,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi6",			1009,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi5",			1010,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi4",			1011,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi3",			1012,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi2",			1013,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi1",			1014,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi0",			1015,	MOD_CLK_ID(1005)),
+	DEF_MOD("scu-all",		1017,	R8A774E1_CLK_S3D4),
+	DEF_MOD("scu-dvc1",		1018,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu1-mix1",	1020,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu0-mix0",	1021,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src9",		1022,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src8",		1023,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src7",		1024,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src6",		1025,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src5",		1026,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src4",		1027,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src3",		1028,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src2",		1029,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src1",		1030,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src0",		1031,	MOD_CLK_ID(1017)),
+};
+
+static const unsigned int r8a774e1_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
+};
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ *   MD		EXTAL		PLL0	PLL1	PLL2	PLL3	PLL4	OSC
+ * 14 13 19 17	(MHz)
+ *-------------------------------------------------------------------------
+ * 0  0  0  0	16.66 x 1	x180	x192	x144	x192	x144	/16
+ * 0  0  0  1	16.66 x 1	x180	x192	x144	x128	x144	/16
+ * 0  0  1  0	Prohibited setting
+ * 0  0  1  1	16.66 x 1	x180	x192	x144	x192	x144	/16
+ * 0  1  0  0	20    x 1	x150	x160	x120	x160	x120	/19
+ * 0  1  0  1	20    x 1	x150	x160	x120	x106	x120	/19
+ * 0  1  1  0	Prohibited setting
+ * 0  1  1  1	20    x 1	x150	x160	x120	x160	x120	/19
+ * 1  0  0  0	25    x 1	x120	x128	x96	x128	x96	/24
+ * 1  0  0  1	25    x 1	x120	x128	x96	x84	x96	/24
+ * 1  0  1  0	Prohibited setting
+ * 1  0  1  1	25    x 1	x120	x128	x96	x128	x96	/24
+ * 1  1  0  0	33.33 / 2	x180	x192	x144	x192	x144	/32
+ * 1  1  0  1	33.33 / 2	x180	x192	x144	x128	x144	/32
+ * 1  1  1  0	Prohibited setting
+ * 1  1  1  1	33.33 / 2	x180	x192	x144	x192	x144	/32
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 11) | \
+					 (((md) & BIT(13)) >> 11) | \
+					 (((md) & BIT(19)) >> 18) | \
+					 (((md) & BIT(17)) >> 17))
+
+static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div	OSC prediv */
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		192,	1,	128,	1,	16,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		160,	1,	106,	1,	19,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		128,	1,	128,	1,	24,	},
+	{ 1,		128,	1,	84,	1,	24,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		128,	1,	128,	1,	24,	},
+	{ 2,		192,	1,	192,	1,	32,	},
+	{ 2,		192,	1,	128,	1,	32,	},
+	{ 0, /* Prohibited setting */				},
+	{ 2,		192,	1,	192,	1,	32,	},
+};
+
+static int __init r8a774e1_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	if (!cpg_pll_config->extal_div) {
+		dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
+		return -EINVAL;
+	}
+
+	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a774e1_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a774e1_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a774e1_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a774e1_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a774e1_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a774e1_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a774e1_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a774e1_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index dcb6e2706d37..0b3ab853ef47 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -720,6 +720,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a774c0_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A774E1
+	{
+		.compatible = "renesas,r8a774e1-cpg-mssr",
+		.data = &r8a774e1_cpg_mssr_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R8A7790
 	{
 		.compatible = "renesas,r8a7790-cpg-mssr",
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 55a18ef0efaf..1cc569484250 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -162,6 +162,7 @@ extern const struct cpg_mssr_info r8a77470_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774a1_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774b1_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774c0_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a774e1_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7790_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7791_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7792_cpg_mssr_info;
-- 
2.17.1

