Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606492F66BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 18:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbhANRF3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 12:05:29 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:32935 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbhANRFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 12:05:23 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 68B0940018;
        Thu, 14 Jan 2021 17:04:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 5/5] media: i2c: max9286: Configure reverse channel amplitude
Date:   Thu, 14 Jan 2021 18:04:29 +0100
Message-Id: <20210114170429.139762-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Adjust the initial reverse channel amplitude parsing from
firmware interface the 'maxim,reverse-channel-microvolt'
property.

This change is required for both rdacm20 and rdacm21 camera
modules to be correctly probed when used in combination with
the max9286 deserializer.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ba84a2d7e29b..46c4e7b3c40b 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,6 +163,8 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
+	u32 reverse_channel_mv;
+
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
 
@@ -556,10 +558,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * All enabled sources have probed and enabled their reverse control
 	 * channels:
 	 *
+	 * - Increase the reverse channel amplitude to compensate for the
+	 *   remote ends high threshold, if not done already
 	 * - Verify all configuration links are properly detected
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
+	if (priv->reverse_channel_mv < 170)
+		max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
@@ -966,7 +972,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, 170);
+	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1130,6 +1136,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	struct device_node *i2c_mux;
 	struct device_node *node = NULL;
 	unsigned int i2c_mux_mask = 0;
+	u32 reverse_channel_microvolt;
 
 	/* Balance the of_node_put() performed by of_find_node_by_name(). */
 	of_node_get(dev->of_node);
@@ -1220,6 +1227,20 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	/*
+	 * Parse the initial value of the reverse channel amplitude from
+	 * the firmware interface and convert it to millivolts.
+	 *
+	 * Default it to 170mV for backward compatibility with DTBs that do not
+	 * provide the property.
+	 */
+	if (of_property_read_u32(dev->of_node,
+				 "maxim,reverse-channel-microvolt",
+				 &reverse_channel_microvolt))
+		priv->reverse_channel_mv = 170;
+	else
+		priv->reverse_channel_mv = reverse_channel_microvolt / 1000U;
+
 	priv->route_mask = priv->source_mask;
 
 	return 0;
-- 
2.29.2

