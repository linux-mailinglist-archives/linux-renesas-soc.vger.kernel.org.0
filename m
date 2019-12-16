Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D5C12027F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfLPK3q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:46 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65722144B;
        Mon, 16 Dec 2019 11:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492177;
        bh=uCh1T2Yfv/ZM/HR/y4pLSjxonu+4j+vpiwmLYsdw3k8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=L3Q4S1N3tqsoZeNiLcpFZfiAMF0wdxY9Kdh56fizijPmo/6irw5H6SWgpqsznMhse
         moAyTixS18wTnDRp/CXQkSoFpY980Qz/H3hnZOuoTrfHf6GeKXmV9EVp6hsSCzs8f+
         VlKISx10WNW1zbKI72d6RP9ram6yg2tsGRjLIZUs=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 13/13] media: i2c: max9286: [Workaround] 'device is bound'
Date:   Mon, 16 Dec 2019 10:29:30 +0000
Message-Id: <20191216102930.5867-14-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

This introduces a local workaround to support multiple MAX9286 devices
on the same I2C bus.

Not for upstream consumption due to device_is_bound being an in kernel
symbol, and requires the module to be a built-in only.

Not-signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 090b6c0f81e9..07d4489183f4 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -942,7 +942,7 @@ static int max9286_gpio(struct max9286_priv *priv)
 	return ret;
 }
 
-static int max9286_init(struct device *dev)
+static int max9286_init(struct device *dev, void *data)
 {
 	struct max9286_priv *priv;
 	struct i2c_client *client;
@@ -1056,6 +1056,25 @@ static int max9286_init(struct device *dev)
 	return ret;
 }
 
+static int max9286_is_bound(struct device *dev, void *data)
+{
+	struct device *this = data;
+	int ret;
+
+	if (dev == this)
+		return 0;
+
+	/* Skip non-max9286 devices. */
+	if (!dev->of_node || !of_match_node(max9286_dt_ids, dev->of_node))
+		return 0;
+
+	ret = device_is_bound(dev);
+	if (!ret)
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+
 static void max9286_cleanup_dt(struct max9286_priv *priv)
 {
 	struct max9286_source *source;
@@ -1281,10 +1300,21 @@ static int max9286_probe(struct i2c_client *client)
 	/* Add any userspace support before we return early. */
 	max9286_debugfs_init(priv);
 
-	ret = max9286_init(&client->dev);
+	ret = device_for_each_child(client->dev.parent, &client->dev,
+				    max9286_is_bound);
+	if (ret)
+		return 0;
+
+	dev_dbg(&client->dev,
+		"All max9286 probed: start initialization sequence\n");
+	ret = device_for_each_child(client->dev.parent, NULL,
+				    max9286_init);
 	if (ret < 0)
 		goto err_regulator;
 
+	/* Leave the mux channels disabled until they are selected. */
+	max9286_i2c_mux_close(priv);
+
 	return 0;
 
 err_regulator:
-- 
2.20.1

