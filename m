Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B252648606
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 16:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiLIP4o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 10:56:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiLIP4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:56:43 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 430BCF008;
        Fri,  9 Dec 2022 07:56:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,230,1665414000"; 
   d="scan'208";a="145648838"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Dec 2022 00:56:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.54])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 81C414010EBA;
        Sat, 10 Dec 2022 00:56:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] usb: typec: hd3ss3220: Add polling support
Date:   Fri,  9 Dec 2022 15:56:23 +0000
Message-Id: <20221209155623.29147-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some platforms(for eg: RZ/V2M EVK) does not have interrupt pin
connected to HD3SS3220. Add polling support for role detection.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/typec/hd3ss3220.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 666a93f7ec65..9894fa96cc5f 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/usb/role.h>
 #include <linux/usb/typec.h>
+#include <linux/workqueue.h>
 
 #define HD3SS3220_REG_CN_STAT_CTRL	0x09
 #define HD3SS3220_REG_GEN_CTRL		0x0A
@@ -37,6 +38,9 @@ struct hd3ss3220 {
 	struct regmap *regmap;
 	struct usb_role_switch	*role_sw;
 	struct typec_port *port;
+	struct delayed_work output_poll_work;
+	enum usb_role role_state;
+	bool poll;
 };
 
 static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
@@ -118,6 +122,22 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 	default:
 		break;
 	}
+
+	hd3ss3220->role_state = role_state;
+}
+
+static void output_poll_execute(struct work_struct *work)
+{
+	struct delayed_work *delayed_work = to_delayed_work(work);
+	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
+						   struct hd3ss3220,
+						   output_poll_work);
+	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+
+	if (hd3ss3220->role_state != role_state)
+		hd3ss3220_set_role(hd3ss3220);
+
+	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
 }
 
 static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
@@ -227,6 +247,9 @@ static int hd3ss3220_probe(struct i2c_client *client,
 					"hd3ss3220", &client->dev);
 		if (ret)
 			goto err_unreg_port;
+	} else {
+		INIT_DELAYED_WORK(&hd3ss3220->output_poll_work, output_poll_execute);
+		hd3ss3220->poll = true;
 	}
 
 	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
@@ -235,6 +258,9 @@ static int hd3ss3220_probe(struct i2c_client *client,
 
 	fwnode_handle_put(connector);
 
+	if (hd3ss3220->poll)
+		schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
+
 	dev_info(&client->dev, "probed revision=0x%x\n", ret);
 
 	return 0;
@@ -252,6 +278,9 @@ static void hd3ss3220_remove(struct i2c_client *client)
 {
 	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
 
+	if (hd3ss3220->poll)
+		cancel_delayed_work_sync(&hd3ss3220->output_poll_work);
+
 	typec_unregister_port(hd3ss3220->port);
 	usb_role_switch_put(hd3ss3220->role_sw);
 }
-- 
2.25.1

