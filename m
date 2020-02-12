Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF2CE15AED8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 18:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgBLRhe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 12:37:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLRhd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:37:33 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EECC9A42;
        Wed, 12 Feb 2020 18:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581529052;
        bh=XAKGLTWUNAr7m5WuNhLcL8Zv8WKV2Zg2QHKTbdGvqM4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mlGHLE/okOurB3dXYY6yQqmQ2vN6HK3MbsjShSuWQHRx6duN+3PQLVUfYisSFZV5K
         OK0InBJDTJHElQxkXdNICrawqtD36y87n+TOuYsyokvYb4Gwwh6sLxiUfJJD3b+GBO
         yOVQFzOXMaUbwJ0G+z4ThTFcjfKb/D80QH7IcZJQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/2] max9286: Split out async registration
Date:   Wed, 12 Feb 2020 17:37:26 +0000
Message-Id: <20200212173727.19476-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move all the V4L2 Subdev Async registration so that it can only happen once
we know we will not need to -EPROBE_DEFER...

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 88 +++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1b4ff3533795..03c5fa232b6d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -503,6 +503,49 @@ static const struct v4l2_async_notifier_operations max9286_notify_ops = {
 	.unbind = max9286_notify_unbind,
 };
 
+static int max9286_v4l2_async_register(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct max9286_source *source = NULL;
+	int ret;
+
+	v4l2_async_notifier_init(&priv->notifier);
+
+	for_each_source(priv, source) {
+		unsigned int i = to_index(priv, source);
+
+		dev_err(dev, "Registering v4l2-async for source %d\n", i);
+
+		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
+		source->asd.match.fwnode = source->fwnode;
+
+		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
+						     &source->asd);
+		if (ret) {
+			dev_err(dev, "Failed to add subdev for source %d", i);
+			v4l2_async_notifier_cleanup(&priv->notifier);
+			return ret;
+		}
+	}
+
+	priv->notifier.ops = &max9286_notify_ops;
+
+	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev_notifier");
+		v4l2_async_notifier_cleanup(&priv->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max9286_v4l2_async_unregister(struct max9286_priv *priv)
+{
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
+}
+
 static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
@@ -870,6 +913,13 @@ static int max9286_init(struct device *dev)
 		goto err_regulator;
 	}
 
+	/* Register v4l2 async notifiers */
+	ret = max9286_v4l2_async_register(priv);
+	if (ret) {
+		dev_err(dev, "Unable to register V4L2 async notifiers\n");
+		goto err_regulator;
+	}
+
 	v4l2_i2c_subdev_init(&priv->sd, client, &max9286_subdev_ops);
 	priv->sd.internal_ops = &max9286_subdev_internal_ops;
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -884,7 +934,7 @@ static int max9286_init(struct device *dev)
 	priv->sd.ctrl_handler = &priv->ctrls;
 	ret = priv->ctrls.error;
 	if (ret)
-		goto err_regulator;
+		goto err_async;
 
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 
@@ -927,6 +977,8 @@ static int max9286_init(struct device *dev)
 	max9286_i2c_mux_close(priv);
 err_put_node:
 	fwnode_handle_put(ep);
+err_async:
+	max9286_v4l2_async_unregister(priv);
 err_regulator:
 	regulator_disable(priv->regulator);
 	priv->poc_enabled = false;
@@ -938,14 +990,6 @@ static void max9286_cleanup_dt(struct max9286_priv *priv)
 {
 	struct max9286_source *source;
 
-	/*
-	 * Not strictly part of the DT, but the notifier is registered during
-	 * max9286_parse_dt(), and the notifier holds references to the fwnodes
-	 * thus the cleanup is here to mirror the registration.
-	 */
-	v4l2_async_notifier_unregister(&priv->notifier);
-	v4l2_async_notifier_cleanup(&priv->notifier);
-
 	for_each_source(priv, source) {
 		fwnode_handle_put(source->fwnode);
 		source->fwnode = NULL;
@@ -958,7 +1002,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	struct device_node *i2c_mux;
 	struct device_node *node = NULL;
 	unsigned int i2c_mux_mask = 0;
-	int ret;
 
 	of_node_get(dev->of_node);
 	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
@@ -986,8 +1029,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	of_node_put(node);
 	of_node_put(i2c_mux);
 
-	v4l2_async_notifier_init(&priv->notifier);
-
 	/* Parse the endpoints */
 	for_each_endpoint_of_node(dev->of_node, node) {
 		struct max9286_source *source;
@@ -1056,34 +1097,14 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 			continue;
 		}
 
-		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-		source->asd.match.fwnode = source->fwnode;
-
-		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
-						     &source->asd);
-		if (ret) {
-			v4l2_async_notifier_cleanup(&priv->notifier);
-			of_node_put(node);
-			return ret;
-		}
-
 		priv->source_mask |= BIT(ep.port);
 		priv->nsources++;
 	}
 	of_node_put(node);
 
-	/* Do not register the subdev notifier if there are no devices. */
-	if (!priv->nsources)
-		return 0;
-
 	priv->route_mask = priv->source_mask;
-	priv->notifier.ops = &max9286_notify_ops;
-
-	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
-	if (ret)
-		v4l2_async_notifier_cleanup(&priv->notifier);
 
-	return ret;
+	return 0;
 }
 
 static int max9286_probe(struct i2c_client *client)
@@ -1182,6 +1203,7 @@ static int max9286_remove(struct i2c_client *client)
 
 	fwnode_handle_put(priv->sd.fwnode);
 	v4l2_async_unregister_subdev(&priv->sd);
+	max9286_v4l2_async_unregister(priv);
 
 	if (priv->poc_enabled)
 		regulator_disable(priv->regulator);
-- 
2.20.1

