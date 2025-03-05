Return-Path: <linux-renesas-soc+bounces-13995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC4A4FEA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB980166BD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 12:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483941E7C24;
	Wed,  5 Mar 2025 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UoIj4Qmw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2922A1BF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177918; cv=none; b=j+48u9MMxVGLdKpK7AH9YfPIxE7mBV212Ib2iOVkjZXY4HMeagFwRsgtn5DCVRZai3fB5io+UMVknzkmNvdbgL6gFs3Q2N7tpdrPY98GJN7JZrzf1EpVRx11yPoWg9dIRkRVgeCeOnH/POzzJRzoGNMCpkmmXUo2jqy8OWeKpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177918; c=relaxed/simple;
	bh=ds726Kg0hyNwQAqqHENQFz1hhTJQhLNkmGpHOmQYUws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KMxn4AaqCXNcbR/O1jA1BspNo7IsYIFUZhI/z/ZoHDM7lT4/25/QLDdE90duU1BqMEA75yIEcRMWPWRH8RWvswnny0YtGTHRFy2Yy7S+DeJcGaxRkoBd/CuQVorc19sElHStYwRlMlOc3S3HDxu7jgnseg2vjY8i7sc2iDQ1nxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UoIj4Qmw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ElYfFzYm6+hkEj
	gzaTxnEHxgY4G9pehwaTd2Ai5ICc8=; b=UoIj4Qmwqh8GJK9oYdTjqP0hWZS3RD
	n5inbbXyXKQ4XQAnCdmwBaMoUBRn+bf2NWrFS5NN53Xxw6gXPlZ/QkHxEvFsHhGT
	RW+1oXF5LRRrwz7DohjcJgGisdwoTtixPa9JeDYK0WXJGoMAk63XXscp9vaescL2
	YeHAzVldAKbsMEuO7SpVaIj1PARoJ1/mp+4wQApXYXuLAAR7ZI1Osd2b1tr7A5uo
	Ftw8Tg2fVMsOvCP2sidER80s7PpDyKdV5ELrcxWPS45u/Np/1Tq84NKCsgdBoKKR
	5ATvXGT8sBVYGwrxAqSUiPSpwZLscirjbIVr/h/kCx5D/S5cjEL1uNYg==
Received: (qmail 2933127 invoked from network); 5 Mar 2025 13:31:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2025 13:31:53 +0100
X-UD-Smtp-Session: l3s3148p1@QRP7kpcvEKkgAwDPXylhAB+mKiir6bOV
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT v3] hwmon: (pt5161l) Use per-client debugfs entry
Date: Wed,  5 Mar 2025 13:30:12 +0100
Message-ID: <20250305123149.16990-2-wsa+renesas@sang-engineering.com>
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
Changes since v2: add 'client' as a parameter to the debugfs init
function.

Sorry, sent an old version as v2 :(

 drivers/hwmon/pt5161l.c | 46 ++++++++---------------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index a9f0b23f9e76..20e3cfa625f1 100644
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
+static void pt5161l_init_debugfs(struct i2c_client *client, struct pt5161l_data *data)
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
 
-	pt5161l_init_debugfs(data);
-
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-static void pt5161l_remove(struct i2c_client *client)
-{
-	struct pt5161l_data *data = i2c_get_clientdata(client);
+	pt5161l_init_debugfs(client, data);
 
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


