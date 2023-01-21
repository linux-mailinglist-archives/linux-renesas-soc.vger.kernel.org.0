Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0639C6766F1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjAUO7o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjAUO7o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:44 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A945D21957;
        Sat, 21 Jan 2023 06:59:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="147051272"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E5B9E42BC262;
        Sat, 21 Jan 2023 23:59:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Artur Bujdoso <artur.bujdoso@gmail.com>,
        linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 09/12] xhci: host: Add Renesas RZ/V2M SoC support
Date:   Sat, 21 Jan 2023 14:58:50 +0000
Message-Id: <20230121145853.4792-10-biju.das.jz@bp.renesas.com>
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

RZ/V2M is similar to R-Car XHCI but it doesn't require any
firmware, we need to reset the USB Host reset release in DRD Module
before accessing host registers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated USB_XHCI_PLATFORM to select USB_XHCI_RZV2M if ARCH_R9A09G011
   enabled.
v1->v2:
 * No change
---
 drivers/usb/host/Kconfig      | 10 +++++++++
 drivers/usb/host/Makefile     |  3 +++
 drivers/usb/host/xhci-plat.c  | 11 ++++++++++
 drivers/usb/host/xhci-rzv2m.c | 38 +++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-rzv2m.h | 16 +++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 drivers/usb/host/xhci-rzv2m.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index a97923897c8e..2b80ce9587c1 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -54,6 +54,7 @@ config USB_XHCI_PCI_RENESAS
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
 	select USB_XHCI_RCAR if ARCH_RENESAS
+	select USB_XHCI_RZV2M if ARCH_R9A09G011
 	help
 	  Adds an xHCI host driver for a generic platform device, which
 	  provides a memory space and an irq.
@@ -95,6 +96,15 @@ config USB_XHCI_RCAR
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Renesas R-Car ARM SoCs.
 
+config USB_XHCI_RZV2M
+	tristate "xHCI support for Renesas RZ/V2M SoC"
+	depends on USB_XHCI_PLATFORM
+	depends on ARCH_R9A09G011 || COMPILE_TEST
+	select USB_RZV2M_USB3DRD
+	help
+	  Say 'Y' to enable the support for the xHCI host controller
+	  found in Renesas RZ/V2M SoC.
+
 config USB_XHCI_TEGRA
 	tristate "xHCI support for NVIDIA Tegra SoCs"
 	depends on PHY_TEGRA_XUSB
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 6d8ee264c9b2..6b1f9317f116 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -28,6 +28,9 @@ endif
 ifneq ($(CONFIG_USB_XHCI_RCAR), )
 	xhci-plat-hcd-y		+= xhci-rcar.o
 endif
+ifneq ($(CONFIG_USB_XHCI_RZV2M), )
+	xhci-plat-hcd-y		+= xhci-rzv2m.o
+endif
 
 ifneq ($(CONFIG_DEBUG_FS),)
 	xhci-hcd-y		+= xhci-debugfs.o
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c5fc175a5fd1..57269f1f318e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -25,6 +25,7 @@
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
 #include "xhci-rcar.h"
+#include "xhci-rzv2m.h"
 
 static struct hc_driver __read_mostly xhci_plat_hc_driver;
 
@@ -123,6 +124,13 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
 	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
 };
 
+static const struct xhci_plat_priv xhci_plat_renesas_rzv2m = {
+	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |
+		  XHCI_SLOW_SUSPEND,
+	.init_quirk = xhci_rzv2m_init_quirk,
+	.plat_start = xhci_rzv2m_start,
+};
+
 static const struct xhci_plat_priv xhci_plat_brcm = {
 	.quirks = XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS,
 };
@@ -162,6 +170,9 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	}, {
 		.compatible = "renesas,rcar-gen3-xhci",
 		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "renesas,rzv2m-xhci",
+		.data = &xhci_plat_renesas_rzv2m,
 	}, {
 		.compatible = "brcm,xhci-brcm-v2",
 		.data = &xhci_plat_brcm,
diff --git a/drivers/usb/host/xhci-rzv2m.c b/drivers/usb/host/xhci-rzv2m.c
new file mode 100644
index 000000000000..ec65b24eafa8
--- /dev/null
+++ b/drivers/usb/host/xhci-rzv2m.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * xHCI host controller driver for RZ/V2M
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/usb/rzv2m_usb3drd.h>
+#include "xhci-plat.h"
+#include "xhci-rzv2m.h"
+
+#define RZV2M_USB3_INTEN	0x1044	/* Interrupt Enable */
+
+#define RZV2M_USB3_INT_XHC_ENA	BIT(0)
+#define RZV2M_USB3_INT_HSE_ENA	BIT(2)
+#define RZV2M_USB3_INT_ENA_VAL	(RZV2M_USB3_INT_XHC_ENA \
+				 | RZV2M_USB3_INT_HSE_ENA)
+
+int xhci_rzv2m_init_quirk(struct usb_hcd *hcd)
+{
+	struct device *dev = hcd->self.controller;
+
+	rzv2m_usb3drd_reset(dev->parent, true);
+
+	return 0;
+}
+
+void xhci_rzv2m_start(struct usb_hcd *hcd)
+{
+	u32 int_en;
+
+	if (hcd->regs) {
+		/* Interrupt Enable */
+		int_en = readl(hcd->regs + RZV2M_USB3_INTEN);
+		int_en |= RZV2M_USB3_INT_ENA_VAL;
+		writel(int_en, hcd->regs + RZV2M_USB3_INTEN);
+	}
+}
diff --git a/drivers/usb/host/xhci-rzv2m.h b/drivers/usb/host/xhci-rzv2m.h
new file mode 100644
index 000000000000..12448b0e8d5b
--- /dev/null
+++ b/drivers/usb/host/xhci-rzv2m.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __XHCI_RZV2M_H
+#define __XHCI_RZV2M_H
+
+#if IS_ENABLED(CONFIG_USB_XHCI_RZV2M)
+void xhci_rzv2m_start(struct usb_hcd *hcd);
+int xhci_rzv2m_init_quirk(struct usb_hcd *hcd);
+#else
+static inline void xhci_rzv2m_start(struct usb_hcd *hcd) {}
+static inline int xhci_rzv2m_init_quirk(struct usb_hcd *hcd)
+{
+	return -EINVAL;
+}
+#endif
+
+#endif /* __XHCI_RZV2M_H */
-- 
2.25.1

