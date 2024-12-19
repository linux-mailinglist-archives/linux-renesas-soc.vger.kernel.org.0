Return-Path: <linux-renesas-soc+bounces-11593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAF9F8828
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CE6016536F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC2E1D79B1;
	Thu, 19 Dec 2024 22:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fdGPzZsG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A651D8E09
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648956; cv=none; b=Ii5uui1iuB6iJBNq67vHnpJ96DZJwZq0iWwFN00oF/95x+aVZ3vx6JocfJ+gLiLXW+kmAKHCHXv0KPfbsO72dRC5XIkOhtKExRlG5hokCVQwiiWARyN4ezVXlwARIG6pgKF4R/yfvgMjivk4y5/XX47pyxmUz7BjfP/kkXhvehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648956; c=relaxed/simple;
	bh=vQ/R9ilHEn5q3VaWJzwuPPXkm2APrJFlVGTIYlssav8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM7MANihTCPqkdzImJD9DMZJiTM7NlmqDu5R/VX0FJCEt79mWeooiOmyALFHqpRBlc7rlE0uUqzKLNaqQXsBSh3w6KzjauMABraEcRFuBuyXPr9uttL0IK+Z7AmEfqA7/NKkhDU+zmQcEa+lQbsGhb+LfynS36P4GivEeh7zZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fdGPzZsG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sbDui2BU847sp3+zqR27cxvNTAZScJEEylWUFLTO20Q=; b=fdGPzZ
	sGE7NrO7faTHHJK5g9Dt7vO/AaVJlZEFjYHyYYuJ5b10XSG2j2zPE3m/YzK4Gcp8
	5JhQWt9Ipg4hdlqk5RKFuE+2/8ZdxXjhCh/PV1HCyhaJMjsdYqc0OJdIKvaxSWY+
	x9TbhPiLzcS0Ugf4GspV3+bFClIp8iGl8OdGGh7IV+IqUT3r/Tu0dNYrSc397ZWw
	RAgf/d8581QiLrjANVaZYMP6wxGaDoxAStajk89rGvwPKAIVLPvbSfebjs9p/pOL
	0b+JxND//JPMG69Cab/DQG2rXtyMEpMyn1qMFG7E2YlFxB8rL9cMAH7Co4MMKHXo
	/Y3PnnK1HYPh/90A==
Received: (qmail 826681 invoked from network); 19 Dec 2024 23:55:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:51 +0100
X-UD-Smtp-Session: l3s3148p1@tJuFbqcpIqkujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 4/5] hwmon: (lm75) separate probe into common and I2C parts
Date: Thu, 19 Dec 2024 23:55:26 +0100
Message-ID: <20241219225522.3490-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put generic probe functionality into a separate function and let the I2C
driver call it. This is a preparation for adding I3C support which will
also use the generic probe function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/lm75.c | 68 +++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 0f034110daed..8b4f324524da 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -601,6 +601,11 @@ static int lm75_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
 	return i2c_smbus_write_word_swapped(client, reg, val);
 }
 
+static const struct regmap_bus lm75_i2c_regmap_bus = {
+	.reg_read = lm75_i2c_reg_read,
+	.reg_write = lm75_i2c_reg_write,
+};
+
 static const struct regmap_config lm75_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -613,11 +618,6 @@ static const struct regmap_config lm75_regmap_config = {
 	.use_single_write = true,
 };
 
-static const struct regmap_bus lm75_i2c_regmap_bus = {
-	.reg_read = lm75_i2c_reg_read,
-	.reg_write = lm75_i2c_reg_write,
-};
-
 static void lm75_remove(void *data)
 {
 	struct lm75_data *lm75 = data;
@@ -625,17 +625,13 @@ static void lm75_remove(void *data)
 	regmap_write(lm75->regmap, LM75_REG_CONF, lm75->orig_conf);
 }
 
-static int lm75_probe(struct i2c_client *client)
+static int lm75_generic_probe(struct device *dev, const char *name,
+			      const void *kind_ptr, int irq, struct regmap *regmap)
 {
-	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm75_data *data;
 	int status, err;
 
-	if (!i2c_check_functionality(client->adapter,
-			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
-		return -EIO;
-
 	data = devm_kzalloc(dev, sizeof(struct lm75_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -643,17 +639,13 @@ static int lm75_probe(struct i2c_client *client)
 	/* needed by custom regmap callbacks */
 	dev_set_drvdata(dev, data);
 
-	data->kind = (uintptr_t)i2c_get_match_data(client);
+	data->kind = (uintptr_t)kind_ptr;
+	data->regmap = regmap;
 
 	err = devm_regulator_get_enable(dev, "vs");
 	if (err)
 		return err;
 
-	data->regmap = devm_regmap_init(dev, &lm75_i2c_regmap_bus, client,
-					&lm75_regmap_config);
-	if (IS_ERR(data->regmap))
-		return PTR_ERR(data->regmap);
-
 	/* Set to LM75 resolution (9 bits, 1/2 degree C) and range.
 	 * Then tweak to be more precise when appropriate.
 	 */
@@ -679,20 +671,19 @@ static int lm75_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
-							 data, &lm75_chip_info,
-							 NULL);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, name, data,
+							 &lm75_chip_info, NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	if (client->irq) {
+	if (irq) {
 		if (data->params->alarm) {
 			err = devm_request_threaded_irq(dev,
-							client->irq,
+							irq,
 							NULL,
 							&lm75_alarm_handler,
 							IRQF_ONESHOT,
-							client->name,
+							name,
 							hwmon_dev);
 			if (err)
 				return err;
@@ -702,12 +693,29 @@ static int lm75_probe(struct i2c_client *client)
 		}
 	}
 
-	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
+	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), name);
 
 	return 0;
 }
 
-static const struct i2c_device_id lm75_ids[] = {
+static int lm75_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+
+	if (!i2c_check_functionality(client->adapter,
+			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
+		return -EOPNOTSUPP;
+
+	regmap = devm_regmap_init(dev, &lm75_i2c_regmap_bus, client, &lm75_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return lm75_generic_probe(dev, client->name, i2c_get_match_data(client),
+				  client->irq, regmap);
+}
+
+static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ "adt75", adt75, },
 	{ "as6200", as6200, },
 	{ "at30ts74", at30ts74, },
@@ -740,7 +748,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "tmp1075", tmp1075, },
 	{ /* LIST END */ }
 };
-MODULE_DEVICE_TABLE(i2c, lm75_ids);
+MODULE_DEVICE_TABLE(i2c, lm75_i2c_ids);
 
 static const struct of_device_id __maybe_unused lm75_of_match[] = {
 	{
@@ -987,20 +995,20 @@ static const struct dev_pm_ops lm75_dev_pm_ops = {
 #define LM75_DEV_PM_OPS NULL
 #endif /* CONFIG_PM */
 
-static struct i2c_driver lm75_driver = {
+static struct i2c_driver lm75_i2c_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm75",
 		.of_match_table = of_match_ptr(lm75_of_match),
 		.pm	= LM75_DEV_PM_OPS,
 	},
-	.probe		= lm75_probe,
-	.id_table	= lm75_ids,
+	.probe		= lm75_i2c_probe,
+	.id_table	= lm75_i2c_ids,
 	.detect		= lm75_detect,
 	.address_list	= normal_i2c,
 };
 
-module_i2c_driver(lm75_driver);
+module_i2c_driver(lm75_i2c_driver);
 
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_DESCRIPTION("LM75 driver");
-- 
2.45.2


