Return-Path: <linux-renesas-soc+bounces-12404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BFBA1A77F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF29D3A0692
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E6123CB;
	Thu, 23 Jan 2025 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bgl4UM7a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753731F5F6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648251; cv=none; b=oA0fnEwxjvDEyCHKMDyoxI0Zxe23XBn5/GN72dxaP9/7DKhxR/y9ie+RsomywAPAJdD01RBV15dQ8xhNX9NWZM9DsmWx47ZTVSlSAGYhBmP27IJM7qd1Ctq4MWcQr4fLin12wwY0/EkMD6lu+np33ckloGq860Sv8mVa/lznsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648251; c=relaxed/simple;
	bh=m9eI4UMuC/HQYC7p3/UUbDdxzSDth92to4hHTEEhh6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Y+c7If+19pUlCwgLjTL0tzfk3I+Lsh6WH6Wq8h+vuqoCvRzA4c01NjPXkDHhzb+R9QoQ+us1QrCOmFCpLAAKT/RDM0/N5fSWcSOXkO3Mgz35m4A3jd6LVnRRlYaRcSQXPDg/4fO62wGrvdRJB+d4HX3MbRgXOPTomm9qdZCq+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bgl4UM7a; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=7
	nO+YclNtqmHt6FMutq65BGE0NzccpN94JCI7/4bKpY=; b=Bgl4UM7afEkU54iZL
	IgWoeEA54knjhdgCc8mMCuRLUV1dvqB6G3XE1pDQDioZDCLE38xSJe+Dw9cb5Xw9
	gPfsdhMyqxbmUslQrQI1u31QEJAPyUaQq6K1j1Zlen0GLHK/k2hdX3qPsa4x0LBX
	b4Q3auJKK5fuzW+Q8rRCWNxYsZArBYgZ0/ikBkxhAjsXHNVdGB8PPzc9E1Vqa7kr
	AdLl5sNYba/ZpczeMojKSS8Nf2AiPYizueEFcbphb6DkxafvLgr68HEp6dpyDXYB
	sS57BlIaowW0QXnYzpIZtQoQIbE1YNDPgnIhvS5cfoLxNgcwHE843s1JP5NA8/iW
	YERbw==
Received: (qmail 3322830 invoked from network); 23 Jan 2025 17:03:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jan 2025 17:03:58 +0100
X-UD-Smtp-Session: l3s3148p1@cAT2wWEsouQujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Date: Thu, 23 Jan 2025 17:03:47 +0100
Message-Id: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

All dependencies are now in Linus' tree. Thisapatch can be applied now.

 drivers/hwmon/isl28022.c | 44 ++--------------------------------------
 1 file changed, 2 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index 3f9b4520b53e..1fb9864635db 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -324,26 +324,6 @@ static int shunt_voltage_show(struct seq_file *seqf, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
 
-static struct dentry *isl28022_debugfs_root;
-
-static void isl28022_debugfs_remove(void *res)
-{
-	debugfs_remove_recursive(res);
-}
-
-static void isl28022_debugfs_init(struct i2c_client *client, struct isl28022_data *data)
-{
-	char name[16];
-	struct dentry *debugfs;
-
-	scnprintf(name, sizeof(name), "%d-%04hx", client->adapter->nr, client->addr);
-
-	debugfs = debugfs_create_dir(name, isl28022_debugfs_root);
-	debugfs_create_file("shunt_voltage", 0444, debugfs, data, &shunt_voltage_fops);
-
-	devm_add_action_or_reset(&client->dev, isl28022_debugfs_remove, debugfs);
-}
-
 /*
  * read property values and make consistency checks.
  *
@@ -475,7 +455,7 @@ static int isl28022_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	isl28022_debugfs_init(client, data);
+	debugfs_create_file("shunt_voltage", 0444, client->debugfs, data, &shunt_voltage_fops);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &isl28022_chip_info, NULL);
@@ -505,27 +485,7 @@ static struct i2c_driver isl28022_driver = {
 	.probe	= isl28022_probe,
 	.id_table	= isl28022_ids,
 };
-
-static int __init isl28022_init(void)
-{
-	int err;
-
-	isl28022_debugfs_root = debugfs_create_dir("isl28022", NULL);
-	err = i2c_add_driver(&isl28022_driver);
-	if (!err)
-		return 0;
-
-	debugfs_remove_recursive(isl28022_debugfs_root);
-	return err;
-}
-module_init(isl28022_init);
-
-static void __exit isl28022_exit(void)
-{
-	i2c_del_driver(&isl28022_driver);
-	debugfs_remove_recursive(isl28022_debugfs_root);
-}
-module_exit(isl28022_exit);
+module_i2c_driver(isl28022_driver);
 
 MODULE_AUTHOR("Carsten Spieß <mail@carsten-spiess.de>");
 MODULE_DESCRIPTION("ISL28022 driver");
-- 
2.39.2


