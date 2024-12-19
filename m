Return-Path: <linux-renesas-soc+bounces-11591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58679F8824
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB350162988
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB841D2B2A;
	Thu, 19 Dec 2024 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="geuvYBIy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676CE1D6DB8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648954; cv=none; b=mkxB1K8XVHHDrJiUupm+RtEC/Y6LFG9+Jr7j3ZOyM7q0qO421XtH7/dFBtSsFzkS9Sbba+If6paAouPMLIPzop1eREHqxYsviTMN2m/H+VerDCUA2c/xAW9v12CKHvEN6FzNRNr6JzIP8yel5iJxihe0weMNldGOmIZJP/x2FBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648954; c=relaxed/simple;
	bh=gyI/pmtnVSGA6mAS+7tY1CpMr4yyGYniXxBfcG831+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPqZgwFmqapBBHnJ1NilE/tgA6LS+OaqM1twrGjX4sooiqTP+xuaqD5TrmQDzoZp/2CteUMrzdqZONrjvp/LX0AZ/DyDoLrLjbOSfOGlcTHj+xc5fwpbbdAGzSgqz9xtNqkHizOSiLgpwDnbOUlptUC2QlOt23u+9WlaR73up9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=geuvYBIy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EFtXOkS8o7zBjJldP7Zsy3cjh6NMxH47TTmDvMf8sZ4=; b=geuvYB
	Iy/n9pgK9qbjoIO+OM3kLFH+Kba0C0W7cmoMJWmx7THp2DBC2XfRfZhjqS/U9k6I
	IjaX86AToVN7GGWPHfTDIgs51ZmFRTwYMWatbES9SCHkN4GBrhmP24fRrvknVoEI
	bJlGf4PpUa1z1+Sy1jGlrVUYcux9rbs9FfP8ZElnZBbIt5dLJGitUmha8p+kmvdK
	9ESQyDpiZnP/jvBsKre0z/64SCMQ/sSFV9aRRwb4a3LP7SOmcfNgD48Kqdbg3wbQ
	s+vtuCrLSxfxEnv3pKoEa+KRq94A0w0gGfZwRNQf+ITZSqaEahtYMXaTzO+t6Xik
	vim0HGR82PtvDwkA==
Received: (qmail 826623 invoked from network); 19 Dec 2024 23:55:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:49 +0100
X-UD-Smtp-Session: l3s3148p1@2cpubqcpBKkujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 2/5] hwmon: (lm75) simplify regulator handling
Date: Thu, 19 Dec 2024 23:55:24 +0100
Message-ID: <20241219225522.3490-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_regulator_get_enable() was introduced exactly to avoid open coding
regulator handling like in this driver. Make use of this helper.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/lm75.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index b03e760cf3a1..4d0fd1c93c63 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -109,7 +109,6 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 struct lm75_data {
 	struct i2c_client		*client;
 	struct regmap			*regmap;
-	struct regulator		*vs;
 	u16				orig_conf;
 	u8				resolution;	/* In bits, 9 to 16 */
 	unsigned int			sample_time;	/* In ms */
@@ -621,13 +620,6 @@ static const struct regmap_bus lm75_i2c_regmap_bus = {
 	.reg_write = lm75_i2c_reg_write,
 };
 
-static void lm75_disable_regulator(void *data)
-{
-	struct lm75_data *lm75 = data;
-
-	regulator_disable(lm75->vs);
-}
-
 static void lm75_remove(void *data)
 {
 	struct lm75_data *lm75 = data;
@@ -656,9 +648,9 @@ static int lm75_probe(struct i2c_client *client)
 	data->client = client;
 	data->kind = (uintptr_t)i2c_get_match_data(client);
 
-	data->vs = devm_regulator_get(dev, "vs");
-	if (IS_ERR(data->vs))
-		return PTR_ERR(data->vs);
+	err = devm_regulator_get_enable(dev, "vs");
+	if (err)
+		return err;
 
 	data->regmap = devm_regmap_init(dev, &lm75_i2c_regmap_bus, data,
 					&lm75_regmap_config);
@@ -675,17 +667,6 @@ static int lm75_probe(struct i2c_client *client)
 	data->sample_time = data->params->default_sample_time;
 	data->resolution = data->params->default_resolution;
 
-	/* Enable the power */
-	err = regulator_enable(data->vs);
-	if (err) {
-		dev_err(dev, "failed to enable regulator: %d\n", err);
-		return err;
-	}
-
-	err = devm_add_action_or_reset(dev, lm75_disable_regulator, data);
-	if (err)
-		return err;
-
 	/* Cache original configuration */
 	err = regmap_read(data->regmap, LM75_REG_CONF, &status);
 	if (err)
-- 
2.45.2


