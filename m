Return-Path: <linux-renesas-soc+bounces-6302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C2909D14
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 12:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37669B20D88
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 10:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6D71862BC;
	Sun, 16 Jun 2024 10:54:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ED949635;
	Sun, 16 Jun 2024 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718535271; cv=none; b=clRIy9cDF7QGHYnpwZqE0ldUVuaqE6yDnS5u+INfZ0sstRDumqL4sInhF/OOfUGH6zyciOieU6wzcBk+FLpAN7e8XIWlYxIlenvpVLQfQ8YUS6luz0k8WbuUkE839zLk2UFyAAr4FLFaHhIch8wecbc1ibB5AVrAe9wMGs4WhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718535271; c=relaxed/simple;
	bh=sK3vwRjChb7ryYxEoP6WZ0dLVkOPhWJP0kw3GDQp0Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2RILKkEpLjbbXAYFr5nRgZwMRYntb7gKMr6lNK/V/YuifkZXHbeYQC0j/aDnFdN6EW+2564R36zJDeUso3Lx5ePlVCcaO2yyQcR1gWBIw0E7N1r1b5Ol2dEKJkJH8Wmwy4/7PJ1FspNCHp88xh0IJsnHDzGsbirUGk+tsBwcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,242,1712588400"; 
   d="scan'208";a="212062406"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Jun 2024 19:54:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.60])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AEE5341FEF44;
	Sun, 16 Jun 2024 19:54:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator driver
Date: Sun, 16 Jun 2024 11:53:56 +0100
Message-ID: <20240616105402.45211-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
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
this driver. The consumer will use the regulator API to control the VBOUT
bit as the control need to be done in the atomic context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added check for of_get_child_by_name().
 * Released the resource by of_node_put()
v2->v3:
 * Dropped vbus_voltages table
 * Added support for enabling/disabling regulator through regmap API's
 * Updated rzg2l_usb_vbus_rdesc with enable_{reg,mask}, fixed_uV and
   n_voltages
 * Updated of_node with child node of the parent device.
v1->v2:
 * New patch
---
 drivers/regulator/Kconfig                     |  9 +++
 drivers/regulator/Makefile                    |  1 +
 .../regulator/renesas-usb-vbus-regulator.c    | 74 +++++++++++++++++++
 3 files changed, 84 insertions(+)
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
index 000000000000..4eceb6b54497
--- /dev/null
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -0,0 +1,74 @@
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
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+static const struct regulator_ops rzg2l_usb_vbus_reg_ops = {
+	.enable     = regulator_enable_regmap,
+	.disable    = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_desc rzg2l_usb_vbus_rdesc = {
+	.name = "vbus",
+	.of_match = of_match_ptr("regulator-vbus"),
+	.ops = &rzg2l_usb_vbus_reg_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.enable_reg  = 0,
+	.enable_mask = BIT(0),
+	.enable_is_inverted = true,
+	.fixed_uV	= 5000000,
+	.n_voltages	= 1,
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
+	config.of_node = of_get_child_by_name(dev->parent->of_node, "regulator-vbus");
+	if (!config.of_node)
+		return dev_err_probe(dev, -ENODEV, "regulator node not found\n");
+
+	rdev = devm_regulator_register(dev, &rzg2l_usb_vbus_rdesc, &config);
+	if (IS_ERR(rdev)) {
+		of_node_put(config.of_node);
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "not able to register vbus regulator\n");
+	}
+
+	of_node_put(config.of_node);
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
2.43.0


