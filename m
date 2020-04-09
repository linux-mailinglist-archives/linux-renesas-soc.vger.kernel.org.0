Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183D31A33D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDIMMQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:16 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6AC1DA9;
        Thu,  9 Apr 2020 14:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434333;
        bh=As1xFdsW6xjPMs+VepKhf68/IQBQZt1bXv7lxBl8VvI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hZZlCc/a+DU6H/gxn6LbJl1m/0zGP66CSH625RilPQZUJSmDhz5CJD648spMr98fq
         P1LooPHDdS1THiETtiIAhB/PGv3QB1g7r4NpX5Kmpw+cpxlKKeAE8y3fCoTT4NEedy
         465CMexHVtz3Smi5BSCWoMpclFEgSN8NgWIQdzBo=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 10/13] squash! max9286: Implement Pixelrate control
Date:   Thu,  9 Apr 2020 13:11:59 +0100
Message-Id: <20200409121202.11130-11-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Determine the (CSI2) pixel rate control by providing a control to read,
and checking the rate from the upstream camera sensors, and their
appropriate formats.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 44 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 17830c362a50..008a93910300 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -155,6 +155,7 @@ struct max9286_priv {
 	bool mux_open;
 
 	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *pixelrate;
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
 
@@ -631,6 +632,16 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
+static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
+{
+	if (!priv->pixelrate)
+		return -EINVAL;
+
+	dev_err(&priv->client->dev, "Setting pixel rate to %lld\n", rate);
+
+	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
+}
+
 static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_pad_config *cfg,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -664,6 +675,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
+	s64 pixelrate;
 
 	if (format->pad >= MAX9286_SRC_PAD)
 		return -EINVAL;
@@ -688,6 +700,12 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
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
 
@@ -756,6 +774,20 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
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
@@ -777,12 +809,12 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&priv->ctrls, 1);
-	/*
-	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
-	 * hardcoded frequency in the BSP CSI-2 receiver driver.
-	 */
-	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
-			  50000000, 50000000, 1, 50000000);
+
+	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
+					    &max9286_ctrl_ops,
+					    V4L2_CID_PIXEL_RATE,
+					    1, INT_MAX, 1, 50000000);
+
 	priv->sd.ctrl_handler = &priv->ctrls;
 	ret = priv->ctrls.error;
 	if (ret)
-- 
2.20.1

