Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05DC3CD497
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 14:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236967AbhGSLjP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 07:39:15 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59972 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236957AbhGSLjM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 07:39:12 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88077927"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2021 21:19:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 68F0D40061A1;
        Mon, 19 Jul 2021 21:19:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control driver
Date:   Mon, 19 Jul 2021 13:19:32 +0100
Message-Id: <20210719121938.6532-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for RZ/G2L USBPHY Control driver. It mainly controls
reset and power down of the USB/PHY.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 * Incorporated the changes suggested by Philipp
 * removed *dev pointer, replaced the magic number 0xff
 * started using of_reset_simple_xlate
 * Added spinlock for read-modify-writes
 v3:
  * New driver. As per Rob's suggestion, Modelled IP as a reset driver,
    since it mainly controls reset and power down of the PHY.
---
 drivers/reset/Kconfig                   |   7 +
 drivers/reset/Makefile                  |   1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 175 ++++++++++++++++++++++++
 3 files changed, 183 insertions(+)
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 328f70f633eb..ed65ea66987b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -181,6 +181,13 @@ config RESET_RASPBERRYPI
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
index ea8b8d9ca565..21d46d8869ff 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
 obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
+obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
new file mode 100644
index 000000000000..e0704fd2b533
--- /dev/null
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L USBPHY control driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation
+ */
+
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
+#define RESET_SEL_PLLRESET	BIT(12)
+#define RESET_PLLRESET		BIT(8)
+
+#define RESET_SEL_P2RESET	BIT(5)
+#define RESET_SEL_P1RESET	BIT(4)
+#define RESET_PHYRST_2		BIT(1)
+#define RESET_PHYRST_1		BIT(0)
+
+#define PHY_RESET_PORT2		(RESET_SEL_P2RESET | RESET_PHYRST_2)
+#define PHY_RESET_PORT1		(RESET_SEL_P1RESET | RESET_PHYRST_1)
+
+#define NUM_PORTS		2
+
+struct rzg2l_usbphy_ctrl_priv {
+	struct reset_controller_dev rcdev;
+	struct reset_control *rstc;
+	void __iomem *base;
+
+	spinlock_t lock;
+};
+
+#define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
+
+static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	u32 port_mask = PHY_RESET_PORT1 | PHY_RESET_PORT2;
+	void __iomem *base = priv->base;
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(base + RESET);
+	val |= id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
+	if (port_mask == (val & port_mask))
+		val |= RESET_PLLRESET;
+	writel(val, base + RESET);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int rzg2l_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	void __iomem *base = priv->base;
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(base + RESET);
+
+	val |= RESET_SEL_PLLRESET;
+	val &= ~(RESET_PLLRESET | (id ? PHY_RESET_PORT2 : PHY_RESET_PORT1));
+	writel(val, base + RESET);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
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
+	.assert = rzg2l_usbphy_ctrl_assert,
+	.deassert = rzg2l_usbphy_ctrl_deassert,
+	.status = rzg2l_usbphy_ctrl_status,
+};
+
+static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzg2l_usbphy_ctrl_priv *priv;
+	unsigned long flags;
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
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(dev, PTR_ERR(priv->rstc),
+				     "failed to get reset\n");
+
+	reset_control_deassert(priv->rstc);
+
+	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.nr_resets = NUM_PORTS;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.dev = dev;
+
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return error;
+
+	spin_lock_init(&priv->lock);
+	dev_set_drvdata(dev, priv);
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
+
+	/* put pll and phy into reset state */
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + RESET);
+	val |= RESET_SEL_PLLRESET | RESET_PLLRESET | PHY_RESET_PORT2 | PHY_RESET_PORT1;
+	writel(val, priv->base + RESET);
+	spin_unlock_irqrestore(&priv->lock, flags);
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
+	.probe	= rzg2l_usbphy_ctrl_probe,
+	.remove	= rzg2l_usbphy_ctrl_remove,
+};
+module_platform_driver(rzg2l_usbphy_ctrl_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas RZ/G2L USBPHY Control");
+MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
-- 
2.17.1

