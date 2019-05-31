Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E6530C61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 12:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfEaKH7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 06:07:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:3044 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726998AbfEaKH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 06:07:59 -0400
X-IronPort-AV: E=Sophos;i="5.60,534,1549897200"; 
   d="scan'208";a="17479576"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2019 19:07:56 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 63BF142251C7;
        Fri, 31 May 2019 19:07:53 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 4/7] usb: gadget: udc: renesas_usb3: Enhance role switch support
Date:   Fri, 31 May 2019 10:59:57 +0100
Message-Id: <1559296800-5610-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2E cat874 board has a type-c connector connected to hd3ss3220 usb
type-c drp port controller. Enhance role switch support to assign the role
requested by connector device using the usb role switch class framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V6-->V7
   * Incorporated Shimoda-San and Chunfeng Yun's review comments
     (https://patchwork.kernel.org/patch/10944643/)
 V5-->V6
   * Added graph api's to find the role supported by the connector.
 V4-->V5
   * Incorporated Shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10902537/)
 V3-->V4
   * No Change
 V2-->V3
   * Incorporated Shimoda-san's review comment
     (https://patchwork.kernel.org/patch/10852507/)
   * Used renesas,usb-role-switch property for differentiating USB
     role switch associated with Type-C port controller driver.
 V1-->V2
   * Driver uses usb role clas for handling dual role switch and handling
     connect/disconnect events instead of extcon.
---
 drivers/usb/gadget/udc/renesas_usb3.c | 91 ++++++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7dc2485..5a960fc 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -351,6 +351,8 @@ struct renesas_usb3 {
 	int disabled_count;
 
 	struct usb_request *ep0_req;
+
+	enum usb_role connection_state;
 	u16 test_mode;
 	u8 ep0_buf[USB3_EP0_BUF_SIZE];
 	bool softconnect;
@@ -359,6 +361,7 @@ struct renesas_usb3 {
 	bool extcon_usb;		/* check vbus and set EXTCON_USB */
 	bool forced_b_device;
 	bool start_to_connect;
+	bool role_sw_by_connector;
 };
 
 #define gadget_to_renesas_usb3(_gadget)	\
@@ -699,8 +702,11 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&usb3->lock, flags);
-	usb3_set_mode_by_role_sw(usb3, host);
-	usb3_vbus_out(usb3, a_dev);
+	if (!usb3->role_sw_by_connector ||
+	    usb3->connection_state != USB_ROLE_NONE) {
+		usb3_set_mode_by_role_sw(usb3, host);
+		usb3_vbus_out(usb3, a_dev);
+	}
 	/* for A-Peripheral or forced B-device mode */
 	if ((!host && a_dev) || usb3->start_to_connect)
 		usb3_connect(usb3);
@@ -716,7 +722,8 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
 {
 	usb3->extcon_host = usb3_is_a_device(usb3);
 
-	if (usb3->extcon_host && !usb3->forced_b_device)
+	if ((!usb3->role_sw_by_connector && usb3->extcon_host &&
+	     !usb3->forced_b_device) || usb3->connection_state == USB_ROLE_HOST)
 		usb3_mode_config(usb3, true, true);
 	else
 		usb3_mode_config(usb3, false, false);
@@ -2343,14 +2350,65 @@ static enum usb_role renesas_usb3_role_switch_get(struct device *dev)
 	return cur_role;
 }
 
-static int renesas_usb3_role_switch_set(struct device *dev,
-					enum usb_role role)
+static void handle_ext_role_switch_states(struct device *dev,
+					    enum usb_role role)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+	struct device *host = usb3->host_dev;
+	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		usb3->connection_state = USB_ROLE_NONE;
+		if (usb3->driver)
+			usb3_disconnect(usb3);
+		usb3_vbus_out(usb3, false);
+		break;
+	case USB_ROLE_DEVICE:
+		if (usb3->connection_state == USB_ROLE_NONE) {
+			usb3->connection_state = USB_ROLE_DEVICE;
+			usb3_set_mode(usb3, false);
+			if (usb3->driver)
+				usb3_connect(usb3);
+		} else if (cur_role == USB_ROLE_HOST)  {
+			device_release_driver(host);
+			usb3_set_mode(usb3, false);
+			if (usb3->driver)
+				usb3_connect(usb3);
+		}
+		usb3_vbus_out(usb3, false);
+		break;
+	case USB_ROLE_HOST:
+		if (usb3->connection_state == USB_ROLE_NONE) {
+			if (usb3->driver)
+				usb3_disconnect(usb3);
+
+			usb3->connection_state = USB_ROLE_HOST;
+			usb3_set_mode(usb3, true);
+			usb3_vbus_out(usb3, true);
+			if (device_attach(host) < 0)
+				dev_err(dev, "device_attach(host) failed\n");
+		} else if (cur_role == USB_ROLE_DEVICE) {
+			usb3_disconnect(usb3);
+			/* Must set the mode before device_attach of the host */
+			usb3_set_mode(usb3, true);
+			/* This device_attach() might sleep */
+			if (device_attach(host) < 0)
+				dev_err(dev, "device_attach(host) failed\n");
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static void handle_role_switch_states(struct device *dev,
+					    enum usb_role role)
 {
 	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
 	struct device *host = usb3->host_dev;
 	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
 
-	pm_runtime_get_sync(dev);
 	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
 		device_release_driver(host);
 		usb3_set_mode(usb3, false);
@@ -2361,6 +2419,20 @@ static int renesas_usb3_role_switch_set(struct device *dev,
 		if (device_attach(host) < 0)
 			dev_err(dev, "device_attach(host) failed\n");
 	}
+}
+
+static int renesas_usb3_role_switch_set(struct device *dev,
+					enum usb_role role)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+
+	if (usb3->role_sw_by_connector)
+		handle_ext_role_switch_states(dev, role);
+	else
+		handle_role_switch_states(dev, role);
+
 	pm_runtime_put(dev);
 
 	return 0;
@@ -2650,7 +2722,7 @@ static const unsigned int renesas_usb3_cable[] = {
 	EXTCON_NONE,
 };
 
-static const struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
+static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
 	.set = renesas_usb3_role_switch_set,
 	.get = renesas_usb3_role_switch_get,
 	.allow_userspace_control = true,
@@ -2741,6 +2813,11 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
+	if (device_property_read_bool(&pdev->dev, "usb-role-switch")) {
+		usb3->role_sw_by_connector = true;
+		renesas_usb3_role_switch_desc.fwnode = dev_fwnode(&pdev->dev);
+	}
+
 	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
 	usb3->role_sw = usb_role_switch_register(&pdev->dev,
 					&renesas_usb3_role_switch_desc);
-- 
2.7.4

