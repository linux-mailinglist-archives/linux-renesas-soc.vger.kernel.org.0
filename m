Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E19121179
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfLPROX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:23 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43547 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfLPROW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:22 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C9DCA4000D;
        Mon, 16 Dec 2019 17:14:20 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 08/11] media: i2c: max9286: Move link setup to completion
Date:   Mon, 16 Dec 2019 18:16:17 +0100
Message-Id: <20191216171620.372683-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The max9286 async notifier is a sub-notifier which does not support a
'complete' callback.

In order to properly complete the reverse channel configuration, we need
to perform operations after all remote serializers have completed their
probe.

Keep track of how many serializers have probed, and once all the
expected ones have completed its initialization:
1) Compensate the reverse channel high threshold
2) Verify that all expected control links are enabled
3) Disable i2c auto-ack

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 3c2c1f506983..f75c97ef87a8 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -166,6 +166,7 @@ struct max9286_priv {
 	unsigned int nsources;
 	unsigned int source_mask;
 	unsigned int route_mask;
+	unsigned int bound_sources;
 	unsigned int csi2_data_lanes;
 	struct max9286_source sources[MAX9286_NUM_GMSL];
 	struct v4l2_async_notifier notifier;
@@ -570,6 +571,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 
 	source->sd = subdev;
 	src_pad = ret;
+	priv->bound_sources |= BIT(index);
 
 	ret = media_create_pad_link(&source->sd->entity, src_pad,
 				    &priv->sd.entity, index,
@@ -585,6 +587,25 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	dev_dbg(&priv->client->dev, "Bound %s pad: %u on index %u\n",
 		subdev->name, src_pad, index);
 
+	if (priv->bound_sources != priv->source_mask)
+		return 0;
+
+	/*
+	 * All enabled sources have probed and enabled their reverse control
+	 * channels:
+	 *
+	 * - Increase the reverse channel amplitude to 170mV to accommodate the
+	 *   high threshold enabled by the serializer driver.
+	 * - Verify all configuration links are properly detected
+	 * - Disable auto-ack as communication on the control channel are now
+	 *   stable.
+	 */
+	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
+		      MAX9286_REV_AMP_X);
+	usleep_range(2000, 2500);
+	max9286_check_config_link(priv, priv->source_mask);
+	max9286_configure_i2c(priv, false);
+
 	return 0;
 }
 
@@ -876,11 +897,6 @@ static int max9286_setup(struct max9286_priv *priv)
 	 */
 	usleep_range(2000, 5000);
 
-	/*
-	 * Check to see if the expected configuration links are up.
-	 */
-	max9286_check_config_link(priv, priv->source_mask);
-
 	return 0;
 }
 
@@ -1042,12 +1058,6 @@ static int max9286_init(struct device *dev, void *data)
 		goto err_subdev_unregister;
 	}
 
-	/*
-	 * Re-configure I2C with local acknowledge disabled after cameras
-	 * have probed.
-	 */
-	max9286_configure_i2c(priv, false);
-
 	/* Leave the mux channels disabled until they are selected. */
 	max9286_i2c_mux_close(priv);
 
-- 
2.24.0

