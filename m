Return-Path: <linux-renesas-soc+bounces-11043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300789E7AE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 22:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF08B287C21
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 21:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61937215042;
	Fri,  6 Dec 2024 21:26:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E56212FB6;
	Fri,  6 Dec 2024 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520401; cv=none; b=NrWf94WFNL10+UJlfnz9smq4MW6vRjl1NWyK/Xo0v2IFsgstCOuVtKy/Mi73FlLVst6io8CGxJRle5EsvN9wnyjQlksuSlvVEvwFQxLbGFRIEzvD8WMaD3nlJ/8p62bt78C2NuLAsyebS9HXKfy5KtAVqz8DyfmNAaBu8ZiP8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520401; c=relaxed/simple;
	bh=aUrqdGkehyY2PkgcW7kCKdC1TTB3CDw9JSd9X2PLcSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZziqlWIA2TBFCOZ/ae6XbK4A8i1BeNFBEDClvU3w+h8J6WHjWFCql3ytbohjYZeA2m+fk226cZfLJOwU6HIHsE/K+rm3QoMeTHbHEcsYYz3WiCHI98Bo0rw1pXwSZNYAo7D3BkjAq9fDKxQe8PzWmJqrLLb2FRYU/ehP+FcdgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: MEh8Vt9SRG6fi9LW2EOXZQ==
X-CSE-MsgGUID: wEvWILlRTUKokvRWvdPB9A==
X-IronPort-AV: E=Sophos;i="6.12,214,1728918000"; 
   d="scan'208";a="231123928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Dec 2024 06:26:33 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.246])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EC8634090D3F;
	Sat,  7 Dec 2024 06:26:17 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Date: Fri,  6 Dec 2024 22:25:57 +0100
Message-ID: <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
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
 drivers/soc/renesas/Kconfig          |  6 +++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a09g047-sysc.c | 70 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        | 44 +++++++++++------
 drivers/soc/renesas/rz-sysc.h        |  7 +++
 5 files changed, 114 insertions(+), 14 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g047-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a792a3e915fe..9e46b0ee6e80 100644
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
+	depends on MFD_SYSCON
 
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
index 000000000000..32bdab9f1774
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g047-sysc.c
@@ -0,0 +1,70 @@
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
+/* Register definitions */
+#define SYS_LSI_DEVID	0x304
+#define SYS_LSI_MODE	0x300
+#define SYS_LSI_PRR	0x308
+#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
+#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
+#define SYS_LSI_PRR_CA55_DIS	BIT(8)
+#define SYS_LSI_PRR_NPU_DIS	BIT(1)
+/*
+ * BOOTPLLCA[1:0]
+ *	[0,0] => 1.1GHZ
+ *	[0,1] => 1.5GHZ
+ *	[1,0] => 1.6GHZ
+ *	[1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHz	0x3
+
+static void rzg3e_extended_device_identification(struct device *dev,
+				void __iomem *sysc_base,
+				struct soc_device_attribute *soc_dev_attr)
+{
+	u32 prr_val, mode_val;
+	bool is_quad_core, npu_enabled;
+
+	prr_val = readl(sysc_base + SYS_LSI_PRR);
+	mode_val = readl(sysc_base + SYS_LSI_MODE);
+
+	/* Check CPU and NPU configuration */
+	is_quad_core = !(prr_val & SYS_LSI_PRR_CA55_DIS);
+	npu_enabled = !(prr_val & SYS_LSI_PRR_NPU_DIS);
+
+	dev_info(dev, "Detected Renesas %s Core %s %s Rev %s  %s\n",
+		 is_quad_core ? "Quad" : "Dual",
+		 soc_dev_attr->family,
+		 soc_dev_attr->soc_id,
+		 soc_dev_attr->revision,
+		 npu_enabled ? "with Ethos-U55" : "");
+
+	/* Check CA55 PLL configuration */
+	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHz)
+		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
+}
+
+static const struct rz_sysc_soc_id_init_data rzg3e_sysc_soc_id_init_data __initconst = {
+	.family = "RZ/G3E",
+	.id = 0x8679447,
+	.offset = SYS_LSI_DEVID,
+	.revision_mask = SYS_LSI_DEVID_REV,
+	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC,
+	.extended_device_identification = rzg3e_extended_device_identification,
+};
+
+const struct rz_sysc_init_data rzg3e_sysc_init_data = {
+	.soc_id_init_data = &rzg3e_sysc_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index d34d295831b8..515eca249b6e 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 
 	soc_id_start = strchr(match->compatible, ',') + 1;
 	soc_id_end = strchr(match->compatible, '-');
-	size = soc_id_end - soc_id_start;
+	size = soc_id_end - soc_id_start + 1;
 	if (size > 32)
 		size = 32;
 	strscpy(soc_id, soc_id_start, size);
@@ -257,8 +257,16 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 		return -ENODEV;
 	}
 
-	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
-		 soc_dev_attr->soc_id, soc_dev_attr->revision);
+	/* Try to call SoC-specific device identification */
+	if (soc_data->extended_device_identification) {
+		soc_data->extended_device_identification(sysc->dev, sysc->base,
+							 soc_dev_attr);
+	} else {
+		dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n",
+			 soc_dev_attr->family,
+			 soc_dev_attr->soc_id,
+			 soc_dev_attr->revision);
+	}
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
@@ -283,6 +291,9 @@ static struct regmap_config rz_sysc_regmap = {
 static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
+#endif
+#ifdef CONFIG_SYSC_R9A09G047
+	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sysc_init_data },
 #endif
 	{ }
 };
@@ -315,20 +326,25 @@ static int rz_sysc_probe(struct platform_device *pdev)
 		return ret;
 
 	data = match->data;
-	if (!data->max_register_offset)
-		return -EINVAL;
+	if (data->signals_init_data) {
+		if (!data->max_register_offset)
+			return -EINVAL;
 
-	ret = rz_sysc_signals_init(sysc, data->signals_init_data, data->num_signals);
-	if (ret)
-		return ret;
+		ret = rz_sysc_signals_init(sysc, data->signals_init_data, data->num_signals);
+		if (ret)
+			return ret;
+
+		rz_sysc_regmap.max_register = data->max_register_offset;
+		dev_set_drvdata(dev, sysc);
 
-	dev_set_drvdata(dev, sysc);
-	rz_sysc_regmap.max_register = data->max_register_offset;
-	regmap = devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+		regmap = devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
 
-	return of_syscon_register_regmap(dev->of_node, regmap);
+		return of_syscon_register_regmap(dev->of_node, regmap);
+	}
+
+	return 0;
 }
 
 static struct platform_driver rz_sysc_driver = {
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index babca9c743c7..2b5ad41cef9e 100644
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
+ * @extended_device_identification: SoC-specific extended device identification
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -49,6 +52,9 @@ struct rz_sysc_soc_id_init_data {
 	u32 offset;
 	u32 revision_mask;
 	u32 specific_id_mask;
+	void (*extended_device_identification)(struct device *dev,
+		void __iomem *sysc_base,
+		struct soc_device_attribute *soc_dev_attr);
 };
 
 /**
@@ -65,6 +71,7 @@ struct rz_sysc_init_data {
 	u32 max_register_offset;
 };
 
+extern const struct rz_sysc_init_data rzg3e_sysc_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.25.1


