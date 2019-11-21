Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 954191057A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 17:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfKUQ4g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 11:56:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42326 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUQ4g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 11:56:36 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6DA0A2B;
        Thu, 21 Nov 2019 17:56:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574355394;
        bh=B8VENkpydvuIlvYlJk+FSecUZfZq+Cmx83ou7deGTLc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rLY3tjxZnKYMDT2GNJ1MpMXZvWbfAkkOZ4yrrx/DhlTUZdrNMsV9n5gLHW6yrgPoj
         pJ9Yapb8wPuGrShl6iZsSMrcD+0uWww8QB8yUaGqXSCZUgUKsQCi+MZCm+Qa5ZJ1fP
         QbXLIj6l6Gt6bCtkqUNdkpcZVSTmAcEEA/8xF9NU=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] max9286: simplify i2c-mux parsing
Date:   Thu, 21 Nov 2019 16:56:31 +0000
Message-Id: <20191121165631.5744-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 - Identify each enabled i2c-mux channel in a single pass

The parse_dt function iterates each node in the i2c-mux for each endpoint looking for a match.
The only purpose of these iterations is to determine if the corresponding i2c-channel
is enabled. (status = 'okay').

Iterate the i2c-mux nodes in a single pass storing the enable state
in a local i2c_mux_mask for use when parsing the endpoints.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 84 +++++++++++++++----------------------
 1 file changed, 34 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 34cb6f3b40c2..a36132becdc7 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1097,55 +1097,6 @@ static int max9286_is_bound(struct device *dev, void *data)
 	return 0;
 }
 
-static struct device_node *max9286_get_i2c_by_id(struct device_node *parent,
-						 u32 id)
-{
-	struct device_node *i2c_mux;
-	struct device_node *child;
-
-	/* Balance the of_node_put() performed by of_find_node_by_name() */
-	of_node_get(parent);
-
-	i2c_mux = of_find_node_by_name(parent, "i2c-mux");
-	if (!i2c_mux) {
-		printk("max9286: Failed to find i2c-mux node\n");
-		return NULL;
-	}
-
-	for_each_child_of_node(i2c_mux, child) {
-		u32 i2c_id = 0;
-
-		if (of_node_cmp(child->name, "i2c") != 0)
-			continue;
-		of_property_read_u32(child, "reg", &i2c_id);
-		if (id == i2c_id)
-			return child;
-	}
-
-	return NULL;
-}
-
-static int max9286_check_i2c_bus_by_id(struct device *dev, int id)
-{
-	struct device_node *i2c_np;
-
-	i2c_np = max9286_get_i2c_by_id(dev->of_node, id);
-	if (!i2c_np) {
-		dev_err(dev, "Failed to find corresponding i2c@%u\n", id);
-		return -ENODEV;
-	}
-
-	if (!of_device_is_available(i2c_np)) {
-		dev_dbg(dev, "Skipping port %u with disabled I2C bus\n", id);
-		of_node_put(i2c_np);
-		return -ENODEV;
-	}
-
-	of_node_put(i2c_np);
-
-	return 0;
-}
-
 static void max9286_cleanup_dt(struct max9286_priv *priv)
 {
 	struct max9286_source *source;
@@ -1167,11 +1118,44 @@ static void max9286_cleanup_dt(struct max9286_priv *priv)
 static int max9286_parse_dt(struct max9286_priv *priv)
 {
 	struct device *dev = &priv->client->dev;
+	struct device_node *i2c_mux;
+	struct device_node *child = NULL;
 	struct device_node *ep_np = NULL;
+	unsigned int i2c_mux_mask = 0;
 	int ret;
 
+	/* Balance the of_node_put() performed by of_find_node_by_name() */
+	of_node_get(dev->of_node);
+	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
+	if (!i2c_mux) {
+		dev_err(dev, "Failed to find i2c-mux node\n");
+		return -EINVAL;
+	}
+
+	/* Identify which i2c-mux channels are enabled */
+	for_each_child_of_node(i2c_mux, child) {
+		u32 id = 0;
+
+		if (of_node_cmp(child->name, "i2c") != 0)
+			continue;
+
+		of_property_read_u32(child, "reg", &id);
+		if (id >= MAX9286_NUM_GMSL)
+			continue;
+
+		if (!of_device_is_available(child)) {
+			dev_dbg(dev, "Skipping port %u with disabled I2C bus\n", id);
+			continue;
+		}
+
+		i2c_mux_mask |= BIT(id);
+	}
+	of_node_put(child);
+	of_node_put(i2c_mux);
+
 	v4l2_async_notifier_init(&priv->notifier);
 
+	/* Parse the endpoints */
 	for_each_endpoint_of_node(dev->of_node, ep_np) {
 		struct max9286_source *source;
 		struct of_endpoint ep;
@@ -1214,7 +1198,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 		}
 
 		/* Skip if the corresponding GMSL link is unavailable. */
-		if (max9286_check_i2c_bus_by_id(dev, ep.port))
+		if (!(i2c_mux_mask & BIT(ep.port)))
 			continue;
 
 		if (priv->sources[ep.port].fwnode) {
-- 
2.20.1

