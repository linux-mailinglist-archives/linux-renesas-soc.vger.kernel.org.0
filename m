Return-Path: <linux-renesas-soc+bounces-13994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD9A4FE9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0AB07A6DDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 12:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DD524500E;
	Wed,  5 Mar 2025 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dV+xS43e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECBE242911
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177733; cv=none; b=bsGxSEUe4u/kelJaJXLfjUw+hpff+e2Bditg92N0no+bWeFDqQE1MlsBLccnMelC/dAU7MHrkCl1AYmQPiLynfI3G/hRLLNtUwuOkd3mHgdAluLblnIcF82gM5iPw95kYSor72QI9reoE6cJUOQC00uZYhcDWo4Rn0tMtX9No74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177733; c=relaxed/simple;
	bh=PNYKnsjNdF/7VQjOF4sJPkIXFYtRqiTXuF10W2BU7Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1N7Jpsb9LGAl9kE1FYZgTUqukdjOhAsujIoISgMDNaZa6uHeDA9IDWqxfbCIeNwW5oTM2mk58O0v4pHY0yCz/0bCj/S9Ypz2FEm39ySsorleYlYMS+MksZfErFB4qvUNUyQ0FiKt/HMhZPQvJJLqW6lOyHCLVzJHA7LGBwfbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dV+xS43e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Dy3y/QpJfpEoCD
	OF8uc5YAiC8mQQCg6gUqeh58GH4AU=; b=dV+xS43eA/PWkb++Phc1TuE6a6/SGr
	SwQfPGn+kxnPE5ob5beVO7n/+zij9Qt3shyKnuw78F4Y3bmyohXtBHpClciSuVMi
	muag54tyAN89mZOnRmBkqFH+kP/MMJS3cwviLZtuXo1hSpICPQo7z3U7XS80KOCC
	MYfuWimCjgIBJ7iY0cI6PUaj1u0tq0UDr0sqjgWS2mCw1nAag7sno6zXCthPk094
	yPfmc6HKcmTKD2HIp+Hm+jbiDYW8ISDBxk/mv2OFtWdD7oyVl8GxBWN/7e6HgDtZ
	wXk2AqLB/tjcMKF4MgBpi6UtZQFFJwWYi1S6aNawoNkH15VFePdjle0A==
Received: (qmail 2932195 invoked from network); 5 Mar 2025 13:28:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2025 13:28:45 +0100
X-UD-Smtp-Session: l3s3148p1@GX7Oh5cvOIogAwDPXylhAB+mKiir6bOV
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT v2] hwmon: (pt5161l) Use per-client debugfs entry
Date: Wed,  5 Mar 2025 13:27:42 +0100
Message-ID: <20250305122843.15056-2-wsa+renesas@sang-engineering.com>
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

Changes since v1: - keep the debugfs init as a function

 drivers/hwmon/pt5161l.c | 44 ++++++++---------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index a9f0b23f9e76..58b3e0a71281 100644
--- a/drivers/hwmon/pt5161l.c
+++ b/drivers/hwmon/pt5161l.c
@@ -63,7 +63,6 @@ struct pt5161l_fw_ver {
 /* Each client has this additional data */
 struct pt5161l_data {
 	struct i2c_client *client;
-	struct dentry *debugfs;
 	struct pt5161l_fw_ver fw_ver;
 	struct mutex lock; /* for atomic I2C transactions */
 	bool init_done;
@@ -72,8 +71,6 @@ struct pt5161l_data {
 	bool mm_wide_reg_access; /* MM assisted wide register access */
 };
 
-static struct dentry *pt5161l_debugfs_dir;
-
 /*
  * Write multiple data bytes to Aries over I2C
  */
@@ -568,21 +565,16 @@ static const struct file_operations pt5161l_debugfs_ops_hb_sts = {
 	.open = simple_open,
 };
 
-static int pt5161l_init_debugfs(struct pt5161l_data *data)
+static void pt5161l_init_debugfs(struct pt5161l_data *data)
 {
-	data->debugfs = debugfs_create_dir(dev_name(&data->client->dev),
-					   pt5161l_debugfs_dir);
-
-	debugfs_create_file("fw_ver", 0444, data->debugfs, data,
+	debugfs_create_file("fw_ver", 0444, client->debugfs, data,
 			    &pt5161l_debugfs_ops_fw_ver);
 
-	debugfs_create_file("fw_load_status", 0444, data->debugfs, data,
+	debugfs_create_file("fw_load_status", 0444, client->debugfs, data,
 			    &pt5161l_debugfs_ops_fw_load_sts);
 
-	debugfs_create_file("heartbeat_status", 0444, data->debugfs, data,
+	debugfs_create_file("heartbeat_status", 0444, client->debugfs, data,
 			    &pt5161l_debugfs_ops_hb_sts);
-
-	return 0;
 }
 
 static int pt5161l_probe(struct i2c_client *client)
@@ -604,17 +596,12 @@ static int pt5161l_probe(struct i2c_client *client)
 							 data,
 							 &pt5161l_chip_info,
 							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
 
 	pt5161l_init_debugfs(data);
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-static void pt5161l_remove(struct i2c_client *client)
-{
-	struct pt5161l_data *data = i2c_get_clientdata(client);
-
-	debugfs_remove_recursive(data->debugfs);
+	return 0;
 }
 
 static const struct of_device_id __maybe_unused pt5161l_of_match[] = {
@@ -643,24 +630,9 @@ static struct i2c_driver pt5161l_driver = {
 		.acpi_match_table = ACPI_PTR(pt5161l_acpi_match),
 	},
 	.probe = pt5161l_probe,
-	.remove = pt5161l_remove,
 	.id_table = pt5161l_id,
 };
-
-static int __init pt5161l_init(void)
-{
-	pt5161l_debugfs_dir = debugfs_create_dir("pt5161l", NULL);
-	return i2c_add_driver(&pt5161l_driver);
-}
-
-static void __exit pt5161l_exit(void)
-{
-	i2c_del_driver(&pt5161l_driver);
-	debugfs_remove_recursive(pt5161l_debugfs_dir);
-}
-
-module_init(pt5161l_init);
-module_exit(pt5161l_exit);
+module_i2c_driver(pt5161l_driver);
 
 MODULE_AUTHOR("Cosmo Chou <cosmo.chou@quantatw.com>");
 MODULE_DESCRIPTION("Hwmon driver for Astera Labs Aries PCIe retimer");
-- 
2.45.2


