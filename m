Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37B81ABE21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505081AbgDPKkJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:40:09 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34761 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505338AbgDPKiZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:25 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5B6E160022;
        Thu, 16 Apr 2020 10:38:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 12/20] sqaush! max9286: Lock format changes
Date:   Thu, 16 Apr 2020 12:40:44 +0200
Message-Id: <20200416104052.2643098-13-jacopo+renesas@jmondi.org>
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

Provide a mutex to protect against format changes on the pads.  The
mutex can also be used to protect against control changes, or other
userspace facing interactions as necessary

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 84173b8c2706..49b4d1830747 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -18,6 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -157,6 +158,9 @@ struct max9286_priv {
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
 
+	/* Protects controls and fmt structures */
+	struct mutex mutex;
+
 	unsigned int nsources;
 	unsigned int source_mask;
 	unsigned int route_mask;
@@ -680,7 +684,9 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	if (!cfg_fmt)
 		return -EINVAL;
 
+	mutex_lock(&priv->mutex);
 	*cfg_fmt = format->format;
+	mutex_unlock(&priv->mutex);
 
 	return 0;
 }
@@ -699,7 +705,9 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 	if (!cfg_fmt)
 		return -EINVAL;
 
+	mutex_lock(&priv->mutex);
 	format->format = *cfg_fmt;
+	mutex_unlock(&priv->mutex);
 
 	return 0;
 }
@@ -1148,6 +1156,8 @@ static int max9286_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	mutex_init(&priv->mutex);
+
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
-- 
2.26.0

