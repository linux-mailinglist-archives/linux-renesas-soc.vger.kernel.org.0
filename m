Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A1E9E544
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 12:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbfH0KDw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 06:03:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11411 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725805AbfH0KDw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 06:03:52 -0400
X-IronPort-AV: E=Sophos;i="5.64,436,1559487600"; 
   d="scan'208";a="25044207"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2019 19:03:48 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D5D740083ED;
        Tue, 27 Aug 2019 19:03:48 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] usb: host: xhci-rcar: avoid 60s wait by request_firmware() in system booting
Date:   Tue, 27 Aug 2019 19:02:07 +0900
Message-Id: <1566900127-11148-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y and CONFIG_USB_XHCI_RCAR=y,
request_firmware() in xhci_rcar_download_firmware() waits for 60s to
sysfs fallback for the firmware like below.

[    1.599701] xhci-hcd ee000000.usb: xHCI Host Controller
[    1.604948] xhci-hcd ee000000.usb: new USB bus registered, assigned bus number 3
[    1.612403] xhci-hcd ee000000.usb: Direct firmware load for r8a779x_usb3_v3.dlmem failed with error -2
[    1.621726] xhci-hcd ee000000.usb: Falling back to sysfs fallback for: r8a779x_usb3_v3.dlmem
[    1.707953] ata1: link resume succeeded after 1 retries
[    1.819379] ata1: SATA link down (SStatus 0 SControl 300)
[   62.436012] xhci-hcd ee000000.usb: can't setup: -11
[   62.440901] xhci-hcd ee000000.usb: USB bus 3 deregistered
[   62.446361] xhci-hcd: probe of ee000000.usb failed with error -11

To avoid this 60s wait, this patch adds to check the system_state
condition and if the system is not running,
xhci_rcar_download_firmware() calls request_firmware_direct()
instead of request_firmware() as a workaround.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-rcar.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 34761be..c90cf46 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
@@ -146,7 +147,10 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 		firmware_name = priv->firmware_name;
 
 	/* request R-Car USB3.0 firmware */
-	retval = request_firmware(&fw, firmware_name, dev);
+	if (system_state < SYSTEM_RUNNING)
+		retval = request_firmware_direct(&fw, firmware_name, dev);
+	else
+		retval = request_firmware(&fw, firmware_name, dev);
 	if (retval)
 		return retval;
 
-- 
2.7.4

