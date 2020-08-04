Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F50E23BF13
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Aug 2020 19:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbgHDRsp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Aug 2020 13:48:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24954 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728823AbgHDRsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 13:48:43 -0400
X-IronPort-AV: E=Sophos;i="5.75,434,1589209200"; 
   d="scan'208";a="53649492"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2020 02:48:43 +0900
Received: from localhost.localdomain (unknown [172.29.52.222])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AC82D40B92DF;
        Wed,  5 Aug 2020 02:48:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
Date:   Tue,  4 Aug 2020 18:48:26 +0100
Message-Id: <20200804174828.8339-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
References: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some platforms have only super speed data bus connected to this device
and high speed data bus directly connected to the SoC. In such platforms
modelling connector as a child of this device is making it non complaint
with usb connector bindings. By modelling connector node as standalone
device node along with this device and the SoC data bus will make it
complaint with usb connector bindings.
Update the driver to handle this model by using OF graph API to get the
connector fwnode and usb role switch class API to get role switch handle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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

