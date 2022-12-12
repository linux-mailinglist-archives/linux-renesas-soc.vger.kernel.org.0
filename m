Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C44564A5C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbiLLR2c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbiLLR20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:26 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9A56FD16;
        Mon, 12 Dec 2022 09:28:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="145905873"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:22 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E037406F1D2;
        Tue, 13 Dec 2022 02:28:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 03/16] usb: gadget: Add support for RZ/V2M USB3DRD driver
Date:   Mon, 12 Dec 2022 17:27:51 +0000
Message-Id: <20221212172804.1277751-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/V2M USB3.1 Gen1 Interface (USB) composed of a USB3.1 Gen1 Dual Role
Device controller (USB3DRD), a USB3.1 Gen1 Host controller (USB3HOST), a
USB3.1 Gen1 Peripheral controller (USB3PERI).

The reset for both host and peri are located in USB3DRD block. The
USB3DRD registers are mapped in the AXI address space of the Peripheral
module.

Add USB3DRD driver to handle reset for both host and peri modules.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/gadget/udc/Kconfig            |   6 +
 drivers/usb/gadget/udc/Makefile           |   1 +
 drivers/usb/gadget/udc/rzv2m_usb3drd.c    | 151 ++++++++++++++++++++++
 include/linux/soc/renesas/rzv2m_usb3drd.h |  19 +++
 4 files changed, 177 insertions(+)
 create mode 100644 drivers/usb/gadget/udc/rzv2m_usb3drd.c
 create mode 100644 include/linux/soc/renesas/rzv2m_usb3drd.h

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 5756acb07b8d..578a3f209ef6 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -191,6 +191,12 @@ config USB_RENESAS_USBHS_UDC
 	   dynamically linked module called "renesas_usbhs" and force all
 	   gadget drivers to also be dynamically linked.
 
+config USB_RZV2M_USB3DRD
+	depends on ARCH_R9A09G011 || COMPILE_TEST
+	bool
+	default y if USB_XHCI_RZV2M
+	default y if USB_RENESAS_USB3
+
 config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 12f9e4c9eb0c..13c2a5422c30 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_USB_TEGRA_XUDC)	+= tegra-xudc.o
 obj-$(CONFIG_USB_M66592)	+= m66592-udc.o
 obj-$(CONFIG_USB_R8A66597)	+= r8a66597-udc.o
 obj-$(CONFIG_USB_RENESAS_USB3)	+= renesas_usb3.o
+obj-$(CONFIG_USB_RZV2M_USB3DRD)	+= rzv2m_usb3drd.o
 obj-$(CONFIG_USB_FSL_QE)	+= fsl_qe_udc.o
 obj-$(CONFIG_USB_S3C_HSUDC)	+= s3c-hsudc.o
 obj-$(CONFIG_USB_LPC32XX)	+= lpc32xx_udc.o
diff --git a/drivers/usb/gadget/udc/rzv2m_usb3drd.c b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
new file mode 100644
index 000000000000..1c9176dff1cb
--- /dev/null
+++ b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2M USB3DRD driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#define USB_PERI_DRD_CON	0x400
+
+#define USB_PERI_DRD_CON_PERI_RST	BIT(31)
+#define USB_PERI_DRD_CON_HOST_RST	BIT(30)
+#define USB_PERI_DRD_CON_PERI_CON	BIT(24)
+
+struct rzv2m_usb3drd {
+	void __iomem *reg;
+	struct device *dev;
+	struct reset_control *drd_rstc;
+	struct reset_control *usbp_rstc;
+};
+
+static void rzv2m_usb3drd_set_bit(struct rzv2m_usb3drd *usb3, u32 bits,
+				  u32 offs)
+{
+	u32 val = readl(usb3->reg + offs);
+
+	val |= bits;
+	writel(val, usb3->reg + offs);
+}
+
+static void rzv2m_usb3drd_clear_bit(struct rzv2m_usb3drd *usb3, u32 bits,
+				    u32 offs)
+{
+	u32 val = readl(usb3->reg + offs);
+
+	val &= ~bits;
+	writel(val, usb3->reg + offs);
+}
+
+void rzv2m_usb3drd_reset(struct device *dev, bool host)
+{
+	struct rzv2m_usb3drd *usb3 = dev_get_drvdata(dev);
+
+	if (host) {
+		rzv2m_usb3drd_clear_bit(usb3, USB_PERI_DRD_CON_PERI_CON,
+					USB_PERI_DRD_CON);
+		rzv2m_usb3drd_clear_bit(usb3, USB_PERI_DRD_CON_HOST_RST,
+					USB_PERI_DRD_CON);
+		rzv2m_usb3drd_set_bit(usb3, USB_PERI_DRD_CON_PERI_RST,
+				      USB_PERI_DRD_CON);
+	} else {
+		rzv2m_usb3drd_set_bit(usb3, USB_PERI_DRD_CON_PERI_CON,
+				      USB_PERI_DRD_CON);
+		rzv2m_usb3drd_set_bit(usb3, USB_PERI_DRD_CON_HOST_RST,
+				      USB_PERI_DRD_CON);
+		rzv2m_usb3drd_clear_bit(usb3, USB_PERI_DRD_CON_PERI_RST,
+					USB_PERI_DRD_CON);
+	}
+}
+EXPORT_SYMBOL_GPL(rzv2m_usb3drd_reset);
+
+static int rzv2m_usb3drd_remove(struct platform_device *pdev)
+{
+	struct rzv2m_usb3drd *usb3 = platform_get_drvdata(pdev);
+
+	of_platform_depopulate(usb3->dev);
+	pm_runtime_put(usb3->dev);
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(usb3->usbp_rstc);
+	reset_control_assert(usb3->drd_rstc);
+
+	return 0;
+}
+
+static int rzv2m_usb3drd_probe(struct platform_device *pdev)
+{
+	struct rzv2m_usb3drd *usb3;
+	int ret;
+
+	usb3 = devm_kzalloc(&pdev->dev, sizeof(*usb3), GFP_KERNEL);
+	if (!usb3)
+		return -ENOMEM;
+
+	usb3->dev = &pdev->dev;
+
+	usb3->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(usb3->reg))
+		return PTR_ERR(usb3->reg);
+
+	platform_set_drvdata(pdev, usb3);
+
+	usb3->drd_rstc = devm_reset_control_get_exclusive(&pdev->dev,
+							  "drd_reset");
+	if (IS_ERR(usb3->drd_rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(usb3->drd_rstc),
+				     "failed to get drd reset");
+
+	usb3->usbp_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
+								 "aresetn_p");
+	if (IS_ERR(usb3->usbp_rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(usb3->usbp_rstc),
+				     "failed to get peri reset");
+
+	reset_control_deassert(usb3->drd_rstc);
+	reset_control_deassert(usb3->usbp_rstc);
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(usb3->dev);
+	if (ret)
+		goto err_rst;
+
+	ret = of_platform_populate(usb3->dev->of_node, NULL, NULL, usb3->dev);
+	if (ret)
+		goto err_pm;
+
+	return 0;
+
+err_pm:
+	pm_runtime_put(usb3->dev);
+
+err_rst:
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(usb3->usbp_rstc);
+	reset_control_assert(usb3->drd_rstc);
+	return ret;
+}
+
+static const struct of_device_id rzv2m_usb3drd_of_match[] = {
+	{ .compatible = "renesas,rzv2m-usb3drd", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzv2m_usb3drd_of_match);
+
+static struct platform_driver rzv2m_usb3drd_driver = {
+	.driver = {
+		.name = "rzv2m-usb3drd",
+		.of_match_table = of_match_ptr(rzv2m_usb3drd_of_match),
+	},
+	.probe = rzv2m_usb3drd_probe,
+	.remove = rzv2m_usb3drd_remove,
+};
+module_platform_driver(rzv2m_usb3drd_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/V2M USB3DRD driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:rzv2m_usb3drd");
diff --git a/include/linux/soc/renesas/rzv2m_usb3drd.h b/include/linux/soc/renesas/rzv2m_usb3drd.h
new file mode 100644
index 000000000000..87114c81a98e
--- /dev/null
+++ b/include/linux/soc/renesas/rzv2m_usb3drd.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __RZV2M_USB3DRD_H
+#define __RZV2M_USB3DRD_H
+
+#include <linux/types.h>
+
+struct rzv2m_usb3drd {
+	void __iomem *reg;
+	struct device *dev;
+	struct reset_control *rstc;
+};
+
+#if IS_ENABLED(CONFIG_USB_RZV2M_USB3DRD)
+void rzv2m_usb3drd_reset(struct device *dev, bool host);
+#else
+static inline void rzv2m_usb3drd_reset(struct device *dev, bool host) { }
+#endif
+
+#endif /* __RZV2M_USB3DRD_H */
-- 
2.25.1

