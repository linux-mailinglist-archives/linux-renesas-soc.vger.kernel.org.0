Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9C4281E35
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Oct 2020 00:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgJBWXi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Oct 2020 18:23:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:27896 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725283AbgJBWXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 18:23:37 -0400
X-IronPort-AV: E=Sophos;i="5.77,329,1596466800"; 
   d="scan'208";a="58574391"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Oct 2020 07:23:35 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 49E2140062C6;
        Sat,  3 Oct 2020 07:23:33 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 1/3] media: i2c: ov772x: Parse endpoint properties
Date:   Fri,  2 Oct 2020 23:23:21 +0100
Message-Id: <20201002222323.21736-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002222323.21736-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201002222323.21736-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
to determine the bus type and store it in the driver structure.

Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ov772x.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 2cc6a678069a..afe2446dfb68 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-image-sizes.h>
 #include <media/v4l2-subdev.h>
 
@@ -434,6 +435,7 @@ struct ov772x_priv {
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_pad pad;
 #endif
+	enum v4l2_mbus_type		  bus_type;
 };
 
 /*
@@ -1348,6 +1350,34 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
 	.pad	= &ov772x_subdev_pad_ops,
 };
 
+static int ov772x_parse_dt(struct i2c_client *client,
+			   struct ov772x_priv *priv)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_PARALLEL
+	};
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	if (!ep) {
+		dev_err(&client->dev, "Endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	if (ret)
+		goto error_fwnode_put;
+
+	priv->bus_type = bus_cfg.bus_type;
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+error_fwnode_put:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
+
 /*
  * i2c_driver function
  */
@@ -1415,6 +1445,10 @@ static int ov772x_probe(struct i2c_client *client)
 		goto error_clk_put;
 	}
 
+	ret = ov772x_parse_dt(client, priv);
+	if (ret)
+		goto error_clk_put;
+
 	ret = ov772x_video_probe(priv);
 	if (ret < 0)
 		goto error_gpio_put;
-- 
2.17.1

