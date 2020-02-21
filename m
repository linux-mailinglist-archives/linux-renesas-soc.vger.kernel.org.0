Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D45A1686F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 19:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgBUSsG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 13:48:06 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27049 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726150AbgBUSsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 13:48:06 -0500
X-IronPort-AV: E=Sophos;i="5.70,469,1574089200"; 
   d="scan'208";a="39730618"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2020 03:48:05 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5DE9540DAD14;
        Sat, 22 Feb 2020 03:48:04 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH] usb: typec: hd3ss3220: fix return code
Date:   Fri, 21 Feb 2020 18:48:03 +0000
Message-Id: <1582310883-25893-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch fixes the return code for the attached_state, as the low level
call did not adequately propagate errors to its callers.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 drivers/usb/typec/hd3ss3220.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 323dfa8..97ea52d 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -46,10 +46,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
 				  src_pref);
 }
 
-static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
+static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
+		enum usb_role *attached_state)
 {
 	unsigned int reg_val;
-	enum usb_role attached_state;
 	int ret;
 
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
@@ -59,17 +59,17 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
 
 	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
-		attached_state = USB_ROLE_HOST;
+		*attached_state = USB_ROLE_HOST;
 		break;
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
-		attached_state = USB_ROLE_DEVICE;
+		*attached_state = USB_ROLE_DEVICE;
 		break;
 	default:
-		attached_state = USB_ROLE_NONE;
+		*attached_state = USB_ROLE_NONE;
 		break;
 	}
 
-	return attached_state;
+	return 0;
 }
 
 static int hd3ss3220_dr_set(struct typec_port *port, enum typec_data_role role)
@@ -99,9 +99,14 @@ static const struct typec_operations hd3ss3220_ops = {
 	.dr_set = hd3ss3220_dr_set
 };
 
-static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
+static int hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
+	int ret;
+
+	ret = hd3ss3220_get_attached_state(hd3ss3220, &role_state);
+	if (ret < 0)
+		return ret;
 
 	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
 	if (role_state == USB_ROLE_NONE)
@@ -118,13 +123,18 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 	default:
 		break;
 	}
+
+	return 0;
 }
 
 static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
 {
 	int err;
 
-	hd3ss3220_set_role(hd3ss3220);
+	err = hd3ss3220_set_role(hd3ss3220);
+	if (err < 0)
+		return IRQ_NONE;
+
 	err = regmap_update_bits_base(hd3ss3220->regmap,
 				      HD3SS3220_REG_CN_STAT_CTRL,
 				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
@@ -196,7 +206,10 @@ static int hd3ss3220_probe(struct i2c_client *client,
 		goto err_put_role;
 	}
 
-	hd3ss3220_set_role(hd3ss3220);
+	ret = hd3ss3220_set_role(hd3ss3220);
+	if (ret < 0)
+		goto err_unreg_port;
+
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
 	if (ret < 0)
 		goto err_unreg_port;
-- 
2.7.4

