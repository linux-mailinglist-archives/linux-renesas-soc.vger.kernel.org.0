Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5543AFD93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 15:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbfIKNSN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 09:18:13 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43215 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIKNSN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 09:18:13 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id EF1A53C04C0;
        Wed, 11 Sep 2019 15:18:09 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1KGUIPF6xynS; Wed, 11 Sep 2019 15:18:03 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id E50A73C04C1;
        Wed, 11 Sep 2019 15:18:00 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 11 Sep
 2019 15:18:00 +0200
From:   Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <external.veeraiyan.c@de.adit-jv.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: [PATCH v5 3/3] usb: renesas_usbhs: add suspend event support in gadget mode
Date:   Wed, 11 Sep 2019 15:15:56 +0200
Message-ID: <1568207756-22325-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
References: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>

When R-Car Gen3 USB 2.0 is in Gadget mode, if host is detached an interrupt
will be generated and Suspended state bit is set in interrupt status
register. Interrupt handler will call driver->suspend(composite_suspend)
if suspended state bit is set. composite_suspend will call
ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
by user space application via /dev/ep0.

To be able to detect host detach, extend the DVSQ_MASK to cover the
Suspended bit of the DVSQ[2:0] bitfield from the Interrupt Status
Register 0 (INTSTS0) register and perform appropriate action in the
DVST interrupt handler (usbhsg_irq_dev_state).

Without this commit, disconnection of the phone from R-Car-H3 ES2.0
Salvator-X CN9 port is not recognized and reverse role switch does
not happen. If phone is connected again it does not enumerate.

With this commit, disconnection will be recognized and reverse role
switch will happen by a user space application. If phone is connected
again it will enumerate properly and will become visible in the output
of 'lsusb'.

Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
v5: No change
v4: https://patchwork.kernel.org/patch/11138205/
v3: https://patchwork.kernel.org/patch/11137701/ 
v2: https://patchwork.kernel.org/patch/11135115/
v1: https://patchwork.kernel.org/patch/11135115/
 drivers/usb/renesas_usbhs/common.h     |  3 ++-
 drivers/usb/renesas_usbhs/mod_gadget.c | 12 +++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 3777af848a35..142319c7585d 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -159,11 +159,12 @@ struct usbhs_priv;
 #define VBSTS	(1 << 7)	/* VBUS_0 and VBUSIN_0 Input Status */
 #define VALID	(1 << 3)	/* USB Request Receive */
 
-#define DVSQ_MASK		(0x3 << 4)	/* Device State */
+#define DVSQ_MASK		(0x7 << 4)	/* Device State */
 #define  POWER_STATE		(0 << 4)
 #define  DEFAULT_STATE		(1 << 4)
 #define  ADDRESS_STATE		(2 << 4)
 #define  CONFIGURATION_STATE	(3 << 4)
+#define  SUSPENDED_STATE	(4 << 4)
 
 #define CTSQ_MASK		(0x7)	/* Control Transfer Stage */
 #define  IDLE_SETUP_STAGE	0	/* Idle stage or setup stage */
diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 34ee9ebe12a3..d8972ab3c2f9 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -456,12 +456,18 @@ static int usbhsg_irq_dev_state(struct usbhs_priv *priv,
 {
 	struct usbhsg_gpriv *gpriv = usbhsg_priv_to_gpriv(priv);
 	struct device *dev = usbhsg_gpriv_to_dev(gpriv);
+	int state = usbhs_status_get_device_state(irq_state);
 
 	gpriv->gadget.speed = usbhs_bus_get_speed(priv);
 
-	dev_dbg(dev, "state = %x : speed : %d\n",
-		usbhs_status_get_device_state(irq_state),
-		gpriv->gadget.speed);
+	dev_dbg(dev, "state = %x : speed : %d\n", state, gpriv->gadget.speed);
+
+	if (gpriv->gadget.speed != USB_SPEED_UNKNOWN &&
+	    (state & SUSPENDED_STATE)) {
+		if (gpriv->driver && gpriv->driver->suspend)
+			gpriv->driver->suspend(&gpriv->gadget);
+		usb_gadget_set_state(&gpriv->gadget, USB_STATE_SUSPENDED);
+	}
 
 	return 0;
 }
-- 
2.7.4

