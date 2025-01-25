Return-Path: <linux-renesas-soc+bounces-12493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C2A1C341
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48200167F45
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C23207E07;
	Sat, 25 Jan 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AVzrOk72"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39EE2080C4
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808820; cv=none; b=iXDEnQm0KYuI/PIdBbsVlXmpSL4fAA8T4G9kB6pPGZcfgy8IU9l7ls6vaPdsKvcoAXW/Sa4RdCprfL1h/yWO8Hxw9hRhuUCx1q8BqtkqkPSGr97FwOsRjKe/mZBqoV73Ikm23Lg5eOb3mZ3FGXQeKvwtAbnWs5wz0DuZUZQmkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808820; c=relaxed/simple;
	bh=smprCYyFwoIZjRwIHe+Jo5e7e+pNpG3uSmHSFdWkK88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW6Fek+obboiVF4hFbfKJ6izVT3pvvThKcjzHCidmowmnM9z+T/88SSIUzZMoTGLHsf+h5SQYKlSHglp1R1WeFRkeEyD2nkicdp38Aqv9AG4N0EFKu8FhI7hP3zp293bSfLg4EVtCj0/tjmdAVX0sRgTd1TloSlhXcYVH5W4oVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AVzrOk72; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2WOFRJFj98MocYfXFeBJDF4Pl26hqhV5yVfrAZs/QmY=; b=AVzrOk
	72cS61tjo6B8txQdmHN7A8nZx8/bOKF+xuORnuqDK+eP94X6ePfbzsAf5oK4L7Gi
	fFgGfB8hbifaiMdeU2rLi4Ln+mouCWlVsHIYz/17IUdSpnRc2UowPp4J6PICVabZ
	f2njJ6lG/WFgGcOR825wJCVZ73vZ2jIwJ9LGak7mclsaKO31w/lAU6WKKFzCQJFZ
	0lGPeuKIWgVHu5C1sHkHWaRJ90OmjuusVoYoBw5BOcUBZIRC8/9gUU66287qVy3r
	q6ghusiSYm9GtDng5Gwi0OfliAa6XeDVDxHghrk24v3NG7WCFgRk5hu3a490EgZn
	J0W0HGUV5RW8kl5Q==
Received: (qmail 3871131 invoked from network); 25 Jan 2025 13:40:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:08 +0100
X-UD-Smtp-Session: l3s3148p1@EjuyJIcs2q8ujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 1/6] hwmon: (ina3221) Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:41 +0100
Message-ID: <20250125123941.36729-9-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/ina3221.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 1bf479a0f793..ce0e3f214f5b 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -116,7 +116,6 @@ struct ina3221_input {
  * @fields: Register fields of the device
  * @inputs: Array of channel input source specific structures
  * @lock: mutex lock to serialize sysfs attribute accesses
- * @debugfs: Pointer to debugfs entry for device
  * @reg_config: Register value of INA3221_CONFIG
  * @summation_shunt_resistor: equivalent shunt resistor value for summation
  * @summation_channel_control: Value written to SCC field in INA3221_MASK_ENABLE
@@ -128,7 +127,6 @@ struct ina3221_data {
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
 	struct mutex lock;
-	struct dentry *debugfs;
 	u32 reg_config;
 	int summation_shunt_resistor;
 	u32 summation_channel_control;
@@ -913,12 +911,9 @@ static int ina3221_probe(struct i2c_client *client)
 		goto fail;
 	}
 
-	scnprintf(name, sizeof(name), "%s-%s", INA3221_DRIVER_NAME, dev_name(dev));
-	ina->debugfs = debugfs_create_dir(name, NULL);
-
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
 		scnprintf(name, sizeof(name), "in%d_summation_disable", i);
-		debugfs_create_bool(name, 0400, ina->debugfs,
+		debugfs_create_bool(name, 0400, client->debugfs,
 				    &ina->inputs[i].summation_disable);
 	}
 
@@ -940,8 +935,6 @@ static void ina3221_remove(struct i2c_client *client)
 	struct ina3221_data *ina = dev_get_drvdata(&client->dev);
 	int i;
 
-	debugfs_remove_recursive(ina->debugfs);
-
 	pm_runtime_disable(ina->pm_dev);
 	pm_runtime_set_suspended(ina->pm_dev);
 
-- 
2.45.2


