Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D9B522FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbfFYFjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53837 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728377AbfFYFjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:39 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607565"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E12434007F41;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 11/13] usb: renesas_usbhs: Add a common function for the .get_id
Date:   Tue, 25 Jun 2019 14:38:55 +0900
Message-Id: <1561441137-3090-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All platform related codes (rcar[23].c and rza{2}.c) has its own
.get_id function as "USBHS_GADGET". So, we can use a common
function for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c |  5 +++++
 drivers/usb/renesas_usbhs/common.h |  2 ++
 drivers/usb/renesas_usbhs/rcar2.c  |  8 ++------
 drivers/usb/renesas_usbhs/rcar3.c  | 11 +++--------
 drivers/usb/renesas_usbhs/rza.c    |  9 ++-------
 drivers/usb/renesas_usbhs/rza2.c   |  7 +------
 6 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index dc5e80d..656f976 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -84,6 +84,11 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev)
 	return dev_get_drvdata(&pdev->dev);
 }
 
+int usbhs_get_id_as_gadget(struct platform_device *pdev)
+{
+	return USBHS_GADGET;
+}
+
 /*
  *		syscfg functions
  */
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index b2b21fb..65e9abc 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -297,6 +297,8 @@ void usbhs_bset(struct usbhs_priv *priv, u32 reg, u16 mask, u16 data);
 #define usbhs_lock(p, f) spin_lock_irqsave(usbhs_priv_to_lock(p), f)
 #define usbhs_unlock(p, f) spin_unlock_irqrestore(usbhs_priv_to_lock(p), f)
 
+int usbhs_get_id_as_gadget(struct platform_device *pdev);
+
 /*
  * sysconfig
  */
diff --git a/drivers/usb/renesas_usbhs/rcar2.c b/drivers/usb/renesas_usbhs/rcar2.c
index 0027092..741bd81 100644
--- a/drivers/usb/renesas_usbhs/rcar2.c
+++ b/drivers/usb/renesas_usbhs/rcar2.c
@@ -3,6 +3,7 @@
  * Renesas USB driver R-Car Gen. 2 initialization and power control
  *
  * Copyright (C) 2014 Ulrich Hecht
+ * Copyright (C) 2019 Renesas Electronics Corporation
  */
 
 #include <linux/gpio.h>
@@ -62,14 +63,9 @@ static int usbhs_rcar2_power_ctrl(struct platform_device *pdev,
 	return retval;
 }
 
-static int usbhs_rcar2_get_id(struct platform_device *pdev)
-{
-	return USBHS_GADGET;
-}
-
 const struct renesas_usbhs_platform_callback usbhs_rcar2_ops = {
 	.hardware_init = usbhs_rcar2_hardware_init,
 	.hardware_exit = usbhs_rcar2_hardware_exit,
 	.power_ctrl = usbhs_rcar2_power_ctrl,
-	.get_id = usbhs_rcar2_get_id,
+	.get_id = usbhs_get_id_as_gadget,
 };
diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 5e730e9..8dbbd14 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -2,7 +2,7 @@
 /*
  * Renesas USB driver R-Car Gen. 3 initialization and power control
  *
- * Copyright (C) 2016 Renesas Electronics Corporation
+ * Copyright (C) 2016-2019 Renesas Electronics Corporation
  */
 
 #include <linux/delay.h>
@@ -95,17 +95,12 @@ static int usbhs_rcar3_power_and_pll_ctrl(struct platform_device *pdev,
 	return 0;
 }
 
-static int usbhs_rcar3_get_id(struct platform_device *pdev)
-{
-	return USBHS_GADGET;
-}
-
 const struct renesas_usbhs_platform_callback usbhs_rcar3_ops = {
 	.power_ctrl = usbhs_rcar3_power_ctrl,
-	.get_id = usbhs_rcar3_get_id,
+	.get_id = usbhs_get_id_as_gadget,
 };
 
 const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops = {
 	.power_ctrl = usbhs_rcar3_power_and_pll_ctrl,
-	.get_id = usbhs_rcar3_get_id,
+	.get_id = usbhs_get_id_as_gadget,
 };
diff --git a/drivers/usb/renesas_usbhs/rza.c b/drivers/usb/renesas_usbhs/rza.c
index 8c739bd..64ce584 100644
--- a/drivers/usb/renesas_usbhs/rza.c
+++ b/drivers/usb/renesas_usbhs/rza.c
@@ -3,7 +3,7 @@
  * Renesas USB driver RZ/A initialization and power control
  *
  * Copyright (C) 2018 Chris Brandt
- * Copyright (C) 2018 Renesas Electronics Corporation
+ * Copyright (C) 2018-2019 Renesas Electronics Corporation
  */
 
 #include <linux/delay.h>
@@ -41,12 +41,7 @@ static int usbhs_rza1_hardware_init(struct platform_device *pdev)
 	return 0;
 }
 
-static int usbhs_rza_get_id(struct platform_device *pdev)
-{
-	return USBHS_GADGET;
-}
-
 const struct renesas_usbhs_platform_callback usbhs_rza1_ops = {
 	.hardware_init = usbhs_rza1_hardware_init,
-	.get_id = usbhs_rza_get_id,
+	.get_id = usbhs_get_id_as_gadget,
 };
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index 9d8551f..6e32768 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -59,14 +59,9 @@ static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
 	return retval;
 }
 
-static int usbhs_rza2_get_id(struct platform_device *pdev)
-{
-	return USBHS_GADGET;
-}
-
 const struct renesas_usbhs_platform_callback usbhs_rza2_ops = {
 	.hardware_init = usbhs_rza2_hardware_init,
 	.hardware_exit = usbhs_rza2_hardware_exit,
 	.power_ctrl = usbhs_rza2_power_ctrl,
-	.get_id = usbhs_rza2_get_id,
+	.get_id = usbhs_get_id_as_gadget,
 };
-- 
2.7.4

