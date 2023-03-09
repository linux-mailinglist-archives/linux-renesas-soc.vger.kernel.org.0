Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C943A6B2B6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 18:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjCIRBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 12:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjCIRAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 12:00:45 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B6793DDB15;
        Thu,  9 Mar 2023 08:55:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,246,1673881200"; 
   d="scan'208";a="155417075"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2023 01:55:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A018A4006DEA;
        Fri, 10 Mar 2023 01:55:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] drivers: clk: Add support for versa3 clock driver
Date:   Thu,  9 Mar 2023 16:55:28 +0000
Message-Id: <20230309165529.223052-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
References: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for Renesas versa3 clock driver(5p35023).
The clock generator provides 6 output clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v2:
 * Dropped header file <linux/clk.h> and removed all
   consumer api's
 * struct clk_parent_data used for assigning the parent names.
 * Replaced initpointer->const init pointer in vc3_clk_register
 * Replaced of_clk_add_hw_provider with devm_clk_add_hw_provider
 * Dropped vc3_remove() callback.
---
 drivers/clk/Kconfig           |    9 +
 drivers/clk/Makefile          |    1 +
 drivers/clk/clk-versaclock3.c | 1139 +++++++++++++++++++++++++++++++++
 3 files changed, 1149 insertions(+)
 create mode 100644 drivers/clk/clk-versaclock3.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b6c5bf69a2b2..4dfa44cf5289 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -367,6 +367,15 @@ config COMMON_CLK_RS9_PCIE
 	  This driver supports the Renesas 9-series PCIe clock generator
 	  models 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ.
 
+config COMMON_CLK_VC3
+	tristate "Clock driver for Renesas VersaClock 3 devices"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This driver supports the Renesas VersaClock 3 programmable clock
+	  generators.
+
 config COMMON_CLK_VC5
 	tristate "Clock driver for IDT VersaClock 5,6 devices"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..e7aa4f81863c 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+= clk-renesas-pcie.o
+obj-$(CONFIG_COMMON_CLK_VC3)		+= clk-versaclock3.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_VC7)		+= clk-versaclock7.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
new file mode 100644
index 000000000000..6c5c8b37f6af
--- /dev/null
+++ b/drivers/clk/clk-versaclock3.c
@@ -0,0 +1,1139 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Renesas Versaclock 3
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/i2c.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define NUM_CONFIG_REGISTERS		37
+
+#define VC3_GENERAL_CTR			0x0
+#define VC3_GENERAL_CTR_DIV1_SRC_SEL	BIT(3)
+#define VC3_GENERAL_CTR_PLL3_REFIN_SEL	BIT(2)
+
+#define VC3_PLL3_M_DIVIDER		0x3
+#define VC3_PLL3_M_DIV1			BIT(7)
+#define VC3_PLL3_M_DIV2			BIT(6)
+#define VC3_PLL3_M_DIV(n)		((n) & GENMASK(5, 0))
+
+#define VC3_PLL3_N_DIVIDER		0x4
+#define VC3_PLL3_LOOP_FILTER_N_DIV_MSB	0x5
+
+#define VC3_PLL3_CHARGE_PUMP_CTRL	0x6
+#define VC3_PLL3_CHARGE_PUMP_CTRL_OUTDIV3_SRC_SEL	BIT(7)
+
+#define VC3_PLL1_CTRL_OUTDIV5		0x7
+#define VC3_PLL1_CTRL_OUTDIV5_PLL1_MDIV_DOUBLER		BIT(7)
+
+#define VC3_PLL1_M_DIVIDER		0x8
+#define VC3_PLL1_M_DIV1			BIT(7)
+#define VC3_PLL1_M_DIV2			BIT(6)
+#define VC3_PLL1_M_DIV(n)		((n) & GENMASK(5, 0))
+
+#define VC3_PLL1_VCO_N_DIVIDER		0x9
+#define VC3_PLL1_LOOP_FILTER_N_DIV_MSB	0x0a
+
+#define VC3_OUT_DIV1_DIV2_CTRL		0xf
+
+#define VC3_PLL2_FB_INT_DIV_MSB		0x10
+#define VC3_PLL2_FB_INT_DIV_LSB		0x11
+#define VC3_PLL2_FB_FRC_DIV_MSB		0x12
+#define VC3_PLL2_FB_FRC_DIV_LSB		0x13
+
+#define VC3_PLL2_M_DIVIDER		0x1a
+#define VC3_PLL2_MDIV_DOUBLER		BIT(7)
+#define VC3_PLL2_M_DIV1			BIT(6)
+#define VC3_PLL2_M_DIV2			BIT(5)
+#define VC3_PLL2_M_DIV(n)		((n) & GENMASK(4, 0))
+
+#define VC3_OUT_DIV3_DIV4_CTRL		0x1b
+
+#define VC3_PLL_OP_CTRL			0x1c
+#define VC3_PLL_OP_CTRL_PLL2_REFIN_SEL	6
+
+#define VC3_OUTPUT_CTR			0x1d
+#define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
+
+#define VC3_SE2_CTRL_REG0		0x1f
+#define VC3_SE2_CTRL_REG0_SE2_CLK_SEL	BIT(6)
+
+#define VC3_SE3_DIFF1_CTRL_REG		0x21
+#define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
+
+#define VC3_DIFF1_CTRL_REG		0x22
+#define VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL	BIT(7)
+
+#define VC3_DIFF2_CTRL_REG		0x23
+#define VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL	BIT(7)
+
+#define VC3_SE1_DIV4_CTRL		0x24
+#define VC3_SE1_DIV4_CTRL_SE1_CLK_SEL	BIT(3)
+
+#define VC3_PLL1_VCO_MIN		300000000UL
+#define VC3_PLL1_VCO_MAX		600000000UL
+
+#define VC3_PLL2_VCO_MIN		400000000UL
+#define VC3_PLL2_VCO_MAX		1200000000UL
+
+#define VC3_PLL3_VCO_MIN		300000000UL
+#define VC3_PLL3_VCO_MAX		800000000UL
+
+#define VC3_2_POW_16			(U16_MAX + 1)
+#define VC3_DIV_MASK(width)		((1 << (width)) - 1)
+
+struct vc3_driver_data;
+
+enum vc3_pfd_mux {
+	VC3_PFD2_MUX,
+	VC3_PFD3_MUX,
+};
+
+enum vc3_pfd {
+	VC3_PFD1,
+	VC3_PFD2,
+	VC3_PFD3,
+};
+
+enum vc3_pll {
+	VC3_PLL1,
+	VC3_PLL2,
+	VC3_PLL3,
+};
+
+enum vc3_div_mux {
+	VC3_DIV1_MUX,
+	VC3_DIV3_MUX,
+	VC3_DIV4_MUX,
+};
+
+enum vc3_div {
+	VC3_DIV1,
+	VC3_DIV2,
+	VC3_DIV3,
+	VC3_DIV4,
+	VC3_DIV5,
+};
+
+enum vc3_clk_mux {
+	VC3_DIFF2_MUX,
+	VC3_DIFF1_MUX,
+	VC3_SE3_MUX,
+	VC3_SE2_MUX,
+	VC3_SE1_MUX,
+};
+
+enum vc3_clk {
+	VC3_DIFF2,
+	VC3_DIFF1,
+	VC3_SE3,
+	VC3_SE2,
+	VC3_SE1,
+	VC3_REF,
+};
+
+struct vc3_clk_data {
+	const char * const name;
+	u8 offs;
+	u8 bitmsk;
+};
+
+struct vc3_pfd_data {
+	const char * const name;
+	u8 offs;
+	u8 mdiv1_bitmsk;
+	u8 mdiv2_bitmsk;
+};
+
+struct vc3_pll_data {
+	const char * const name;
+	u8 int_div_msb_offs;
+	u8 int_div_lsb_offs;
+	unsigned long vco_min;
+	unsigned long vco_max;
+};
+
+struct vc3_div_data {
+	const char * const name;
+	u8 offs;
+	const struct clk_div_table *table;
+	u8 shift;
+	u8 width;
+};
+
+static const struct clk_div_table div1_divs[] = {
+	{ .val = 0, .div = 1, }, { .val = 1, .div = 4, },
+	{ .val = 2, .div = 5, }, { .val = 3, .div = 6, },
+	{ .val = 4, .div = 2, }, { .val = 5, .div = 8, },
+	{ .val = 6, .div = 10, }, { .val = 7, .div = 12, },
+	{ .val = 8, .div = 4, }, { .val = 9, .div = 16, },
+	{ .val = 10, .div = 20, }, { .val = 11, .div = 24, },
+	{ .val = 12, .div = 8, }, { .val = 13, .div = 32, },
+	{ .val = 14, .div = 40, }, { .val = 15, .div = 48, },
+	{}
+};
+
+static const struct clk_div_table div245_divs[] = {
+	{ .val = 0, .div = 1, }, { .val = 1, .div = 3, },
+	{ .val = 2, .div = 5, }, { .val = 3, .div = 10, },
+	{ .val = 4, .div = 2, }, { .val = 5, .div = 6, },
+	{ .val = 6, .div = 10, }, { .val = 7, .div = 20, },
+	{ .val = 8, .div = 4, }, { .val = 9, .div = 12, },
+	{ .val = 10, .div = 20, }, { .val = 11, .div = 40, },
+	{ .val = 12, .div = 5, }, { .val = 13, .div = 15, },
+	{ .val = 14, .div = 25, }, { .val = 15, .div = 50, },
+	{}
+};
+
+static const struct clk_div_table div3_divs[] = {
+	{ .val = 0, .div = 1, }, { .val = 1, .div = 3, },
+	{ .val = 2, .div = 5, }, { .val = 3, .div = 10, },
+	{ .val = 4, .div = 2, }, { .val = 5, .div = 6, },
+	{ .val = 6, .div = 10, }, { .val = 7, .div = 20, },
+	{ .val = 8, .div = 4, }, { .val = 9, .div = 12, },
+	{ .val = 10, .div = 20, }, { .val = 11, .div = 40, },
+	{ .val = 12, .div = 8, }, { .val = 13, .div = 24, },
+	{ .val = 14, .div = 40, }, { .val = 15, .div = 80, },
+	{}
+};
+
+static const char * const vc3_fin_name = "xtal";
+
+static const char * const vc3_pfd_mux_names[] = {
+	[VC3_PFD2_MUX] = "pfd2_mux",
+	[VC3_PFD3_MUX] = "pfd3_mux"
+};
+
+static const char * const vc3_pfd_names[] = {
+	[VC3_PFD1] = "pfd1",
+	[VC3_PFD2] = "pfd2",
+	[VC3_PFD3] = "pfd3"
+};
+
+static const char * const vc3_pll_names[] = {
+	[VC3_PLL1] = "pll1",
+	[VC3_PLL2] = "pll2",
+	[VC3_PLL3] = "pll3"
+};
+
+static const char * const vc3_div_mux_names[] = {
+	[VC3_DIV1_MUX] = "div1_mux",
+	[VC3_DIV3_MUX] = "div3_mux",
+	[VC3_DIV4_MUX] = "div4_mux"
+};
+
+static const char * const vc3_div_names[] = {
+	[VC3_DIV1] = "div1",
+	[VC3_DIV2] = "div2",
+	[VC3_DIV3] = "div3",
+	[VC3_DIV4] = "div4",
+	[VC3_DIV5] = "div5"
+};
+
+static const char * const vc3_clk_mux_names[] = {
+	[VC3_DIFF2_MUX] = "diff2_mux",
+	[VC3_DIFF1_MUX] = "diff1_mux",
+	[VC3_SE3_MUX] = "se3_mux",
+	[VC3_SE2_MUX] = "se2_mux",
+	[VC3_SE1_MUX] = "se1_mux"
+};
+
+static const char * const vc3_clk_out_names[] = {
+	[VC3_DIFF2] = "diff2",
+	[VC3_DIFF1] = "diff1",
+	[VC3_SE3] = "se3",
+	[VC3_SE2] = "se2",
+	[VC3_SE1] = "se1",
+	[VC3_REF] = "ref"
+};
+
+static const struct clk_parent_data pfdmux_p[] = {
+	{ .fw_name = vc3_fin_name, .name = vc3_fin_name },
+	{ .fw_name = "div2", .name = "div2" }
+};
+
+static const struct clk_parent_data pfd_p[] = {
+	{ .fw_name = vc3_fin_name, .name = vc3_fin_name },
+	{ .fw_name = "pfd2_mux", .name = "pfd2_mux" },
+	{ .fw_name = "pfd3_mux", .name = "pfd3_mux" }
+};
+
+static const struct clk_parent_data pll_p[] = {
+	{ .fw_name = "pfd1", .name = "pfd1" },
+	{ .fw_name = "pfd2", .name = "pfd2" },
+	{ .fw_name = "pfd3", .name = "pfd3" }
+};
+
+static const struct clk_parent_data divmux_p[][2] = {
+	{
+		{ .fw_name = "pll1", .name = "pll1" },
+		{ .fw_name = "xtal", .name = vc3_fin_name }
+	},
+	{
+		{ .fw_name = "pll2", .name = "pll2" },
+		{ .fw_name = "pll3", .name = "pll3" }
+	},
+	{
+		{ .fw_name = "pll2", .name = "pll2" },
+		{ .fw_name = vc3_fin_name, .name = vc3_fin_name }
+	}
+};
+
+static const struct clk_parent_data div_p[] = {
+	{ .fw_name = "div1_mux", .name = "div1_mux" },
+	{ .fw_name = "pll1", .name = "pll1" },
+	{ .fw_name = "div3_mux", .name = "div3_mux" },
+	{ .fw_name = "div4_mux", .name = "div4_mux" },
+	{ .fw_name = "pll3", .name = "pll3" }
+};
+
+static const struct clk_parent_data clkmux_p[][2] = {
+	{
+		{ .fw_name = "div1", .name = "div1" },
+		{ .fw_name = "div3", .name = "div3" }
+	},
+	{
+		{ .fw_name = "div1", .name = "div1" },
+		{ .fw_name = "div3", .name = "div3" }
+	},
+	{
+		{ .fw_name = "div2", .name = "div2" },
+		{ .fw_name = "div4", .name = "div4" }
+	},
+	{
+		{ .fw_name = "div5", .name = "div5" },
+		{ .fw_name = "div4", .name = "div4" }
+	},
+	{
+		{ .fw_name = "div5", .name = "div5" },
+		{ .fw_name = "div4", .name = "div4" }
+	}
+};
+
+static const struct clk_parent_data clkout_p[] = {
+	{ .fw_name = "diff2_mux", .name = "diff2_mux" },
+	{ .fw_name = "diff1_mux", .name = "diff1_mux" },
+	{ .fw_name = "se3_mux", .name = "se3_mux" },
+	{ .fw_name = "se2_mux", .name = "se2_mux" },
+	{ .fw_name = "se1_mux", .name = "se1_mux" },
+	{ .fw_name = vc3_fin_name, .name = vc3_fin_name }
+};
+
+static const struct vc3_clk_data pfd_mux_data[] = {
+	[VC3_PFD2_MUX] = {
+		.name = vc3_pfd_mux_names[VC3_PFD2_MUX],
+		.offs = VC3_PLL_OP_CTRL,
+		.bitmsk = BIT(VC3_PLL_OP_CTRL_PLL2_REFIN_SEL)
+	},
+	[VC3_PFD3_MUX] = {
+		.name = vc3_pfd_mux_names[VC3_PFD3_MUX],
+		.offs = VC3_GENERAL_CTR,
+		.bitmsk = BIT(VC3_GENERAL_CTR_PLL3_REFIN_SEL)
+	}
+};
+
+static const struct vc3_pfd_data pfd_data[] = {
+	[VC3_PFD1] = {
+		.name = vc3_pfd_names[VC3_PFD1],
+		.offs = VC3_PLL1_M_DIVIDER,
+		.mdiv1_bitmsk = VC3_PLL1_M_DIV1,
+		.mdiv2_bitmsk = VC3_PLL1_M_DIV2
+	},
+	[VC3_PFD2] = {
+		.name = vc3_pfd_names[VC3_PFD2],
+		.offs = VC3_PLL2_M_DIVIDER,
+		.mdiv1_bitmsk = VC3_PLL2_M_DIV1,
+		.mdiv2_bitmsk = VC3_PLL2_M_DIV2
+	},
+	[VC3_PFD3] = {
+		.name = vc3_pfd_names[VC3_PFD3],
+		.offs = VC3_PLL3_M_DIVIDER,
+		.mdiv1_bitmsk = VC3_PLL3_M_DIV1,
+		.mdiv2_bitmsk = VC3_PLL3_M_DIV2
+	}
+};
+
+static const struct vc3_pll_data pll_data[] = {
+	[VC3_PLL1] = {
+		.name = vc3_pll_names[VC3_PLL1],
+		.int_div_msb_offs = VC3_PLL1_LOOP_FILTER_N_DIV_MSB,
+		.int_div_lsb_offs = VC3_PLL1_VCO_N_DIVIDER,
+		.vco_min = VC3_PLL1_VCO_MIN,
+		.vco_max = VC3_PLL1_VCO_MAX
+	},
+	[VC3_PLL2] = {
+		.name = vc3_pll_names[VC3_PLL2],
+		.int_div_msb_offs = VC3_PLL2_FB_INT_DIV_MSB,
+		.int_div_lsb_offs = VC3_PLL2_FB_INT_DIV_LSB,
+		.vco_min = VC3_PLL2_VCO_MIN,
+		.vco_max = VC3_PLL2_VCO_MAX
+	},
+	[VC3_PLL3] = {
+		.name = vc3_pll_names[VC3_PLL3],
+		.int_div_msb_offs = VC3_PLL3_LOOP_FILTER_N_DIV_MSB,
+		.int_div_lsb_offs = VC3_PLL3_N_DIVIDER,
+		.vco_min = VC3_PLL3_VCO_MIN,
+		.vco_max = VC3_PLL3_VCO_MAX
+	}
+};
+
+static const struct vc3_clk_data div_mux_data[] = {
+	[VC3_DIV1_MUX] = {
+		.name = vc3_div_mux_names[VC3_DIV1_MUX],
+		.offs = VC3_GENERAL_CTR,
+		.bitmsk = VC3_GENERAL_CTR_DIV1_SRC_SEL
+	},
+	[VC3_DIV3_MUX] = {
+		.name = vc3_div_mux_names[VC3_DIV3_MUX],
+		.offs = VC3_PLL3_CHARGE_PUMP_CTRL,
+		.bitmsk = VC3_PLL3_CHARGE_PUMP_CTRL_OUTDIV3_SRC_SEL
+	},
+	[VC3_DIV4_MUX] = {
+		.name = vc3_div_mux_names[VC3_DIV4_MUX],
+		.offs = VC3_OUTPUT_CTR,
+		.bitmsk = VC3_OUTPUT_CTR_DIV4_SRC_SEL
+	}
+};
+
+static const struct vc3_div_data div_data[] = {
+	[VC3_DIV1] = {
+		.name = vc3_div_names[VC3_DIV1],
+		.offs = VC3_OUT_DIV1_DIV2_CTRL,
+		.table = div1_divs,
+		.shift = 4,
+		.width = 4
+	},
+	[VC3_DIV2] = {
+		.name = vc3_div_names[VC3_DIV2],
+		.offs = VC3_OUT_DIV1_DIV2_CTRL,
+		.table = div245_divs,
+		.shift = 0,
+		.width = 4
+	},
+	[VC3_DIV3] = {
+		.name = vc3_div_names[VC3_DIV3],
+		.offs = VC3_OUT_DIV3_DIV4_CTRL,
+		.table = div3_divs,
+		.shift = 4,
+		.width = 4
+	},
+	[VC3_DIV4] = {
+		.name = vc3_div_names[VC3_DIV4],
+		.offs = VC3_OUT_DIV3_DIV4_CTRL,
+		.table = div245_divs,
+		.shift = 0,
+		.width = 4
+	},
+	[VC3_DIV5] = {
+		.name = vc3_div_names[VC3_DIV5],
+		.offs = VC3_PLL1_CTRL_OUTDIV5,
+		.table = div245_divs,
+		.shift = 0,
+		.width = 4
+	}
+};
+
+static const struct vc3_clk_data clk_mux_data[] = {
+	[VC3_DIFF2_MUX] = {
+		.name = vc3_clk_mux_names[VC3_DIFF2_MUX],
+		.offs = VC3_DIFF2_CTRL_REG,
+		.bitmsk = VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL
+	},
+	[VC3_DIFF1_MUX] = {
+		.name = vc3_clk_mux_names[VC3_DIFF1_MUX],
+		.offs = VC3_DIFF1_CTRL_REG,
+		.bitmsk = VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL
+	},
+	[VC3_SE3_MUX] = {
+		.name = vc3_clk_mux_names[VC3_SE3_MUX],
+		.offs = VC3_SE3_DIFF1_CTRL_REG,
+		.bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL
+	},
+	[VC3_SE2_MUX] = {
+		.name = vc3_clk_mux_names[VC3_SE2_MUX],
+		.offs = VC3_SE2_CTRL_REG0,
+		.bitmsk = VC3_SE2_CTRL_REG0_SE2_CLK_SEL
+	},
+	[VC3_SE1_MUX] = {
+		.name = vc3_clk_mux_names[VC3_SE1_MUX],
+		.offs = VC3_SE1_DIV4_CTRL,
+		.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
+	}
+};
+
+static const struct vc3_clk_data clk_out_data[] = {
+	[VC3_DIFF2] = { .name = vc3_clk_out_names[VC3_DIFF2] },
+	[VC3_DIFF1] = { .name = vc3_clk_out_names[VC3_DIFF1] },
+	[VC3_SE3] = { .name = vc3_clk_out_names[VC3_SE3] },
+	[VC3_SE2] = { .name = vc3_clk_out_names[VC3_SE2] },
+	[VC3_SE1] = { .name = vc3_clk_out_names[VC3_SE1] },
+	[VC3_REF] = { .name = vc3_clk_out_names[VC3_REF] }
+};
+
+struct vc3_hw_data {
+	struct clk_hw hw;
+	struct vc3_driver_data *vc3;
+	const void *data;
+	unsigned int num;
+	u32 div_int;
+	u32 div_frc;
+	u8 flags;
+};
+
+struct vc3_driver_data {
+	struct i2c_client *client;
+	struct regmap *regmap;
+
+	struct vc3_hw_data clk_pfd_mux[ARRAY_SIZE(pfd_mux_data)];
+	struct vc3_hw_data clk_pfd[ARRAY_SIZE(pfd_data)];
+	struct vc3_hw_data clk_pll[ARRAY_SIZE(pll_data)];
+	struct vc3_hw_data clk_div_mux[ARRAY_SIZE(div_mux_data)];
+	struct vc3_hw_data clk_div[ARRAY_SIZE(div_data)];
+	struct vc3_hw_data clk_mux[ARRAY_SIZE(clk_mux_data)];
+	struct vc3_hw_data clk_out[ARRAY_SIZE(clk_out_data)];
+};
+
+static unsigned char vc3_pfd_mux_get_parent(struct clk_hw *hw)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_clk_data *pfd_mux = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	u32 src;
+
+	regmap_read(vc3->regmap, pfd_mux->offs, &src);
+
+	return !!(src & pfd_mux->bitmsk);
+}
+
+static int vc3_pfd_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_clk_data *pfd_mux = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+
+	regmap_update_bits(vc3->regmap, pfd_mux->offs, pfd_mux->bitmsk,
+			   index ? pfd_mux->bitmsk : 0);
+	return 0;
+}
+
+static const struct clk_ops vc3_pfd_mux_ops = {
+	.set_parent = vc3_pfd_mux_set_parent,
+	.get_parent = vc3_pfd_mux_get_parent,
+};
+
+static unsigned long vc3_pfd_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_pfd_data *pfd = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	unsigned int prediv, premul;
+	unsigned long rate;
+	u8 mdiv;
+
+	regmap_read(vc3->regmap, pfd->offs, &prediv);
+	if (hwdata->num == VC3_PFD1) {
+		/* The bypass_prediv is set, PLL fed from Ref_in directly. */
+		if (prediv & pfd->mdiv1_bitmsk) {
+			/* check doubler is set or not */
+			regmap_read(vc3->regmap, VC3_PLL1_CTRL_OUTDIV5, &premul);
+			if (premul & VC3_PLL1_CTRL_OUTDIV5_PLL1_MDIV_DOUBLER)
+				parent_rate *= 2;
+			return parent_rate;
+		}
+		mdiv = VC3_PLL1_M_DIV(prediv);
+	} else if (hwdata->num == VC3_PFD2) {
+		/* The bypass_prediv is set, PLL fed from Ref_in directly. */
+		if (prediv & pfd->mdiv1_bitmsk) {
+			/* check doubler is set or not */
+			if (premul & VC3_PLL2_MDIV_DOUBLER)
+				parent_rate *= 2;
+			return parent_rate;
+		}
+
+		mdiv = VC3_PLL2_M_DIV(prediv);
+	} else {
+		/* The bypass_prediv is set, PLL fed from Ref_in directly. */
+		if (prediv & pfd->mdiv1_bitmsk)
+			return parent_rate;
+
+		mdiv = VC3_PLL3_M_DIV(prediv);
+	}
+
+	if (prediv & pfd->mdiv2_bitmsk)
+		rate = parent_rate / 2;
+	else
+		rate = parent_rate / mdiv;
+
+	return rate;
+}
+
+static long vc3_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	unsigned long idiv;
+
+	/* PLL cannot operate with input clock above 50 MHz. */
+	if (rate > 50000000)
+		return -EINVAL;
+
+	/* CLKIN within range of PLL input, feed directly to PLL. */
+	if (*parent_rate <= 50000000)
+		return *parent_rate;
+
+	idiv = DIV_ROUND_UP(*parent_rate, rate);
+	if (hwdata->num == VC3_PFD1 || hwdata->num == VC3_PFD3) {
+		if (idiv > 63)
+			return -EINVAL;
+	} else {
+		if (idiv > 31)
+			return -EINVAL;
+	}
+
+	return *parent_rate / idiv;
+}
+
+static int vc3_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_pfd_data *pfd = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	unsigned long idiv;
+	u8 div;
+
+	/* CLKIN within range of PLL input, feed directly to PLL. */
+	if (parent_rate <= 50000000) {
+		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv1_bitmsk,
+				   pfd->mdiv1_bitmsk);
+		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv2_bitmsk, 0);
+		return 0;
+	}
+
+	idiv = DIV_ROUND_UP(parent_rate, rate);
+	/* We have dedicated div-2 predivider. */
+	if (idiv == 2) {
+		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv2_bitmsk,
+				   pfd->mdiv2_bitmsk);
+		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv1_bitmsk, 0);
+	} else {
+		if (hwdata->num == VC3_PFD1)
+			div = VC3_PLL1_M_DIV(idiv);
+		else if (hwdata->num == VC3_PFD2)
+			div = VC3_PLL2_M_DIV(idiv);
+		else
+			div = VC3_PLL3_M_DIV(idiv);
+
+		regmap_write(vc3->regmap, pfd->offs, div);
+	}
+
+	return 0;
+}
+
+static const struct clk_ops vc3_pfd_ops = {
+	.recalc_rate = vc3_pfd_recalc_rate,
+	.round_rate = vc3_pfd_round_rate,
+	.set_rate = vc3_pfd_set_rate,
+};
+
+static unsigned long vc3_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_pll_data *pll = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	u32 div_int, div_frc, val;
+	unsigned long rate;
+
+	regmap_read(vc3->regmap, pll->int_div_msb_offs, &val);
+	div_int = (val & GENMASK(2, 0)) << 8;
+	regmap_read(vc3->regmap, pll->int_div_lsb_offs, &val);
+	div_int |= val;
+
+	if (hwdata->num == VC3_PLL2) {
+		regmap_read(vc3->regmap, VC3_PLL2_FB_FRC_DIV_MSB, &val);
+		div_frc = val << 8;
+		regmap_read(vc3->regmap, VC3_PLL2_FB_FRC_DIV_LSB, &val);
+		div_frc |= val;
+		rate = (parent_rate *
+			(div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
+	} else {
+		rate = parent_rate * div_int;
+	}
+
+	return rate;
+}
+
+static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_pll_data *pll = hwdata->data;
+	u64 div_frc;
+
+	if (rate < pll->vco_min)
+		rate = pll->vco_min;
+	if (rate > pll->vco_max)
+		rate = pll->vco_max;
+
+	hwdata->div_int = rate / *parent_rate;
+
+	if (hwdata->num == VC3_PLL2) {
+		if (hwdata->div_int > 0x7ff)
+			rate = *parent_rate * 0x7ff;
+
+		/* Determine best fractional part, which is 16 bit wide */
+		div_frc = rate % *parent_rate;
+		div_frc *= BIT(16) - 1;
+		do_div(div_frc, *parent_rate);
+
+		hwdata->div_frc = (u32)div_frc;
+		rate = (*parent_rate *
+			(hwdata->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
+	} else {
+		rate = *parent_rate * hwdata->div_int;
+	}
+
+	return rate;
+}
+
+static int vc3_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_pll_data *pll = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	u32 val;
+
+	regmap_read(vc3->regmap, pll->int_div_msb_offs, &val);
+	val = (val & 0xf8) | ((hwdata->div_int >> 8) & 0x7);
+	regmap_write(vc3->regmap, pll->int_div_msb_offs, val);
+	regmap_write(vc3->regmap, pll->int_div_lsb_offs, hwdata->div_int & 0xff);
+
+	if (hwdata->num == VC3_PLL2) {
+		regmap_write(vc3->regmap, VC3_PLL2_FB_FRC_DIV_MSB,
+			     hwdata->div_frc >> 8);
+		regmap_write(vc3->regmap, VC3_PLL2_FB_FRC_DIV_LSB,
+			     hwdata->div_frc & 0xff);
+	}
+
+	return 0;
+}
+
+static const struct clk_ops vc3_pll_ops = {
+	.recalc_rate = vc3_pll_recalc_rate,
+	.round_rate = vc3_pll_round_rate,
+	.set_rate = vc3_pll_set_rate,
+};
+
+static unsigned char vc3_div_mux_get_parent(struct clk_hw *hw)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_clk_data *div_mux = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	u32 src;
+
+	regmap_read(vc3->regmap, div_mux->offs, &src);
+
+	return !!(src & div_mux->bitmsk);
+}
+
+static int vc3_div_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_clk_data *div_mux = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+
+	regmap_update_bits(vc3->regmap, div_mux->offs, div_mux->bitmsk,
+			   index ? div_mux->bitmsk : 0);
+
+	return 0;
+}
+
+static const struct clk_ops vc3_div_mux_ops = {
+	.set_parent = vc3_div_mux_set_parent,
+	.get_parent = vc3_div_mux_get_parent,
+};
+
+static unsigned int vc3_get_div(const struct clk_div_table *table,
+				unsigned int val, unsigned long flag)
+{
+	const struct clk_div_table *clkt;
+
+	for (clkt = table; clkt->div; clkt++)
+		if (clkt->val == val)
+			return clkt->div;
+
+	return 0;
+}
+
+static unsigned long vc3_div_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_div_data *div_data = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	unsigned int val;
+
+	regmap_read(vc3->regmap, div_data->offs, &val);
+	val >>= div_data->shift;
+	val &= VC3_DIV_MASK(div_data->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, div_data->table,
+				   hwdata->flags, div_data->width);
+}
+
+static long vc3_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_div_data *div_data = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	unsigned int bestdiv;
+
+	/* if read only, just return current value */
+	if (hwdata->flags & CLK_DIVIDER_READ_ONLY) {
+		regmap_read(vc3->regmap, div_data->offs, &bestdiv);
+		bestdiv >>= div_data->shift;
+		bestdiv &= VC3_DIV_MASK(div_data->width);
+		bestdiv = vc3_get_div(div_data->table, bestdiv, hwdata->flags);
+		return DIV_ROUND_UP(*parent_rate, bestdiv);
+	}
+
+	return divider_round_rate(hw, rate, parent_rate, div_data->table,
+				  div_data->width, hwdata->flags);
+}
+
+static int vc3_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_div_data *div_data = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	unsigned int value;
+
+	value = divider_get_val(rate, parent_rate, div_data->table,
+				div_data->width, hwdata->flags);
+	regmap_update_bits(vc3->regmap, div_data->offs,
+			   VC3_DIV_MASK(div_data->width) << div_data->shift,
+			   value << div_data->shift);
+	return 0;
+}
+
+static const struct clk_ops vc3_div_ops = {
+	.recalc_rate = vc3_div_recalc_rate,
+	.round_rate = vc3_div_round_rate,
+	.set_rate = vc3_div_set_rate,
+};
+
+static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	int ret;
+	int frc;
+
+	ret = clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT);
+	if (ret) {
+		if (req->best_parent_rate / req->rate) {
+			frc = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
+						    req->rate);
+			req->rate *= frc;
+			return clk_mux_determine_rate_flags(hw, req,
+							    CLK_SET_RATE_PARENT);
+		}
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static unsigned char vc3_clk_mux_get_parent(struct clk_hw *hw)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_clk_data *clk_mux = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+	u32 val;
+
+	regmap_read(vc3->regmap, clk_mux->offs, &val);
+
+	return !!(val & clk_mux->bitmsk);
+}
+
+static int vc3_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct vc3_hw_data *hwdata = container_of(hw, struct vc3_hw_data, hw);
+	const struct vc3_clk_data *clk_mux = hwdata->data;
+	struct vc3_driver_data *vc3 = hwdata->vc3;
+
+	regmap_update_bits(vc3->regmap, clk_mux->offs,
+			   clk_mux->bitmsk, index ? clk_mux->bitmsk : 0);
+	return 0;
+}
+
+static const struct clk_ops vc3_clk_mux_ops = {
+	.determine_rate = vc3_clk_mux_determine_rate,
+	.set_parent = vc3_clk_mux_set_parent,
+	.get_parent = vc3_clk_mux_get_parent,
+};
+
+static unsigned long vc3_clk_out_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	return parent_rate;
+}
+
+static long vc3_clk_out_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *prate)
+{
+	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), rate);
+
+	return *prate;
+}
+
+static int vc3_clk_out_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	/*
+	 * We must report success. round_rate() propagates rate to the
+	 * parent and based on the rate mux changes its parent.
+	 */
+
+	return 0;
+}
+
+const struct clk_ops vc3_clk_out_ops = {
+	.recalc_rate = vc3_clk_out_recalc_rate,
+	.round_rate = vc3_clk_out_round_rate,
+	.set_rate = vc3_clk_out_set_rate,
+};
+
+static bool vc3_regmap_is_writeable(struct device *dev, unsigned int reg)
+{
+	return true;
+}
+
+static const struct regmap_config vc3_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = 0x24,
+	.writeable_reg = vc3_regmap_is_writeable,
+};
+
+static struct clk_hw *vc3_of_clk_get(struct of_phandle_args *clkspec,
+				     void *data)
+{
+	struct vc3_driver_data *vc3 = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= ARRAY_SIZE(clk_out_data)) {
+		pr_err("invalid clk index %u for provider %pOF\n", idx, clkspec->np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &vc3->clk_out[idx].hw;
+}
+
+static void vc3_divider_type_parse_dt(struct device *dev,
+				      struct vc3_driver_data *vc3)
+{
+	struct device_node *np = dev->of_node;
+	struct property *prop;
+	const __be32 *p;
+	u32 i = 0;
+	u32 val;
+
+	of_property_for_each_u32(np, "assigned-clock-rates",
+				 prop, p, val) {
+		if (i >= ARRAY_SIZE(div_data))
+			break;
+		if (val)
+			vc3->clk_div[i].flags = CLK_DIVIDER_READ_ONLY;
+
+		i++;
+	}
+}
+
+static void vc3_fill_init_data_parent(struct clk_init_data *init,
+				      const struct vc3_clk_data *mux,
+				      const struct clk_ops *ops,
+				      const struct clk_parent_data *pdata,
+				      int n)
+{
+	init->name = mux->name;
+	init->ops = ops;
+	init->flags = CLK_SET_RATE_PARENT;
+	init->parent_data = pdata;
+	init->num_parents = n;
+}
+
+static int vc3_clk_register(struct device *dev, struct vc3_driver_data *vc3,
+			    struct vc3_hw_data *data, const void *clk_data,
+			    const struct clk_init_data *init, int n)
+{
+	data->hw.init = init;
+	data->num = n;
+	data->vc3 = vc3;
+	data->data = clk_data;
+
+	return devm_clk_hw_register(dev, &data->hw);
+}
+
+static int vc3_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	u8 settings[NUM_CONFIG_REGISTERS];
+	struct vc3_driver_data *vc3;
+	struct clk_init_data init;
+	int ret, i;
+
+	vc3 = devm_kzalloc(dev, sizeof(*vc3), GFP_KERNEL);
+	if (!vc3)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, vc3);
+	vc3->client = client;
+
+	vc3->regmap = devm_regmap_init_i2c(client, &vc3_regmap_config);
+	if (IS_ERR(vc3->regmap))
+		return dev_err_probe(dev, PTR_ERR(vc3->regmap),
+				     "failed to allocate register map\n");
+
+	ret = of_property_read_u8_array(dev->of_node, "renesas,settings",
+					settings, ARRAY_SIZE(settings));
+	if (!ret) {
+		/*
+		 * A raw settings array was specified in the DT. Write the
+		 * settings to the device immediately.
+		 */
+		for  (i = 0; i < NUM_CONFIG_REGISTERS; i++) {
+			ret = regmap_write(vc3->regmap, i, settings[i]);
+			if (ret) {
+				dev_err(dev, "error writing to chip (%i)\n", ret);
+				return ret;
+			}
+		}
+	} else if (ret == -EOVERFLOW) {
+		dev_err(&client->dev, "EOVERFLOW reg settings. ARRAY_SIZE: %zu",
+			ARRAY_SIZE(settings));
+		return ret;
+	}
+
+	/* Register clock ref */
+	memset(&init, 0, sizeof(init));
+
+	/* Register pfd muxes */
+	for (i = 0; i < ARRAY_SIZE(pfd_mux_data); i++) {
+		vc3_fill_init_data_parent(&init, &pfd_mux_data[i], &vc3_pfd_mux_ops,
+					  pfdmux_p, ARRAY_SIZE(pfdmux_p));
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_pfd_mux[i],
+				       &pfd_mux_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	/* Register pfd's */
+	for (i = 0; i < ARRAY_SIZE(pfd_data); i++) {
+		init.name = pfd_data[i].name;
+		init.ops = &vc3_pfd_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		init.num_parents = 1;
+		init.parent_data = &pfd_p[i];
+
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_pfd[i],
+				       &pfd_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	/* Register pll's */
+	for (i = 0; i < ARRAY_SIZE(pll_data); i++) {
+		init.name = pll_data[i].name;
+		init.ops = &vc3_pll_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		init.num_parents = 1;
+		init.parent_data = &pll_p[i];
+
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_pll[i],
+				       &pll_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	/* Register divider muxes */
+	for (i = 0; i < ARRAY_SIZE(div_mux_data); i++) {
+		vc3_fill_init_data_parent(&init, &div_mux_data[i], &vc3_div_mux_ops,
+					  divmux_p[i], 2);
+
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_div_mux[i],
+				       &div_mux_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	vc3_divider_type_parse_dt(dev, vc3);
+	/* Register dividers */
+	for (i = 0; i < ARRAY_SIZE(div_data); i++) {
+		init.name = div_data[i].name;
+		init.ops = &vc3_div_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		init.num_parents = 1;
+		init.parent_data = &div_p[i];
+
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_div[i],
+				       &div_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	/* Register clk muxes */
+	for (i = 0; i < ARRAY_SIZE(clk_mux_data); i++) {
+		vc3_fill_init_data_parent(&init, &clk_mux_data[i], &vc3_clk_mux_ops,
+					  clkmux_p[i], 2);
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_mux[i],
+				       &clk_mux_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	/* Register clk outputs */
+	for (i = 0; i < ARRAY_SIZE(clk_out_data); i++) {
+		vc3_fill_init_data_parent(&init, &clk_out_data[i], &vc3_clk_out_ops,
+					  &clkout_p[i], 1);
+		ret = vc3_clk_register(dev, vc3, &vc3->clk_out[i],
+				       &clk_out_data[i], &init, i);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s failed\n", init.name);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, vc3_of_clk_get, vc3);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to add clk provider\n");
+
+	return ret;
+}
+
+static const struct of_device_id dev_ids[] = {
+	{ .compatible = "renesas,5p35023" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dev_ids);
+
+static struct i2c_driver vc3_driver = {
+	.driver = {
+		.name = "vc3",
+		.of_match_table = of_match_ptr(dev_ids),
+	},
+	.probe_new = vc3_probe,
+};
+module_i2c_driver(vc3_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas VersaClock 3 driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

