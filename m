Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E703F52302
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfFYFjp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53837 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728359AbfFYFjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:37 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607552"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7340F4007F41;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 02/13] usb: renesas_usbhs: remove notify_hotplug callback
Date:   Tue, 25 Jun 2019 14:38:46 +0900
Message-Id: <1561441137-3090-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The notify_hotplug callback was supported in v3.10, but the last user
(armadillo800eva) was removed by the commit 1fa59bda21c7 ("ARM: shmobile:
Remove legacy board code for Armadillo-800 EVA"). So, this patch
removes it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c     | 16 ++++------------
 drivers/usb/renesas_usbhs/common.h     |  2 ++
 drivers/usb/renesas_usbhs/mod.c        |  3 ++-
 drivers/usb/renesas_usbhs/mod_gadget.c |  3 ++-
 include/linux/usb/renesas_usbhs.h      | 26 +-------------------------
 5 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index ebbe322..f6b136a 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -3,6 +3,7 @@
  * Renesas USB driver
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 #include <linux/clk.h>
@@ -513,7 +514,7 @@ static void usbhsc_notify_hotplug(struct work_struct *work)
 	usbhsc_hotplug(priv);
 }
 
-static int usbhsc_drvcllbck_notify_hotplug(struct platform_device *pdev)
+int usbhsc_schedule_notify_hotplug(struct platform_device *pdev)
 {
 	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
 	int delay = usbhs_get_dparam(priv, detection_delay);
@@ -667,7 +668,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 static int usbhs_probe(struct platform_device *pdev)
 {
 	struct renesas_usbhs_platform_info *info = renesas_usbhs_get_info(pdev);
-	struct renesas_usbhs_driver_callback *dfunc;
 	struct usbhs_priv *priv;
 	struct resource *res, *irq_res;
 	int ret;
@@ -721,10 +721,6 @@ static int usbhs_probe(struct platform_device *pdev)
 	}
 	priv->pfunc = info->platform_callback;
 
-	/* set driver callback functions for platform */
-	dfunc			= &info->driver_callback;
-	dfunc->notify_hotplug	= usbhsc_drvcllbck_notify_hotplug;
-
 	/* set default param if platform doesn't have */
 	if (!priv->dparam.pipe_configs) {
 		priv->dparam.pipe_configs = usbhsc_default_pipe;
@@ -818,7 +814,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	/*
 	 * manual call notify_hotplug for cold plug
 	 */
-	usbhsc_drvcllbck_notify_hotplug(pdev);
+	usbhsc_schedule_notify_hotplug(pdev);
 
 	dev_info(&pdev->dev, "probed\n");
 
@@ -843,13 +839,9 @@ static int usbhs_probe(struct platform_device *pdev)
 static int usbhs_remove(struct platform_device *pdev)
 {
 	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
-	struct renesas_usbhs_platform_info *info = renesas_usbhs_get_info(pdev);
-	struct renesas_usbhs_driver_callback *dfunc = &info->driver_callback;
 
 	dev_dbg(&pdev->dev, "usb remove\n");
 
-	dfunc->notify_hotplug = NULL;
-
 	/* power off */
 	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
@@ -894,7 +886,7 @@ static __maybe_unused int usbhsc_resume(struct device *dev)
 
 	usbhs_platform_call(priv, phy_reset, pdev);
 
-	usbhsc_drvcllbck_notify_hotplug(pdev);
+	usbhsc_schedule_notify_hotplug(pdev);
 
 	return 0;
 }
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index de74ebd1..b2b21fb 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -3,6 +3,7 @@
  * Renesas USB driver
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 #ifndef RENESAS_USB_DRIVER_H
@@ -317,6 +318,7 @@ void usbhs_bus_send_sof_enable(struct usbhs_priv *priv);
 void usbhs_bus_send_reset(struct usbhs_priv *priv);
 int usbhs_bus_get_speed(struct usbhs_priv *priv);
 int usbhs_vbus_ctrl(struct usbhs_priv *priv, int enable);
+int usbhsc_schedule_notify_hotplug(struct platform_device *pdev);
 
 /*
  * frame
diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 7475c4f..540472a 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -3,6 +3,7 @@
  * Renesas USB driver
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 #include <linux/interrupt.h>
@@ -41,7 +42,7 @@ static int usbhsm_autonomy_irq_vbus(struct usbhs_priv *priv,
 {
 	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
 
-	renesas_usbhs_call_notify_hotplug(pdev);
+	usbhsc_schedule_notify_hotplug(pdev);
 
 	return 0;
 }
diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 59cac40..0c1e8fa 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -3,6 +3,7 @@
  * Renesas USB driver
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 #include <linux/delay.h>
@@ -1023,7 +1024,7 @@ static int usbhsg_vbus_session(struct usb_gadget *gadget, int is_active)
 
 	gpriv->vbus_active = !!is_active;
 
-	renesas_usbhs_call_notify_hotplug(pdev);
+	usbhsc_schedule_notify_hotplug(pdev);
 
 	return 0;
 }
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index b2cba7c..ac601be 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -3,6 +3,7 @@
  * Renesas USB
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  *
  * This program is distributed in the hope that it will be useful,
@@ -33,17 +34,6 @@ enum {
 };
 
 /*
- * callback functions table for driver
- *
- * These functions are called from platform for driver.
- * Callback function's pointer will be set before
- * renesas_usbhs_platform_callback :: hardware_init was called
- */
-struct renesas_usbhs_driver_callback {
-	int (*notify_hotplug)(struct platform_device *pdev);
-};
-
-/*
  * callback functions for platform
  *
  * These functions are called from driver for platform
@@ -214,12 +204,6 @@ struct renesas_usbhs_platform_info {
 	struct renesas_usbhs_platform_callback	platform_callback;
 
 	/*
-	 * driver set these callback functions pointer.
-	 * platform can use it on callback functions
-	 */
-	struct renesas_usbhs_driver_callback	driver_callback;
-
-	/*
 	 * option:
 	 *
 	 * driver use these param for some register
@@ -232,12 +216,4 @@ struct renesas_usbhs_platform_info {
  */
 #define renesas_usbhs_get_info(pdev)\
 	((struct renesas_usbhs_platform_info *)(pdev)->dev.platform_data)
-
-#define renesas_usbhs_call_notify_hotplug(pdev)				\
-	({								\
-		struct renesas_usbhs_driver_callback *dc;		\
-		dc = &(renesas_usbhs_get_info(pdev)->driver_callback);	\
-		if (dc && dc->notify_hotplug)				\
-			dc->notify_hotplug(pdev);			\
-	})
 #endif /* RENESAS_USB_H */
-- 
2.7.4

