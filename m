Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5E08121178
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLPROW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:22 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:45823 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLPROW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:22 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AC34F4000A;
        Mon, 16 Dec 2019 17:14:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 07/11] media: i2c: max9286: Move notifiers operations
Date:   Mon, 16 Dec 2019 18:16:16 +0100
Message-Id: <20191216171620.372683-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In preparation to move the call to max9286_check_config_link() in
the notifier's bound callback, move the notifier's ops below the
max9286_check_config_link() function.

Cosmetic change, no functional changes intended.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 114 ++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ab84f0fa66dc..3c2c1f506983 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -445,63 +445,6 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
 	usleep_range(3000, 5000);
 }
 
-/* -----------------------------------------------------------------------------
- * V4L2 Subdev
- */
-
-static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
-				struct v4l2_subdev *subdev,
-				struct v4l2_async_subdev *asd)
-{
-	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
-	struct max9286_source *source = asd_to_max9286_source(asd);
-	unsigned int index = to_index(priv, source);
-	unsigned int src_pad;
-	int ret;
-
-	ret = media_entity_get_fwnode_pad(&subdev->entity,
-					  source->fwnode,
-					  MEDIA_PAD_FL_SOURCE);
-	if (ret < 0) {
-		dev_err(&priv->client->dev,
-			"Failed to find pad for %s\n", subdev->name);
-		return ret;
-	}
-
-	source->sd = subdev;
-	src_pad = ret;
-
-	ret = media_create_pad_link(&source->sd->entity, src_pad,
-				    &priv->sd.entity, index,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret) {
-		dev_err(&priv->client->dev,
-			"Unable to link %s:%u -> %s:%u\n",
-			source->sd->name, src_pad, priv->sd.name, index);
-		return ret;
-	}
-
-	dev_dbg(&priv->client->dev, "Bound %s pad: %u on index %u\n",
-		subdev->name, src_pad, index);
-
-	return 0;
-}
-
-static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
-				  struct v4l2_subdev *subdev,
-				  struct v4l2_async_subdev *asd)
-{
-	struct max9286_source *source = asd_to_max9286_source(asd);
-
-	source->sd = NULL;
-}
-
-static const struct v4l2_async_notifier_operations max9286_notify_ops = {
-	.bound = max9286_notify_bound,
-	.unbind = max9286_notify_unbind,
-};
-
 /*
  * max9286_check_config_link() - Detect and wait for configuration links
  *
@@ -602,6 +545,63 @@ static int max9286_check_video_links(struct max9286_priv *priv)
 	return 0;
 }
 
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev
+ */
+
+static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_subdev *asd)
+{
+	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
+	struct max9286_source *source = asd_to_max9286_source(asd);
+	unsigned int index = to_index(priv, source);
+	unsigned int src_pad;
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&subdev->entity,
+					  source->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(&priv->client->dev,
+			"Failed to find pad for %s\n", subdev->name);
+		return ret;
+	}
+
+	source->sd = subdev;
+	src_pad = ret;
+
+	ret = media_create_pad_link(&source->sd->entity, src_pad,
+				    &priv->sd.entity, index,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Unable to link %s:%u -> %s:%u\n",
+			source->sd->name, src_pad, priv->sd.name, index);
+		return ret;
+	}
+
+	dev_dbg(&priv->client->dev, "Bound %s pad: %u on index %u\n",
+		subdev->name, src_pad, index);
+
+	return 0;
+}
+
+static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *subdev,
+				  struct v4l2_async_subdev *asd)
+{
+	struct max9286_source *source = asd_to_max9286_source(asd);
+
+	source->sd = NULL;
+}
+
+static const struct v4l2_async_notifier_operations max9286_notify_ops = {
+	.bound = max9286_notify_bound,
+	.unbind = max9286_notify_unbind,
+};
+
 static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
-- 
2.24.0

