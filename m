Return-Path: <linux-renesas-soc+bounces-11761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F789FF49D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 17:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9B21882678
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 16:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A251E3DCD;
	Wed,  1 Jan 2025 16:39:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C4F1E32CF;
	Wed,  1 Jan 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735749570; cv=none; b=LVC7tHtXo05nXe4t6UHImkh1T2wHQeHdf08iD/9yWRVCBqFsoEsmgxTG1r+jAGo87h6pJKll8B7ta+4q7DI8AW0a8LDqZoWucpdr+GaiYiJBhSt8sNu5VOWS8WUjV6OHMDnINFTm+JTHv7KwVsnCOrqdmX4HBisRdXJbRJUem7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735749570; c=relaxed/simple;
	bh=AxPUmLAqRQ8Jgxv2ZsnJGki1oskRrnWS1MzcJMEgpYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSiyNhYI1FGfUNHQ66uHcFUKRDLCOUH6JdcCfAlrEYuGFqqklaXEg8vsWAgu7ZZmKdAeqy7Kxn78+66xZ63yg4MzXenat3L//7FVet/uot4fUlNVmDzqoL+LDBRudWcvxTPNYoWlVNHWz6Nx4vljXzTvAAh+LxlHQix30UzWymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: w5xmIJtcSvuJFxxaV38zhg==
X-CSE-MsgGUID: 2iuqLZYgSJqCIKf9qqUP0Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jan 2025 01:34:25 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 448D14026460;
	Thu,  2 Jan 2025 01:34:15 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Subject: [PATCH v2 3/4] soc: renesas: rz-sysc: Add support for RZ/G3E family
Date: Wed,  1 Jan 2025 17:33:43 +0100
Message-ID: <20250101163344.128139-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC detection support for RZ/G3E SoC. Also add support for detecting the
number of cores and ETHOS-U55 NPU and also detect PLL mismatch for SW settings
other than 1.7GHz.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
Changes in v2:
 - Group bitfields ordered by registers
 - Rename SoC-specific callback field to 'print_id'
 - Explicitely select 'MFD_SYSCON' config option
 - Do not rely on 'syscon'-compatible probing anymore.


 drivers/soc/renesas/Kconfig          |  6 +++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a09g047-sysc.c | 73 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        | 22 ++++++++-
 drivers/soc/renesas/rz-sysc.h        |  6 +++
 5 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g047-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a792a3e915fe..33759f69c37c 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -348,6 +348,7 @@ config ARCH_R9A09G011
 
 config ARCH_R9A09G047
 	bool "ARM64 Platform support for RZ/G3E"
+	select SYSC_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
@@ -386,9 +387,14 @@ config RST_RCAR
 
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
+	select MFD_SYSCON
 
 config SYSC_R9A08G045
 	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYSC_R9A09G047
+	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 8cd139b3dd0a..3256706112d9 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -7,6 +7,7 @@ ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
+obj-$(CONFIG_SYSC_R9A09G047)	+= r9a09g047-sysc.o
 
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
diff --git a/drivers/soc/renesas/r9a09g047-sysc.c b/drivers/soc/renesas/r9a09g047-sysc.c
new file mode 100644
index 000000000000..3ad6057f9196
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g047-sysc.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3E System controller driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+#include "rz-sysc.h"
+
+/* Register Offsets */
+#define SYS_LSI_DEVID		0x304
+#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
+#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
+#define SYS_LSI_MODE		0x300
+/*
+ * BOOTPLLCA[1:0]
+ *	    [0,0] => 1.1GHZ
+ *	    [0,1] => 1.5GHZ
+ *	    [1,0] => 1.6GHZ
+ *	    [1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
+#define SYS_LSI_PRR			0x308
+#define SYS_LSI_PRR_CA55_DIS		BIT(8)
+#define SYS_LSI_PRR_NPU_DIS		BIT(1)
+#define SYS_MAX_REG			0x170c
+
+
+static void rzg3e_sysc_print_id(struct device *dev,
+				void __iomem *sysc_base,
+				struct soc_device_attribute *soc_dev_attr)
+{
+	bool is_quad_core, npu_enabled;
+	u32 prr_val, mode_val;
+
+	prr_val = readl(sysc_base + SYS_LSI_PRR);
+	mode_val = readl(sysc_base + SYS_LSI_MODE);
+
+	/* Check CPU and NPU configuration */
+	is_quad_core = !(prr_val & SYS_LSI_PRR_CA55_DIS);
+	npu_enabled = !(prr_val & SYS_LSI_PRR_NPU_DIS);
+
+	dev_info(dev, "Detected Renesas %s Core %s %s Rev %s%s\n",
+		 is_quad_core ? "Quad" : "Dual",
+		 soc_dev_attr->family,
+		 soc_dev_attr->soc_id,
+		 soc_dev_attr->revision,
+		 npu_enabled ? " with Ethos-U55" : "");
+
+	/* Check CA55 PLL configuration */
+	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
+		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
+}
+
+static const struct rz_sysc_soc_id_init_data rzg3e_sysc_soc_id_init_data __initconst = {
+	.family = "RZ/G3E",
+	.id = 0x8679447,
+	.offset = SYS_LSI_DEVID,
+	.revision_mask = SYS_LSI_DEVID_REV,
+	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC,
+	.print_id = rzg3e_sysc_print_id,
+};
+
+const struct rz_sysc_init_data rzg3e_sysc_init_data = {
+	.soc_id_init_data = &rzg3e_sysc_soc_id_init_data,
+	.max_register_offset = SYS_MAX_REG,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index e472fda3995b..6a33807e925a 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -130,6 +130,10 @@ static bool rz_sysc_writeable_reg(struct device *dev, unsigned int off)
 	struct rz_sysc *sysc = dev_get_drvdata(dev);
 	struct rz_sysc_signal *signal;
 
+	/* Fast path if not signal-aware */
+	if (!sysc->num_signals)
+		return true;
+
 	/* Any register containing a signal is writeable. */
 	signal = rz_sysc_off_to_signal(sysc, off, 0);
 	if (signal)
@@ -143,6 +147,10 @@ static bool rz_sysc_readable_reg(struct device *dev, unsigned int off)
 	struct rz_sysc *sysc = dev_get_drvdata(dev);
 	struct rz_sysc_signal *signal;
 
+	/* Fast path if not signal-aware */
+	if (!sysc->num_signals)
+		return true;
+
 	/* Any register containing a signal is readable. */
 	signal = rz_sysc_off_to_signal(sysc, off, 0);
 	if (signal)
@@ -257,8 +265,15 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 		return -ENODEV;
 	}
 
-	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
-		 soc_dev_attr->soc_id, soc_dev_attr->revision);
+	/* Try to call SoC-specific device identification */
+	if (soc_data->print_id) {
+		soc_data->print_id(sysc->dev, sysc->base, soc_dev_attr);
+	} else {
+		dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n",
+			 soc_dev_attr->family,
+			 soc_dev_attr->soc_id,
+			 soc_dev_attr->revision);
+	}
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
@@ -283,6 +298,9 @@ static struct regmap_config rz_sysc_regmap = {
 static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
+#endif
+#ifdef CONFIG_SYSC_R9A09G047
+	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sysc_init_data },
 #endif
 	{ }
 };
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index babca9c743c7..2c92b252b40c 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -8,7 +8,9 @@
 #ifndef __SOC_RENESAS_RZ_SYSC_H__
 #define __SOC_RENESAS_RZ_SYSC_H__
 
+#include <linux/device.h>
 #include <linux/refcount.h>
+#include <linux/sys_soc.h>
 #include <linux/types.h>
 
 /**
@@ -42,6 +44,7 @@ struct rz_sysc_signal {
  * @offset: SYSC SoC ID register offset
  * @revision_mask: SYSC SoC ID revision mask
  * @specific_id_mask: SYSC SoC ID specific ID mask
+ * @print_id: SoC-specific extended device identification
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -49,6 +52,8 @@ struct rz_sysc_soc_id_init_data {
 	u32 offset;
 	u32 revision_mask;
 	u32 specific_id_mask;
+	void (*print_id)(struct device *dev, void __iomem *sysc_base,
+			 struct soc_device_attribute *soc_dev_attr);
 };
 
 /**
@@ -65,6 +70,7 @@ struct rz_sysc_init_data {
 	u32 max_register_offset;
 };
 
+extern const struct rz_sysc_init_data rzg3e_sysc_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.25.1


