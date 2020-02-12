Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DF815AED9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 18:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgBLRhg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 12:37:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLRhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:37:36 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D070D06;
        Wed, 12 Feb 2020 18:37:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581529052;
        bh=8usEf77U2d1lVXJBJBv1dtEUuu/lhJPWRebpgvRGKUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iyzWXC9pk/z9GxlHcZD/w74Db5LWllvFC8UIGRF7n//2SlHhy0RB7Xykr1UcaGe/r
         UCn7jtSkwwdDE5/szTHLshm7D1jIZsK+hAmE5jO/wTpPjJMYLAvSpteYiX+NJukz8v
         dGVnxgfWzHZyIhDl8JFoaTkKUt3T3n5MRQfS7mnw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/2] max9286: Collect all V4L2 registrations
Date:   Wed, 12 Feb 2020 17:37:27 +0000
Message-Id: <20200212173727.19476-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move all interactions with V4L2 to a dedicated pair of functions
for register and unregister to improve readability of the code.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 139 +++++++++++++++++++++---------------
 1 file changed, 83 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 03c5fa232b6d..b1366f122a8a 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -735,6 +735,80 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
 	.open = max9286_open,
 };
 
+static int max9286_v4l2_register(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct fwnode_handle *ep;
+	int ret;
+	int i;
+
+	/* Register v4l2 async notifiers for connected Camera subdevices */
+	ret = max9286_v4l2_async_register(priv);
+	if (ret) {
+		dev_err(dev, "Unable to register V4L2 async notifiers\n");
+		return ret;
+	}
+
+	/* Configure V4L2 for the MAX9286 itself */
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
+	priv->sd.internal_ops = &max9286_subdev_internal_ops;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	v4l2_ctrl_handler_init(&priv->ctrls, 1);
+	/*
+	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
+	 * hardcoded frequency in the BSP CSI-2 receiver driver.
+	 */
+	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
+			  50000000, 50000000, 1, 50000000);
+	priv->sd.ctrl_handler = &priv->ctrls;
+	ret = priv->ctrls.error;
+	if (ret)
+		goto err_async;
+
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
+	for (i = 0; i < MAX9286_SRC_PAD; i++)
+		priv->pads[i].flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
+				     priv->pads);
+	if (ret)
+		goto err_async;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
+					     0, 0);
+	if (!ep) {
+		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
+		ret = -ENOENT;
+		goto err_async;
+	}
+	priv->sd.fwnode = ep;
+
+	ret = v4l2_async_register_subdev(&priv->sd);
+	if (ret < 0) {
+		dev_err(dev, "Unable to register subdevice\n");
+		goto err_put_node;
+	}
+
+	return 0;
+
+err_put_node:
+	fwnode_handle_put(ep);
+err_async:
+	max9286_v4l2_async_unregister(priv);
+
+	return ret;
+}
+
+static void max9286_v4l2_unregister(struct max9286_priv *priv)
+{
+	fwnode_handle_put(priv->sd.fwnode);
+	v4l2_async_unregister_subdev(&priv->sd);
+	max9286_v4l2_async_unregister(priv);
+}
+
 /* -----------------------------------------------------------------------------
  * Probe/Remove
  */
@@ -887,8 +961,6 @@ static int max9286_init(struct device *dev)
 {
 	struct max9286_priv *priv;
 	struct i2c_client *client;
-	struct fwnode_handle *ep;
-	unsigned int i;
 	int ret;
 
 	/* Skip non-max9286 devices. */
@@ -913,58 +985,20 @@ static int max9286_init(struct device *dev)
 		goto err_regulator;
 	}
 
-	/* Register v4l2 async notifiers */
-	ret = max9286_v4l2_async_register(priv);
-	if (ret) {
-		dev_err(dev, "Unable to register V4L2 async notifiers\n");
-		goto err_regulator;
-	}
-
-	v4l2_i2c_subdev_init(&priv->sd, client, &max9286_subdev_ops);
-	priv->sd.internal_ops = &max9286_subdev_internal_ops;
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-
-	v4l2_ctrl_handler_init(&priv->ctrls, 1);
 	/*
-	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
-	 * hardcoded frequency in the BSP CSI-2 receiver driver.
+	 * Register all V4L2 interactions for the MAX9286 and notifiers for
+	 * any subdevices connected.
 	 */
-	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
-			  50000000, 50000000, 1, 50000000);
-	priv->sd.ctrl_handler = &priv->ctrls;
-	ret = priv->ctrls.error;
-	if (ret)
-		goto err_async;
-
-	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-
-	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
-	for (i = 0; i < MAX9286_SRC_PAD; i++)
-		priv->pads[i].flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
-				     priv->pads);
-	if (ret)
-		goto err_regulator;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
-					     0, 0);
-	if (!ep) {
-		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
-		ret = -ENOENT;
+	ret = max9286_v4l2_register(priv);
+	if (ret) {
+		dev_err(dev, "Failed to register with V4L2\n");
 		goto err_regulator;
 	}
-	priv->sd.fwnode = ep;
-
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret < 0) {
-		dev_err(dev, "Unable to register subdevice\n");
-		goto err_put_node;
-	}
 
 	ret = max9286_i2c_mux_init(priv);
 	if (ret) {
 		dev_err(dev, "Unable to initialize I2C multiplexer\n");
-		goto err_subdev_unregister;
+		goto err_v4l2_register;
 	}
 
 	/* Leave the mux channels disabled until they are selected. */
@@ -972,13 +1006,8 @@ static int max9286_init(struct device *dev)
 
 	return 0;
 
-err_subdev_unregister:
-	v4l2_async_unregister_subdev(&priv->sd);
-	max9286_i2c_mux_close(priv);
-err_put_node:
-	fwnode_handle_put(ep);
-err_async:
-	max9286_v4l2_async_unregister(priv);
+err_v4l2_register:
+	max9286_v4l2_unregister(priv);
 err_regulator:
 	regulator_disable(priv->regulator);
 	priv->poc_enabled = false;
@@ -1201,9 +1230,7 @@ static int max9286_remove(struct i2c_client *client)
 
 	i2c_mux_del_adapters(priv->mux);
 
-	fwnode_handle_put(priv->sd.fwnode);
-	v4l2_async_unregister_subdev(&priv->sd);
-	max9286_v4l2_async_unregister(priv);
+	max9286_v4l2_unregister(priv);
 
 	if (priv->poc_enabled)
 		regulator_disable(priv->regulator);
-- 
2.20.1

