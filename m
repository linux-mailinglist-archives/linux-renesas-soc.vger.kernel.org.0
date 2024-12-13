Return-Path: <linux-renesas-soc+bounces-11286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1F9F0C79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 13:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEDE9188E18A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EACF1DFD91;
	Fri, 13 Dec 2024 12:36:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2C11DF97D;
	Fri, 13 Dec 2024 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093378; cv=none; b=kv7C98IHk+kXRpqFfcltFYimhNa2/m4aDRTMR0AWWL6YH6KndvUjt0FmMQDyve42C5LjqerffUolH0hA2IfhPyceO3mNPNMe0HFL86C89zd9ujF/Gkv6WBqWT8UT30MA1M9JHUsD00fQA2dSj2A5F7Gwz9KTAQAt5KoU+RUdA8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093378; c=relaxed/simple;
	bh=A7uiiAArEXNqV6N8Kk+uVNo/PLot8LX2/Jj66kmz7QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcO65cn0577FuVe3dMEinhHyGYo4ivvZJhDGyqmDufAe5DXxQUm6AlSoqCQ3sQb5V3mt1oxBzOYdtwFU7DddwEuq+F+C4O+kzHlEhXjkgPP+X/Eirh0319MW/u9ikXhXekB7zAnEQKXbngV9dJ08H7EcmHQIzMRytppc010BaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: PYF339r/SrmmWp7QYgoKEg==
X-CSE-MsgGUID: kk7O4Jg0S/2Z3EbIBm8Z+w==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="227784183"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2024 21:36:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 58F394239264;
	Fri, 13 Dec 2024 21:35:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/3] clk: renesas: rzv2h-cpg: Add support for RZ/G3E SoC
Date: Fri, 13 Dec 2024 12:35:41 +0000
Message-ID: <20241213123550.289193-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock structure for RZ/G3E is almost identical to RZ/V2H SoC with
more IP blocks compared to RZ/V2H. For eg: VSPI, LVDS, DPI and LCDC1
are present only on the RZ/G3E SoC.

Add minimal clock and reset entries required to boot the Renesas RZ/G3E
SMARC EVK and binds it with the RZ/V2H CPG core driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added Rg tag from Geert.
v1->v2:
 * No change.
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c | 100 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |   6 ++
 drivers/clk/renesas/rzv2h-cpg.h     |   1 +
 5 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r9a09g047-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index ff01f5f0ed20..5a4bc3f94d49 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -40,6 +40,7 @@ config CLK_RENESAS
 	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
+	select CLK_R9A09G047 if ARCH_R9A09G047
 	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_SH73A0 if ARCH_SH73A0
 
@@ -194,6 +195,10 @@ config CLK_R9A09G011
 	bool "RZ/V2M clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A09G047
+       bool "RZ/G3E clock support" if COMPILE_TEST
+       select CLK_RZV2H
+
 config CLK_R9A09G057
        bool "RZ/V2H(P) clock support" if COMPILE_TEST
        select CLK_RZV2H
@@ -234,7 +239,7 @@ config CLK_RZG2L
 	select RESET_CONTROLLER
 
 config CLK_RZV2H
-	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
+	bool "RZ/{G3E,V2H(P)} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
 config CLK_RENESAS_VBATTB
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 82efaa835ac7..2d6e746939c4 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
+obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
new file mode 100644
index 000000000000..ab63a7e7e480
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3E CPG driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+
+#include "rzv2h-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G047_IOTOP_0_SHCLK,
+
+	/* External Input Clocks */
+	CLK_AUDIO_EXTAL,
+	CLK_RTXIN,
+	CLK_QEXTAL,
+
+	/* PLL Clocks */
+	CLK_PLLCM33,
+	CLK_PLLDTY,
+	CLK_PLLCA55,
+
+	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV16,
+	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV4,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct clk_div_table dtable_2_64[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{4, 64},
+	{0, 0},
+};
+
+static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
+	DEF_INPUT("rtxin", CLK_RTXIN),
+	DEF_INPUT("qextal", CLK_QEXTAL),
+
+	/* PLL Clocks */
+	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+
+	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+
+	/* Core Clocks */
+	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("iotop_0_shclk", R9A09G047_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+};
+
+static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
+						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
+						BUS_MSTOP(3, BIT(14))),
+};
+
+static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
+	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
+	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
+	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+};
+
+const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r9a09g047_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g047_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r9a09g047_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g047_mod_clks),
+	.num_hw_mod_clks = 28 * 16,
+
+	/* Resets */
+	.resets = r9a09g047_resets,
+	.num_resets = ARRAY_SIZE(r9a09g047_resets),
+};
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 511df561d299..668a2880b2d3 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -961,6 +961,12 @@ static const struct of_device_id rzv2h_cpg_match[] = {
 		.compatible = "renesas,r9a09g057-cpg",
 		.data = &r9a09g057_cpg_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G047
+	{
+		.compatible = "renesas,r9a09g047-cpg",
+		.data = &r9a09g047_cpg_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 503e76ee9a56..9be5a312fa96 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -211,6 +211,7 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 };
 
+extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
 extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
 
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.43.0


