Return-Path: <linux-renesas-soc+bounces-10820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC459E19DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF602816CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644B11E2601;
	Tue,  3 Dec 2024 10:50:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD801DDA37;
	Tue,  3 Dec 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223045; cv=none; b=GFszVbn+FiZC5Vyy7dVsynmry1u0caymMn5+nrROgcu3BQ1jowc5m16o5aiGmfEJpmhwI1ivwVUptzk5PbWZ5fp2724gpAAWJLHCmNzfa+DiXWcdoZOWKlWN+MUsk1wvTCIOhbmj6/GIRwlny6U0+Nr9RCtyqQR7PkWs5IYt/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223045; c=relaxed/simple;
	bh=FcaYsPwrLK3ZqoRhidvcE0etwCXxgZRYqtlhKQkntBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oy8yEGWCSSKUPN0J24XfFNO17ZS/KgQIL4dqyuj4NXU2bQpEO6Sdw2/wXsXBpbtewuCGJS2NJHU9W+OkHvrZ8jga3AZy5jFp0MY+iuesSyuGSYP374YoPrfPcmvp9kGpHtE/nW8DsWdblQ12J7VCtuDKjKLj0ExX+ohjKjCwLc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xo2p3+PHTyuoVpmJzaMLDQ==
X-CSE-MsgGUID: Nd9GqulZTteRNK0eBOEcwg==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754411"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:42 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7900F40061AD;
	Tue,  3 Dec 2024 19:50:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 06/13] clk: renesas: Add support for RZ/G3E SoC
Date: Tue,  3 Dec 2024 10:49:33 +0000
Message-ID: <20241203105005.103927-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/clk/renesas/Kconfig         |  7 ++-
 drivers/clk/renesas/Makefile        |  1 +
 drivers/clk/renesas/r9a09g047-cpg.c | 98 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |  6 ++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 5 files changed, 112 insertions(+), 1 deletion(-)
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
index 000000000000..5d7611cee9bc
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -0,0 +1,98 @@
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
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19),
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
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
index 1154493583a7..ef26e7760a88 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -868,6 +868,12 @@ static const struct of_device_id rzv2h_cpg_match[] = {
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
index ed8d2cad3260..1e5bf1eb65a4 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -202,6 +202,7 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 };
 
+extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
 extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
 
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.43.0


