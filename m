Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B235764A5D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbiLLR3W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbiLLR25 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:57 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD21F13E94;
        Mon, 12 Dec 2022 09:28:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="143082700"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 828E5406F1D2;
        Tue, 13 Dec 2022 02:28:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-usb@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/16] usb: gadget: udc: renesas_usb3: Add role switch support for RZ/V2M
Date:   Mon, 12 Dec 2022 17:27:59 +0000
Message-Id: <20221212172804.1277751-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
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
 drivers/usb/gadget/udc/Kconfig        |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c | 38 ++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 578a3f209ef6..d7278d67b146 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -201,6 +201,7 @@ config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on EXTCON
+	select USB_RZV2M_USB3DRD if ARCH_R9A09G011
 	select USB_ROLE_SWITCH
 	help
 	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index af29de32e08b..9ca40b41aa36 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2318,6 +2318,9 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 
 	usb3 = gadget_to_renesas_usb3(gadget);
 
+	if (usb3->is_rzv2m && usb3_is_a_device(usb3))
+		return -EBUSY;
+
 	/* hook up the driver */
 	usb3->driver = driver;
 
@@ -2326,6 +2329,10 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 
 	pm_runtime_get_sync(usb3_to_dev(usb3));
 
+	/* Peripheral Reset */
+	if (usb3->is_rzv2m)
+		rzv2m_usb3drd_reset(usb3_to_dev(usb3)->parent, false);
+
 	renesas_usb3_init_controller(usb3);
 
 	return 0;
@@ -2338,8 +2345,10 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 	usb3->softconnect = false;
 	usb3->gadget.speed = USB_SPEED_UNKNOWN;
 	usb3->driver = NULL;
-	renesas_usb3_stop_controller(usb3);
+	if (usb3->is_rzv2m)
+		rzv2m_usb3drd_reset(usb3_to_dev(usb3)->parent, false);
 
+	renesas_usb3_stop_controller(usb3);
 	if (usb3->phy)
 		phy_exit(usb3->phy);
 
@@ -2401,16 +2410,22 @@ static void handle_ext_role_switch_states(struct device *dev,
 		usb3->connection_state = USB_ROLE_NONE;
 		if (cur_role == USB_ROLE_HOST)
 			device_release_driver(host);
-		if (usb3->driver)
+		if (usb3->driver) {
+			if (usb3->is_rzv2m)
+				rzv2m_usb3drd_reset(dev->parent, false);
 			usb3_disconnect(usb3);
+		}
 		usb3_vbus_out(usb3, false);
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
@@ -2421,8 +2436,11 @@ static void handle_ext_role_switch_states(struct device *dev,
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
@@ -2806,9 +2824,15 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 
 	usb3->is_rzv2m = priv->is_rzv2m;
 
-	usb3->reg = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(usb3->reg))
-		return PTR_ERR(usb3->reg);
+	if (usb3->is_rzv2m) {
+		struct rzv2m_usb3drd *ddata = dev_get_drvdata(pdev->dev.parent);
+
+		usb3->reg = ddata->reg;
+	} else {
+		usb3->reg = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(usb3->reg))
+			return PTR_ERR(usb3->reg);
+	}
 
 	platform_set_drvdata(pdev, usb3);
 	spin_lock_init(&usb3->lock);
-- 
2.25.1

