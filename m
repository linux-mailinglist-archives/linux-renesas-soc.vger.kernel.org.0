Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D6827149E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 15:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgITNtX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Sep 2020 09:49:23 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5580 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726305AbgITNtX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 09:49:23 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596466800"; 
   d="scan'208";a="57511484"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Sep 2020 22:49:21 +0900
Received: from localhost.localdomain (unknown [172.29.52.129])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 02B9940078C5;
        Sun, 20 Sep 2020 22:49:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/6] usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
Date:   Sun, 20 Sep 2020 14:49:03 +0100
Message-Id: <20200920134905.4370-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some platforms have only super speed data bus connected to this device
and high speed data bus directly connected to the SoC. In such platforms
modelling connector as a child of this device is making it non compliant
with usb connector bindings. By modelling connector node as standalone
device node along with this device and the SoC data bus will make it
compliant with usb connector bindings.
Update the driver to handle this model by using OF graph API to get the
connector fwnode and usb role switch class API to get role switch handle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v3->v4: No Change
v2->v3: Added Heikki's reviewed by tag.
v1->v2: Fixed the commit message (https://patchwork.kernel.org/patch/11700777/)
Ref:https://patchwork.kernel.org/patch/11669423/
---
 drivers/usb/typec/hd3ss3220.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 323dfa8160ab..f633ec15b1a1 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -155,7 +155,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
 {
 	struct typec_capability typec_cap = { };
 	struct hd3ss3220 *hd3ss3220;
-	struct fwnode_handle *connector;
+	struct fwnode_handle *connector, *ep;
 	int ret;
 	unsigned int data;
 
@@ -173,11 +173,21 @@ static int hd3ss3220_probe(struct i2c_client *client,
 
 	hd3ss3220_set_source_pref(hd3ss3220,
 				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
+	/* For backward compatibility check the connector child node first */
 	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
-	if (!connector)
-		return -ENODEV;
+	if (connector) {
+		hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
+	} else {
+		ep = fwnode_graph_get_next_endpoint(dev_fwnode(hd3ss3220->dev), NULL);
+		if (!ep)
+			return -ENODEV;
+		connector = fwnode_graph_get_remote_port_parent(ep);
+		fwnode_handle_put(ep);
+		if (!connector)
+			return -ENODEV;
+		hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
+	}
 
-	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
 	if (IS_ERR(hd3ss3220->role_sw)) {
 		ret = PTR_ERR(hd3ss3220->role_sw);
 		goto err_put_fwnode;
-- 
2.17.1

