Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 132B0522EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbfFYFjg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12131 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728352AbfFYFjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:35 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393826"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7F6CE400856C;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 03/13] usb: renesas_usbhs: move macros from mod.c to the mod.h
Date:   Tue, 25 Jun 2019 14:38:47 +0900
Message-Id: <1561441137-3090-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In the future, since other source code of this driver will use these
macros, this patch moves it to the header file.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod.c | 9 ---------
 drivers/usb/renesas_usbhs/mod.h | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 540472a..984bb2f 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -11,15 +11,6 @@
 #include "common.h"
 #include "mod.h"
 
-#define usbhs_priv_to_modinfo(priv) (&priv->mod_info)
-#define usbhs_mod_info_call(priv, func, param...)	\
-({						\
-	struct usbhs_mod_info *info;		\
-	info = usbhs_priv_to_modinfo(priv);	\
-	!info->func ? 0 :			\
-	 info->func(param);			\
-})
-
 /*
  *		autonomy
  *
diff --git a/drivers/usb/renesas_usbhs/mod.h b/drivers/usb/renesas_usbhs/mod.h
index 7117729..6678e81 100644
--- a/drivers/usb/renesas_usbhs/mod.h
+++ b/drivers/usb/renesas_usbhs/mod.h
@@ -129,6 +129,15 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod);
 		 mod->func(param);			\
 	})
 
+#define usbhs_priv_to_modinfo(priv) (&priv->mod_info)
+#define usbhs_mod_info_call(priv, func, param...)	\
+({							\
+	struct usbhs_mod_info *info;			\
+	info = usbhs_priv_to_modinfo(priv);		\
+	!info->func ? 0 :				\
+	 info->func(param);				\
+})
+
 /*
  * host / gadget control
  */
-- 
2.7.4

