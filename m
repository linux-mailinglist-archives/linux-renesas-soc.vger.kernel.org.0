Return-Path: <linux-renesas-soc+bounces-12495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D47A1C347
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7C01888B93
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42002080FC;
	Sat, 25 Jan 2025 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ceRTgX5X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2672080F4
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808821; cv=none; b=Kn5umH1CPWhUvymrjeJl9JW1/4fstkppgZV+8ZTnEGmr0wsKsxKVAJtSNhhnEUYohDRepNLHhP+9xn8HSxdqxLHbJBEWsvVm972k+ZVdDQT/2ZLvHMvB7iM9cCSNaSPYkMpmQRDvwgoQsxQ2E5lZ3BU9u5S+m+CZmEAm0sRpcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808821; c=relaxed/simple;
	bh=CJvzYJf5g5rEeWvK7/SUMIlM75WusBOssVylLiKRSpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPPPet7TnnZ0dmN5gD23Yei76M/a1Dqj/gZDLZIjdWb9rUN0aMi13JejN9xP8M49sEDn1+NgY7DyHjBHW51lxqg8THMzf+37WLPIMywRxSsi7DgkNTF0dblNfBpsceMrQ06xLJtShaFIi+Md5pGtwkWWejNqUMOSlxxdqx3GUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ceRTgX5X; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=vlIQU4MZ6pSduTmrPoJe8oP+MM8crSkqeS4MWFCRdJg=; b=ceRTgX
	5XCGOtdFrgDWHe32kAhg8aF/spj9O/MvBnpWrq9IPl/aO3sKhV3LLS81147K7cFD
	wpRRDD7xSHGeyoeg4XrnQ01FDGqa63rDcFL6sqAc0ZEKC94af15bAKV5umwPV5+5
	gk4DY/sirpyeONciO7UE4ex1iTlHa2SvKNB0izw41tbIUtOFou5iFKY5sFoOp9G4
	TmRjLtvUgutPBQJKS3uZYGWDh8rceNcM1RtBKnDa9lCigO1qEXkPJsXpNfYMjMy4
	e8DIo6g4A9YdKAUNguaKFGiGI0o3qMTriO0MkkmVRmqv3t6sL6cApuED2H6/yvwh
	zsRjX6pxsG2QIHiw==
Received: (qmail 3871258 invoked from network); 25 Jan 2025 13:40:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:11 +0100
X-UD-Smtp-Session: l3s3148p1@qDvnJIcs+q8ujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 5/6] hwmon: (sht3x) Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:45 +0100
Message-ID: <20250125123941.36729-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/sht3x.c | 57 ++++++-------------------------------------
 1 file changed, 8 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 650b0bcc2359..a6e7449de396 100644
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
@@ -837,22 +835,6 @@ static int sht3x_write(struct device *dev, enum hwmon_sensor_types type,
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
 static int sht3x_serial_number_read(struct sht3x_data *data)
 {
 	int ret;
@@ -931,27 +913,17 @@ static int sht3x_probe(struct i2c_client *client)
 		return ret;
 
 	ret = sht3x_serial_number_read(data);
-	if (ret) {
+	if (ret)
 		dev_dbg(dev, "unable to read serial number\n");
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
 
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &sht3x_chip_info, sht3x_groups);
 	if (IS_ERR(hwmon_dev))
-		dev_dbg(dev, "unable to register hwmon device\n");
+		return PTR_ERR(hwmon_dev);
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	debugfs_create_u32("serial_number", 0444, client->debugfs, &data->serial_number);
+
+	return 0;
 }
 
 /* device ID table */
@@ -968,20 +940,7 @@ static struct i2c_driver sht3x_i2c_driver = {
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


