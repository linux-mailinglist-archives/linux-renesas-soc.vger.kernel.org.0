Return-Path: <linux-renesas-soc+bounces-5957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81C900258
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 13:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85632877BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 11:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F3518FC84;
	Fri,  7 Jun 2024 11:38:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E028A18FC63;
	Fri,  7 Jun 2024 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760290; cv=none; b=rvMTPSsYu002r+Cr4hRyJqpQLpYsPBXeMvg14keH3DwdLbo/r4+Ykpq0MrBHNY+PugA81I4t+KYIE9j0YrVijxfcaWAMFFEWqw2Uu2syomsvIsLT1om3VqfdZp2WJJRSFGELBWkhPG84v1ZChUAoibpUTw4nF/qrOPmsGrHUd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760290; c=relaxed/simple;
	bh=1Akd+26U6Id9fSsgiUhbrzDMLs+DxaRzmxHmosCpZ0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SeJzXzwDYJo1hoDujWqvKf+bhUw/3vGoIMitD1MVfv8iqqqzYvyM2FflslDitq0gO7uk1NXoYekIIjYtXJvDb47cL35lleoeS3NU7Zpn22vIDzUtm7kWewQrg6hLGdNIfmRdTs7/zApG43IagoLNHuCC33IXs77SuimKdbm9xHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,220,1712588400"; 
   d="scan'208";a="211042485"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2024 20:38:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05D5C40071E8;
	Fri,  7 Jun 2024 20:37:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS regulator driver
Date: Fri,  7 Jun 2024 12:37:43 +0100
Message-Id: <20240607113745.73934-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the RZ/G2L HW manual, VBUSEN can be controlled by the VBOUT
bit of the VBUS Control Register. This register is mapped in the reset
framework. The reset driver expose this register as regmap and instantiates
this driver. The consumer device will use the regulator regmap to control
the VBOUT bit as the control need to be done in the atomic context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * New patch
---
 drivers/regulator/Kconfig                     |  9 +++
 drivers/regulator/Makefile                    |  1 +
 .../regulator/renesas-usb-vbus-regulator.c    | 65 +++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 drivers/regulator/renesas-usb-vbus-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d333be2bea3b..0281a9a6f4ce 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1634,6 +1634,15 @@ config REGULATOR_UNIPHIER
 	help
 	  Support for regulators implemented on Socionext UniPhier SoCs.
 
+config REGULATOR_RZG2L_VBCTRL
+	tristate "Renesas RZ/G2L USB VBUS regulator driver"
+	depends on ARCH_RZG2L || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	default ARCH_RZG2L
+	help
+	  Support for VBUS regulators implemented on Renesas RZ/G2L SoCs.
+
 config REGULATOR_VCTRL
 	tristate "Voltage controlled regulators"
 	depends on OF
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index ba15fa5f30ad..6127ffb4b011 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -189,6 +189,7 @@ obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
 obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
 obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
 obj-$(CONFIG_REGULATOR_UNIPHIER) += uniphier-regulator.o
+obj-$(CONFIG_REGULATOR_RZG2L_VBCTRL) += renesas-usb-vbus-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
 obj-$(CONFIG_REGULATOR_VEXPRESS) += vexpress-regulator.o
 obj-$(CONFIG_REGULATOR_VQMMC_IPQ4019) += vqmmc-ipq4019-regulator.o
diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
new file mode 100644
index 000000000000..24582782ad40
--- /dev/null
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Renesas USB VBUS output regulator driver
+//
+// Copyright (C) 2024 Renesas Electronics Corporation
+//
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/regmap.h>
+
+static const unsigned int vbus_voltages[] = {
+	3300000, 0
+};
+
+static const struct regulator_ops rzg2l_usb_vbus_reg_ops = {
+	.list_voltage = regulator_list_voltage_table,
+};
+
+static const struct regulator_desc rzg2l_usb_vbus_rdesc = {
+	.name = "usb_vbus",
+	.ops = &rzg2l_usb_vbus_reg_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.volt_table = vbus_voltages,
+	.n_voltages = ARRAY_SIZE(vbus_voltages),
+};
+
+static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap)
+		return dev_err_probe(dev, -ENOENT, "Failed to get regmap\n");
+
+	config.dev = dev;
+	config.of_node = dev->of_node;
+	rdev = devm_regulator_register(dev, &rzg2l_usb_vbus_rdesc, &config);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "not able to register vbus regulator\n");
+
+	return 0;
+}
+
+static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
+	.probe = rzg2l_usb_vbus_regulator_probe,
+	.driver	= {
+		.name = "rzg2l-usb-vbus-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(rzg2l_usb_vbus_regulator_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L USB Vbus Regulator Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


