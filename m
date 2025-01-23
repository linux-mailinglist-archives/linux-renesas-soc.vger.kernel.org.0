Return-Path: <linux-renesas-soc+bounces-12422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9BA1A871
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D022168532
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE45A2144DD;
	Thu, 23 Jan 2025 17:05:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF7A2144D2;
	Thu, 23 Jan 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651943; cv=none; b=iDPVR/4Jaa+YtV8Y4i2M0NSu9z33HImTuKY8A0BLSmkbZ7hKOgzSHMaqVPSovDhWEC0GjztmQoY+BRUB4DLetB9qRdQ5oube5gKDONsJxwpl53GOndry5Ri/OWmW33WYB8Ul+5Xw80JDH9FKKKvK9QV00gQbAshZZmLpaMroNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651943; c=relaxed/simple;
	bh=TKvdTsVK48x1tXiiDTExgdPLZpGlQWK6H0Uua7EQMcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6P6fMMuwePkqJOXQ0gv2CBAAZV4STAaRemTOhNq9cBnQqckgX/WskK0dgqa0ZIc2C1A1PhGPjtLiVRPiS8wsIIP/zRBy2Kyls2B9Zo1bC2PFqCDHaJl3KNpByATbPUPxWL3a3rwaERltZ6Y5PWTCR1o1380eUR+NLnqVw2rmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: nQZoyJPcTPOj+b/AliwAvg==
X-CSE-MsgGUID: 8s8vfqPqTpanOnZoAffgEg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jan 2025 02:05:33 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 49F7C402BEEF;
	Fri, 24 Jan 2025 02:05:18 +0900 (JST)
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
Subject: [PATCH v4 1/9] soc: renesas: Add SYSC driver for Renesas RZ family
Date: Thu, 23 Jan 2025 18:05:00 +0100
Message-ID: <20250123170508.13578-2-john.madieu.xa@bp.renesas.com>
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S system controller (SYSC) has various registers that control
different functionalities. One of the exposed register offsers information
about the SoC identification.

Add a driver that identifies the SoC. Later the driver will be extended
with other functionalities.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
v4: No changes
v3: New patch

 drivers/soc/renesas/Kconfig   |   3 +
 drivers/soc/renesas/Makefile  |   1 +
 drivers/soc/renesas/rz-sysc.c | 119 ++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h |  37 +++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/renesas/rz-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.h

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 6d2e135eed89..937ab43fae6a 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -383,4 +383,7 @@ config PWC_RZV2M
 config RST_RCAR
 	bool "Reset Controller support for R-Car" if COMPILE_TEST
 
+config SYSC_RZ
+	bool "System controller for RZ SoCs" if COMPILE_TEST
+
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 734f8f8cefa4..3d5f847ed889 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -10,3 +10,4 @@ endif
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
+obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
new file mode 100644
index 000000000000..64fc56229440
--- /dev/null
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ System controller driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sys_soc.h>
+
+#include "rz-sysc.h"
+
+#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
+
+/**
+ * struct rz_sysc - RZ SYSC private data structure
+ * @base: SYSC base address
+ * @dev: SYSC device pointer
+ */
+struct rz_sysc {
+	void __iomem *base;
+	struct device *dev;
+};
+
+static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *match)
+{
+	const struct rz_sysc_init_data *sysc_data = match->data;
+	const struct rz_sysc_soc_id_init_data *soc_data = sysc_data->soc_id_init_data;
+	struct soc_device_attribute *soc_dev_attr;
+	const char *soc_id_start, *soc_id_end;
+	u32 val, revision, specific_id;
+	struct soc_device *soc_dev;
+	char soc_id[32] = {0};
+	size_t size;
+
+	soc_id_start = strchr(match->compatible, ',') + 1;
+	soc_id_end = strchr(match->compatible, '-');
+	size = soc_id_end - soc_id_start + 1;
+	if (size > 32)
+		size = sizeof(soc_id);
+	strscpy(soc_id, soc_id_start, size);
+
+	soc_dev_attr = devm_kzalloc(sysc->dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	soc_dev_attr->family = devm_kstrdup(sysc->dev, soc_data->family, GFP_KERNEL);
+	soc_dev_attr->soc_id = devm_kstrdup(sysc->dev, soc_id, GFP_KERNEL);
+	if (!soc_dev_attr->soc_id)
+		return -ENOMEM;
+
+	val = readl(sysc->base + soc_data->offset);
+	revision = field_get(soc_data->revision_mask, val);
+	specific_id = field_get(soc_data->specific_id_mask, val);
+	soc_dev_attr->revision = devm_kasprintf(sysc->dev, GFP_KERNEL, "%u", revision);
+	if (!soc_dev_attr->revision)
+		return -ENOMEM;
+
+	if (soc_data->id && specific_id != soc_data->id) {
+		dev_warn(sysc->dev, "SoC mismatch (product = 0x%x)\n", specific_id);
+		return -ENODEV;
+	}
+
+	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
+		 soc_dev_attr->soc_id, soc_dev_attr->revision);
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	return 0;
+}
+
+static const struct of_device_id rz_sysc_match[] = {
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rz_sysc_match);
+
+static int rz_sysc_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct rz_sysc *sysc;
+
+	match = of_match_node(rz_sysc_match, dev->of_node);
+	if (!match)
+		return -ENODEV;
+
+	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
+	if (!sysc)
+		return -ENOMEM;
+
+	sysc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sysc->base))
+		return PTR_ERR(sysc->base);
+
+	sysc->dev = dev;
+	return rz_sysc_soc_init(sysc, match);
+}
+
+static struct platform_driver rz_sysc_driver = {
+	.driver = {
+		.name = "renesas-rz-sysc",
+		.of_match_table = rz_sysc_match
+	},
+	.probe = rz_sysc_probe
+};
+
+static int __init rz_sysc_init(void)
+{
+	return platform_driver_register(&rz_sysc_driver);
+}
+subsys_initcall(rz_sysc_init);
+
+MODULE_DESCRIPTION("Renesas RZ System Controller Driver");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
new file mode 100644
index 000000000000..d74047686988
--- /dev/null
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ System Controller
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#ifndef __SOC_RENESAS_RZ_SYSC_H__
+#define __SOC_RENESAS_RZ_SYSC_H__
+
+#include <linux/types.h>
+
+/**
+ * struct rz_syc_soc_id_init_data - RZ SYSC SoC identification initialization data
+ * @family: RZ SoC family
+ * @id: RZ SoC expected ID
+ * @offset: SYSC SoC ID register offset
+ * @revision_mask: SYSC SoC ID revision mask
+ * @specific_id_mask: SYSC SoC ID specific ID mask
+ */
+struct rz_sysc_soc_id_init_data {
+	const char * const family;
+	u32 id;
+	u32 offset;
+	u32 revision_mask;
+	u32 specific_id_mask;
+};
+
+/**
+ * struct rz_sysc_init_data - RZ SYSC initialization data
+ * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ */
+struct rz_sysc_init_data {
+	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+};
+
+#endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.25.1


