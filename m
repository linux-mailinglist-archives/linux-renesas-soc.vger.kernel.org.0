Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6202CDF2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 12:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfJGKXq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 06:23:46 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:54810 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfJGKXp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id AaPh2100R05gfCL01aPh2P; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00087B-Kb; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003CN-Ir; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 12/19] soc: renesas: rcar-sysc: Add R8A77961 support
Date:   Mon,  7 Oct 2019 12:23:25 +0200
Message-Id: <20191007102332.12196-13-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the power areas in the Renesas R-Car M3-W+ (R8A77961)
SoC to the R-Car System Controller driver.

R-Car M3-W+ (aka R-Car M3-W ES3.0) is very similar to R-Car
M3-W (R8A77960), which allows for both SoCs to share a driver:
  - R-Car M3-W+ lacks the A2VC power area, so its area must be
    nullified,
  - The existing support for the SYSCEXTMASK register added in commit
    9bd645af9d2a49ac ("soc: renesas: r8a7796-sysc: Fix power request
    conflicts") applies to ES3.0 and later only.
    As R-Car M3-W+ uses a different compatible value, differentiate
    based on that, instead of on the ES version.

Rename r8a7796_sysc_info to r8a77960_sysc_info for consistency.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig        |  5 +++++
 drivers/soc/renesas/Makefile       |  1 +
 drivers/soc/renesas/r8a7796-sysc.c | 27 +++++++++++++--------------
 drivers/soc/renesas/rcar-sysc.c    |  5 ++++-
 drivers/soc/renesas/rcar-sysc.h    |  3 ++-
 5 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index b2ec65210bd770d5..62d388c10c7a7207 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -209,6 +209,7 @@ config ARCH_R8A7796
 config ARCH_R8A77961
 	bool "Renesas R-Car M3-W+ SoC Platform"
 	select ARCH_RCAR_GEN3
+	select SYSC_R8A77961
 	help
 	  This enables support for the Renesas R-Car M3-W+ SoC.
 
@@ -302,6 +303,10 @@ config SYSC_R8A7796
 	bool "R-Car M3-W System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A77961
+	bool "R-Car M3-W+ System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A77965
 	bool "R-Car M3-N System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index e99dc37ea1209444..5d2d6abf38e505ac 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_SYSC_R8A7792)	+= r8a7792-sysc.o
 obj-$(CONFIG_SYSC_R8A7794)	+= r8a7794-sysc.o
 obj-$(CONFIG_SYSC_R8A7795)	+= r8a7795-sysc.o
 obj-$(CONFIG_SYSC_R8A7796)	+= r8a7796-sysc.o
+obj-$(CONFIG_SYSC_R8A77961)	+= r8a7796-sysc.o
 obj-$(CONFIG_SYSC_R8A77965)	+= r8a77965-sysc.o
 obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
 obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
diff --git a/drivers/soc/renesas/r8a7796-sysc.c b/drivers/soc/renesas/r8a7796-sysc.c
index d374622a667bbfbd..46770615859c9871 100644
--- a/drivers/soc/renesas/r8a7796-sysc.c
+++ b/drivers/soc/renesas/r8a7796-sysc.c
@@ -1,19 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Renesas R-Car M3-W System Controller
+ * Renesas R-Car M3-W/W+ System Controller
  *
  * Copyright (C) 2016 Glider bvba
+ * Copyright (C) 2018-2019 Renesas Electronics Corporation
  */
 
 #include <linux/bits.h>
 #include <linux/kernel.h>
-#include <linux/sys_soc.h>
 
 #include <dt-bindings/power/r8a7796-sysc.h>
 
 #include "rcar-sysc.h"
 
-static const struct rcar_sysc_area r8a7796_areas[] __initconst = {
+static struct rcar_sysc_area r8a7796_areas[] __initdata = {
 	{ "always-on",	    0, 0, R8A7796_PD_ALWAYS_ON,	-1, PD_ALWAYS_ON },
 	{ "ca57-scu",	0x1c0, 0, R8A7796_PD_CA57_SCU,	R8A7796_PD_ALWAYS_ON,
 	  PD_SCU },
@@ -41,22 +41,21 @@ static const struct rcar_sysc_area r8a7796_areas[] __initconst = {
 };
 
 
-/* Fixups for R-Car M3-W ES1.x revision */
-static const struct soc_device_attribute r8a7796es1[] __initconst = {
-	{ .soc_id = "r8a7796", .revision = "ES1.*" },
-	{ /* sentinel */ }
-};
-
-static int __init r8a7796_sysc_init(void)
+static int __init r8a77961_sysc_init(void)
 {
-	if (soc_device_match(r8a7796es1))
-		r8a7796_sysc_info.extmask_val = 0;
+	rcar_sysc_nullify(r8a7796_areas, ARRAY_SIZE(r8a7796_areas),
+			  R8A7796_PD_A2VC0);
 
 	return 0;
 }
 
-struct rcar_sysc_info r8a7796_sysc_info __initdata = {
-	.init = r8a7796_sysc_init,
+const struct rcar_sysc_info r8a77960_sysc_info __initconst = {
+	.areas = r8a7796_areas,
+	.num_areas = ARRAY_SIZE(r8a7796_areas),
+};
+
+const struct rcar_sysc_info r8a77961_sysc_info __initconst = {
+	.init = r8a77961_sysc_init,
 	.areas = r8a7796_areas,
 	.num_areas = ARRAY_SIZE(r8a7796_areas),
 	.extmask_offs = 0x2f8,
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index d4f2ed52b2b363be..9d63e2ad53b76e6d 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -314,7 +314,10 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 	{ .compatible = "renesas,r8a7795-sysc", .data = &r8a7795_sysc_info },
 #endif
 #ifdef CONFIG_SYSC_R8A7796
-	{ .compatible = "renesas,r8a7796-sysc", .data = &r8a7796_sysc_info },
+	{ .compatible = "renesas,r8a7796-sysc", .data = &r8a77960_sysc_info },
+#endif
+#ifdef CONFIG_SYSC_R8A77961
+	{ .compatible = "renesas,r8a77961-sysc", .data = &r8a77961_sysc_info },
 #endif
 #ifdef CONFIG_SYSC_R8A77965
 	{ .compatible = "renesas,r8a77965-sysc", .data = &r8a77965_sysc_info },
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index e4c9854f5dc00492..8d074489fba96821 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -61,7 +61,8 @@ extern const struct rcar_sysc_info r8a7791_sysc_info;
 extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern struct rcar_sysc_info r8a7795_sysc_info;
-extern struct rcar_sysc_info r8a7796_sysc_info;
+extern const struct rcar_sysc_info r8a77960_sysc_info;
+extern const struct rcar_sysc_info r8a77961_sysc_info;
 extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
 extern const struct rcar_sysc_info r8a77980_sysc_info;
-- 
2.17.1

