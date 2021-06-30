Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0C13B7E1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhF3Hd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:33:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42113 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233035AbhF3Hd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:33:26 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85884673"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2021 16:30:52 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 96EDC41DBA50;
        Wed, 30 Jun 2021 16:30:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 05/11] reset: renesas: Add RZ/G2L usbphy control driver
Date:   Wed, 30 Jun 2021 08:30:07 +0100
Message-Id: <20210630073013.22415-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for RZ/G2L USBPHY Control driver. It mainly controls
reset and power down of the USB/PHY.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 v3:
  * New driver. As per Rob's suggestion, Modelled IP as a reset driver,
    since it mainly controls reset and power down of the PHY.
---
 drivers/reset/Kconfig                   |   7 +
 drivers/reset/Makefile                  |   1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 195 ++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3e7f55e44d84..82a1de5a3711 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -170,6 +170,13 @@ config RESET_RASPBERRYPI
 	  interfacing with RPi4's co-processor and model these firmware
 	  initialization routines as reset lines.
 
+config RESET_RZG2L_USBPHY_CTRL
+	tristate "Renesas RZ/G2L USBPHY control driver"
+	depends on ARCH_R9A07G044 || COMPILE_TEST
+	help
+	  Support for USBPHY Control found on RZ/G2L family. It mainly
+	  controls reset and power down of the USB/PHY.
+
 config RESET_SCMI
 	tristate "Reset driver controlled via ARM SCMI interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 65a118a91b27..e4a53224f432 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
 obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
+obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_STM32MP157) += reset-stm32mp1.o
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
new file mode 100644
index 000000000000..4e6f2513e792
--- /dev/null
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L USBPHY control driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/reset-controller.h>
+
+#define RESET			0x000
+
+#define SEL_PLLRESET		BIT(12)
+#define PLL_RESET		BIT(8)
+
+#define PHY_RESET_PORT2		(BIT(1) | BIT(5))
+#define PHY_RESET_PORT1		(BIT(0) | BIT(4))
+
+#define NUM_PORTS		2
+
+struct rzg2l_usbphy_ctrl_priv {
+	struct reset_controller_dev rcdev;
+	struct reset_control *rstc;
+	struct device *dev;
+	void __iomem *base;
+};
+
+#define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
+
+static void rzg2l_usbphy_ctrl_set_reset(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	void __iomem *base = priv->base;
+	u32 val = readl(base + RESET);
+
+	val |= id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
+	if ((val & 0xff) == (PHY_RESET_PORT1 | PHY_RESET_PORT2))
+		val |= PLL_RESET;
+	writel(val, base + RESET);
+}
+
+static void rzg2l_usbphy_ctrl_release_reset(struct reset_controller_dev *rcdev,
+					    unsigned long id)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	void __iomem *base = priv->base;
+	u32 val = readl(base + RESET);
+
+	val |= SEL_PLLRESET;
+	val &= ~(PLL_RESET | (id ? PHY_RESET_PORT2 : PHY_RESET_PORT1));
+	writel(val, base + RESET);
+}
+
+static int rzg2l_usbphy_ctrl_reset(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	rzg2l_usbphy_ctrl_set_reset(rcdev, id);
+	rzg2l_usbphy_ctrl_release_reset(rcdev, id);
+	return 0;
+}
+
+static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	rzg2l_usbphy_ctrl_set_reset(rcdev, id);
+	return 0;
+}
+
+static int rzg2l_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	rzg2l_usbphy_ctrl_release_reset(rcdev, id);
+	return 0;
+}
+
+static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	u32 port_mask;
+
+	port_mask = id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
+
+	return !!(readl(priv->base + RESET) & port_mask);
+}
+
+static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
+
+static const struct reset_control_ops rzg2l_usbphy_ctrl_reset_ops = {
+	.reset = rzg2l_usbphy_ctrl_reset,
+	.assert = rzg2l_usbphy_ctrl_assert,
+	.deassert = rzg2l_usbphy_ctrl_deassert,
+	.status = rzg2l_usbphy_ctrl_status,
+};
+
+static int rzg2l_usbphy_ctrl_xlate(struct reset_controller_dev *rcdev,
+				   const struct of_phandle_args *reset_spec)
+{
+	unsigned int id = reset_spec->args[0];
+
+	if (id >= NUM_PORTS) {
+		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
+		return -EINVAL;
+	}
+
+	return id;
+}
+
+static int rzg2l_usbphy_ctrl_register(struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
+	priv->rcdev.of_node = priv->dev->of_node;
+	priv->rcdev.dev = priv->dev;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.of_xlate = rzg2l_usbphy_ctrl_xlate;
+
+	return devm_reset_controller_register(priv->dev, &priv->rcdev);
+}
+
+static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzg2l_usbphy_ctrl_priv *priv;
+	int error;
+	u32 val;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->dev = dev;
+	error = rzg2l_usbphy_ctrl_register(priv);
+	if (error)
+		return error;
+
+	dev_set_drvdata(dev, priv);
+
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc)) {
+		dev_err(&pdev->dev, "failed to get reset\n");
+		return PTR_ERR(priv->rstc);
+	}
+
+	reset_control_deassert(priv->rstc);
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
+
+	/* put pll and phy into reset state */
+	val = readl(priv->base + RESET);
+	val |= SEL_PLLRESET | PLL_RESET | PHY_RESET_PORT2 | PHY_RESET_PORT1;
+	writel(val, priv->base + RESET);
+
+	return 0;
+}
+
+static int rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(priv->rstc);
+
+	return 0;
+}
+
+static struct platform_driver rzg2l_usbphy_ctrl_driver = {
+	.driver = {
+		.name		= "rzg2l_usbphy_ctrl",
+		.of_match_table	= rzg2l_usbphy_ctrl_match_table,
+	},
+	.probe	=  rzg2l_usbphy_ctrl_probe,
+	.remove	=  rzg2l_usbphy_ctrl_remove,
+};
+module_platform_driver(rzg2l_usbphy_ctrl_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas RZ/G2L USBPHY Control");
+MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
-- 
2.17.1

