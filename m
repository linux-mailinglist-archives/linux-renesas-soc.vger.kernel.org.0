Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B747CDF31
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 12:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfJGKXq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 06:23:46 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:46230 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbfJGKXp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id AaPh2100b05gfCL01aPhDt; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00087K-Nm; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003CW-Md; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 15/19] pinctrl: sh-pfc: r8a7796: Add R8A77961 PFC support
Date:   Mon,  7 Oct 2019 12:23:28 +0200
Message-Id: <20191007102332.12196-16-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Pin Function Controller in the R-Car M3-W+
(R8A77961) SoC.

R-Car M3-W+ is pin compatible with R-Car M3-W (R8A77960), which allows
for both SoCs to share a driver.

Rename r8a7796_pinmux_info to r8a77960_pinmux_info for consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/Kconfig       |  4 ++++
 drivers/pinctrl/sh-pfc/Makefile      |  1 +
 drivers/pinctrl/sh-pfc/core.c        |  8 ++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 31 ++++++++++++++++++++++++++--
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  3 ++-
 5 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index de2a33ab945bf1c2..c9e8bd261748898a 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -28,6 +28,7 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
 	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
 	select PINCTRL_PFC_R8A7796 if ARCH_R8A7796
+	select PINCTRL_PFC_R8A77961 if ARCH_R8A77961
 	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
 	select PINCTRL_PFC_R8A77970 if ARCH_R8A77970
 	select PINCTRL_PFC_R8A77980 if ARCH_R8A77980
@@ -120,6 +121,9 @@ config PINCTRL_PFC_R8A7795
 config PINCTRL_PFC_R8A7796
 	bool "R-Car M3-W pin control support" if COMPILE_TEST
 
+config PINCTRL_PFC_R8A77961
+	bool "R-Car M3-W+ pin control support" if COMPILE_TEST
+
 config PINCTRL_PFC_R8A77965
 	bool "R-Car M3-N pin control support" if COMPILE_TEST
 
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 00b12af651ebe744..af71444155bb37c5 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7794)	+= pfc-r8a7794.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795-es1.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7796)	+= pfc-r8a7796.o
+obj-$(CONFIG_PINCTRL_PFC_R8A77961)	+= pfc-r8a7796.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77965)	+= pfc-r8a77965.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77970)	+= pfc-r8a77970.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77980)	+= pfc-r8a77980.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f8cbd33b4511be69..1745c0639932c7a7 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -588,7 +588,13 @@ static const struct of_device_id sh_pfc_of_table[] = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7796
 	{
 		.compatible = "renesas,pfc-r8a7796",
-		.data = &r8a7796_pinmux_info,
+		.data = &r8a77960_pinmux_info,
+	},
+#endif
+#ifdef CONFIG_PINCTRL_PFC_R8A77961
+	{
+		.compatible = "renesas,pfc-r8a77961",
+		.data = &r8a77961_pinmux_info,
 	},
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 61db7c7a35ec9cb4..c3047c315e7b9f8f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R8A7796 processor support - PFC hardware block.
+ * R8A7796 (R-Car M3-W/W+) support - PFC hardware block.
  *
  * Copyright (C) 2016-2019 Renesas Electronics Corp.
  *
@@ -6211,7 +6211,7 @@ const struct sh_pfc_soc_info r8a774a1_pinmux_info = {
 #endif
 
 #ifdef CONFIG_PINCTRL_PFC_R8A7796
-const struct sh_pfc_soc_info r8a7796_pinmux_info = {
+const struct sh_pfc_soc_info r8a77960_pinmux_info = {
 	.name = "r8a77960_pfc",
 	.ops = &r8a7796_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
@@ -6236,3 +6236,30 @@ const struct sh_pfc_soc_info r8a7796_pinmux_info = {
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
 };
 #endif
+
+#ifdef CONFIG_PINCTRL_PFC_R8A77961
+const struct sh_pfc_soc_info r8a77961_pinmux_info = {
+	.name = "r8a77961_pfc",
+	.ops = &r8a7796_pinmux_ops,
+	.unlock_reg = 0xe6060000, /* PMMR */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
+		ARRAY_SIZE(pinmux_groups.automotive),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
+		ARRAY_SIZE(pinmux_functions.automotive),
+
+	.cfg_regs = pinmux_config_regs,
+	.drive_regs = pinmux_drive_regs,
+	.bias_regs = pinmux_bias_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
+#endif
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 63d2089240c6c0fb..d7a72e2f2330db04 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -320,7 +320,8 @@ extern const struct sh_pfc_soc_info r8a7793_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795es1_pinmux_info;
-extern const struct sh_pfc_soc_info r8a7796_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77970_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77980_pinmux_info;
-- 
2.17.1

