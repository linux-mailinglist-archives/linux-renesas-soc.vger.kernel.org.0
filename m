Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B171ABE14
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504959AbgDPKjh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:39:37 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44277 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505351AbgDPKiZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:25 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 07EB160008;
        Thu, 16 Apr 2020 10:38:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 10/20] squash! max9286: Move multi-device workarounds out of upstream
Date:   Thu, 16 Apr 2020 12:40:42 +0200
Message-Id: <20200416104052.2643098-11-jacopo+renesas@jmondi.org>
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

 - Move multi-device workarounds out of upstream driver
---
 drivers/media/i2c/max9286.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 8f7e8928af56..3fd70ddbcce8 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -911,12 +911,6 @@ static int max9286_setup(struct max9286_priv *priv)
 	return 0;
 }
 
-static const struct of_device_id max9286_dt_ids[] = {
-	{ .compatible = "maxim,max9286" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, max9286_dt_ids);
-
 static void max9286_gpio_set(struct gpio_chip *chip,
 			     unsigned int offset, int value)
 {
@@ -976,10 +970,6 @@ static int max9286_init(struct device *dev)
 	struct i2c_client *client;
 	int ret;
 
-	/* Skip non-max9286 devices. */
-	if (!dev->of_node || !of_match_node(max9286_dt_ids, dev->of_node))
-		return 0;
-
 	client = to_i2c_client(dev);
 	priv = i2c_get_clientdata(client);
 
@@ -1256,6 +1246,12 @@ static int max9286_remove(struct i2c_client *client)
 	return 0;
 }
 
+static const struct of_device_id max9286_dt_ids[] = {
+	{ .compatible = "maxim,max9286" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max9286_dt_ids);
+
 static const struct i2c_device_id max9286_id[] = {
 	{ "max9286", 0 },
 	{ }
-- 
2.26.0

