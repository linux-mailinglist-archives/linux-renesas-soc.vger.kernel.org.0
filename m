Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1D23AE633
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFUJmM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:12 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230292AbhFUJmM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:12 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="84924651"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2021 18:39:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 70B48400C4E6;
        Mon, 21 Jun 2021 18:39:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-phy@lists.infradead.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 03/11] phy: renesas: Add RZ/G2L usb phy control driver
Date:   Mon, 21 Jun 2021 10:39:35 +0100
Message-Id: <20210621093943.12143-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for RZ/G2L USB PHY Control driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Incorporated vinod's review comments.
---
 drivers/phy/renesas/Kconfig                |   7 +
 drivers/phy/renesas/Makefile               |   1 +
 drivers/phy/renesas/phy-rzg2l-usbphyctrl.c | 157 +++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/phy/renesas/phy-rzg2l-usbphyctrl.c

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index 111bdcae775c..2184fba12255 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -32,3 +32,10 @@ config PHY_RCAR_GEN3_USB3
 	select GENERIC_PHY
 	help
 	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
+
+config PHY_RZG2L_USBPHYCTRL
+	tristate "Renesas RZ/G2L USB PHY control driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Support for USB PHY Control found on RZ/G2L SoCs.
diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
index b599ff8a4349..62acc6bde5cb 100644
--- a/drivers/phy/renesas/Makefile
+++ b/drivers/phy/renesas/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o
+obj-$(CONFIG_PHY_RZG2L_USBPHYCTRL)	+= phy-rzg2l-usbphyctrl.o
diff --git a/drivers/phy/renesas/phy-rzg2l-usbphyctrl.c b/drivers/phy/renesas/phy-rzg2l-usbphyctrl.c
new file mode 100644
index 000000000000..f0e5555b99fe
--- /dev/null
+++ b/drivers/phy/renesas/phy-rzg2l-usbphyctrl.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L USB PHY control driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
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
+struct rzg2l_usbphycontrol_drv;
+
+struct rzg2l_phyctrl {
+	struct phy *phy;
+	struct rzg2l_usbphycontrol_drv *drv;
+	u32 phy_reset_port_mask;
+};
+
+struct rzg2l_usbphycontrol_drv {
+	void __iomem *base;
+	struct rzg2l_phyctrl phyctrl[NUM_PORTS];
+};
+
+static int rzg2l_usbphyctrl_init(struct phy *p)
+{
+	struct rzg2l_phyctrl *r = phy_get_drvdata(p);
+	struct rzg2l_usbphycontrol_drv *drv = r->drv;
+	void __iomem *base = drv->base;
+	u32 val = readl(base + RESET);
+
+	val |= SEL_PLLRESET;
+	val &= ~(PLL_RESET | r->phy_reset_port_mask);
+	writel(val, base + RESET);
+
+	return 0;
+}
+
+static int rzg2l_usbphyctrl_exit(struct phy *p)
+{
+	struct rzg2l_phyctrl *r = phy_get_drvdata(p);
+	struct rzg2l_usbphycontrol_drv *drv = r->drv;
+	void __iomem *base = drv->base;
+	u32 val = readl(base + RESET);
+
+	val |= r->phy_reset_port_mask;
+	if ((val & 0xFF) == (PHY_RESET_PORT1 | PHY_RESET_PORT2))
+		val |= PLL_RESET;
+	writel(val, base + RESET);
+	return 0;
+}
+
+static const struct phy_ops rzg2l_usbphyctrl_ops = {
+	.init		= rzg2l_usbphyctrl_init,
+	.exit		= rzg2l_usbphyctrl_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id rzg2l_usbphyctrl_match_table[] = {
+	{ .compatible = "renesas,rzg2l-usbphyctrl" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg2l_usbphyctrl_match_table);
+
+static struct phy *rzg2l_usbphycontrol_xlate(struct device *dev,
+					     struct of_phandle_args *args)
+{
+	struct rzg2l_usbphycontrol_drv *drv;
+	struct rzg2l_phyctrl *r;
+
+	drv = dev_get_drvdata(dev);
+	if (!drv)
+		return ERR_PTR(-EINVAL);
+
+	if (args->args[0] >= NUM_PORTS)
+		return ERR_PTR(-ENODEV);
+
+	r = &drv->phyctrl[args->args[0]];
+
+	return r->phy;
+}
+
+static int rzg2l_usbphycontrol_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzg2l_usbphycontrol_drv *drv;
+	struct phy_provider *provider;
+	u32 val;
+	int n;
+
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	drv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drv->base))
+		return PTR_ERR(drv->base);
+
+	for (n = 0; n < NUM_PORTS; n++) {
+		struct rzg2l_phyctrl *phy = &drv->phyctrl[n];
+
+		phy->phy = devm_phy_create(dev, NULL, &rzg2l_usbphyctrl_ops);
+		if (IS_ERR(phy->phy)) {
+			dev_err(dev, "Failed to create USBPHY Control\n");
+			return PTR_ERR(phy->phy);
+		}
+
+		if (n == 0)
+			phy->phy_reset_port_mask = PHY_RESET_PORT1;
+		else
+			phy->phy_reset_port_mask = PHY_RESET_PORT2;
+
+		phy->drv = drv;
+		phy_set_drvdata(phy->phy, phy);
+	};
+
+	provider = devm_of_phy_provider_register(dev, rzg2l_usbphycontrol_xlate);
+	if (IS_ERR(provider)) {
+		dev_err(dev, "Failed to register PHY provider\n");
+		return PTR_ERR(provider);
+	}
+
+	dev_set_drvdata(dev, drv);
+
+	/* put pll and phy into reset state */
+	val = readl(drv->base + RESET);
+	val |= SEL_PLLRESET | PLL_RESET | PHY_RESET_PORT2 | PHY_RESET_PORT1;
+	writel(val, drv->base + RESET);
+
+	return 0;
+}
+
+static struct platform_driver rzg2l_usbphyctrl_driver = {
+	.driver = {
+		.name		= "rzg2l_usbphyctrl",
+		.of_match_table	= rzg2l_usbphyctrl_match_table,
+	},
+	.probe	= rzg2l_usbphycontrol_probe,
+};
+module_platform_driver(rzg2l_usbphyctrl_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas RZ/G2L USBPHYControl");
+MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
-- 
2.17.1

