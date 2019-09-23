Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE396BAE80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 09:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393525AbfIWH3z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 03:29:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393460AbfIWH3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 03:29:55 -0400
X-IronPort-AV: E=Sophos;i="5.64,539,1559487600"; 
   d="scan'208";a="27020707"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2019 16:29:52 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4F888400004C;
        Mon, 23 Sep 2019 16:29:50 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3] soc: renesas: rcar-sysc: Add r8a774b1 support
Date:   Mon, 23 Sep 2019 08:29:40 +0100
Message-Id: <1569223780-54304-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for RZ/G2N (R8A774B1) SoC power areas to the R-Car SYSC
driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V2-->V3
 * Incorporated Geert's review comment.
 * Added Geert's reviewed by tag.
V1-->V2
 * No change
---
 drivers/soc/renesas/Kconfig         |  5 +++++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r8a774b1-sysc.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c     |  3 +++
 drivers/soc/renesas/rcar-sysc.h     |  1 +
 5 files changed, 47 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a774b1-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index d6a7df3..3bd0c21 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -181,6 +181,7 @@ config ARCH_R8A774A1
 config ARCH_R8A774B1
 	bool "Renesas RZ/G2N SoC Platform"
 	select ARCH_RCAR_GEN3
+	select SYSC_R8A774B1
 	help
 	  This enables support for the Renesas RZ/G2N SoC.
 
@@ -259,6 +260,10 @@ config SYSC_R8A774A1
 	bool "RZ/G2M System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A774B1
+	bool "RZ/G2N System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A774C0
 	bool "RZ/G2E System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 00764d5..e99dc37 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
 obj-$(CONFIG_SYSC_R8A7745)	+= r8a7745-sysc.o
 obj-$(CONFIG_SYSC_R8A77470)	+= r8a77470-sysc.o
 obj-$(CONFIG_SYSC_R8A774A1)	+= r8a774a1-sysc.o
+obj-$(CONFIG_SYSC_R8A774B1)	+= r8a774b1-sysc.o
 obj-$(CONFIG_SYSC_R8A774C0)	+= r8a774c0-sysc.o
 obj-$(CONFIG_SYSC_R8A7779)	+= r8a7779-sysc.o
 obj-$(CONFIG_SYSC_R8A7790)	+= r8a7790-sysc.o
diff --git a/drivers/soc/renesas/r8a774b1-sysc.c b/drivers/soc/renesas/r8a774b1-sysc.c
new file mode 100644
index 0000000..5f97ff2
--- /dev/null
+++ b/drivers/soc/renesas/r8a774b1-sysc.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2N System Controller
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car M3-W System Controller
+ * Copyright (C) 2016 Glider bvba
+ */
+
+#include <linux/bits.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a774b1-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a774b1_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A774B1_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca57-scu",	0x1c0, 0, R8A774B1_PD_CA57_SCU,	R8A774B1_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca57-cpu0",	 0x80, 0, R8A774B1_PD_CA57_CPU0, R8A774B1_PD_CA57_SCU,
+	  PD_CPU_NOCR },
+	{ "ca57-cpu1",	 0x80, 1, R8A774B1_PD_CA57_CPU1, R8A774B1_PD_CA57_SCU,
+	  PD_CPU_NOCR },
+	{ "a3vc",	0x380, 0, R8A774B1_PD_A3VC,	R8A774B1_PD_ALWAYS_ON },
+	{ "a3vp",	0x340, 0, R8A774B1_PD_A3VP,	R8A774B1_PD_ALWAYS_ON },
+	{ "a2vc1",	0x3c0, 1, R8A774B1_PD_A2VC1,	R8A774B1_PD_A3VC },
+	{ "3dg-a",	0x100, 0, R8A774B1_PD_3DG_A,	R8A774B1_PD_ALWAYS_ON },
+	{ "3dg-b",	0x100, 1, R8A774B1_PD_3DG_B,	R8A774B1_PD_3DG_A },
+};
+
+const struct rcar_sysc_info r8a774b1_sysc_info __initconst = {
+	.areas = r8a774b1_areas,
+	.num_areas = ARRAY_SIZE(r8a774b1_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 176de14..d4f2ed5 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -287,6 +287,9 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A774A1
 	{ .compatible = "renesas,r8a774a1-sysc", .data = &r8a774a1_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A774B1
+	{ .compatible = "renesas,r8a774b1-sysc", .data = &r8a774b1_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A774C0
 	{ .compatible = "renesas,r8a774c0-sysc", .data = &r8a774c0_sysc_info },
 #endif
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 64c2a0f..e4c9854 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -53,6 +53,7 @@ extern const struct rcar_sysc_info r8a7743_sysc_info;
 extern const struct rcar_sysc_info r8a7745_sysc_info;
 extern const struct rcar_sysc_info r8a77470_sysc_info;
 extern const struct rcar_sysc_info r8a774a1_sysc_info;
+extern const struct rcar_sysc_info r8a774b1_sysc_info;
 extern const struct rcar_sysc_info r8a774c0_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
-- 
2.7.4

