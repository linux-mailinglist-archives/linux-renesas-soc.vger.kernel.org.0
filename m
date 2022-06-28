Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD01055EB24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jun 2022 19:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbiF1Rj5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Jun 2022 13:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiF1Rj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 13:39:56 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 32A7033E15
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2022 10:39:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,229,1650898800"; 
   d="scan'208";a="124404098"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Jun 2022 02:39:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A4B640CCE2D;
        Wed, 29 Jun 2022 02:39:53 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC] soc: renesas: Add RZ/V2M SYS driver
Date:   Tue, 28 Jun 2022 18:39:47 +0100
Message-Id: <20220628173947.91519-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The System Configuration (SYS) module on the Renesas RZ/V2M (r9a09g011)
contains registers for many different aspects of the SoC.

Some of the peripherals on the SoC are only 32-bit address capable bus
masters. To select the lower 4GiB or upper 4GiB of memory, the
SYS PERI0_BANK and SYS_PERI1_BANK registers can be programmed to set
the 33rd address bit.
Due to the use of firmware with the SoC, uboot is often set up such that
these peripherals can only access the upper 4GiB. In order to allow
Linux to use bounce buffers for drivers, we set aside some memory in the
lower 4GiB for Linux.
Thus this requires the SYS PERIx_BANK registers to be reprogrammed.
---
 drivers/soc/renesas/Kconfig         |  4 ++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g011-sys.c | 67 +++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a09g011-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index c50a6ce1b99d..b9e3dc879ddc 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -327,6 +327,7 @@ config ARCH_R9A09G011
 	bool "ARM64 Platform support for RZ/V2M"
 	select PM
 	select PM_GENERIC_DOMAINS
+	select SYS_R9A09G011
 	help
 	  This enables support for the Renesas RZ/V2M SoC.
 
@@ -440,4 +441,7 @@ config SYSC_R8A774B1
 	bool "System Controller support for RZ/G2N" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYS_R9A09G011
+	bool "System Controller support for RZ/V2M" if COMPILE_TEST
+
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 535868c9c7e4..7e269ab6343e 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_SYSC_R8A779G0)	+= r8a779g0-sysc.o
 ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
+obj-$(CONFIG_SYS_R9A09G011)	+= r9a09g011-sys.o
 
 # Family
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
diff --git a/drivers/soc/renesas/r9a09g011-sys.c b/drivers/soc/renesas/r9a09g011-sys.c
new file mode 100644
index 000000000000..6a72ab15cc89
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g011-sys.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2M SYS driver
+ *
+ * Copyright (C) 2022  Renesas Electronics Corporation
+ */
+
+#include <linux/io.h>
+#include <linux/of_address.h>
+
+#define SYS_PERI0_BANK		0x30
+#define SDI0_SHIFT		0
+#define SDI1_SHIFT		2
+#define EMMC_SHIFT		4
+#define USB_HOST_SHIFT		8
+#define USB_PERI_SHIFT		10
+#define PCIE_SHIFT		12
+
+#define SYS_PERI1_BANK		0x34
+#define ETH_SHIFT		0
+
+#define BANK_LOWER_4GB		0
+#define BANK_UPPER_4GB		1
+
+static const struct of_device_id renesas_socs[] __initconst = {
+	{ .compatible = "renesas,r9a09g011-sys" },
+	{ /* sentinel */ }
+};
+
+static void write_peri_bank(void __iomem *addr, uint32_t val, int shift)
+{
+	/* Set the write enable bits */
+	writel(((3 << 16) | val) << shift, addr);
+}
+
+static int __init r9a09g011_init(void)
+{
+	const struct of_device_id *match;
+	struct device_node *np;
+	void __iomem *base;
+	int error = 0;
+
+	np = of_find_matching_node_and_match(NULL, renesas_socs, &match);
+	if (!np)
+		return -ENODEV;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_warn("%pOF: Cannot map regs\n", np);
+		error = -ENOMEM;
+		goto out_put;
+	}
+
+	write_peri_bank(base + SYS_PERI0_BANK, BANK_LOWER_4GB, SDI0_SHIFT);
+	write_peri_bank(base + SYS_PERI0_BANK, BANK_LOWER_4GB, SDI1_SHIFT);
+	write_peri_bank(base + SYS_PERI0_BANK, BANK_LOWER_4GB, EMMC_SHIFT);
+	write_peri_bank(base + SYS_PERI0_BANK, BANK_LOWER_4GB, USB_HOST_SHIFT);
+	write_peri_bank(base + SYS_PERI0_BANK, BANK_LOWER_4GB, USB_PERI_SHIFT);
+	write_peri_bank(base + SYS_PERI0_BANK, BANK_LOWER_4GB, PCIE_SHIFT);
+	write_peri_bank(base + SYS_PERI1_BANK, BANK_LOWER_4GB, ETH_SHIFT);
+
+out_put:
+	of_node_put(np);
+	return error;
+}
+
+core_initcall(r9a09g011_init);
-- 
2.34.1

