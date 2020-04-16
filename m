Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E874C1ABE1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504911AbgDPKkA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:40:00 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:36017 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504923AbgDPKjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:39:00 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B647A60018;
        Thu, 16 Apr 2020 10:38:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 17/20] sqaush! max9286: Remove poc_enabled workaround
Date:   Thu, 16 Apr 2020 12:40:49 +0200
Message-Id: <20200416104052.2643098-18-jacopo+renesas@jmondi.org>
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

This boolean is a flag used to handle the regulator when our
multi-max9286 workaround is in place.  It shouldn't be in the upstream
driver, and is moved out.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 6d63b4ca0a42..69e81b879a9b 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -149,7 +149,6 @@ struct max9286_priv {
 	struct v4l2_subdev sd;
 	struct media_pad pads[MAX9286_N_PADS];
 	struct regulator *regulator;
-	bool poc_enabled;
 
 	struct gpio_chip gpio;
 	u8 gpio_state;
@@ -1060,8 +1059,6 @@ static int max9286_init(struct device *dev)
 		return ret;
 	}
 
-	priv->poc_enabled = true;
-
 	ret = max9286_setup(priv);
 	if (ret) {
 		dev_err(dev, "Unable to setup max9286\n");
@@ -1093,7 +1090,6 @@ static int max9286_init(struct device *dev)
 	max9286_v4l2_unregister(priv);
 err_regulator:
 	regulator_disable(priv->regulator);
-	priv->poc_enabled = false;
 
 	return ret;
 }
@@ -1318,8 +1314,7 @@ static int max9286_remove(struct i2c_client *client)
 
 	max9286_v4l2_unregister(priv);
 
-	if (priv->poc_enabled)
-		regulator_disable(priv->regulator);
+	regulator_disable(priv->regulator);
 
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
 
-- 
2.26.0

