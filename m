Return-Path: <linux-renesas-soc+bounces-11623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E29F8F1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2183418975AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBDB1BC07B;
	Fri, 20 Dec 2024 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TDC1c0IL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F71BC073
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687408; cv=none; b=PBf40Q3uiRQAeUoVXLMBB/84oPAJ/ux3B0ygN0Xkk5qUqyDgDvIhDbYbXZqUEscGtBHRHT1dFHiz1uTF6TZTQrRBCu7x1HWwtXsJ6FKnPplu+7hGQ4USMM6w8FEjcPEM0b7lomdLop4s0HnXR7ZCN47TMKvac5uC2AVg79Xe7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687408; c=relaxed/simple;
	bh=dWv/f9EpETM6+pvMWaSQENrIdrJUWlSaMx0ZEZywDZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WyInvb6mAZ7nQQ1hkezmmoHMJSSFDDAGznCGxBLjZD94NrJL7+d5kSftH0ACJLbLWY0N3U72TwqScIamrkhsRTWjlMRnopcIMwLXOAwY6uxigI/x5x/g9iO8DjtI9iOLs1OiXh2q71kAMlVAbsji+4cjeni62S0OIjE1CVP7cow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TDC1c0IL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Lp0Yvbxa9B0vQR
	q+y2kLJx19vNtF2icxGpIwqknGa1s=; b=TDC1c0ILSa8u3aaXahdteDYh5mpchR
	KM83+pun7aKreCW4kUnKfcBTfAwNLA8hTp5nyWjtfynlicyUAYWS5UtIVxdBN9/t
	CdiPV8JyCqOVwt9YK51vpLl792ka/faPHlTfA3Y2XZR5N46uQJv6NfNAHXAFtAoB
	Ogcc0Pm6Yn6Wa8qHPHNVPoMo/JED3NHS5/8d+AZPl5zI+1sCFG3PxoIzCnqpAcox
	OOyplQBelrUAo/fvsEmZ/8R0K6lC7EyH4x02jgu4dk2aegBmf1sbbJXpEsVZd+5w
	c05IEtgJSGVZgKGWjcYm8uI9tyAqsYM5VY8BjPsdBX3Kt4cOjfxWYP/g==
Received: (qmail 956462 invoked from network); 20 Dec 2024 10:36:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 10:36:40 +0100
X-UD-Smtp-Session: l3s3148p1@KvJMYrApLKUujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
Date: Fri, 20 Dec 2024 10:36:34 +0100
Message-Id: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce I3C support by defining I3C accessors for regmap and
implementing an I3C driver. Enable I3C for the NXP P3T1755.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* don't parse i2c_device_id for a suitable sensor name but copy this
  information to a specific struct for I3C devices
  (frankly, I liked the previous solution better)

* not really a change. I decided against using cpu_to_be/le* helpers.
  It looks clumsy when operating on an array of u8 with them IMHO.

 drivers/hwmon/Kconfig |   2 +
 drivers/hwmon/lm75.c  | 121 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index dd376602f3f1..86897b4d105f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1412,7 +1412,9 @@ config SENSORS_LM73
 config SENSORS_LM75
 	tristate "National Semiconductor LM75 and compatibles"
 	depends on I2C
+	depends on I3C || !I3C
 	select REGMAP_I2C
+	select REGMAP_I3C if I3C
 	help
 	  If you say yes here you get support for one common type of
 	  temperature sensor chip, with models including:
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 8b4f324524da..d95a3c6c245c 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
+#include <linux/i3c/device.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -112,6 +113,8 @@ struct lm75_data {
 	unsigned int			sample_time;	/* In ms */
 	enum lm75_type			kind;
 	const struct lm75_params	*params;
+	u8				reg_buf[1];
+	u8				val_buf[3];
 };
 
 /*-----------------------------------------------------------------------*/
@@ -606,6 +609,77 @@ static const struct regmap_bus lm75_i2c_regmap_bus = {
 	.reg_write = lm75_i2c_reg_write,
 };
 
+static int lm75_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct i3c_device *i3cdev = context;
+	struct lm75_data *data = i3cdev_get_drvdata(i3cdev);
+	struct i3c_priv_xfer xfers[] = {
+		{
+			.rnw = false,
+			.len = 1,
+			.data.out = data->reg_buf,
+		},
+		{
+			.rnw = true,
+			.len = 2,
+			.data.out = data->val_buf,
+		},
+	};
+	int ret;
+
+	data->reg_buf[0] = reg;
+
+	if (reg == LM75_REG_CONF && !data->params->config_reg_16bits)
+		xfers[1].len--;
+
+	ret = i3c_device_do_priv_xfers(i3cdev, xfers, 2);
+	if (ret < 0)
+		return ret;
+
+	if (reg == LM75_REG_CONF && !data->params->config_reg_16bits)
+		*val = data->val_buf[0];
+	else if (reg == LM75_REG_CONF)
+		*val = data->val_buf[0] | (data->val_buf[1] << 8);
+	else
+		*val = data->val_buf[1] | (data->val_buf[0] << 8);
+
+	return 0;
+}
+
+static int lm75_i3c_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i3c_device *i3cdev = context;
+	struct lm75_data *data = i3cdev_get_drvdata(i3cdev);
+	struct i3c_priv_xfer xfers[] = {
+		{
+			.rnw = false,
+			.len = 3,
+			.data.out = data->val_buf,
+		},
+	};
+
+	data->val_buf[0] = reg;
+
+	if (reg == PCT2075_REG_IDLE ||
+	    (reg == LM75_REG_CONF && !data->params->config_reg_16bits)) {
+		xfers[0].len--;
+		data->val_buf[1] = val & 0xff;
+	} else if (reg == LM75_REG_CONF) {
+		data->val_buf[1] = val & 0xff;
+		data->val_buf[2] = (val >> 8) & 0xff;
+	} else {
+		data->val_buf[1] = (val >> 8) & 0xff;
+		data->val_buf[2] = val & 0xff;
+	}
+
+	return i3c_device_do_priv_xfers(i3cdev, xfers, 1);
+}
+
+static const struct regmap_bus lm75_i3c_regmap_bus = {
+	.reg_read = lm75_i3c_reg_read,
+	.reg_write = lm75_i3c_reg_write,
+};
+
 static const struct regmap_config lm75_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -626,7 +700,7 @@ static void lm75_remove(void *data)
 }
 
 static int lm75_generic_probe(struct device *dev, const char *name,
-			      const void *kind_ptr, int irq, struct regmap *regmap)
+			      enum lm75_type kind, int irq, struct regmap *regmap)
 {
 	struct device *hwmon_dev;
 	struct lm75_data *data;
@@ -639,7 +713,7 @@ static int lm75_generic_probe(struct device *dev, const char *name,
 	/* needed by custom regmap callbacks */
 	dev_set_drvdata(dev, data);
 
-	data->kind = (uintptr_t)kind_ptr;
+	data->kind = kind;
 	data->regmap = regmap;
 
 	err = devm_regulator_get_enable(dev, "vs");
@@ -711,7 +785,7 @@ static int lm75_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return lm75_generic_probe(dev, client->name, i2c_get_match_data(client),
+	return lm75_generic_probe(dev, client->name, (uintptr_t)i2c_get_match_data(client),
 				  client->irq, regmap);
 }
 
@@ -750,6 +824,37 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm75_i2c_ids);
 
+struct lm75_i3c_device {
+	enum lm75_type type;
+	const char *name;
+};
+
+static const struct lm75_i3c_device lm75_i3c_p3t1755 = {
+	.name = "p3t1755",
+	.type = p3t1755,
+};
+
+static const struct i3c_device_id lm75_i3c_ids[] = {
+	I3C_DEVICE(0x011b, 0x152a, &lm75_i3c_p3t1755),
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(i3c, lm75_i3c_ids);
+
+static int lm75_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	const struct lm75_i3c_device *id_data;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init(dev, &lm75_i3c_regmap_bus, i3cdev, &lm75_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	id_data = i3c_device_match_id(i3cdev, lm75_i3c_ids)->data;
+
+	return lm75_generic_probe(dev, id_data->name, id_data->type, 0, regmap);
+}
+
 static const struct of_device_id __maybe_unused lm75_of_match[] = {
 	{
 		.compatible = "adi,adt75",
@@ -1008,7 +1113,15 @@ static struct i2c_driver lm75_i2c_driver = {
 	.address_list	= normal_i2c,
 };
 
-module_i2c_driver(lm75_i2c_driver);
+static struct i3c_driver lm75_i3c_driver = {
+	.driver = {
+		.name = "lm75_i3c",
+	},
+	.probe = lm75_i3c_probe,
+	.id_table = lm75_i3c_ids,
+};
+
+module_i3c_i2c_driver(lm75_i3c_driver, &lm75_i2c_driver)
 
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_DESCRIPTION("LM75 driver");
-- 
2.39.2


