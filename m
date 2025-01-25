Return-Path: <linux-renesas-soc+bounces-12490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78AA1C33B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B09C3A79C5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43922080F3;
	Sat, 25 Jan 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SpM05Ovm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1342080D9
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808819; cv=none; b=YHJyHWTSL+lgzrDpU2hYlXFrwGfZcqR6ADV4DUbHcl/eJk+p6lRNRu0UNaP53Icmbe/yOHD7Z5A+nbnRDB/kahOCuKXu22qv9ZdNbWpXk6FRyMa3Z43Vjl/WAcI88DfJw/DXlRalv5fMILak6w5DJkpNMt05ZYJE0beNYlqwXm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808819; c=relaxed/simple;
	bh=C1Ed1/V5FUJJfkf5i/xzBuYZpQp3JGtjNsOessWUwuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8+IycSeCiyApP9gHIhB34v9kAzUroZheOUrpt+7COvjrImgQnBbQXZdLiE2di2qHF8HOIG5HUZM7CDSrGaYVYuuzr6O+21iFZvkujE42MJrFodwTa9/hAzOlIpHMEPk39sBUpLEyDY+GowvExmoOxA9UAYjW/HSNCG+I6jXYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SpM05Ovm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yW8nn4PqnneVia72AZOXVYIDYhz1EeldWyknAPPVGKg=; b=SpM05O
	vmmA+tHW73mtrOiJzF3Mml/hQpOq57bL5y+wM7xw7HNVinD/fo83YauCKEWECXzm
	8HEbjvDhCYQgjC2x+MCv7meGRFU2wzYdaOILumYd5/PfPmEW0Y5qfqVbAOTcyPbA
	CI5l6kL7aG6mUHx+BXcEpNsw8pcItu0P2YDoMX1K/dorfrD4TFSD2I3/mYCPVPEx
	1/b1GNFnX8uQw3igJmfWNoTAwwm+czOHIpoW3Dfi2TjvVP/guh4YQo4D2FJwgfAC
	0KIBViQVQlNHT9gqGTZwOHB03cRZJ2zc3x9UTRo6kL+OWKGRy1hr2zdOIOUwiQKb
	0c0NOduKWS1CAR7Q==
Received: (qmail 3871287 invoked from network); 25 Jan 2025 13:40:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:12 +0100
X-UD-Smtp-Session: l3s3148p1@WD/0JIcsALAujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 6/6] hwmon: (tps23861) Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:46 +0100
Message-ID: <20250125123941.36729-14-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/tps23861.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index 80fb03f30c30..4cb3960d5170 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -114,7 +114,6 @@ struct tps23861_data {
 	struct regmap *regmap;
 	u32 shunt_resistor;
 	struct i2c_client *client;
-	struct dentry *debugfs_dir;
 };
 
 static const struct regmap_config tps23861_regmap_config = {
@@ -503,25 +502,6 @@ static int tps23861_port_status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(tps23861_port_status);
 
-static void tps23861_init_debugfs(struct tps23861_data *data,
-				  struct device *hwmon_dev)
-{
-	const char *debugfs_name;
-
-	debugfs_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "%s-%s",
-				      data->client->name, dev_name(hwmon_dev));
-	if (!debugfs_name)
-		return;
-
-	data->debugfs_dir = debugfs_create_dir(debugfs_name, NULL);
-
-	debugfs_create_file("port_status",
-			    0400,
-			    data->debugfs_dir,
-			    data,
-			    &tps23861_port_status_fops);
-}
-
 static int tps23861_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -562,18 +542,12 @@ static int tps23861_probe(struct i2c_client *client)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	tps23861_init_debugfs(data, hwmon_dev);
+	debugfs_create_file("port_status", 0400, client->debugfs, data,
+			    &tps23861_port_status_fops);
 
 	return 0;
 }
 
-static void tps23861_remove(struct i2c_client *client)
-{
-	struct tps23861_data *data = i2c_get_clientdata(client);
-
-	debugfs_remove_recursive(data->debugfs_dir);
-}
-
 static const struct of_device_id __maybe_unused tps23861_of_match[] = {
 	{ .compatible = "ti,tps23861", },
 	{ },
@@ -582,7 +556,6 @@ MODULE_DEVICE_TABLE(of, tps23861_of_match);
 
 static struct i2c_driver tps23861_driver = {
 	.probe			= tps23861_probe,
-	.remove			= tps23861_remove,
 	.driver = {
 		.name		= "tps23861",
 		.of_match_table	= of_match_ptr(tps23861_of_match),
-- 
2.45.2


