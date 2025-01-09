Return-Path: <linux-renesas-soc+bounces-11981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114DA07596
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2047018894B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5BB20551B;
	Thu,  9 Jan 2025 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fQJ+UXAk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA88216E20
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jan 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425284; cv=none; b=Ev1EyDnoJtf6erjP292ITXm93EWQGGPteYXXUYw0UgveAo2jwRBy7GcQ0Xs950DcQalPKY3s6nCxTBX5k1riUSq0JwXe+DEKr5HBKmciWBH5WAcbaHq8mlRj8zARUROn8fWXExc4DgWWQjstnfroJHbfs+UAA5pr9B45NurOhe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425284; c=relaxed/simple;
	bh=s6iLSMvwvB1hhEvSbVmgChnOY8FBYiVDdEUfiaRKLus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCp5gacUHAW9Sc1gOJVt+w6Wcn5IYJM1nEEpNuuBiDL7h1B6Ouwt/gjQUk4V0BYQ3FlizztrheZj1PFWnt3OYiTTsE+BfvYZKgn7GxpN4LRAjfHDgd7Xp81VDNiX25xxZOqAdFF7q/th7XCqGCd/3a8XjriKkDCEcXfW3h4R2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fQJ+UXAk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=Wvj0OmgUBbiythAxDaHZcyRy7Ax
	S3rfnwX3CjJNEV/c=; b=fQJ+UXAkul0JhNsbZfeiSYTu2E3mPjb4X8LGkNLfC53
	QImYkAZoHXjeL4dYRg1TpMEYhS+rHnd4bBFqBhfImp/H2HvJsm1KB8FZYbmqiE/c
	p36oK62jv9nBnYarowVnITjPkFi+3tJXmV9I3yrKAOZQTaX2ubOl6Ar4rLVVQ2OA
	nNuprrEZ/VSDyUvqAURfI9ITD21uiw4xu0reMeQjZZjArbhcU4jKXWS8jN6LDvIt
	3HkH0ZykU6KSFBhAGmkIZl4HxTeCC1NDpHzvmKVHBd4E3w5RYBcfCytGmWrDe7lG
	D8KY8wXTDzEpo2wGYxtbkzZebi6/1W5PTy1Ln5LgTwA==
Received: (qmail 2902280 invoked from network); 9 Jan 2025 13:21:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 13:21:18 +0100
X-UD-Smtp-Session: l3s3148p1@ePvpA0UraL0gAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (isl28022) Use per-client debugfs entry
Date: Thu,  9 Jan 2025 13:21:11 +0100
Message-ID: <20250109122112.45810-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
References: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
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
---
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
2.45.2


