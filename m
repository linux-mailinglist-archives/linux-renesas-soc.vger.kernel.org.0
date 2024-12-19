Return-Path: <linux-renesas-soc+bounces-11594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F459F8829
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F117716234B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A44A1D8DF6;
	Thu, 19 Dec 2024 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hT2p9NjT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1078F4A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648957; cv=none; b=uoAvHSWkypFEon0VjqUVgJrCOxw7dJGQjVm4exH15EHwcziiONex2+RUh6EHcPIPBeZTD0zobxGCaTyl4ELnUNYUHYrxCmtCDjM0y5B02NxroQAGj+XIh/pjbJZqocKwNfTBYTFlpbM4m59ftNw6Ohq50qeIwgtW5DG7+u16MLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648957; c=relaxed/simple;
	bh=IYutn8QVXUq1NW9w+oqTmRp9Vvw03U0/CgCCOfRgy4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5Wr0K2xa7RvPKwhF08zDeY48lgYEBBE87LkFXs1OCfDXrLFxfmAphlJ0KjK8I/RnqYPKkFqNaDOkQfLX7IHxKiJDQYo21QGcqilaiN906+iK3i0/t6eOwKr3B9oQiKj5PP2E6ps2B3st5Ae8XAIs/mZaicNHcZm2FIKSXCxaE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hT2p9NjT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=cCevjPCP/5BMXHpNkBn3G/0jFCQhE2W4vuag2CSBZ0Q=; b=hT2p9N
	jT4jjeoZfhuLYDU+al4pNn4PY99Qk2R4/7tkrTt5eW5ZqcK4vHHburwF5eyk1AdK
	KLkx/HCikMGoPL1v96JteC0FzVuCpkZLPwCSmGjs4mwtFVLjGyQePmuEtDDwtd9q
	fZWh9ZPw+KSls3CJ0PCqg61OrWi53XYLXq7sfJUcU1wFO3robZgIvLPaUqzDu1/z
	S/1cUTUG6piu9v6TfCrCWbBqgOJbTCJP1QvmznnCYRlonTSFzYKvKWUQIbmDZnZg
	fym7/8uhpznYrh/hZTISJuCBcWrpj9thVkToAKeE2wA0JUkW8CUmmGZmKj6+HJ9N
	94+za9fv+3bD7l1Q==
Received: (qmail 826711 invoked from network); 19 Dec 2024 23:55:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:51 +0100
X-UD-Smtp-Session: l3s3148p1@7fOSbqcpKKkujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 5/5] hwmon: (lm75) add I3C support for P3T1755
Date: Thu, 19 Dec 2024 23:55:27 +0100
Message-ID: <20241219225522.3490-12-wsa+renesas@sang-engineering.com>
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

Introduce I3C support by defining I3C accessors for regmap and
implementing an I3C driver. Enable I3C for the NXP P3T1755.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Two things I would like to discuss:

- Shall we reuse i2c_device_id's to get a proper name for the chip?
  Looks strange, but adding all the info again for I3C looks strange as
  well

- are there some suitable kernel helpers for dealing with big/little
  endianess in lm75_i3c_regmap_bus? Note: I also tried to use the
  non-*_reg callbacks for the regmap bus. But the constified
  void-pointers make it ugly as we need to change buffers because some
  registers are big endian and some little endian.

 drivers/hwmon/Kconfig |   2 +
 drivers/hwmon/lm75.c  | 114 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 1 deletion(-)

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
index 8b4f324524da..2979f1746585 100644
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
+		data->val_buf[2] = val & 0xff;
+		data->val_buf[1] = (val >> 8) & 0xff;
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
@@ -750,6 +824,36 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm75_i2c_ids);
 
+static const struct i3c_device_id lm75_i3c_ids[] = {
+	I3C_DEVICE(0x011b, 0x152a, (void *)p3t1755),
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(i3c, lm75_i3c_ids);
+
+static int lm75_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	const struct i3c_device_id *id;
+	struct regmap *regmap;
+	const char *name;
+	unsigned int i;
+
+	regmap = devm_regmap_init(dev, &lm75_i3c_regmap_bus, i3cdev, &lm75_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	id = i3c_device_match_id(i3cdev, lm75_i3c_ids);
+
+	/* Reuse i2c_device_ids is OK? Or do we want a third copy of this data in lm75_i3c_ids? */
+	for (i = 0; lm75_i2c_ids[i].name[0]; i++)
+		if ((kernel_ulong_t)id->data == lm75_i2c_ids[i].driver_data)
+			break;
+
+	name = lm75_i2c_ids[i].name[0] ? lm75_i2c_ids[i].name : "lm75compatible";
+
+	return lm75_generic_probe(dev, name, id->data, 0, regmap);
+}
+
 static const struct of_device_id __maybe_unused lm75_of_match[] = {
 	{
 		.compatible = "adi,adt75",
@@ -1008,7 +1112,15 @@ static struct i2c_driver lm75_i2c_driver = {
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
2.45.2


