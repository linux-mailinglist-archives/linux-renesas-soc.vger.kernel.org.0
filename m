Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D2B6766E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjAUO71 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjAUO70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:26 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 47A7D21977;
        Sat, 21 Jan 2023 06:59:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="147051246"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3BAE942BC25E;
        Sat, 21 Jan 2023 23:59:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.de>,
        Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-usb@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 05/12] usb: gadget: Add support for RZ/V2M USB3DRD driver
Date:   Sat, 21 Jan 2023 14:58:46 +0000
Message-Id: <20230121145853.4792-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Changed config option type from bool->tristate
 * Updated default values for the config option
v1->v2:
 * Moved header file from include/linux/soc/renesas->include/linux/usb
 * Passing DRD irq resource to usb3_peri for handling it.
 * As drd_reg is now seperate, updated DRD reg handling in usb3 peri driver.
 * Removed usb3 peri reset from DRD driver.
---
 drivers/usb/gadget/udc/Kconfig         |  13 +++
 drivers/usb/gadget/udc/Makefile        |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c  | 102 +++++++++++-------
 drivers/usb/gadget/udc/rzv2m_usb3drd.c | 139 +++++++++++++++++++++++++
 include/linux/usb/rzv2m_usb3drd.h      |  20 ++++
 5 files changed, 238 insertions(+), 37 deletions(-)
 create mode 100644 drivers/usb/gadget/udc/rzv2m_usb3drd.c
 create mode 100644 include/linux/usb/rzv2m_usb3drd.h

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 9d0b508e37c9..43154d0ebf25 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -179,10 +179,23 @@ config USB_RENESAS_USBHS_UDC
 	   dynamically linked module called "renesas_usbhs" and force all
 	   gadget drivers to also be dynamically linked.
 
+config USB_RZV2M_USB3DRD
+	tristate 'Renesas USB3.1 DRD controller'
+	depends on ARCH_R9A09G011 || COMPILE_TEST
+	default USB_XHCI_RZV2M
+	default USB_RENESAS_USB3
+	help
+	   Renesas USB3.1 DRD controller is a USB DRD controller
+	   that supports both host and device switching.
+
+	   Say "y" to link the driver statically, or "m" to build a
+	   dynamically linked module called "rzv2m_usb3drd".
+
 config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on EXTCON
+	select USB_RZV2M_USB3DRD if ARCH_R9A09G011
 	select USB_ROLE_SWITCH
 	help
 	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index afdd9d0c92ff..ee569f63c74a 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_USB_TEGRA_XUDC)	+= tegra-xudc.o
 obj-$(CONFIG_USB_M66592)	+= m66592-udc.o
 obj-$(CONFIG_USB_R8A66597)	+= r8a66597-udc.o
 obj-$(CONFIG_USB_RENESAS_USB3)	+= renesas_usb3.o
+obj-$(CONFIG_USB_RZV2M_USB3DRD)	+= rzv2m_usb3drd.o
 obj-$(CONFIG_USB_RENESAS_USBF)	+= renesas_usbf.o
 obj-$(CONFIG_USB_FSL_QE)	+= fsl_qe_udc.o
 obj-$(CONFIG_USB_LPC32XX)	+= lpc32xx_udc.o
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 615ba0a6fbee..8d694501bf02 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -27,6 +27,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/of.h>
 #include <linux/usb/role.h>
+#include <linux/usb/rzv2m_usb3drd.h>
 
 /* register definitions */
 #define USB3_AXI_INT_STA	0x008
@@ -334,7 +335,7 @@ struct renesas_usb3_priv {
 
 struct renesas_usb3 {
 	void __iomem *reg;
-	struct reset_control *drd_rstc;
+	void __iomem *drd_reg;
 	struct reset_control *usbp_rstc;
 
 	struct usb_gadget gadget;
@@ -426,6 +427,46 @@ static void usb3_clear_bit(struct renesas_usb3 *usb3, u32 bits, u32 offs)
 	usb3_write(usb3, val, offs);
 }
 
+static void usb3_drd_write(struct renesas_usb3 *usb3, u32 data, u32 offs)
+{
+	void __iomem *reg;
+
+	if (usb3->is_rzv2m)
+		reg = usb3->drd_reg + offs - USB3_DRD_CON(usb3);
+	else
+		reg = usb3->reg + offs;
+
+	iowrite32(data, reg);
+}
+
+static u32 usb3_drd_read(struct renesas_usb3 *usb3, u32 offs)
+{
+	void __iomem *reg;
+
+	if (usb3->is_rzv2m)
+		reg = usb3->drd_reg + offs - USB3_DRD_CON(usb3);
+	else
+		reg = usb3->reg + offs;
+
+	return ioread32(reg);
+}
+
+static void usb3_drd_set_bit(struct renesas_usb3 *usb3, u32 bits, u32 offs)
+{
+	u32 val = usb3_drd_read(usb3, offs);
+
+	val |= bits;
+	usb3_drd_write(usb3, val, offs);
+}
+
+static void usb3_drd_clear_bit(struct renesas_usb3 *usb3, u32 bits, u32 offs)
+{
+	u32 val = usb3_drd_read(usb3, offs);
+
+	val &= ~bits;
+	usb3_drd_write(usb3, val, offs);
+}
+
 static int usb3_wait(struct renesas_usb3 *usb3, u32 reg, u32 mask,
 		     u32 expected)
 {
@@ -474,7 +515,7 @@ static void usb3_disable_pipe_irq(struct renesas_usb3 *usb3, int num)
 
 static bool usb3_is_host(struct renesas_usb3 *usb3)
 {
-	return !(usb3_read(usb3, USB3_DRD_CON(usb3)) & DRD_CON_PERI_CON);
+	return !(usb3_drd_read(usb3, USB3_DRD_CON(usb3)) & DRD_CON_PERI_CON);
 }
 
 static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
@@ -683,18 +724,18 @@ static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 {
 	if (usb3->is_rzv2m) {
 		if (host) {
-			usb3_set_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
-			usb3_clear_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
+			usb3_drd_set_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
+			usb3_drd_clear_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
 		} else {
-			usb3_set_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
-			usb3_clear_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
+			usb3_drd_set_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
+			usb3_drd_clear_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
 		}
 	}
 
 	if (host)
-		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON(usb3));
+		usb3_drd_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON(usb3));
 	else
-		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON(usb3));
+		usb3_drd_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON(usb3));
 }
 
 static void usb3_set_mode_by_role_sw(struct renesas_usb3 *usb3, bool host)
@@ -710,9 +751,9 @@ static void usb3_set_mode_by_role_sw(struct renesas_usb3 *usb3, bool host)
 static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
 {
 	if (enable)
-		usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON(usb3));
+		usb3_drd_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON(usb3));
 	else
-		usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON(usb3));
+		usb3_drd_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON(usb3));
 }
 
 static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
@@ -733,7 +774,7 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
 
 static bool usb3_is_a_device(struct renesas_usb3 *usb3)
 {
-	return !(usb3_read(usb3, USB3_USB_OTG_STA(usb3)) & USB_OTG_IDMON(usb3));
+	return !(usb3_drd_read(usb3, USB3_USB_OTG_STA(usb3)) & USB_OTG_IDMON(usb3));
 }
 
 static void usb3_check_id(struct renesas_usb3 *usb3)
@@ -756,8 +797,8 @@ static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 	usb3_set_bit(usb3, USB_COM_CON_PN_WDATAIF_NL |
 		     USB_COM_CON_PN_RDATAIF_NL | USB_COM_CON_PN_LSTTR_PP,
 		     USB3_USB_COM_CON);
-	usb3_write(usb3, USB_OTG_IDMON(usb3), USB3_USB_OTG_INT_STA(usb3));
-	usb3_write(usb3, USB_OTG_IDMON(usb3), USB3_USB_OTG_INT_ENA(usb3));
+	usb3_drd_write(usb3, USB_OTG_IDMON(usb3), USB3_USB_OTG_INT_STA(usb3));
+	usb3_drd_write(usb3, USB_OTG_IDMON(usb3), USB3_USB_OTG_INT_ENA(usb3));
 
 	usb3_check_id(usb3);
 	usb3_check_vbus(usb3);
@@ -767,7 +808,7 @@ static void renesas_usb3_stop_controller(struct renesas_usb3 *usb3)
 {
 	usb3_disconnect(usb3);
 	usb3_write(usb3, 0, USB3_P0_INT_ENA);
-	usb3_write(usb3, 0, USB3_USB_OTG_INT_ENA(usb3));
+	usb3_drd_write(usb3, 0, USB3_USB_OTG_INT_ENA(usb3));
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_1);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_2);
 	usb3_write(usb3, 0, USB3_AXI_INT_ENA);
@@ -2024,11 +2065,11 @@ static void usb3_irq_idmon_change(struct renesas_usb3 *usb3)
 
 static void usb3_irq_otg_int(struct renesas_usb3 *usb3)
 {
-	u32 otg_int_sta = usb3_read(usb3, USB3_USB_OTG_INT_STA(usb3));
+	u32 otg_int_sta = usb3_drd_read(usb3, USB3_USB_OTG_INT_STA(usb3));
 
-	otg_int_sta &= usb3_read(usb3, USB3_USB_OTG_INT_ENA(usb3));
+	otg_int_sta &= usb3_drd_read(usb3, USB3_USB_OTG_INT_ENA(usb3));
 	if (otg_int_sta)
-		usb3_write(usb3, otg_int_sta, USB3_USB_OTG_INT_STA(usb3));
+		usb3_drd_write(usb3, otg_int_sta, USB3_USB_OTG_INT_STA(usb3));
 
 	if (otg_int_sta & USB_OTG_IDMON(usb3))
 		usb3_irq_idmon_change(usb3);
@@ -2600,7 +2641,6 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 
 	usb_del_gadget_udc(&usb3->gadget);
 	reset_control_assert(usb3->usbp_rstc);
-	reset_control_assert(usb3->drd_rstc);
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
@@ -2788,7 +2828,7 @@ static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
 static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
-	int irq, drd_irq, ret;
+	int irq, ret;
 	const struct renesas_usb3_priv *priv;
 	const struct soc_device_attribute *attr;
 
@@ -2802,12 +2842,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	if (priv->is_rzv2m) {
-		drd_irq = platform_get_irq_byname(pdev, "drd");
-		if (drd_irq < 0)
-			return drd_irq;
-	}
-
 	usb3 = devm_kzalloc(&pdev->dev, sizeof(*usb3), GFP_KERNEL);
 	if (!usb3)
 		return -ENOMEM;
@@ -2836,9 +2870,12 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		return ret;
 
 	if (usb3->is_rzv2m) {
-		ret = devm_request_irq(&pdev->dev, drd_irq,
+		struct rzv2m_usb3drd *ddata = dev_get_drvdata(pdev->dev.parent);
+
+		usb3->drd_reg = ddata->reg;
+		ret = devm_request_irq(ddata->dev, ddata->drd_irq,
 				       renesas_usb3_otg_irq, 0,
-				       dev_name(&pdev->dev), usb3);
+				       dev_name(ddata->dev), usb3);
 		if (ret < 0)
 			return ret;
 	}
@@ -2873,21 +2910,13 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		goto err_add_udc;
 	}
 
-	usb3->drd_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
-								"drd_reset");
-	if (IS_ERR(usb3->drd_rstc)) {
-		ret = PTR_ERR(usb3->drd_rstc);
-		goto err_add_udc;
-	}
-
 	usb3->usbp_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
-								 "aresetn_p");
+								 NULL);
 	if (IS_ERR(usb3->usbp_rstc)) {
 		ret = PTR_ERR(usb3->usbp_rstc);
 		goto err_add_udc;
 	}
 
-	reset_control_deassert(usb3->drd_rstc);
 	reset_control_deassert(usb3->usbp_rstc);
 
 	pm_runtime_enable(&pdev->dev);
@@ -2933,7 +2962,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 
 err_reset:
 	reset_control_assert(usb3->usbp_rstc);
-	reset_control_assert(usb3->drd_rstc);
 
 err_add_udc:
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
diff --git a/drivers/usb/gadget/udc/rzv2m_usb3drd.c b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
new file mode 100644
index 000000000000..3c8bbf843038
--- /dev/null
+++ b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
@@ -0,0 +1,139 @@
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
+#include <linux/usb/rzv2m_usb3drd.h>
+
+#define USB_PERI_DRD_CON	0x000
+
+#define USB_PERI_DRD_CON_PERI_RST	BIT(31)
+#define USB_PERI_DRD_CON_HOST_RST	BIT(30)
+#define USB_PERI_DRD_CON_PERI_CON	BIT(24)
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
+	usb3->drd_irq = platform_get_irq_byname(pdev, "drd");
+	if (usb3->drd_irq < 0)
+		return usb3->drd_irq;
+
+	usb3->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(usb3->reg))
+		return PTR_ERR(usb3->reg);
+
+	platform_set_drvdata(pdev, usb3);
+
+	usb3->drd_rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(usb3->drd_rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(usb3->drd_rstc),
+				     "failed to get drd reset");
+
+	reset_control_deassert(usb3->drd_rstc);
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
diff --git a/include/linux/usb/rzv2m_usb3drd.h b/include/linux/usb/rzv2m_usb3drd.h
new file mode 100644
index 000000000000..4cc848de229f
--- /dev/null
+++ b/include/linux/usb/rzv2m_usb3drd.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __RZV2M_USB3DRD_H
+#define __RZV2M_USB3DRD_H
+
+#include <linux/types.h>
+
+struct rzv2m_usb3drd {
+	void __iomem *reg;
+	int drd_irq;
+	struct device *dev;
+	struct reset_control *drd_rstc;
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

