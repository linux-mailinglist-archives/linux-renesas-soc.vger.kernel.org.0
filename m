Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF6B668681
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjALWJn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjALWIy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:08:54 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DBB63DBD1;
        Thu, 12 Jan 2023 13:59:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="149165234"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F4E6400A66D;
        Fri, 13 Jan 2023 06:59:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-usb@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/12] usb: gadget: udc: renesas_usb3: Add role switch support for RZ/V2M
Date:   Thu, 12 Jan 2023 21:59:00 +0000
Message-Id: <20230112215906.494394-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As RZ/V2M has both HOST and PERI reset module, we need to do reset release
before accessing registers in respective IP module.

This patch adds role switch support for RZ/V2M.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/usb/gadget/udc/renesas_usb3.c | 34 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 8d694501bf02..bee6bceafc4f 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -7,6 +7,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/extcon-provider.h>
@@ -2366,6 +2367,9 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 
 	usb3 = gadget_to_renesas_usb3(gadget);
 
+	if (usb3->is_rzv2m && usb3_is_a_device(usb3))
+		return -EBUSY;
+
 	/* hook up the driver */
 	usb3->driver = driver;
 
@@ -2374,6 +2378,10 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 
 	pm_runtime_get_sync(usb3_to_dev(usb3));
 
+	/* Peripheral Reset */
+	if (usb3->is_rzv2m)
+		rzv2m_usb3drd_reset(usb3_to_dev(usb3)->parent, false);
+
 	renesas_usb3_init_controller(usb3);
 
 	return 0;
@@ -2386,8 +2394,10 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 	usb3->softconnect = false;
 	usb3->gadget.speed = USB_SPEED_UNKNOWN;
 	usb3->driver = NULL;
-	renesas_usb3_stop_controller(usb3);
+	if (usb3->is_rzv2m)
+		rzv2m_usb3drd_reset(usb3_to_dev(usb3)->parent, false);
 
+	renesas_usb3_stop_controller(usb3);
 	if (usb3->phy)
 		phy_exit(usb3->phy);
 
@@ -2447,18 +2457,29 @@ static void handle_ext_role_switch_states(struct device *dev,
 	switch (role) {
 	case USB_ROLE_NONE:
 		usb3->connection_state = USB_ROLE_NONE;
-		if (cur_role == USB_ROLE_HOST)
+		if (!usb3->is_rzv2m && cur_role == USB_ROLE_HOST)
 			device_release_driver(host);
-		if (usb3->driver)
+		if (usb3->driver) {
+			if (usb3->is_rzv2m)
+				rzv2m_usb3drd_reset(dev->parent, false);
 			usb3_disconnect(usb3);
+		}
 		usb3_vbus_out(usb3, false);
+
+		if (usb3->is_rzv2m) {
+			rzv2m_usb3drd_reset(dev->parent, true);
+			device_release_driver(host);
+		}
 		break;
 	case USB_ROLE_DEVICE:
 		if (usb3->connection_state == USB_ROLE_NONE) {
 			usb3->connection_state = USB_ROLE_DEVICE;
 			usb3_set_mode(usb3, false);
-			if (usb3->driver)
+			if (usb3->driver) {
+				if (usb3->is_rzv2m)
+					renesas_usb3_init_controller(usb3);
 				usb3_connect(usb3);
+			}
 		} else if (cur_role == USB_ROLE_HOST)  {
 			device_release_driver(host);
 			usb3_set_mode(usb3, false);
@@ -2469,8 +2490,11 @@ static void handle_ext_role_switch_states(struct device *dev,
 		break;
 	case USB_ROLE_HOST:
 		if (usb3->connection_state == USB_ROLE_NONE) {
-			if (usb3->driver)
+			if (usb3->driver) {
+				if (usb3->is_rzv2m)
+					rzv2m_usb3drd_reset(dev->parent, false);
 				usb3_disconnect(usb3);
+			}
 
 			usb3->connection_state = USB_ROLE_HOST;
 			usb3_set_mode(usb3, true);
-- 
2.25.1

