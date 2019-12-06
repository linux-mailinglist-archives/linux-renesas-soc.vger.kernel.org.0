Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 803451151E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 15:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfLFOF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 09:05:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42906 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbfLFOF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:05:27 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23D6B99A;
        Fri,  6 Dec 2019 15:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575641125;
        bh=CkF+cjiD63BZsJ7gNtqHwKT4AeGU/QVAVg8itjpe8VE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mjqpDLutDk5QxISkdNPYczfzEEVX+9kyirtzYiDr3S0h9hPN7VIKpSDGs5I1yBE+r
         8MEoaXE8c6mcYDxN8NL7kPKvDz/jhhcezpziGjutaO3DZmal2z2G1FezCiy7klg/TC
         TmgDJRpGznJnXHZYmlJvUjnEpOYg8PIe+veqpkC8=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] media: i2c: max9286: Add GPIO chip controller
Date:   Fri,  6 Dec 2019 14:05:19 +0000
Message-Id: <20191206140520.10457-2-kieran.bingham@ideasonboard.com>
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

Provide a GPIO chip to control the two output lines available on the
MAX9286.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 6ea08fd87811..c34e7b5c7447 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/fwnode.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
@@ -58,6 +59,8 @@
 #define MAX9286_HVSRC_D0		(2 << 0)
 #define MAX9286_HVSRC_D14		(1 << 0)
 #define MAX9286_HVSRC_D18		(0 << 0)
+/* Register 0x0f */
+#define MAX9286_0X0F_RESERVED		BIT(3)
 /* Register 0x12 */
 #define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
 #define MAX9286_CSIDBL			BIT(5)
@@ -145,6 +148,9 @@ struct max9286_priv {
 	struct regulator *regulator;
 	bool poc_enabled;
 
+	struct gpio_chip gpio;
+	u8 gpio_state;
+
 	struct i2c_mux_core *mux;
 	unsigned int mux_channel;
 	bool mux_open;
@@ -712,6 +718,60 @@ static const struct of_device_id max9286_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, max9286_dt_ids);
 
+static void max9286_gpio_set(struct gpio_chip *chip,
+			     unsigned int offset, int value)
+{
+	struct max9286_priv *priv = gpiochip_get_data(chip);
+
+	if (value)
+		priv->gpio_state |= BIT(offset);
+	else
+		priv->gpio_state &= ~BIT(offset);
+
+	max9286_write(priv, 0x0f, MAX9286_0X0F_RESERVED | priv->gpio_state);
+}
+
+static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct max9286_priv *priv = gpiochip_get_data(chip);
+
+	return priv->gpio_state & BIT(offset);
+}
+
+static int max9286_gpio(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct gpio_chip *gpio = &priv->gpio;
+	int ret;
+
+	static const char * const names[] = {
+		"GPIO0OUT",
+		"GPIO1OUT",
+	};
+
+	/* Configure the GPIO */
+	gpio->label = dev_name(dev);
+	gpio->parent = dev;
+	gpio->owner = THIS_MODULE;
+	gpio->of_node = dev->of_node;
+	gpio->ngpio = 2;
+	gpio->set = max9286_gpio_set;
+	gpio->get = max9286_gpio_get;
+	gpio->can_sleep = true;
+	gpio->names = names;
+
+	/* GPIO values default to high */
+	priv->gpio_state = BIT(0) | BIT(1);
+
+	ret = devm_gpiochip_add_data(dev, gpio, priv);
+	if (ret)
+		dev_err(dev, "Unable to create gpio_chip\n");
+
+	dev_err(dev, "Created gpio_chip for MAX9286\n");
+
+	return ret;
+}
+
 static int max9286_init(struct device *dev)
 {
 	struct max9286_priv *priv;
@@ -984,6 +1044,14 @@ static int max9286_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	/*
+	 * It is possible to set up the power regulator from the GPIO lines,
+	 * so it needs to be set up early.
+	 */
+	ret = max9286_gpio(priv);
+	if (ret)
+		return ret;
+
 	priv->regulator = regulator_get(&client->dev, "poc");
 	if (IS_ERR(priv->regulator)) {
 		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
-- 
2.20.1

