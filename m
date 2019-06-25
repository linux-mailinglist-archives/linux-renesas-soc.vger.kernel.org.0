Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85567522F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbfFYFjh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:37 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59344 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728311AbfFYFjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:37 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607555"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8B80F4007F41;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 04/13] usb: renesas_usbhs: Avoid to write platform_data's value
Date:   Tue, 25 Jun 2019 14:38:48 +0900
Message-Id: <1561441137-3090-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The very old commit 482982062f1b ("usb: gadget: renesas_usbhs:
bugfix: don't modify platform data") changed to use copied whole
structures values to fix the "hung-up" issue. However, we also
can fix the issue if the driver copies the get_vbus function
pointer to the driver's value.

So, this patch adds get_vbus member into struct usbhs_mod_info and
use the pointer instead of struct renesas_usbhs_platform_callback.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c     |  4 +++-
 drivers/usb/renesas_usbhs/mod.c        | 11 +++++++++--
 drivers/usb/renesas_usbhs/mod.h        |  7 +++++++
 drivers/usb/renesas_usbhs/mod_gadget.c |  4 ++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index f6b136a..739fe4b 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -448,7 +448,7 @@ static void usbhsc_hotplug(struct usbhs_priv *priv)
 	/*
 	 * get vbus status from platform
 	 */
-	enable = usbhs_platform_call(priv, get_vbus, pdev);
+	enable = usbhs_mod_info_call(priv, get_vbus, pdev);
 
 	/*
 	 * get id from platform
@@ -809,6 +809,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
 		usbhsc_power_ctrl(priv, 1);
 		usbhs_mod_autonomy_mode(priv);
+	} else {
+		usbhs_mod_non_autonomy_mode(priv);
 	}
 
 	/*
diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 984bb2f..ddf0153 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -42,12 +42,19 @@ void usbhs_mod_autonomy_mode(struct usbhs_priv *priv)
 {
 	struct usbhs_mod_info *info = usbhs_priv_to_modinfo(priv);
 
-	info->irq_vbus		= usbhsm_autonomy_irq_vbus;
-	priv->pfunc.get_vbus	= usbhsm_autonomy_get_vbus;
+	info->irq_vbus = usbhsm_autonomy_irq_vbus;
+	info->get_vbus = usbhsm_autonomy_get_vbus;
 
 	usbhs_irq_callback_update(priv, NULL);
 }
 
+void usbhs_mod_non_autonomy_mode(struct usbhs_priv *priv)
+{
+	struct usbhs_mod_info *info = usbhs_priv_to_modinfo(priv);
+
+	info->get_vbus = priv->pfunc.get_vbus;
+}
+
 /*
  *		host / gadget functions
  *
diff --git a/drivers/usb/renesas_usbhs/mod.h b/drivers/usb/renesas_usbhs/mod.h
index 6678e81..65dc19c 100644
--- a/drivers/usb/renesas_usbhs/mod.h
+++ b/drivers/usb/renesas_usbhs/mod.h
@@ -93,6 +93,12 @@ struct usbhs_mod_info {
 	 */
 	int (*irq_vbus)(struct usbhs_priv *priv,
 			struct usbhs_irq_state *irq_state);
+
+	/*
+	 * This function will be used on any gadget mode. To simplify the code,
+	 * this member is in here.
+	 */
+	int (*get_vbus)(struct platform_device *pdev);
 };
 
 /*
@@ -107,6 +113,7 @@ int usbhs_mod_probe(struct usbhs_priv *priv);
 void usbhs_mod_remove(struct usbhs_priv *priv);
 
 void usbhs_mod_autonomy_mode(struct usbhs_priv *priv);
+void usbhs_mod_non_autonomy_mode(struct usbhs_priv *priv);
 
 /*
  *		status functions
diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 0c1e8fa..4d571a5 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -915,8 +915,8 @@ static void usbhs_mod_phy_mode(struct usbhs_priv *priv)
 {
 	struct usbhs_mod_info *info = &priv->mod_info;
 
-	info->irq_vbus		= NULL;
-	priv->pfunc.get_vbus	= usbhsm_phy_get_vbus;
+	info->irq_vbus = NULL;
+	info->get_vbus = usbhsm_phy_get_vbus;
 
 	usbhs_irq_callback_update(priv, NULL);
 }
-- 
2.7.4

