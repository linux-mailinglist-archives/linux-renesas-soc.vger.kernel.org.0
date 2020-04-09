Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 340631A33D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDIMMP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDIMMP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:15 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57E32198C;
        Thu,  9 Apr 2020 14:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434332;
        bh=JbIOqp55h9Iyjdgg6lrfMYhU0LSQfUFZYn8XYjGi5Rc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HIoPxHitps3y7/iBR6yf58NxPdguzXwUbnMpVm6mIkp26VCPw2tFyILHX/suZuim9
         jJXoMcv53+wVy3uXPKwu9316ZMbkMgwMn2j9nLxKQ+s2eMMpgfgGi6sZ205j6GUySI
         4HGl3ahVvAHCN2XFVYPh/Ke4sPrPCsaiEB5ftrac=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 09/13] sqaush! max9286: Lock format changes
Date:   Thu,  9 Apr 2020 13:11:58 +0100
Message-Id: <20200409121202.11130-10-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide a mutex to protect against format changes on the pads.  The
mutex can also be used to protect against control changes, or other
userspace facing interactions as necessary

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 911323d6d3c4..17830c362a50 100644
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
2.20.1

