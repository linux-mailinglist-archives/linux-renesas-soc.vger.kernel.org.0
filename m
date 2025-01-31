Return-Path: <linux-renesas-soc+bounces-12776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8EA23B9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1FA61889C7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF38E158875;
	Fri, 31 Jan 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WDD6JEBf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B076322B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Jan 2025 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317128; cv=none; b=Tv1Xer7qjnPUn5GmCLnpq2P1LLNhrHHCUfjX3TyW/9+9xnZmLCSKAVN8Y2vYQqEv94meprdR72VFrikZBtHI/3MB0aiNNC6udeA6uYmu22cdYtKU8NElXLzvNgJsNzfIhMw9m4f3iMCI3re0VK8QfhxrigIBWWJVMK+5vkKFIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317128; c=relaxed/simple;
	bh=K1TXyVW5bPul3rv1mntw5KppCFA4J3Nw0P1vJbZMmxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gohu1ocKqczjg+Z3EVuukEqszHdR+GFtS7SPRsy0XsgGK6GWRs3Xqva2Lfoutvi2OEVqfx7BjQ1kvEixbo+x7aQwJ9zjO6mHnlDdTvFCnxqRAPJVTBpGztAQJb9cd1C+opYOAz8RPaWpDmybc4UuAzoBYHEc1NovhcICSOqaD7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WDD6JEBf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=k8WpRTQc3VzRF1
	yWfB/ww6H8EJvhuH9q1nfV8TJ5lNE=; b=WDD6JEBfHsraz0az4DLwwJGbGKjQtN
	7AxSRVIOCgKh+gSu4BzjVuSS57aEiNB/UM58qDrrZumhLpXkTgim/AneY1vzKb6M
	0jxEcEPrqjM/d929Oh61AzDKHmD0qkjF6BtkRQuvp7iHWoGX5lT7H2fqFtrTPHzA
	9vml+g99nj9Oj0N5Cgebe+AiOuLpa0BiyxXlXIklPCqmLiOBfxakT9nJqObPKIch
	TCt0TX6mluzSujRjkgvTVw6q7JNXuBBQqwqgJWFzLHDsiOB0xieijgNu+qgguniK
	cfwqG8+07rDuBQB7TVrOjTp23P+3hzE8Y8KQZmfHhbWyTcN21hN6Ud6w==
Received: (qmail 1620055 invoked from network); 31 Jan 2025 10:51:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 10:51:52 +0100
X-UD-Smtp-Session: l3s3148p1@al36ff0srPjUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: (sht3x) Use per-client debugfs entry
Date: Fri, 31 Jan 2025 10:38:33 +0100
Message-ID: <20250131095148.11973-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:

* like previously, only create the file if the serial number could
  be read.
* remove the now superfluous sensor_dir member

Locally build tested only.

 drivers/hwmon/sht3x.c | 67 +++++++------------------------------------
 1 file changed, 11 insertions(+), 56 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 650b0bcc2359..557ad3e7752a 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -44,8 +44,6 @@ static const unsigned char sht3x_cmd_read_status_reg[]         = { 0xf3, 0x2d };
 static const unsigned char sht3x_cmd_clear_status_reg[]        = { 0x30, 0x41 };
 static const unsigned char sht3x_cmd_read_serial_number[]      = { 0x37, 0x80 };
 
-static struct dentry *debugfs;
-
 /* delays for single-shot mode i2c commands, both in us */
 #define SHT3X_SINGLE_WAIT_TIME_HPM  15000
 #define SHT3X_SINGLE_WAIT_TIME_MPM   6000
@@ -167,7 +165,6 @@ struct sht3x_data {
 	enum sht3x_chips chip_id;
 	struct mutex i2c_lock; /* lock for sending i2c commands */
 	struct mutex data_lock; /* lock for updating driver data */
-	struct dentry *sensor_dir;
 
 	u8 mode;
 	const unsigned char *command;
@@ -837,23 +834,7 @@ static int sht3x_write(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static void sht3x_debugfs_init(struct sht3x_data *data)
-{
-	char name[32];
-
-	snprintf(name, sizeof(name), "i2c%u-%02x",
-		 data->client->adapter->nr, data->client->addr);
-	data->sensor_dir = debugfs_create_dir(name, debugfs);
-	debugfs_create_u32("serial_number", 0444,
-			   data->sensor_dir, &data->serial_number);
-}
-
-static void sht3x_debugfs_remove(void *sensor_dir)
-{
-	debugfs_remove_recursive(sensor_dir);
-}
-
-static int sht3x_serial_number_read(struct sht3x_data *data)
+static void sht3x_serial_number_read(struct sht3x_data *data)
 {
 	int ret;
 	char buffer[SHT3X_RESPONSE_LENGTH];
@@ -864,11 +845,12 @@ static int sht3x_serial_number_read(struct sht3x_data *data)
 				      buffer,
 				      SHT3X_RESPONSE_LENGTH, 0);
 	if (ret)
-		return ret;
+		return;
 
 	data->serial_number = (buffer[0] << 24) | (buffer[1] << 16) |
 			      (buffer[3] << 8) | buffer[4];
-	return ret;
+
+	debugfs_create_u32("serial_number", 0444, client->debugfs, &data->serial_number);
 }
 
 static const struct hwmon_ops sht3x_ops = {
@@ -930,28 +912,14 @@ static int sht3x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = sht3x_serial_number_read(data);
-	if (ret) {
-		dev_dbg(dev, "unable to read serial number\n");
-	} else {
-		sht3x_debugfs_init(data);
-		ret = devm_add_action_or_reset(dev,
-					       sht3x_debugfs_remove,
-					       data->sensor_dir);
-		if (ret)
-			return ret;
-	}
-
-	hwmon_dev = devm_hwmon_device_register_with_info(dev,
-							 client->name,
-							 data,
-							 &sht3x_chip_info,
-							 sht3x_groups);
-
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &sht3x_chip_info, sht3x_groups);
 	if (IS_ERR(hwmon_dev))
-		dev_dbg(dev, "unable to register hwmon device\n");
+		return PTR_ERR(hwmon_dev);
+
+	sht3x_serial_number_read(data);
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	return 0;
 }
 
 /* device ID table */
@@ -968,20 +936,7 @@ static struct i2c_driver sht3x_i2c_driver = {
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-
-static int __init sht3x_init(void)
-{
-	debugfs = debugfs_create_dir("sht3x", NULL);
-	return i2c_add_driver(&sht3x_i2c_driver);
-}
-module_init(sht3x_init);
-
-static void __exit sht3x_cleanup(void)
-{
-	debugfs_remove_recursive(debugfs);
-	i2c_del_driver(&sht3x_i2c_driver);
-}
-module_exit(sht3x_cleanup);
+module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
-- 
2.45.2


