Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C1B522EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbfFYFje (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12131 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727064AbfFYFje (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:34 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393823"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6710C400856C;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 01/13] usb: renesas_usbhs: revise the irq_vbus comments
Date:   Tue, 25 Jun 2019 14:38:45 +0900
Message-Id: <1561441137-3090-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the irq_vbus comments doesn't match with the current
implementation, this patch revises it. This patch also changes
new lines to reduce the source code lines.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.h b/drivers/usb/renesas_usbhs/mod.h
index a4a61d6..7117729 100644
--- a/drivers/usb/renesas_usbhs/mod.h
+++ b/drivers/usb/renesas_usbhs/mod.h
@@ -3,6 +3,7 @@
  * Renesas USB driver
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 #ifndef RENESAS_USB_MOD_H
@@ -84,12 +85,11 @@ struct usbhs_mod_info {
 	/*
 	 * INTSTS0 :: VBINT
 	 *
-	 * This function will be used as autonomy mode
-	 * when platform cannot call notify_hotplug.
+	 * This function will be used as autonomy mode (runtime_pwctrl == 0)
+	 * when the platform doesn't have own get_vbus function.
 	 *
-	 * This callback cannot be member of "struct usbhs_mod"
-	 * because it will be used even though
-	 * host/gadget has not been selected.
+	 * This callback cannot be member of "struct usbhs_mod" because it
+	 * will be used even though host/gadget has not been selected.
 	 */
 	int (*irq_vbus)(struct usbhs_priv *priv,
 			struct usbhs_irq_state *irq_state);
-- 
2.7.4

