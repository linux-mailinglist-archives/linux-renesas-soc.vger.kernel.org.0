Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3537522F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfFYFjj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:39 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59344 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728400AbfFYFjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:39 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607568"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:33 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05D15400856C;
        Tue, 25 Jun 2019 14:39:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 13/13] usb: renesas_usbhs: Use struct platform_callback pointer
Date:   Tue, 25 Jun 2019 14:38:57 +0900
Message-Id: <1561441137-3090-14-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now the driver fixes the issue of the commit 482982062f1b ("usb:
gadget: renesas_usbhs: bugfix: don't modify platform data") by
using usbhs_mod_info.get_vbus, this patches uses the pointer
instead of copied value to avoid redundancy. Note that struct
renesas_usbhs_driver_param has to use copied value because
the driver has to set some members (e.g. buswait_bwait).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 8 ++++----
 drivers/usb/renesas_usbhs/common.h | 2 +-
 drivers/usb/renesas_usbhs/mod.c    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index fe7dc91..4c3de77 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -53,8 +53,8 @@
  */
 #define usbhs_platform_call(priv, func, args...)\
 	(!(priv) ? -ENODEV :			\
-	 !((priv)->pfunc.func) ? 0 :		\
-	 (priv)->pfunc.func(args))
+	 !((priv)->pfunc->func) ? 0 :		\
+	 (priv)->pfunc->func(args))
 
 /*
  *		common functions
@@ -644,7 +644,7 @@ static int usbhs_probe(struct platform_device *pdev)
 		dev_err(dev, "no platform callbacks\n");
 		return -EINVAL;
 	}
-	priv->pfunc = info->platform_callback;
+	priv->pfunc = &info->platform_callback;
 
 	/* set default param if platform doesn't have */
 	if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
@@ -665,7 +665,7 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	/* FIXME */
 	/* runtime power control ? */
-	if (priv->pfunc.get_vbus)
+	if (priv->pfunc->get_vbus)
 		usbhs_get_dparam(priv, runtime_pwctrl) = 1;
 
 	/*
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index f6ffdb2..d1a0a35 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -252,7 +252,7 @@ struct usbhs_priv {
 	unsigned int irq;
 	unsigned long irqflags;
 
-	struct renesas_usbhs_platform_callback	pfunc;
+	const struct renesas_usbhs_platform_callback *pfunc;
 	struct renesas_usbhs_driver_param	dparam;
 
 	struct delayed_work notify_hotplug_work;
diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index ddf0153..10fc655 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -52,7 +52,7 @@ void usbhs_mod_non_autonomy_mode(struct usbhs_priv *priv)
 {
 	struct usbhs_mod_info *info = usbhs_priv_to_modinfo(priv);
 
-	info->get_vbus = priv->pfunc.get_vbus;
+	info->get_vbus = priv->pfunc->get_vbus;
 }
 
 /*
-- 
2.7.4

