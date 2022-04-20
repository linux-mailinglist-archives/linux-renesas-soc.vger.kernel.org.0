Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC075083DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376875AbiDTIqE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376858AbiDTIpx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:45:53 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1849A3B2B2;
        Wed, 20 Apr 2022 01:43:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="118557999"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:58 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D3938401073A;
        Wed, 20 Apr 2022 17:42:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 09/15] soc: renesas: r8a779g0-sysc: Add r8a779g0 support
Date:   Wed, 20 Apr 2022 17:42:49 +0900
Message-Id: <20220420084255.375700-10-yoshihiro.shimoda.uh@renesas.com>
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

Add support for R-Car V4H (R8A779G0) SoC power areas and register
access.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig          |  4 ++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r8a779g0-sysc.c  | 62 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.c |  3 ++
 drivers/soc/renesas/rcar-gen4-sysc.h |  1 +
 5 files changed, 71 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a779g0-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 63477f05fbaf..422c8da82fad 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -369,6 +369,10 @@ config SYSC_R8A779F0
 	bool "System Controller support for R-Car S4-8" if COMPILE_TEST
 	select SYSC_RCAR_GEN4
 
+config SYSC_R8A779G0
+	bool "System Controller support for R-Car V4H" if COMPILE_TEST
+	select SYSC_RCAR_GEN4
+
 config SYSC_R8A7792
 	bool "System Controller support for R-Car V2H" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index deeb41f84f01..535868c9c7e4 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_SYSC_R8A77990)	+= r8a77990-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 obj-$(CONFIG_SYSC_R8A779A0)	+= r8a779a0-sysc.o
 obj-$(CONFIG_SYSC_R8A779F0)	+= r8a779f0-sysc.o
+obj-$(CONFIG_SYSC_R8A779G0)	+= r8a779g0-sysc.o
 ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
diff --git a/drivers/soc/renesas/r8a779g0-sysc.c b/drivers/soc/renesas/r8a779g0-sysc.c
new file mode 100644
index 000000000000..a452709f066d
--- /dev/null
+++ b/drivers/soc/renesas/r8a779g0-sysc.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R-Car V4H System Controller
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
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
+#include <dt-bindings/power/r8a779g0-sysc.h>
+
+#include "rcar-gen4-sysc.h"
+
+static struct rcar_gen4_sysc_area r8a779g0_areas[] __initdata = {
+	{ "always-on",	R8A779G0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "a3e0",	R8A779G0_PD_A3E0, R8A779G0_PD_ALWAYS_ON, PD_SCU },
+	{ "a2e0d0",	R8A779G0_PD_A2E0D0, R8A779G0_PD_A3E0, PD_SCU },
+	{ "a2e0d1",	R8A779G0_PD_A2E0D1, R8A779G0_PD_A3E0, PD_SCU },
+	{ "a1e0d0c0",	R8A779G0_PD_A1E0D0C0, R8A779G0_PD_A2E0D0, PD_CPU_NOCR },
+	{ "a1e0d0c1",	R8A779G0_PD_A1E0D0C1, R8A779G0_PD_A2E0D0, PD_CPU_NOCR },
+	{ "a1e0d1c0",	R8A779G0_PD_A1E0D1C0, R8A779G0_PD_A2E0D1, PD_CPU_NOCR },
+	{ "a1e0d1c1",	R8A779G0_PD_A1E0D1C1, R8A779G0_PD_A2E0D1, PD_CPU_NOCR },
+	{ "a33dga",	R8A779G0_PD_A33DGA, R8A779G0_PD_ALWAYS_ON },
+	{ "a23dgb",	R8A779G0_PD_A23DGB, R8A779G0_PD_A33DGA },
+	{ "a3vip0",	R8A779G0_PD_A3VIP0, R8A779G0_PD_ALWAYS_ON },
+	{ "a3vip1",	R8A779G0_PD_A3VIP1, R8A779G0_PD_ALWAYS_ON },
+	{ "a3vip2",	R8A779G0_PD_A3VIP2, R8A779G0_PD_ALWAYS_ON },
+	{ "a3isp0",	R8A779G0_PD_A3ISP0, R8A779G0_PD_ALWAYS_ON },
+	{ "a3isp1",	R8A779G0_PD_A3ISP1, R8A779G0_PD_ALWAYS_ON },
+	{ "a3ir",	R8A779G0_PD_A3IR, R8A779G0_PD_ALWAYS_ON },
+	{ "a2cn0",	R8A779G0_PD_A2CN0, R8A779G0_PD_A3IR },
+	{ "a1cnn0",	R8A779G0_PD_A1CNN0, R8A779G0_PD_A2CN0 },
+	{ "a1dsp0",	R8A779G0_PD_A1DSP0, R8A779G0_PD_A2CN0 },
+	{ "a1dsp1",	R8A779G0_PD_A1DSP1, R8A779G0_PD_A2CN0 },
+	{ "a1dsp2",	R8A779G0_PD_A1DSP2, R8A779G0_PD_A2CN0 },
+	{ "a1dsp3",	R8A779G0_PD_A1DSP3, R8A779G0_PD_A2CN0 },
+	{ "a2imp01",	R8A779G0_PD_A2IMP01, R8A779G0_PD_A3IR },
+	{ "a2imp23",	R8A779G0_PD_A2IMP23, R8A779G0_PD_A3IR },
+	{ "a2psc",	R8A779G0_PD_A2PSC, R8A779G0_PD_A3IR },
+	{ "a2dma",	R8A779G0_PD_A2DMA, R8A779G0_PD_A3IR },
+	{ "a2cv0",	R8A779G0_PD_A2CV0, R8A779G0_PD_A3IR },
+	{ "a2cv1",	R8A779G0_PD_A2CV1, R8A779G0_PD_A3IR },
+	{ "a2cv2",	R8A779G0_PD_A2CV2, R8A779G0_PD_A3IR },
+	{ "a2cv3",	R8A779G0_PD_A2CV3, R8A779G0_PD_A3IR },
+};
+
+const struct rcar_gen4_sysc_info r8a779g0_sysc_info __initconst = {
+	.areas = r8a779g0_areas,
+	.num_areas = ARRAY_SIZE(r8a779g0_areas),
+};
diff --git a/drivers/soc/renesas/rcar-gen4-sysc.c b/drivers/soc/renesas/rcar-gen4-sysc.c
index 831162a57f9a..9e5e6e077abc 100644
--- a/drivers/soc/renesas/rcar-gen4-sysc.c
+++ b/drivers/soc/renesas/rcar-gen4-sysc.c
@@ -281,6 +281,9 @@ static const struct of_device_id rcar_gen4_sysc_matches[] __initconst = {
 #endif
 #ifdef CONFIG_SYSC_R8A779F0
 	{ .compatible = "renesas,r8a779f0-sysc", .data = &r8a779f0_sysc_info },
+#endif
+#ifdef CONFIG_SYSC_R8A779G0
+	{ .compatible = "renesas,r8a779g0-sysc", .data = &r8a779g0_sysc_info },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/soc/renesas/rcar-gen4-sysc.h b/drivers/soc/renesas/rcar-gen4-sysc.h
index 0e0bd102b1f9..fe2d98254754 100644
--- a/drivers/soc/renesas/rcar-gen4-sysc.h
+++ b/drivers/soc/renesas/rcar-gen4-sysc.h
@@ -39,5 +39,6 @@ struct rcar_gen4_sysc_info {
 
 extern const struct rcar_gen4_sysc_info r8a779a0_sysc_info;
 extern const struct rcar_gen4_sysc_info r8a779f0_sysc_info;
+extern const struct rcar_gen4_sysc_info r8a779g0_sysc_info;
 
 #endif /* __SOC_RENESAS_RCAR_GEN4_SYSC_H__ */
-- 
2.25.1

