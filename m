Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64EF368259E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 08:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjAaHij (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 02:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjAaHii (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 02:38:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB67E360BC;
        Mon, 30 Jan 2023 23:38:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6256E61414;
        Tue, 31 Jan 2023 07:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E020C4339C;
        Tue, 31 Jan 2023 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675150715;
        bh=WQ5tv7V/TTgt22zWz2ZUQ5+fACmUXJj6ft2QIW3HbWU=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=E35l4/De1ONw4AAI4BFZdUGoZvTqsGAOMNvdccfqhetwZLOS4R5Q93wHwFQItZLwT
         sXoF1IXTTcupCPlYvD9Y6iY0J5cJajYfRmPGNzLwsAld3n5+3aMQ5XxgPKIUswmuMR
         OrqSF2079uSfBBzBJAuKHaujIKtBse7t+KgmSM63uW+nXGyNq5kvF3LkEJ0P4WG2XW
         G4a3zAnzL6qbxV//PmWYwPrjonE2JBTKbLEcX7pmUgLHqQoauLPPgfw3vxC6H0NlCz
         GBV/3lSUzHB/YbijxAiTPdMsokYmyS++mc82fLM2Rf+H6MaER+F+PgV6Tiecy5TazD
         UyWsec7Inva9A==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id 4186F27C0054;
        Tue, 31 Jan 2023 02:38:34 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 31 Jan 2023 02:38:34 -0500
X-ME-Sender: <xms:ecXYY25uzZf9Wyj3UXcJHTqIG68Ro5NlLekdm41YTRmNFVl8eq-xmg>
    <xme:ecXYY_70DK0HsrV-6IsXYalMdRann3_FDKrKSSkAYnITmjzVqTWNIp02x7oe12pwN
    xwcIhdJhPcjzcaTUq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeffedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
    udegtdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
    tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
    druggv
X-ME-Proxy: <xmx:ecXYY1fcKGi6wk8ItL-CYj3BrZAjWTRuH8BK5nD8J3--K5lfznJfnQ>
    <xmx:ecXYYzJnc-aw0JF-aEUj28aFkbcC6LCoFlb4VcdZnkHKP_XY4F3E4Q>
    <xmx:ecXYY6KgNYgyfMHCjJ08RlKHrOPlWE29igmOCyMYhGzLb8VWq0h5_g>
    <xmx:esXYYy9LSxujkDinxD7m9rBfV0SSDYoB9eaC5TlUG9FhobDqr2uPzg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 06B83B6044F; Tue, 31 Jan 2023 02:38:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-106-gfe3ab13a96-fm-20230124.001-gfe3ab13a
Mime-Version: 1.0
Message-Id: <10f7154e-abe3-4f24-a693-2997b391147a@app.fastmail.com>
In-Reply-To: <7973405f-3d17-4556-af45-792c8edbc391@app.fastmail.com>
References: <202301301054.KVvGA5XO-lkp@intel.com>
 <OS0PR01MB59220EFDE43A39D61FC73E2786D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7973405f-3d17-4556-af45-792c8edbc391@app.fastmail.com>
Date:   Tue, 31 Jan 2023 08:38:14 +0100
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Biju Das" <biju.das.jz@bp.renesas.com>,
        "kernel test robot" <lkp@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc:     "Paul Gazzillo" <paul@pgazz.com>,
        "Necip Fazil Yildiran" <fazilyildiran@gmail.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies detected
 for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 30, 2023, at 20:25, Arnd Bergmann wrote:
> On Mon, Jan 30, 2023, at 19:54, Biju Das wrote:
>> Hi all,
>>
>>> Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
>>> detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
>>> 
>> Just for testing, I have reverted Arnd's patch[1] and then done the 
>> below changes 
>> which is fixing unmet dependencies reported by the bot.
>>
>> Looks like USB_RZV2M_USB3DRD should depend upon both USB and 
>> USB_GADGET. Previously
>> It depends only on USB_GADGET.
>>
>> Also the USB3DRD driver should be in "driver/usb/renesas_usb3drd" 
>> directory instead
>> of "driver/usb/gadget/udc" as both HOST and device ctrlr need this 
>> driver.
>>
> I found yet another regression, and I don't think any of the above
> fully address this. Let me try to come up with a better fix that
> also addresses this one:

I've experimented with this a little more and got to a version that
survived a few hundred randconfig kernel builds overnight and
converts the driver to a much more regular hierarchy.

Can you try the patch below to make sure this still works on
your chip?

      Arnd  

8<---
From 6d42357a59a832acea9530eb8531e9ff908eeca4 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 Jan 2023 12:15:13 +0100
Subject: [PATCH] usb: xhci: split out rcar support from xhci-plat.c

The USB_XHCI_RZV2M and USB_RENESAS_USB3 select other drivers
based on the enabled SoC types, which leads to build failures
when the dependencies are not met:

WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
  Depends on [n]: USB_SUPPORT [=y] && USB_GADGET [=n] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
  Selected by [m]:
  - USB_XHCI_RZV2M [=m] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=m] && USB_XHCI_PLATFORM [=m] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
ERROR: modpost: "rzv2m_usb3drd_reset" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

The xhci-rcar driver has a reverse dependency with the xhci core, and it
depends on the UDC driver in turn. To untangle this, make the xhci-rcar.ko
driver a standalone module that just calls into the xhci-plat.ko module
like other drivers do.

This allows handling the dependency on the USB_RZV2M_USB3DRD driver to
only affect the xhci-rcar module and simplify the xhci-plat module.

It also allows leaving out the hacks for broken dma mask and nested
devices from the rcar side and keep that only in the generic xhci driver.

Fixes: c52c9acc415e ("xhci: host: Add Renesas RZ/V2M SoC support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 9b7a1681550f..20b477b2a080 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -182,8 +182,6 @@ config USB_RENESAS_USBHS_UDC
 config USB_RZV2M_USB3DRD
 	tristate 'Renesas USB3.1 DRD controller'
 	depends on ARCH_R9A09G011 || COMPILE_TEST
-	default USB_XHCI_RZV2M
-	default USB_RENESAS_USB3
 	help
 	   Renesas USB3.1 DRD controller is a USB DRD controller
 	   that supports both host and device switching.
@@ -194,8 +192,8 @@ config USB_RZV2M_USB3DRD
 config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on USB_RZV2M_USB3DRD || !USB_RZV2M_USB3DRD
 	depends on EXTCON
-	select USB_RZV2M_USB3DRD if ARCH_R9A09G011
 	select USB_ROLE_SWITCH
 	help
 	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4b5c5b1feb40..c0b98d789553 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -53,8 +53,6 @@ config USB_XHCI_PCI_RENESAS
 
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
-	select USB_XHCI_RCAR if ARCH_RENESAS
-	select USB_XHCI_RZV2M if ARCH_R9A09G011
 	help
 	  Adds an xHCI host driver for a generic platform device, which
 	  provides a memory space and an irq.
@@ -97,10 +95,10 @@ config USB_XHCI_RCAR
 	  found in Renesas R-Car ARM SoCs.
 
 config USB_XHCI_RZV2M
-	tristate "xHCI support for Renesas RZ/V2M SoC"
-	depends on USB_XHCI_PLATFORM
+	bool "xHCI support for Renesas RZ/V2M SoC"
+	depends on USB_XHCI_RCAR
 	depends on ARCH_R9A09G011 || COMPILE_TEST
-	select USB_RZV2M_USB3DRD
+	depends on USB_RZV2M_USB3DRD=y || (USB_RZV2M_USB3DRD=USB_XHCI_RCAR)
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Renesas RZ/V2M SoC.
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 6b1f9317f116..00ba09378fc2 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -25,17 +25,15 @@ xhci-plat-hcd-y := xhci-plat.o
 ifneq ($(CONFIG_USB_XHCI_MVEBU), )
 	xhci-plat-hcd-y		+= xhci-mvebu.o
 endif
-ifneq ($(CONFIG_USB_XHCI_RCAR), )
-	xhci-plat-hcd-y		+= xhci-rcar.o
-endif
-ifneq ($(CONFIG_USB_XHCI_RZV2M), )
-	xhci-plat-hcd-y		+= xhci-rzv2m.o
-endif
-
 ifneq ($(CONFIG_DEBUG_FS),)
 	xhci-hcd-y		+= xhci-debugfs.o
 endif
 
+obj-$(CONFIG_USB_XHCI_RCAR)		+= xhci-rcar-hcd.o
+xhci-rcar-hcd-y				+= xhci-rcar.o
+xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)	+= xhci-rzv2m.o
+
+
 obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 57269f1f318e..cd17ccab6e00 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -24,8 +24,6 @@
 #include "xhci.h"
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
-#include "xhci-rcar.h"
-#include "xhci-rzv2m.h"
 
 static struct hc_driver __read_mostly xhci_plat_hc_driver;
 
@@ -116,21 +114,6 @@ static const struct xhci_plat_priv xhci_plat_marvell_armada3700 = {
 	.init_quirk = xhci_mvebu_a3700_init_quirk,
 };
 
-static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
-	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V1)
-};
-
-static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
-	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
-};
-
-static const struct xhci_plat_priv xhci_plat_renesas_rzv2m = {
-	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |
-		  XHCI_SLOW_SUSPEND,
-	.init_quirk = xhci_rzv2m_init_quirk,
-	.plat_start = xhci_rzv2m_start,
-};
-
 static const struct xhci_plat_priv xhci_plat_brcm = {
 	.quirks = XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS,
 };
@@ -149,30 +132,6 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	}, {
 		.compatible = "marvell,armada3700-xhci",
 		.data = &xhci_plat_marvell_armada3700,
-	}, {
-		.compatible = "renesas,xhci-r8a7790",
-		.data = &xhci_plat_renesas_rcar_gen2,
-	}, {
-		.compatible = "renesas,xhci-r8a7791",
-		.data = &xhci_plat_renesas_rcar_gen2,
-	}, {
-		.compatible = "renesas,xhci-r8a7793",
-		.data = &xhci_plat_renesas_rcar_gen2,
-	}, {
-		.compatible = "renesas,xhci-r8a7795",
-		.data = &xhci_plat_renesas_rcar_gen3,
-	}, {
-		.compatible = "renesas,xhci-r8a7796",
-		.data = &xhci_plat_renesas_rcar_gen3,
-	}, {
-		.compatible = "renesas,rcar-gen2-xhci",
-		.data = &xhci_plat_renesas_rcar_gen2,
-	}, {
-		.compatible = "renesas,rcar-gen3-xhci",
-		.data = &xhci_plat_renesas_rcar_gen3,
-	}, {
-		.compatible = "renesas,rzv2m-xhci",
-		.data = &xhci_plat_renesas_rzv2m,
 	}, {
 		.compatible = "brcm,xhci-brcm-v2",
 		.data = &xhci_plat_brcm,
@@ -185,11 +144,10 @@ static const struct of_device_id usb_xhci_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
 #endif
 
-static int xhci_plat_probe(struct platform_device *pdev)
+int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const struct xhci_plat_priv *priv_match)
 {
-	const struct xhci_plat_priv *priv_match;
 	const struct hc_driver	*driver;
-	struct device		*sysdev, *tmpdev;
+	struct device		*tmpdev;
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
 	struct usb_hcd		*hcd, *usb3_hcd;
@@ -207,31 +165,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	/*
-	 * sysdev must point to a device that is known to the system firmware
-	 * or PCI hardware. We handle these three cases here:
-	 * 1. xhci_plat comes from firmware
-	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
-	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
-	 */
-	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
-		if (is_of_node(sysdev->fwnode) ||
-			is_acpi_device_node(sysdev->fwnode))
-			break;
-#ifdef CONFIG_PCI
-		else if (sysdev->bus == &pci_bus_type)
-			break;
-#endif
-	}
-
 	if (!sysdev)
 		sysdev = &pdev->dev;
 
-	if (WARN_ON(!sysdev->dma_mask))
-		/* Platform did not initialize dma_mask */
-		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
-	else
-		ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
+	ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
 	if (ret)
 		return ret;
 
@@ -293,11 +230,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_reg_clk;
 
-	if (pdev->dev.of_node)
-		priv_match = of_device_get_match_data(&pdev->dev);
-	else
-		priv_match = dev_get_platdata(&pdev->dev);
-
 	if (priv_match) {
 		priv = hcd_to_xhci_priv(hcd);
 		/* Just copy data for now */
@@ -411,8 +343,47 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(xhci_plat_probe);
+
+static int xhci_generic_plat_probe(struct platform_device *pdev)
+{
+	const struct xhci_plat_priv *priv_match;
+	struct device *sysdev;
+	int ret;
+
+	/*
+	 * sysdev must point to a device that is known to the system firmware
+	 * or PCI hardware. We handle these three cases here:
+	 * 1. xhci_plat comes from firmware
+	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
+	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
+	 */
+	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
+		if (is_of_node(sysdev->fwnode) ||
+			is_acpi_device_node(sysdev->fwnode))
+			break;
+#ifdef CONFIG_PCI
+		else if (sysdev->bus == &pci_bus_type)
+			break;
+#endif
+	}
+
+	if (WARN_ON(!sysdev->dma_mask)) {
+		/* Platform did not initialize dma_mask */
+		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
+		if (ret)
+			return ret;
+	}
+
+	if (pdev->dev.of_node)
+		priv_match = of_device_get_match_data(&pdev->dev);
+	else
+		priv_match = dev_get_platdata(&pdev->dev);
+
+	return xhci_plat_probe(pdev, sysdev, priv_match);
+}
 
-static int xhci_plat_remove(struct platform_device *dev)
+int xhci_plat_remove(struct platform_device *dev)
 {
 	struct usb_hcd	*hcd = platform_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -446,6 +417,7 @@ static int xhci_plat_remove(struct platform_device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
 static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
@@ -522,13 +494,14 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 	return xhci_resume(xhci, 0);
 }
 
-static const struct dev_pm_ops xhci_plat_pm_ops = {
+const struct dev_pm_ops xhci_plat_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xhci_plat_suspend, xhci_plat_resume)
 
 	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
 			   xhci_plat_runtime_resume,
 			   NULL)
 };
+EXPORT_SYMBOL_GPL(xhci_plat_pm_ops);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id usb_xhci_acpi_match[] = {
@@ -539,8 +512,8 @@ static const struct acpi_device_id usb_xhci_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
 #endif
 
-static struct platform_driver usb_xhci_driver = {
-	.probe	= xhci_plat_probe,
+static struct platform_driver usb_generic_xhci_driver = {
+	.probe	= xhci_generic_plat_probe,
 	.remove	= xhci_plat_remove,
 	.shutdown = usb_hcd_platform_shutdown,
 	.driver	= {
@@ -555,13 +528,13 @@ MODULE_ALIAS("platform:xhci-hcd");
 static int __init xhci_plat_init(void)
 {
 	xhci_init_driver(&xhci_plat_hc_driver, &xhci_plat_overrides);
-	return platform_driver_register(&usb_xhci_driver);
+	return platform_driver_register(&usb_generic_xhci_driver);
 }
 module_init(xhci_plat_init);
 
 static void __exit xhci_plat_exit(void)
 {
-	platform_driver_unregister(&usb_xhci_driver);
+	platform_driver_unregister(&usb_generic_xhci_driver);
 }
 module_exit(xhci_plat_exit);
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 1fb149d1fbce..83b5b5aa9f8e 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -21,4 +21,11 @@ struct xhci_plat_priv {
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
 #define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
+
+int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev,
+		    const struct xhci_plat_priv *priv_match);
+
+int xhci_plat_remove(struct platform_device *dev);
+extern const struct dev_pm_ops xhci_plat_pm_ops;
+
 #endif	/* _XHCI_PLAT_H */
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index aef0258a7160..f0960966deb9 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -10,12 +10,14 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/usb/phy.h>
 #include <linux/sys_soc.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
 #include "xhci-rcar.h"
+#include "xhci-rzv2m.h"
 
 /*
 * - The V3 firmware is for almost all R-Car Gen3 (except r8a7795 ES1.x)
@@ -225,3 +227,72 @@ int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 
 	return ret;
 }
+
+static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
+	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V1)
+};
+
+static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
+	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
+};
+
+static const struct xhci_plat_priv xhci_plat_renesas_rzv2m = {
+	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |
+		  XHCI_SLOW_SUSPEND,
+	.init_quirk = xhci_rzv2m_init_quirk,
+	.plat_start = xhci_rzv2m_start,
+};
+
+static const struct of_device_id usb_xhci_of_match[] = {
+	{
+		.compatible = "renesas,xhci-r8a7790",
+		.data = &xhci_plat_renesas_rcar_gen2,
+	}, {
+		.compatible = "renesas,xhci-r8a7791",
+		.data = &xhci_plat_renesas_rcar_gen2,
+	}, {
+		.compatible = "renesas,xhci-r8a7793",
+		.data = &xhci_plat_renesas_rcar_gen2,
+	}, {
+		.compatible = "renesas,xhci-r8a7795",
+		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "renesas,xhci-r8a7796",
+		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "renesas,rcar-gen2-xhci",
+		.data = &xhci_plat_renesas_rcar_gen2,
+	}, {
+		.compatible = "renesas,rcar-gen3-xhci",
+		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "renesas,rzv2m-xhci",
+		.data = &xhci_plat_renesas_rzv2m,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
+
+static int xhci_renesas_probe(struct platform_device *pdev)
+{
+	const struct xhci_plat_priv *priv_match;
+
+	priv_match = of_device_get_match_data(&pdev->dev);
+
+	return xhci_plat_probe(pdev, NULL, priv_match);
+}
+
+static struct platform_driver usb_xhci_renesas_driver = {
+	.probe	= xhci_renesas_probe,
+	.remove	= xhci_plat_remove,
+	.shutdown = usb_hcd_platform_shutdown,
+	.driver	= {
+		.name = "xhci-renesas-hcd",
+		.pm = &xhci_plat_pm_ops,
+		.of_match_table = of_match_ptr(usb_xhci_of_match),
+	},
+};
+module_platform_driver(usb_xhci_renesas_driver);
+
+MODULE_DESCRIPTION("xHCI Platform Host Controller Driver for Renesas R-Car and RZ");
+MODULE_LICENSE("GPL");
