Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EB44648B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhLAHgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:43 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:23247 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1347638AbhLAHgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:42 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102003002"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:17 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7C1FD41FE2AC;
        Wed,  1 Dec 2021 16:33:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 06/14] soc: renesas: r8a779f0-sysc: Add r8a779f0 support
Date:   Wed,  1 Dec 2021 16:33:00 +0900
Message-Id: <20211201073308.1003945-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car S4-8 (R8A779F0) SoC power areas and register
access.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig          |  4 +++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r8a779f0-sysc.c  | 47 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.c |  3 ++
 drivers/soc/renesas/rcar-gen4-sysc.h |  1 +
 5 files changed, 56 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a779f0-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2b09d6cf0d66..59a4106a66e9 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -340,6 +340,10 @@ config SYSC_R8A77961
 	bool "System Controller support for R-Car M3-W+" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A779F0
+	bool "System Controller support for R-Car S4-8" if COMPILE_TEST
+	select SYSC_RCAR_GEN4
+
 config SYSC_R8A7792
 	bool "System Controller support for R-Car V2H" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index db90f3b06007..deeb41f84f01 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
 obj-$(CONFIG_SYSC_R8A77990)	+= r8a77990-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 obj-$(CONFIG_SYSC_R8A779A0)	+= r8a779a0-sysc.o
+obj-$(CONFIG_SYSC_R8A779F0)	+= r8a779f0-sysc.o
 ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
diff --git a/drivers/soc/renesas/r8a779f0-sysc.c b/drivers/soc/renesas/r8a779f0-sysc.c
new file mode 100644
index 000000000000..5602aa6bd7ed
--- /dev/null
+++ b/drivers/soc/renesas/r8a779f0-sysc.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R-Car S4-8 System Controller
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk/renesas.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/of_address.h>
+#include <linux/pm_domain.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <dt-bindings/power/r8a779f0-sysc.h>
+
+#include "rcar-gen4-sysc.h"
+
+static struct rcar_gen4_sysc_area r8a779f0_areas[] __initdata = {
+	{ "always-on",	R8A779F0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "a3e0",	R8A779F0_PD_A3E0, R8A779F0_PD_ALWAYS_ON, PD_SCU },
+	{ "a3e1",	R8A779F0_PD_A3E1, R8A779F0_PD_ALWAYS_ON, PD_SCU },
+	{ "a2e0d0",	R8A779F0_PD_A2E0D0, R8A779F0_PD_A3E0, PD_SCU },
+	{ "a2e0d1",	R8A779F0_PD_A2E0D1, R8A779F0_PD_A3E0, PD_SCU },
+	{ "a2e1d0",	R8A779F0_PD_A2E1D0, R8A779F0_PD_A3E1, PD_SCU },
+	{ "a2e1d1",	R8A779F0_PD_A2E1D1, R8A779F0_PD_A3E1, PD_SCU },
+	{ "a1e0d0c0",	R8A779F0_PD_A1E0D0C0, R8A779F0_PD_A2E0D0, PD_CPU_NOCR },
+	{ "a1e0d0c1",	R8A779F0_PD_A1E0D0C1, R8A779F0_PD_A2E0D0, PD_CPU_NOCR },
+	{ "a1e0d1c0",	R8A779F0_PD_A1E0D1C0, R8A779F0_PD_A2E0D1, PD_CPU_NOCR },
+	{ "a1e0d1c1",	R8A779F0_PD_A1E0D1C1, R8A779F0_PD_A2E0D1, PD_CPU_NOCR },
+	{ "a1e1d0c0",	R8A779F0_PD_A1E1D0C0, R8A779F0_PD_A2E1D0, PD_CPU_NOCR },
+	{ "a1e1d0c1",	R8A779F0_PD_A1E1D0C1, R8A779F0_PD_A2E1D0, PD_CPU_NOCR },
+	{ "a1e1d1c0",	R8A779F0_PD_A1E1D1C0, R8A779F0_PD_A2E1D1, PD_CPU_NOCR },
+	{ "a1e1d1c1",	R8A779F0_PD_A1E1D1C1, R8A779F0_PD_A2E1D1, PD_CPU_NOCR },
+};
+
+const struct rcar_gen4_sysc_info r8a779f0_sysc_info __initconst = {
+	.areas = r8a779f0_areas,
+	.num_areas = ARRAY_SIZE(r8a779f0_areas),
+};
diff --git a/drivers/soc/renesas/rcar-gen4-sysc.c b/drivers/soc/renesas/rcar-gen4-sysc.c
index d9a0929f5f1d..831162a57f9a 100644
--- a/drivers/soc/renesas/rcar-gen4-sysc.c
+++ b/drivers/soc/renesas/rcar-gen4-sysc.c
@@ -278,6 +278,9 @@ static int __init rcar_gen4_sysc_pd_setup(struct rcar_gen4_sysc_pd *pd)
 static const struct of_device_id rcar_gen4_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A779A0
 	{ .compatible = "renesas,r8a779a0-sysc", .data = &r8a779a0_sysc_info },
+#endif
+#ifdef CONFIG_SYSC_R8A779F0
+	{ .compatible = "renesas,r8a779f0-sysc", .data = &r8a779f0_sysc_info },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/soc/renesas/rcar-gen4-sysc.h b/drivers/soc/renesas/rcar-gen4-sysc.h
index 3470a9e2f5c7..0e0bd102b1f9 100644
--- a/drivers/soc/renesas/rcar-gen4-sysc.h
+++ b/drivers/soc/renesas/rcar-gen4-sysc.h
@@ -38,5 +38,6 @@ struct rcar_gen4_sysc_info {
 };
 
 extern const struct rcar_gen4_sysc_info r8a779a0_sysc_info;
+extern const struct rcar_gen4_sysc_info r8a779f0_sysc_info;
 
 #endif /* __SOC_RENESAS_RCAR_GEN4_SYSC_H__ */
-- 
2.25.1

