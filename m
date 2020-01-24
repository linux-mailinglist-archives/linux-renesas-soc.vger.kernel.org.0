Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240DD1489AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 15:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387724AbgAXOgZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 09:36:25 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56339 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387834AbgAXOgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 09:36:24 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4003E3C00C5;
        Fri, 24 Jan 2020 15:36:22 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ukhDIUqbeiym; Fri, 24 Jan 2020 15:36:16 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id F284C3C009E;
        Fri, 24 Jan 2020 15:36:15 +0100 (CET)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 24 Jan
 2020 15:36:15 +0100
From:   Hardik Gajjar <hgajjar@de.adit-jv.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <thinhn@synopsys.com>, <Kento.A.Kobayashi@sony.com>,
        <atmgnd@outlook.com>
CC:     <andrew_gabbasov@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] USB: hub: Fix the broken detection of USB3 device in SMSC hub
Date:   Fri, 24 Jan 2020 15:36:13 +0100
Message-ID: <1579876573-13741-1-git-send-email-hgajjar@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.77]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch disables the auto-suspend feature for SMSC USB hub.
Renesas-RCAR3-H3-KF board was not able to detect the USB3.0 devices.
The XHCI driver was going to sleep and not wake up again on connection
of the USB3.0 device. According to Renesas, This is because of some
hardware issue.

Renesas-RCAR3-H3-KF has USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
configurable hub controller.

Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
---
 drivers/usb/core/hub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 939dd73a..ffc7abf 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -36,7 +36,9 @@
 #include "otg_whitelist.h"
 
 #define USB_VENDOR_GENESYS_LOGIC		0x05e3
+#define USB_VENDOR_SMSC    			0x0424
 #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
+#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
 
 #define USB_VENDOR_UNWIRED			0x2996
 #define USB_VENDOR_DELPHI			0x2C48
@@ -1822,6 +1824,9 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (id->driver_info & HUB_QUIRK_NO_LOGICAL_DISCONNECT)
 		hub->quirk_no_logical_disconnect = 1;
 
+	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
+		pm_runtime_set_autosuspend_delay(&hdev->dev, -1);
+
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
 		return 0;
 
@@ -5313,6 +5318,10 @@ static void hub_event(struct work_struct *work)
 }
 
 static const struct usb_device_id hub_id_table[] = {
+    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_CLASS,
+      .idVendor = USB_VENDOR_SMSC,
+      .bInterfaceClass = USB_CLASS_HUB,
+      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_INT_CLASS,
       .idVendor = USB_VENDOR_GENESYS_LOGIC,
-- 
2.7.4

