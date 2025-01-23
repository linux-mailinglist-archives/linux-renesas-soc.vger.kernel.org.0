Return-Path: <linux-renesas-soc+bounces-12423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68510A1A874
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9BCC188D8E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257AC2147EF;
	Thu, 23 Jan 2025 17:05:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF192144D1;
	Thu, 23 Jan 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651944; cv=none; b=FusV6jCHKB94wB+Hqx9FSOG3gTvVe2crgPPvNDlb6O5yoDydg/DiQzogAYuchc4j8b69uIs0CesMALRXjUv8NNfFDoxWB2eDbC0NEvUpSTln47FNpso/GyrCa4WUMI84wkSb6/3qoCmqd5lFtSPQEyyIE0o/dJaiJOKh+/bCTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651944; c=relaxed/simple;
	bh=WvxGFuKQlR65GCl29lN5zR7ZA4m+M1Wr9NthZdpo4sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLdSwdz1aRM03Z9FyNfgAh1o4vNHNR5Oc+5TAcF77FC8ps9wht/lX5wyAzIXsjynQabHXeOzuzc5i4cOt4MtiEIzCWk4+anslNU8fcZOwumugj70uWFoMuLP4C2u5GtLAqhdnyPMhjZVnJBcH9PIS+idhfj3U+XL4EacP/3BvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Z0a/vy+ySVuIQmnMwFXELg==
X-CSE-MsgGUID: MNSYoPixSVGlMxrOXn+LBA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jan 2025 02:05:40 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AEA37402AA46;
	Fri, 24 Jan 2025 02:05:35 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com
Subject: [PATCH v4 4/9] soc: renesas: rz-sysc: Add support for RZ/G3E family
Date: Thu, 23 Jan 2025 18:05:03 +0100
Message-ID: <20250123170508.13578-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC detection support for RZ/G3E SoC. Also add support for detecting
the number of cores and ETHOS-U55 NPU and also detect PLL mismatch for SW
settings other than 1.7GHz.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
v3 -> v4: No changes

Changes in v3:
- Removed Syscon support

Changes in v2:
- Group bitfields ordered by registers
- Rename SoC-specific callback field to 'print_id'
- Explicitely select 'MFD_SYSCON' config option
- Do not rely on 'syscon'-compatible probing anymore.

 drivers/soc/renesas/Kconfig         |  4 ++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g047-sys.c | 71 +++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       | 12 ++++-
 drivers/soc/renesas/rz-sysc.h       |  6 +++
 5 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g047-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a792a3e915fe..173d4f60d17a 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -348,6 +348,7 @@ config ARCH_R9A09G011
 
 config ARCH_R9A09G047
 	bool "ARM64 Platform support for RZ/G3E"
+	select SYS_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
@@ -391,4 +392,7 @@ config SYSC_R9A08G045
 	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYS_R9A09G047
+	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
+	select SYSC_RZ
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 8cd139b3dd0a..17b86d3ae478 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -7,6 +7,7 @@ ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
+obj-$(CONFIG_SYS_R9A09G047)	+= r9a09g047-sys.o
 
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
new file mode 100644
index 000000000000..db5406eb9e05
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3E System controller (SYS) driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
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
+#define SYS_LSI_DEVID		0x304
+#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
+#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
+#define SYS_LSI_PRR			0x308
+#define SYS_LSI_PRR_CA55_DIS		BIT(8)
+#define SYS_LSI_PRR_NPU_DIS		BIT(1)
+
+
+static void rzg3e_sys_print_id(struct device *dev,
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
+static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initconst = {
+	.family = "RZ/G3E",
+	.id = 0x8679447,
+	.offset = SYS_LSI_DEVID,
+	.revision_mask = SYS_LSI_DEVID_REV,
+	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC,
+	.print_id = rzg3e_sys_print_id,
+};
+
+const struct rz_sysc_init_data rzg3e_sys_init_data = {
+	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index c0d4aca4c2b6..cedc2ca51979 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -63,8 +63,13 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 		return -ENODEV;
 	}
 
-	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
-		 soc_dev_attr->soc_id, soc_dev_attr->revision);
+	/* Try to call SoC-specific device identification */
+	if (soc_data->print_id) {
+		soc_data->print_id(sysc->dev, sysc->base, soc_dev_attr);
+	} else {
+		dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n",
+			 soc_dev_attr->family, soc_dev_attr->soc_id, soc_dev_attr->revision);
+	}
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
@@ -76,6 +81,9 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
+#endif
+#ifdef CONFIG_SYS_R9A09G047
+	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sys_init_data },
 #endif
 	{ }
 };
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 1ee25c78ba8b..3f628eb15677 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -8,6 +8,8 @@
 #ifndef __SOC_RENESAS_RZ_SYSC_H__
 #define __SOC_RENESAS_RZ_SYSC_H__
 
+#include <linux/device.h>
+#include <linux/sys_soc.h>
 #include <linux/types.h>
 
 /**
@@ -17,6 +19,7 @@
  * @offset: SYSC SoC ID register offset
  * @revision_mask: SYSC SoC ID revision mask
  * @specific_id_mask: SYSC SoC ID specific ID mask
+ * @print_id: SoC-specific extended device identification
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -24,6 +27,8 @@ struct rz_sysc_soc_id_init_data {
 	u32 offset;
 	u32 revision_mask;
 	u32 specific_id_mask;
+	void (*print_id)(struct device *dev, void __iomem *sysc_base,
+			 struct soc_device_attribute *soc_dev_attr);
 };
 
 /**
@@ -34,6 +39,7 @@ struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
 };
 
+extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.25.1


