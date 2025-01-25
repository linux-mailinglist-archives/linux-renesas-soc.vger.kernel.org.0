Return-Path: <linux-renesas-soc+bounces-12494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78FA1C346
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3375B3A79FF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06652080E3;
	Sat, 25 Jan 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aTNi8Re5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCC62080E0
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808820; cv=none; b=KG8hYPKkgcVU1Kzh5yWm4tqCe/S+mKl7AHPyea5KCIoKXYQFBcrCaV//05xC0MK8+yufWsHGRwxuY+iZMuRhhlGCWTQMpK4RkipyoWzd7DlG/g//oIfMaxfdEQf+DatbksnzD6i4eogxQahPzImodbluv2y73gzppbR2nGdN7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808820; c=relaxed/simple;
	bh=4FyPcj/4fIrxiC0mQYqgahm27/XQOYAqcYeE76e8LmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFRiBUA2LdADpkLkmRhvZE43zgktho2kh6bQanTfwAM+4vceFZpOQ1g8UurKnriL+xGOvfq4IR2PxE1dnFBez9TIJSQaWUvdCPjL4CzOIDPmvaZQy2hnOU35WzTfLIVJ7eEpWFAPIgWCzGAtPpDpIHvKa2oCUxKehsAj/B27ki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aTNi8Re5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=I3TIhRxKYBkgBIjkteSbYIZBRiVFShfDeceyu+anPxQ=; b=aTNi8R
	e5GPvNnmxZmTe1TUhhm2d+IZOhxvEfXFEuAHUHVgxhVkkjeIKkHbiVZNP9N/cCt1
	e/QAj/VN5Ae2PZm3VaPcHH5cTMhP064wEqKBYgYKA/DuQRGnTSVs2hV89phnA7jU
	PnQVBP8XiASKxMdD1FvJf+ld++vsMu5Ujer7lKfR1KkUMYyVB4zPbYyMAciiKa6r
	dVFJlFvyJlQQqMLf0ezXE39l70xPNVJmWZ9SpQV/tOd1t2E7X1neokXq4a02s5uv
	Vp0ighbuO3L1Itoy4nFDvyhQ6g3pfUVJOF1bvsfNYswNhgIZO38c+5IJNV/4Nh8z
	R+ImuUrsjqfsVRLQ==
Received: (qmail 3871227 invoked from network); 25 Jan 2025 13:40:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:11 +0100
X-UD-Smtp-Session: l3s3148p1@/fvZJIcs6q8ujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 4/6] hwmon: (sg2042) Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:44 +0100
Message-ID: <20250125123941.36729-12-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/sg2042-mcu.c | 44 ++++++--------------------------------
 1 file changed, 7 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
index aa3fb773602c..74c35945d169 100644
--- a/drivers/hwmon/sg2042-mcu.c
+++ b/drivers/hwmon/sg2042-mcu.c
@@ -50,12 +50,9 @@
 
 struct sg2042_mcu_data {
 	struct i2c_client	*client;
-	struct dentry		*debugfs;
 	struct mutex		mutex;
 };
 
-static struct dentry *sgmcu_debugfs;
-
 static ssize_t reset_count_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
@@ -292,18 +289,15 @@ static const struct hwmon_chip_info sg2042_mcu_chip_info = {
 	.info = sg2042_mcu_info,
 };
 
-static void sg2042_mcu_debugfs_init(struct sg2042_mcu_data *mcu,
-				    struct device *dev)
+static void sg2042_mcu_debugfs_init(struct sg2042_mcu_data *mcu)
 {
-	mcu->debugfs = debugfs_create_dir(dev_name(dev), sgmcu_debugfs);
-
-	debugfs_create_file("firmware_version", 0444, mcu->debugfs,
+	debugfs_create_file("firmware_version", 0444, mcu->client->debugfs,
 			    mcu, &firmware_version_fops);
-	debugfs_create_file("pcb_version", 0444, mcu->debugfs, mcu,
+	debugfs_create_file("pcb_version", 0444, mcu->client->debugfs, mcu,
 			    &pcb_version_fops);
-	debugfs_create_file("mcu_type", 0444, mcu->debugfs, mcu,
+	debugfs_create_file("mcu_type", 0444, mcu->client->debugfs, mcu,
 			    &mcu_type_fops);
-	debugfs_create_file("board_type", 0444, mcu->debugfs, mcu,
+	debugfs_create_file("board_type", 0444, mcu->client->debugfs, mcu,
 			    &board_type_fops);
 }
 
@@ -333,18 +327,11 @@ static int sg2042_mcu_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	sg2042_mcu_debugfs_init(mcu, dev);
+	sg2042_mcu_debugfs_init(mcu);
 
 	return 0;
 }
 
-static void sg2042_mcu_i2c_remove(struct i2c_client *client)
-{
-	struct sg2042_mcu_data *mcu = i2c_get_clientdata(client);
-
-	debugfs_remove_recursive(mcu->debugfs);
-}
-
 static const struct i2c_device_id sg2042_mcu_id[] = {
 	{ "sg2042-hwmon-mcu" },
 	{ }
@@ -364,25 +351,8 @@ static struct i2c_driver sg2042_mcu_driver = {
 		.dev_groups = sg2042_mcu_groups,
 	},
 	.probe = sg2042_mcu_i2c_probe,
-	.remove = sg2042_mcu_i2c_remove,
 	.id_table = sg2042_mcu_id,
 };
+module_i2c_driver(sg2042_mcu_driver);
 
-static int __init sg2042_mcu_init(void)
-{
-	sgmcu_debugfs = debugfs_create_dir("sg2042-mcu", NULL);
-	return i2c_add_driver(&sg2042_mcu_driver);
-}
-
-static void __exit sg2042_mcu_exit(void)
-{
-	debugfs_remove_recursive(sgmcu_debugfs);
-	i2c_del_driver(&sg2042_mcu_driver);
-}
-
-module_init(sg2042_mcu_init);
-module_exit(sg2042_mcu_exit);
-
-MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
-MODULE_DESCRIPTION("MCU I2C driver for SG2042 soc platform");
 MODULE_LICENSE("GPL");
-- 
2.45.2


