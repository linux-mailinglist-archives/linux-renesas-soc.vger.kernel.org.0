Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC26D878C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 06:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfJPEic (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 00:38:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:51055 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726502AbfJPEic (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 00:38:32 -0400
X-IronPort-AV: E=Sophos;i="5.67,302,1566831600"; 
   d="scan'208";a="29207818"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Oct 2019 13:38:30 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2CFC7400C749;
        Wed, 16 Oct 2019 13:38:28 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix __le16 warnings
Date:   Wed, 16 Oct 2019 13:38:28 +0900
Message-Id: <1571200708-23381-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch fixes the following sparse warnings by using
a macro and a suitable variable type.

drivers/usb/gadget/udc/renesas_usb3.c:1547:17: warning: restricted __le16 degrades to integer
drivers/usb/gadget/udc/renesas_usb3.c:1550:43: warning: incorrect type in argument 2 (different base types)
drivers/usb/gadget/udc/renesas_usb3.c:1550:43:    expected unsigned short [usertype] addr
drivers/usb/gadget/udc/renesas_usb3.c:1550:43:    got restricted __le16 [usertype] wValue
drivers/usb/gadget/udc/renesas_usb3.c:1607:24: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/udc/renesas_usb3.c:1607:24:    expected unsigned short [assigned] [usertype] status
drivers/usb/gadget/udc/renesas_usb3.c:1607:24:    got restricted __le16 [usertype]
drivers/usb/gadget/udc/renesas_usb3.c:1775:17: warning: restricted __le16 degrades to integer

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index e098f16..3370314 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1544,10 +1544,10 @@ static void usb3_set_device_address(struct renesas_usb3 *usb3, u16 addr)
 static bool usb3_std_req_set_address(struct renesas_usb3 *usb3,
 				     struct usb_ctrlrequest *ctrl)
 {
-	if (ctrl->wValue >= 128)
+	if (le16_to_cpu(ctrl->wValue) >= 128)
 		return true;	/* stall */
 
-	usb3_set_device_address(usb3, ctrl->wValue);
+	usb3_set_device_address(usb3, le16_to_cpu(ctrl->wValue));
 	usb3_set_p0_con_for_no_data(usb3);
 
 	return false;
@@ -1582,6 +1582,7 @@ static bool usb3_std_req_get_status(struct renesas_usb3 *usb3,
 	struct renesas_usb3_ep *usb3_ep;
 	int num;
 	u16 status = 0;
+	__le16 tx_data;
 
 	switch (ctrl->bRequestType & USB_RECIP_MASK) {
 	case USB_RECIP_DEVICE:
@@ -1604,10 +1605,10 @@ static bool usb3_std_req_get_status(struct renesas_usb3 *usb3,
 	}
 
 	if (!stall) {
-		status = cpu_to_le16(status);
+		tx_data = cpu_to_le16(status);
 		dev_dbg(usb3_to_dev(usb3), "get_status: req = %p\n",
 			usb_req_to_usb3_req(usb3->ep0_req));
-		usb3_pipe0_internal_xfer(usb3, &status, sizeof(status),
+		usb3_pipe0_internal_xfer(usb3, &tx_data, sizeof(tx_data),
 					 usb3_pipe0_get_status_completion);
 	}
 
@@ -1772,7 +1773,7 @@ static bool usb3_std_req_set_sel(struct renesas_usb3 *usb3,
 static bool usb3_std_req_set_configuration(struct renesas_usb3 *usb3,
 					   struct usb_ctrlrequest *ctrl)
 {
-	if (ctrl->wValue > 0)
+	if (le16_to_cpu(ctrl->wValue) > 0)
 		usb3_set_bit(usb3, USB_COM_CON_CONF, USB3_USB_COM_CON);
 	else
 		usb3_clear_bit(usb3, USB_COM_CON_CONF, USB3_USB_COM_CON);
-- 
2.7.4

