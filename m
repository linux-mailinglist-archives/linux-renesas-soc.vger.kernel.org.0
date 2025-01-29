Return-Path: <linux-renesas-soc+bounces-12711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208FA22245
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66153A7F5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036801E0DCB;
	Wed, 29 Jan 2025 16:52:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198A11FC8;
	Wed, 29 Jan 2025 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169550; cv=none; b=GB6QIaKFkndQ97MFYFB36P8Vkm3duP/boLHJ/wpH8qLfhYvYS1KJaDEb3s6cdUOy5R82W2W61LH6rVkwI2SSurP8OT3OL/gy0WrgvIxkLbX6LuCteXKZHQRrENhaM6FyDPD61qermbQ9pa2KFq9SmTNmW6GkayAdofvb0yPNG5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169550; c=relaxed/simple;
	bh=ktNJHhG+PbWpOnRxBJUfBDUgEwBUZQro+clBoLbc+tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CskBUa+qrgqD1V0yYjomryl1qRjZIeFsUiMG3EkZiGhS/X6RmmWVrn3PbanIW5a81bkmbOaAU8uoQVyAHllbre0UV/a3Yrc2VBMkJWx2rXJwAYLSB/yUScHI4fQ2IapjS6gD4v4U3QRCnCg/FK3mcpDT3GT50RcybDlh9U+JsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: IDtV4LKDRvS7vps2fR9HLA==
X-CSE-MsgGUID: TotjPwt9R6C/KqP090jv2A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2025 01:52:28 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 46953402E096;
	Thu, 30 Jan 2025 01:52:15 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 07/14] clk: renesas: Add support for R9A09G077 SoC
Date: Wed, 29 Jan 2025 16:37:43 +0000
Message-ID: <20250129165122.2980-8-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the R9A09G077 SoC specific definitions to the CPG driver.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig         |   5 ++
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c | 100 ++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 7ad59be2099d..017ae990d50c 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -41,6 +41,7 @@ config CLK_RENESAS
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G057 if ARCH_R9A09G057
+	select CLK_R9A09G077 if ARCH_R9A09G077
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -198,6 +199,10 @@ config CLK_R9A09G057
        bool "RZ/V2H(P) clock support" if COMPILE_TEST
        select CLK_RZV2H
 
+config CLK_R9A09G077
+	bool "RZ/T2H clock support" if COMPILE_TEST
+	select CLK_RZT2H
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index bd9f0b54fcda..fe11b10bc451 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
+obj-$(CONFIG_CLK_R9A09G077)		+= r9a09g077-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
new file mode 100644
index 000000000000..0b2895c796d1
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r9a09g077 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a09g077-cpg.h>
+
+#include "rzt2h-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	/* External Input Clocks */
+	LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
+	CLK_EXTAL,
+	CLK_LOCO,
+
+	/* Internal Core Clocks */
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL3,
+	CLK_PLL4,
+	CLK_SEL_PLL0,
+	CLK_SEL_CLK_PLL0,
+	CLK_SEL_PLL1,
+	CLK_SEL_CLK_PLL1,
+	CLK_SEL_PLL2,
+	CLK_SEL_CLK_PLL2,
+	CLK_SEL_PLL4,
+	CLK_SEL_CLK_PLL4,
+	CLK_SEL_CLK_SRC,
+	CLK_SEL_EXTAL,
+	CLK_SEL_LOCO,
+	CLK_PLL3_INPUT,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct clk_div_table dtable_1_2[] = {
+	{0, 2},
+	{15, 1},
+	{0, 0},
+};
+
+/* Mux clock tables */
+static const char * const sel_clk_pll0[] = { ".sel_loco", ".sel_pll0" };
+static const char * const sel_clk_pll1[] = { ".sel_loco", ".sel_pll1" };
+static const char * const sel_clk_pll4[] = { ".sel_loco", ".sel_pll4" };
+
+static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+	DEF_INPUT("loco", CLK_LOCO),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 48, 1),
+	DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 40, 1),
+	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 96, 1),
+	DEF_FIXED(".sel_pll0", CLK_SEL_PLL0, CLK_PLL0, 1, 1),
+	DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
+		sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), 0, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".sel_pll1", CLK_SEL_PLL1, CLK_PLL1, 1, 1),
+	DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
+		sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), 0, CLK_MUX_READ_ONLY),
+	DEF_FIXED(".sel_pll4", CLK_SEL_PLL4, CLK_PLL4, 1, 1),
+	DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
+		sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), 0, CLK_MUX_READ_ONLY),
+
+	/* Core output clk */
+	DEF_DIV("CA55", R9A09G077_CA55, CLK_SEL_CLK_PLL0, DIVCA55,
+		dtable_1_2, CLK_DIVIDER_HIWORD_MASK, 1),
+	DEF_FIXED("PCLKM", R9A09G077_PCLKM, CLK_SEL_CLK_PLL1, 1, 8),
+	DEF_FIXED("PCLKGPTL", R9A09G077_PCLKGPTL, CLK_SEL_CLK_PLL1, 1, 2),
+};
+
+static const struct rzt2h_mod_clk r9a09g077_mod_clks[] __initconst = {
+	DEF_MOD("sci0", R9A09G077_SCI0_CLK, R9A09G077_PCLKM, 0x300, 8, 0),
+};
+
+const struct rzt2h_cpg_info r9a09g077_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a09g077_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g077_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r9a09g077_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g077_mod_clks),
+	.num_hw_mod_clks = R9A09G077_LCDC_CLK + 1,
+};
-- 
2.43.0


