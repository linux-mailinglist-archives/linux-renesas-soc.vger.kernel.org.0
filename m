Return-Path: <linux-renesas-soc+bounces-12491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C3A1C33C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270BE167E4C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BCA2080F0;
	Sat, 25 Jan 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EH79b37C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9AD2080DB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808820; cv=none; b=EERsILr1uwDGEdFAX4eauq+8cCY/Nxup7SAnT4qnGZlySb0LdggaoR5TSKu536iKde1I7WPhtS1T9/WWrg64Y32ocxGBo6GkehIO7Bp9EuPlhIj8sPBQi/OPhAuLBu9K5G3w9yQtppfzsMM5Gn3B6aNgTajHO5D1uSh9YcVFQp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808820; c=relaxed/simple;
	bh=/b5qQuglifflzOxcu25XJBmzO7Br0rKwUGqcu9Oq1Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+FAHM/ofP5kYnGkFePSWDYtpGizJmg75Jvqc82/yniSW6Ct6OvTr+SPvhmiYO2VGi3koLTOtX0ArkDD01N+dgfLfyRcn8ptUYfEvVpDnmnooqXebgN4S8LxAeJFLFppqmKtWAXfnNnluhlHGQIQPQT9PdTyN4qOqmitRRvzy9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EH79b37C; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=larzix8/bqXE08GPMM/1OuFjHmPlY/ag374YHx8Yuo4=; b=EH79b3
	7CZZGitWE+YOV/PtNtPx1mWnUqg/be88pOSOcColXe0lgYNP7XnJyuDtsP12bmX1
	R9XG43J8Gfav9BFbDg4it2kXYYn7OnQo/DGE73jGu5R3SqBxZ3tZU/7cBmIUIvn8
	I8xuionbXfF5TknKWBcynzquAzLYltJ6GvPQTBx57ZLzJbmmhA9AzbTqy669xYO7
	R1K881/4ZlOR4Tx2DeeQswTGyk+aeYubHlcPU2IA8Wm/KwEAWSK533PObYHdl8Fr
	NL/P+gR4ltL9dUuqL8jNIMfYLewVlP1+ZnzUDfJH6IiemQZiD+kSMZg4Bgndfl3h
	wD1F3pOoN3CYrvDw==
Received: (qmail 3871195 invoked from network); 25 Jan 2025 13:40:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:10 +0100
X-UD-Smtp-Session: l3s3148p1@TQzNJIcs6K8ujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 3/6] hwmon: (pt5161l) Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:43 +0100
Message-ID: <20250125123941.36729-11-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/pt5161l.c | 59 +++++++++--------------------------------
 1 file changed, 12 insertions(+), 47 deletions(-)

diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index a9f0b23f9e76..1359d317024c 100644
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
@@ -568,23 +565,6 @@ static const struct file_operations pt5161l_debugfs_ops_hb_sts = {
 	.open = simple_open,
 };
 
-static int pt5161l_init_debugfs(struct pt5161l_data *data)
-{
-	data->debugfs = debugfs_create_dir(dev_name(&data->client->dev),
-					   pt5161l_debugfs_dir);
-
-	debugfs_create_file("fw_ver", 0444, data->debugfs, data,
-			    &pt5161l_debugfs_ops_fw_ver);
-
-	debugfs_create_file("fw_load_status", 0444, data->debugfs, data,
-			    &pt5161l_debugfs_ops_fw_load_sts);
-
-	debugfs_create_file("heartbeat_status", 0444, data->debugfs, data,
-			    &pt5161l_debugfs_ops_hb_sts);
-
-	return 0;
-}
-
 static int pt5161l_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -600,21 +580,21 @@ static int pt5161l_probe(struct i2c_client *client)
 	pt5161l_init_dev(data);
 	dev_set_drvdata(dev, data);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
-							 data,
-							 &pt5161l_chip_info,
-							 NULL);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &pt5161l_chip_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
 
-	pt5161l_init_debugfs(data);
+	debugfs_create_file("fw_ver", 0444, client->debugfs, data,
+			    &pt5161l_debugfs_ops_fw_ver);
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
+	debugfs_create_file("fw_load_status", 0444, client->debugfs, data,
+			    &pt5161l_debugfs_ops_fw_load_sts);
 
-static void pt5161l_remove(struct i2c_client *client)
-{
-	struct pt5161l_data *data = i2c_get_clientdata(client);
+	debugfs_create_file("heartbeat_status", 0444, client->debugfs, data,
+			    &pt5161l_debugfs_ops_hb_sts);
 
-	debugfs_remove_recursive(data->debugfs);
+	return 0;
 }
 
 static const struct of_device_id __maybe_unused pt5161l_of_match[] = {
@@ -643,24 +623,9 @@ static struct i2c_driver pt5161l_driver = {
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


