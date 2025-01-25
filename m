Return-Path: <linux-renesas-soc+bounces-12492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B7A1C33E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF623A7A6A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6614B2080DB;
	Sat, 25 Jan 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ph1BKOib"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F626AF6
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808820; cv=none; b=i9rXzQqm0QmTaOlrYxQpbyHw0BUhYIpfYfFFgKoPFyWWMJZI/pdxkXTo9WvmBFan1E2Jq94MdIqsz+yfDG/FZMNfpoVtDHjXtfWll14fqjWvWZxAp7d+9XGRMfa5riN8yjPsZnGYJj6jNd8AmDMLPUmolhzVJTvqcvEdqzc0qME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808820; c=relaxed/simple;
	bh=CoZtDHj2DzknZn7Aq9mOsSbhKnPVORJxAW0j5rrCV7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nufXWp7ToYD59hRqIzwUhoNaImxlzeuNIdEAueA6rgs8fpIRjsRV+hcYJtgyN0UWcQS5ScQigtDgj49QlFrDEmAlcIvM8dYauRfAQma2N7jkwrIvwCSt/MqssmhTSRN+ZtEmucUHOkw2LduO1JeroaLBXjrBB8FN2oobL6QTEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ph1BKOib; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BmIgzuvtTXIRzbyuMaBqbNheEksULVal5rJMWSPrzD4=; b=Ph1BKO
	ib5DbWRYGCwbc9yPjTTQD54QdQ8gc3HxmbOD7sbLSs/puZdqYpYPs3aQywTyZrgH
	7w3wxmN+NTZgX9rZzlkT2vPpAk29nxnJ76fipOrrdu9tBlSny09sA1ua5ZtJ5wX2
	bzZyLgVn8vU7FvOPQD1mKLz9Z/HezWRqTUyDyxPa3gkvjJqRY3oFKGmc2QQ3v5bC
	26dgKZHjxH33qTd/psP63NESZ1lqT3b5h6EtOd49pHnfUQEcxw3fDLsH7EbvFaDv
	ACraoXpa1US3CHnMzSrnHQ8xd353xp1EAbOTsbPxN3Tvn6EGGZMGU8jvIxuh2xpk
	HaLmFgWNmvVFtBWw==
Received: (qmail 3871161 invoked from network); 25 Jan 2025 13:40:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:09 +0100
X-UD-Smtp-Session: l3s3148p1@RIfAJIcs3K8ujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 2/6] hwmon: (ltc4282) Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:42 +0100
Message-ID: <20250125123941.36729-10-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/ltc4282.c | 44 ++++++++---------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 4f608a3790fb..7f38d2696239 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1674,47 +1674,19 @@ static int ltc4282_show_power1_bad_fault_log(void *arg, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_power1_bad_fault_log,
 			 ltc4282_show_power1_bad_fault_log, NULL, "%llu\n");
 
-static void ltc4282_debugfs_remove(void *dir)
+static void ltc4282_debugfs_init(struct ltc4282_state *st, struct i2c_client *i2c)
 {
-	debugfs_remove_recursive(dir);
-}
-
-static void ltc4282_debugfs_init(struct ltc4282_state *st,
-				 struct i2c_client *i2c,
-				 const struct device *hwmon)
-{
-	const char *debugfs_name;
-	struct dentry *dentry;
-	int ret;
-
-	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return;
-
-	debugfs_name = devm_kasprintf(&i2c->dev, GFP_KERNEL, "ltc4282-%s",
-				      dev_name(hwmon));
-	if (!debugfs_name)
-		return;
-
-	dentry = debugfs_create_dir(debugfs_name, NULL);
-	if (IS_ERR(dentry))
-		return;
-
-	ret = devm_add_action_or_reset(&i2c->dev, ltc4282_debugfs_remove,
-				       dentry);
-	if (ret)
-		return;
-
-	debugfs_create_file_unsafe("power1_bad_fault_log", 0400, dentry, st,
+	debugfs_create_file_unsafe("power1_bad_fault_log", 0400, i2c->debugfs, st,
 				   &ltc4282_power1_bad_fault_log);
-	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, dentry, st,
+	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, i2c->debugfs, st,
 				   &ltc4282_fet_short_fault_log);
-	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, dentry, st,
+	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, i2c->debugfs, st,
 				   &ltc4282_fet_bad_fault_log);
-	debugfs_create_file_unsafe("in1_crit_fault_log", 0400, dentry, st,
+	debugfs_create_file_unsafe("in1_crit_fault_log", 0400, i2c->debugfs, st,
 				   &ltc4282_in1_crit_fault_log);
-	debugfs_create_file_unsafe("in1_lcrit_fault_log", 0400, dentry, st,
+	debugfs_create_file_unsafe("in1_lcrit_fault_log", 0400, i2c->debugfs, st,
 				   &ltc4282_in1_lcrit_fault_log);
-	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, dentry, st,
+	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, i2c->debugfs, st,
 				   &ltc4282_curr1_crit_fault_log);
 }
 
@@ -1757,7 +1729,7 @@ static int ltc4282_probe(struct i2c_client *i2c)
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
 
-	ltc4282_debugfs_init(st, i2c, hwmon);
+	ltc4282_debugfs_init(st, i2c);
 
 	return 0;
 }
-- 
2.45.2


