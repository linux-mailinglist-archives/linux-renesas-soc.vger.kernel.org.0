Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78C8D1151E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 15:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfLFOF2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 09:05:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42912 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFOF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:05:28 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CF2FA2E;
        Fri,  6 Dec 2019 15:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575641125;
        bh=sHrg5QqErgwcEvTDoXZYgt8UYYVwPL4m/mdTYb9qhF0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DhPjDqoiKafKGtJFG+2lMO0Xhig/BWahfsxjZ6a1xfGVq19kuP7VzNsuOudqEqger
         j3YL+onwcrrb9zBZLRbPmmFcH1D4uoAP5u9bdoGodMiw6fecOaPZgYZK4HwaagJH8x
         kz61z/X46wZCJ98w+VpuggJLpQAiv9NK0iwxQ7Zo=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] media: i2c: max9286: Provide optional enable-gpio
Date:   Fri,  6 Dec 2019 14:05:20 +0000
Message-Id: <20191206140520.10457-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The MAX9286 has a negated PWDN line which must be raised to enable the
device.  On the Eagle-V3M this pin is connected to a GPIO on the
io_expander.

Provide an enable-gpio dt property to specify the link, and ensure that
the line is handled in the driver accordingly.

This can also provide the abiltiy to manage low power states and
runtime-pm at a later date by fully powering down the chip.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c34e7b5c7447..67065cd99d8d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/fwnode.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
@@ -143,6 +144,7 @@ struct max9286_source {
 
 struct max9286_priv {
 	struct i2c_client *client;
+	struct gpio_desc *gpiod_pwdn;
 	struct v4l2_subdev sd;
 	struct media_pad pads[MAX9286_N_PADS];
 	struct regulator *regulator;
@@ -1044,6 +1046,14 @@ static int max9286_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_pwdn))
+		return PTR_ERR(priv->gpiod_pwdn);
+
+	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
+
 	/*
 	 * It is possible to set up the power regulator from the GPIO lines,
 	 * so it needs to be set up early.
@@ -1117,6 +1127,9 @@ static int max9286_remove(struct i2c_client *client)
 	regulator_put(priv->regulator);
 
 	max9286_cleanup_dt(priv);
+
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
+
 	kfree(priv);
 
 	return 0;
-- 
2.20.1

