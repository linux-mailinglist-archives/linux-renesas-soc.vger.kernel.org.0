Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857952417E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 10:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgHKICn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 04:02:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:51706 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728134AbgHKICn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 04:02:43 -0400
X-IronPort-AV: E=Sophos;i="5.75,460,1589209200"; 
   d="scan'208";a="54355772"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Aug 2020 17:02:43 +0900
Received: from localhost.localdomain (unknown [172.29.52.148])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 736074007529;
        Tue, 11 Aug 2020 17:02:40 +0900 (JST)
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
Subject: [PATCH v2 3/5] usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
Date:   Tue, 11 Aug 2020 09:02:25 +0100
Message-Id: <20200811080227.3170-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
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
---
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

