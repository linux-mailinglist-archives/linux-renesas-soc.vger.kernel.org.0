Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFFCD151FCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 18:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbgBDRog (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 12:44:36 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:58748 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBDRof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 12:44:35 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D4F283C009E;
        Tue,  4 Feb 2020 18:44:32 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MgyLqzoHKw2k; Tue,  4 Feb 2020 18:44:26 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 8470B3C0034;
        Tue,  4 Feb 2020 18:44:26 +0100 (CET)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 4 Feb 2020
 18:44:26 +0100
From:   Hardik Gajjar <hgajjar@de.adit-jv.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <thinhn@synopsys.com>, <Kento.A.Kobayashi@sony.com>,
        <atmgnd@outlook.com>, <linux-usb@vger.kernel.org>
CC:     <andrew_gabbasov@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>, <hgajjar@de.adit-jv.com>
Subject: [PATCH v3] USB: hub: Fix the broken detection of USB3 device in SMSC hub
Date:   Tue, 4 Feb 2020 18:44:13 +0100
Message-ID: <1580838253-31822-1-git-send-email-hgajjar@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.77]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas R-Car H3ULCB + Kingfisher Infotainment Board is either not able
to detect the USB3.0 mass storage devices or is detecting those as
USB2.0 high speed devices.

The explanation given by Renesas is that, due to a HW issue, the XHCI
driver does not wake up after going to sleep on connecting a USB3.0
device.

In order to mitigate that, disable the auto-suspend feature
specifically for SMSC hubs from hub_probe() function, as a quirk.

Renesas Kingfisher Infotainment Board has two USB3.0 ports (CN2) which
are connected via USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
configurable hub controller.

[1] SanDisk USB 3.0 device detected as USB-2.0 before the patch
 [   74.036390] usb 5-1.1: new high-speed USB device number 4 using xhci-hcd
 [   74.061598] usb 5-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
 [   74.069976] usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
 [   74.077303] usb 5-1.1: Product: Ultra
 [   74.080980] usb 5-1.1: Manufacturer: SanDisk
 [   74.085263] usb 5-1.1: SerialNumber: 4C530001110208116550

[2] SanDisk USB 3.0 device detected as USB-3.0 after the patch
 [   34.565078] usb 6-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
 [   34.588719] usb 6-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
 [   34.597098] usb 6-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
 [   34.604430] usb 6-1.1: Product: Ultra
 [   34.608110] usb 6-1.1: Manufacturer: SanDisk
 [   34.612397] usb 6-1.1: SerialNumber: 4C530001110208116550

Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
---
Changes in v2:
 - [Alan Stern] Switched from pm_runtime_set_autosuspend_delay()
   to usb_autopm_get_interface()
 - Improved commit description
 - Rebased against v5.5
 - https://lore.kernel.org/linux-renesas-soc/1579876573-13741-1-git-send-email-hgajjar@de.adit-jv.com/

Changes in v3:
 - [Alan Stern] Called usb_autopm_put_interface() from
   hub_disconnect() to enable auto suspend for interface.
 - https://lore.kernel.org/linux-renesas-soc/1580403994-21076-1-git-send-email-hgajjar@de.adit-jv.com/

 drivers/usb/core/hub.c | 15 +++++++++++++++
 drivers/usb/core/hub.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3405b14..1c74485 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -38,7 +38,9 @@
 #include "otg_whitelist.h"
 
 #define USB_VENDOR_GENESYS_LOGIC		0x05e3
+#define USB_VENDOR_SMSC				0x0424
 #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
+#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
 
 #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
 #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
@@ -1731,6 +1733,10 @@ static void hub_disconnect(struct usb_interface *intf)
 	kfree(hub->buffer);
 
 	pm_suspend_ignore_children(&intf->dev, false);
+
+	if (hub->quirk_disable_autosuspend)
+		usb_autopm_put_interface(intf);
+
 	kref_put(&hub->kref, hub_release);
 }
 
@@ -1863,6 +1869,11 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
 		hub->quirk_check_port_auto_suspend = 1;
 
+	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
+		hub->quirk_disable_autosuspend = 1;
+		usb_autopm_get_interface(intf);
+	}
+
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
 		return 0;
 
@@ -5599,6 +5610,10 @@ static void hub_event(struct work_struct *work)
 }
 
 static const struct usb_device_id hub_id_table[] = {
+    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_CLASS,
+      .idVendor = USB_VENDOR_SMSC,
+      .bInterfaceClass = USB_CLASS_HUB,
+      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_INT_CLASS,
       .idVendor = USB_VENDOR_GENESYS_LOGIC,
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index a9e24e4..2fe9c9f 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -61,6 +61,7 @@ struct usb_hub {
 	unsigned		quiescing:1;
 	unsigned		disconnected:1;
 	unsigned		in_reset:1;
+	unsigned                quirk_disable_autosuspend:1;
 
 	unsigned		quirk_check_port_auto_suspend:1;
 
-- 
2.7.4

