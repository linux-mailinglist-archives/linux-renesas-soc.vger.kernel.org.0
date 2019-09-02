Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AE0A5579
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 14:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbfIBMD3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 08:03:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58665 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731339AbfIBMD3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 08:03:29 -0400
X-IronPort-AV: E=Sophos;i="5.64,459,1559487600"; 
   d="scan'208";a="25317518"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Sep 2019 21:03:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BA95D4001DB1;
        Mon,  2 Sep 2019 21:03:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/3] usb: host: xhci-rcar: Use xhci_plat_priv.quirks instead of code settings
Date:   Mon,  2 Sep 2019 21:01:38 +0900
Message-Id: <1567425698-27560-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567425698-27560-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1567425698-27560-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch uses xhci_plat_priv.quirks to simplify. The previous
code had conditions to set some quirks in xhci_rcar_init_quirk().
But, the xhci_rcar_init_quirk() is called at the same conditions.
So, no behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-rcar.c | 28 ----------------------------
 drivers/usb/host/xhci-rcar.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 8616c52..34761be 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -107,15 +107,6 @@ static int xhci_rcar_is_gen2(struct device *dev)
 		of_device_is_compatible(node, "renensas,rcar-gen2-xhci");
 }
 
-static int xhci_rcar_is_gen3(struct device *dev)
-{
-	struct device_node *node = dev->of_node;
-
-	return of_device_is_compatible(node, "renesas,xhci-r8a7795") ||
-		of_device_is_compatible(node, "renesas,xhci-r8a7796") ||
-		of_device_is_compatible(node, "renesas,rcar-gen3-xhci");
-}
-
 void xhci_rcar_start(struct usb_hcd *hcd)
 {
 	u32 temp;
@@ -226,32 +217,13 @@ static bool xhci_rcar_wait_for_pll_active(struct usb_hcd *hcd)
 /* This function needs to initialize a "phy" of usb before */
 int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 {
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-
 	/* If hcd->regs is NULL, we don't just call the following function */
 	if (!hcd->regs)
 		return 0;
 
-	/*
-	 * On R-Car Gen2 and Gen3, the AC64 bit (bit 0) of HCCPARAMS1 is set
-	 * to 1. However, these SoCs don't support 64-bit address memory
-	 * pointers. So, this driver clears the AC64 bit of xhci->hcc_params
-	 * to call dma_set_coherent_mask(dev, DMA_BIT_MASK(32)) in
-	 * xhci_gen_setup().
-	 *
-	 * And, since the firmware/internal CPU control the USBSTS.STS_HALT
-	 * and the process speed is down when the roothub port enters U3,
-	 * long delay for the handshake of STS_HALT is neeed in xhci_suspend().
-	 */
-	if (xhci_rcar_is_gen2(hcd->self.controller) ||
-			xhci_rcar_is_gen3(hcd->self.controller)) {
-		xhci->quirks |= XHCI_NO_64BIT_SUPPORT | XHCI_SLOW_SUSPEND;
-	}
-
 	if (!xhci_rcar_wait_for_pll_active(hcd))
 		return -ETIMEDOUT;
 
-	xhci->quirks |= XHCI_TRUST_TX_LENGTH;
 	return xhci_rcar_download_firmware(hcd);
 }
 
diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index 1f8c225..012744a 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -32,8 +32,22 @@ static inline int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 }
 #endif
 
+/*
+ * On R-Car Gen2 and Gen3, the AC64 bit (bit 0) of HCCPARAMS1 is set
+ * to 1. However, these SoCs don't support 64-bit address memory
+ * pointers. So, this driver clears the AC64 bit of xhci->hcc_params
+ * to call dma_set_coherent_mask(dev, DMA_BIT_MASK(32)) in
+ * xhci_gen_setup() by using the XHCI_NO_64BIT_SUPPORT quirk.
+ *
+ * And, since the firmware/internal CPU control the USBSTS.STS_HALT
+ * and the process speed is down when the roothub port enters U3,
+ * long delay for the handshake of STS_HALT is neeed in xhci_suspend()
+ * by using the XHCI_SLOW_SUSPEND quirk.
+ */
 #define SET_XHCI_PLAT_PRIV_FOR_RCAR(firmware)				\
 	.firmware_name = firmware,					\
+	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |	\
+		  XHCI_SLOW_SUSPEND,					\
 	.init_quirk = xhci_rcar_init_quirk,				\
 	.plat_start = xhci_rcar_start,					\
 	.resume_quirk = xhci_rcar_resume_quirk,
-- 
2.7.4

