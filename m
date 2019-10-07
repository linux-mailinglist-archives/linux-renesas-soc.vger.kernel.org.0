Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7358CDF33
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 12:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfJGKXq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 06:23:46 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:54802 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfJGKXp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id AaPh2100V05gfCL01aPh2S; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00087H-Mr; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003CT-Lb; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 14/19] clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support
Date:   Mon,  7 Oct 2019 12:23:27 +0200
Message-Id: <20191007102332.12196-15-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the R-Car M3-W+ (R8A77961) SoC to the Renesas Clock
Pulse Generator / Module Standby and Software Reset driver.

R-Car M3-W+ is very similar to R-Car M3-W (R8A77960), which allows for
both SoCs to share a driver.  R-Car M3-W+ lacks a few modules, so their
clocks must be nullified.

Based on a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/Kconfig            |  5 +++++
 drivers/clk/renesas/Makefile           |  1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 21 ++++++++++++++++++---
 drivers/clk/renesas/renesas-cpg-mssr.c |  6 ++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index be03bb74801252bc..abdd39052ad44991 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -22,6 +22,7 @@ config CLK_RENESAS
 	select CLK_R8A7794 if ARCH_R8A7794
 	select CLK_R8A7795 if ARCH_R8A7795
 	select CLK_R8A7796 if ARCH_R8A7796
+	select CLK_R8A77961 if ARCH_R8A77961
 	select CLK_R8A77965 if ARCH_R8A77965
 	select CLK_R8A77970 if ARCH_R8A77970
 	select CLK_R8A77980 if ARCH_R8A77980
@@ -113,6 +114,10 @@ config CLK_R8A7796
 	bool "R-Car M3-W clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A77961
+	bool "R-Car M3-W+ clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN3_CPG
+
 config CLK_R8A77965
 	bool "R-Car M3-N clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index ef0fdd00d2b741b2..7cb12b37be77b33d 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_CLK_R8A7792)		+= r8a7792-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7794)		+= r8a7794-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7795)		+= r8a7795-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7796)		+= r8a7796-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A77961)		+= r8a7796-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77965)		+= r8a77965-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77970)		+= r8a77970-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77980)		+= r8a77980-cpg-mssr.o
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 90cc6a1026028fa8..8cc4876daae30bdd 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -2,8 +2,8 @@
 /*
  * r8a7796 Clock Pulse Generator / Module Standby and Software Reset
  *
- * Copyright (C) 2016 Glider bvba
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2016-2019 Glider bvba
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  *
  * Based on r8a7795-cpg-mssr.c
  *
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/soc/renesas/rcar-rst.h>
 
 #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
@@ -116,7 +117,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_BASE("r",           R8A7796_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
 
-static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 	DEF_MOD("fdp1-0",		 119,	R8A7796_CLK_S0D1),
 	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
@@ -304,6 +305,14 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 	{ 2,		192,	1,	192,	1,	32,	},
 };
 
+	/*
+	 * Fixups for R-Car M3-W+
+	 */
+
+static const unsigned int r8a77961_mod_nullify[] __initconst = {
+	MOD_CLK_ID(617),			/* FCPCI0  */
+};
+
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
@@ -320,6 +329,12 @@ static int __init r8a7796_cpg_mssr_init(struct device *dev)
 		return -EINVAL;
 	}
 
+	if (of_device_is_compatible(dev->of_node, "renesas,r8a77961-cpg-mssr"))
+		mssr_mod_nullify(r8a7796_mod_clks,
+				 ARRAY_SIZE(r8a7796_mod_clks),
+				 r8a77961_mod_nullify,
+				 ARRAY_SIZE(r8a77961_mod_nullify));
+
 	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
 }
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 35966678148e2c8b..1518cd304bce3ae8 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -755,6 +755,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a7796_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A77961
+	{
+		.compatible = "renesas,r8a77961-cpg-mssr",
+		.data = &r8a7796_cpg_mssr_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R8A77965
 	{
 		.compatible = "renesas,r8a77965-cpg-mssr",
-- 
2.17.1

