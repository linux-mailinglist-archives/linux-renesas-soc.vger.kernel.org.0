Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E77055083D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376908AbiDTIqK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376880AbiDTIqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:46:01 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02A013B3FF;
        Wed, 20 Apr 2022 01:43:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="118558005"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:59 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4B350401073A;
        Wed, 20 Apr 2022 17:42:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 13/15] clk: renesas: cpg-mssr: Add support for R-Car V4H
Date:   Wed, 20 Apr 2022 17:42:53 +0900
Message-Id: <20220420084255.375700-14-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial CPG support for R-Car V4H (r8a779g0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 215 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h  |   1 +
 5 files changed, 228 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a779g0-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index a95ed8f310da..7e9b9a5bb5b7 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -32,6 +32,7 @@ config CLK_RENESAS
 	select CLK_R8A77995 if ARCH_R8A77995
 	select CLK_R8A779A0 if ARCH_R8A779A0
 	select CLK_R8A779F0 if ARCH_R8A779F0
+	select CLK_R8A779G0 if ARCH_R8A779G0
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_R9A07G043 if ARCH_R9A07G043
 	select CLK_R9A07G044 if ARCH_R9A07G044
@@ -158,6 +159,10 @@ config CLK_R8A779F0
 	bool "R-Car S4-8 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN4_CPG
 
+config CLK_R8A779G0
+	bool "R-Car V4H clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN4_CPG
+
 config CLK_R9A06G032
 	bool "RZ/N1D clock support" if COMPILE_TEST
 
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index ca3a9bbcf27a..b83062af090c 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_R8A77990)		+= r8a77990-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A779G0)		+= r8a779g0-cpg-mssr.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
new file mode 100644
index 000000000000..eaa89bbfd006
--- /dev/null
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a779g0 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Based on r8a779g0-cpg-mssr.c
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen4-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A779G0_CLK_R,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL3,
+	CLK_PLL4,
+	CLK_PLL5,
+	CLK_PLL6,
+	CLK_PLL1_DIV2,
+	CLK_PLL2_DIV2,
+	CLK_PLL3_DIV2,
+	CLK_PLL4_DIV2,
+	CLK_PLL5_DIV2,
+	CLK_PLL5_DIV4,
+	CLK_PLL6_DIV2,
+	CLK_S0,
+	CLK_S0_VIO,
+	CLK_S0_VC,
+	CLK_S0_HSC,
+	CLK_SV_VIP,
+	CLK_SV_IR,
+	CLK_SDSRC,
+	CLK_RPCSRC,
+	CLK_VIOBUS,
+	CLK_VCBUS,
+	CLK_OCO,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",	CLK_EXTAL),
+	DEF_INPUT("extalr",	CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
+	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2, CLK_MAIN),
+	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3, CLK_MAIN),
+	DEF_BASE(".pll4", CLK_PLL4,	CLK_TYPE_GEN4_PLL4, CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
+	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
+	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
+	DEF_FIXED(".pll3_div2",	CLK_PLL3_DIV2,	CLK_PLL3,	2, 1),
+	DEF_FIXED(".pll4_div2",	CLK_PLL4_DIV2,	CLK_PLL4,	2, 1),
+	DEF_FIXED(".pll5_div2",	CLK_PLL5_DIV2,	CLK_PLL5,	2, 1),
+	DEF_FIXED(".pll5_div4",	CLK_PLL5_DIV4,	CLK_PLL5_DIV2,	2, 1),
+	DEF_FIXED(".pll6_div2",	CLK_PLL6_DIV2,	CLK_PLL6,	2, 1),
+	DEF_FIXED(".s0",	CLK_S0,		CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".s0_vio",	CLK_S0_VIO,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".s0_vc",	CLK_S0_VC,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".s0_hsc",	CLK_S0_HSC,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".sv_vip",	CLK_SV_VIP,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".sv_ir",	CLK_SV_IR,	CLK_PLL1_DIV2,	2, 1),
+	DEF_BASE(".sdsrc",	CLK_SDSRC,	CLK_TYPE_GEN4_SDSRC, CLK_PLL5),
+	DEF_RATE(".oco",	CLK_OCO,	32768),
+
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC,		CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
+	DEF_BASE(".rpc",	R8A779G0_CLK_RPC,	CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A779G0_CLK_RPCD2,	CLK_TYPE_GEN4_RPCD2, R8A779G0_CLK_RPC),
+	DEF_FIXED(".vio",	CLK_VIOBUS,	CLK_PLL5_DIV2,	3, 1),
+	DEF_FIXED(".vc",	CLK_VCBUS,	CLK_PLL5_DIV2,	3, 1),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("s0d2",	R8A779G0_CLK_S0D2,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3",	R8A779G0_CLK_S0D3,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d4",	R8A779G0_CLK_S0D4,	CLK_S0,		4, 1),
+	DEF_FIXED("cl16m",	R8A779G0_CLK_CL16M,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d1_vio",	R8A779G0_CLK_S0D1_VIO,	CLK_S0_VIO,	1, 1),
+	DEF_FIXED("s0d2_vio",	R8A779G0_CLK_S0D2_VIO,	CLK_S0_VIO,	2, 1),
+	DEF_FIXED("s0d4_vio",	R8A779G0_CLK_S0D4_VIO,	CLK_S0_VIO,	4, 1),
+	DEF_FIXED("s0d8_vio",	R8A779G0_CLK_S0D8_VIO,	CLK_S0_VIO,	8, 1),
+	DEF_FIXED("s0d1_vc",	R8A779G0_CLK_S0D1_VC,	CLK_S0_VC,	1, 1),
+	DEF_FIXED("s0d2_vc",	R8A779G0_CLK_S0D2_VC,	CLK_S0_VC,	2, 1),
+	DEF_FIXED("s0d4_vc",	R8A779G0_CLK_S0D4_VC,	CLK_S0_VC,	4, 1),
+	DEF_FIXED("s0d2_mm",	R8A779G0_CLK_S0D2_MM,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d4_mm",	R8A779G0_CLK_S0D4_MM,	CLK_S0,		4, 1),
+	DEF_FIXED("cl16m_mm",	R8A779G0_CLK_CL16M_MM,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d2_u3dg",	R8A779G0_CLK_S0D2_U3DG,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d4_u3dg",	R8A779G0_CLK_S0D4_U3DG,	CLK_S0,		4, 1),
+	DEF_FIXED("s0d2_rt",	R8A779G0_CLK_S0D2_RT,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3_rt",	R8A779G0_CLK_S0D3_RT,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d4_rt",	R8A779G0_CLK_S0D4_RT,	CLK_S0,		4, 1),
+	DEF_FIXED("s0d6_rt",	R8A779G0_CLK_S0D6_RT,	CLK_S0,		6, 1),
+	DEF_FIXED("s0d24_rt",	R8A779G0_CLK_S0D24_RT,	CLK_S0,		24, 1),
+	DEF_FIXED("cl16m_rt",	R8A779G0_CLK_CL16M_RT,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d2_per",	R8A779G0_CLK_S0D2_PER,	CLK_S0,		2, 1),
+	DEF_FIXED("s0d3_per",	R8A779G0_CLK_S0D3_PER,	CLK_S0,		3, 1),
+	DEF_FIXED("s0d6_per",	R8A779G0_CLK_S0D6_PER,	CLK_S0,		6, 1),
+	DEF_FIXED("s0d12_per",	R8A779G0_CLK_S0D12_PER,	CLK_S0,		12, 1),
+	DEF_FIXED("s0d24_per",	R8A779G0_CLK_S0D24_PER,	CLK_S0,		24, 1),
+	DEF_FIXED("cl16m_per",	R8A779G0_CLK_CL16M_PER,	CLK_S0,		48, 1),
+	DEF_FIXED("s0d1_hsc",	R8A779G0_CLK_S0D1_HSC,	CLK_S0_HSC,	1, 1),
+	DEF_FIXED("s0d2_hsc",	R8A779G0_CLK_S0D2_HSC,	CLK_S0_HSC,	2, 1),
+	DEF_FIXED("s0d4_hsc",	R8A779G0_CLK_S0D4_HSC,	CLK_S0_HSC,	4, 1),
+	DEF_FIXED("cl16m_hsc",	R8A779G0_CLK_CL16M_HSC,	CLK_S0_HSC,	48, 1),
+	DEF_FIXED("s0d2_cc",	R8A779G0_CLK_S0D2_CC,	CLK_S0,		2, 1),
+	DEF_FIXED("svd1_ir",	R8A779G0_CLK_SVD1_IR,	CLK_SV_IR,	1, 1),
+	DEF_FIXED("svd2_ir",	R8A779G0_CLK_SVD2_IR,	CLK_SV_IR,	2, 1),
+	DEF_FIXED("svd1_vip",	R8A779G0_CLK_SVD1_VIP,	CLK_SV_VIP,	1, 1),
+	DEF_FIXED("svd2_vip",	R8A779G0_CLK_SVD2_VIP,	CLK_SV_VIP,	2, 1),
+	DEF_FIXED("s0d2_cc",	R8A779G0_CLK_S0D2_CC,	CLK_S0,		2, 1),
+	DEF_FIXED("cbfusa",	R8A779G0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
+	DEF_FIXED("cpex",	R8A779G0_CLK_CPEX,	CLK_EXTAL,	2, 1),
+	DEF_FIXED("viobusd2",	R8A779G0_CLK_VIOBUSD2,	CLK_VIOBUS,	2, 1),
+	DEF_FIXED("vcbusd2",	R8A779G0_CLK_VCBUSD2,	CLK_VCBUS,	2, 1),
+
+	DEF_GEN4_SD("sd0",	R8A779G0_CLK_SD0,	CLK_SDSRC,	0x870),
+	DEF_DIV6P1("mso",	R8A779G0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
+
+	DEF_GEN4_OSC("osc",	R8A779G0_CLK_OSC,	CLK_EXTAL,	8),
+	DEF_GEN4_MDSEL("r",	R8A779G0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
+};
+
+static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
+	DEF_MOD("hscif0",	514,	R8A779G0_CLK_S0D3_PER),
+	DEF_MOD("hscif1",	515,	R8A779G0_CLK_S0D3_PER),
+	DEF_MOD("hscif2",	516,	R8A779G0_CLK_S0D3_PER),
+	DEF_MOD("hscif3",	517,	R8A779G0_CLK_S0D3_PER),
+};
+
+/*
+ * CPG Clock Data
+ */
+/*
+ *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
+ * 14 13 (MHz)
+ * ----------------------------------------------------------------
+ * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/8
+ * 0  1	 20    / 1	x160	x170	x160	x120	x160	x140	/8
+ * 1  0	 Prohibited setting
+ * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/8
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
+					 (((md) & BIT(13)) >> 13))
+
+static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
+	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
+	{ 1,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	8,	},
+	{ 1,		160,	1,	170,	1,	160,	1,	120,	1,	160,	1,	140,	1,	8,	},
+	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	},
+	{ 2,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,	8,	},
+};
+
+static int __init r8a779g0_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen4_cpg_pll_config *cpg_pll_config;
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
+	return rcar_gen4_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a779g0_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a779g0_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a779g0_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a779g0_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a779g0_mod_clks),
+	.num_hw_mod_clks = 30 * 32,
+
+	/* Callbacks */
+	.init = r8a779g0_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen4_cpg_clk_register,
+
+	.reg_layout = CLK_REG_LAYOUT_RCAR_GEN4,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5d2c3edbaa14..1a0cdf001b2f 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -853,6 +853,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r8a779f0-cpg-mssr",
 		.data = &r8a779f0_cpg_mssr_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R8A779G0
+	{
+		.compatible = "renesas,r8a779g0-cpg-mssr",
+		.data = &r8a779g0_cpg_mssr_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 16810dd4e6ac..1c3c057d17f5 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -179,6 +179,7 @@ extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779a0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a779f0_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a779g0_cpg_mssr_info;
 
 void __init cpg_mssr_early_init(struct device_node *np,
 				const struct cpg_mssr_info *info);
-- 
2.25.1

