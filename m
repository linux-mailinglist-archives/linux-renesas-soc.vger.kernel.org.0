Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D771ABE15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505257AbgDPKji (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:39:38 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:36017 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505132AbgDPKi0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:26 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7C13B60013;
        Thu, 16 Apr 2020 10:38:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 13/20] squash! max9286: Implement Pixelrate control
Date:   Thu, 16 Apr 2020 12:40:45 +0200
Message-Id: <20200416104052.2643098-14-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Determine the (CSI2) pixel rate control by providing a control to read,
and checking the rate from the upstream camera sensors, and their
appropriate formats.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 38 +++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 49b4d1830747..2d71205a1aad 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -155,6 +155,7 @@ struct max9286_priv {
 	bool mux_open;
 
 	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *pixelrate;
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
 
@@ -429,6 +430,11 @@ static int max9286_check_config_link(struct max9286_priv *priv,
  * V4L2 Subdev
  */
 
+static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
+{
+	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
+}
+
 static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *subdev,
 				struct v4l2_async_subdev *asd)
@@ -664,6 +670,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
+	s64 pixelrate;
 
 	if (format->pad >= MAX9286_SRC_PAD)
 		return -EINVAL;
@@ -688,6 +695,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	*cfg_fmt = format->format;
 	mutex_unlock(&priv->mutex);
 
+	/* Update pixel rate for the CSI2 receiver */
+	pixelrate = cfg_fmt->width * cfg_fmt->height
+		  * priv->nsources * 30 /*FPS*/;
+
+	max9286_set_pixelrate(priv, pixelrate);
+
 	return 0;
 }
 
@@ -756,6 +769,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
 	.open = max9286_open,
 };
 
+static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_PIXEL_RATE:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
+	.s_ctrl	= max9286_s_ctrl,
+};
+
 static int max9286_v4l2_register(struct max9286_priv *priv)
 {
 	struct device *dev = &priv->client->dev;
@@ -777,12 +804,11 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&priv->ctrls, 1);
-	/*
-	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
-	 * hardcoded frequency in the BSP CSI-2 receiver driver.
-	 */
-	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
-			  50000000, 50000000, 1, 50000000);
+	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
+					    &max9286_ctrl_ops,
+					    V4L2_CID_PIXEL_RATE,
+					    1, INT_MAX, 1, 50000000);
+
 	priv->sd.ctrl_handler = &priv->ctrls;
 	ret = priv->ctrls.error;
 	if (ret)
-- 
2.26.0

