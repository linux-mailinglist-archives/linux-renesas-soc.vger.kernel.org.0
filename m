Return-Path: <linux-renesas-soc+bounces-11592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635F9F8825
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF931890D1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2BD1D6DB8;
	Thu, 19 Dec 2024 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K+whlpQc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA331D7E5C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648954; cv=none; b=oc9bJNbPz/IrlTd+8OX9QmL5rnWj5k2aLcvuLn5p3C6QY496QccxiII56R/Om21UaPAhW5cBpRKk48xw2vYbcoJ0HPTdcMxe2G57Iv70v/OelEcG3NJZCvAxhsv2QEg/L3hZRjrR4csudaNvEDif9/b+Jf4NVNPBOl9oLJf0S6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648954; c=relaxed/simple;
	bh=Fn5Wn6TSgYD9f2tYs5wv0YsHVPJJxLKIv+f0K2Swvwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmJf6Qiiy12r1wzx0wrBQXHejmFnC7Qf/BWqCmYf8oKR+cewfsZSI8ZWRXA7S8KPAebyXczkOC0NEI/Sv89j6qU2t0+KXt+0Udjm98G3DyKEg45BCL+Imhw+cJTtgc6b9Lw3s8jTs2PQMegJtaeQA3JIog+sk/aU+iUGgadPs18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K+whlpQc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mQOUXsZbTYfWBSw0R4gk48zwein1ueWIbvR9w4WLCqM=; b=K+whlp
	QcsPfrz+NfY0Yf6fybzkinsoXfU777+xPKBS98M8ZFTDOPNUBuZ9MZzqxiHVzNXK
	9CL/gAlTV3Iwn3KLHa650cg3YJlgITzQfTaNIHaSj8ZzmoreC5uqTzKpkA32aF1g
	tBGzfz1vKoxqbiCi/ZibubjL0BZv9XQyLP5GLYsNMzOKKeWQpg1x5RCI7DjM3RKD
	rp4KcboZa08mJZuELhJ7SP1QwVtkaDhxZghFdkDbor+uthFcVXkMr+0lmVBbIdO0
	Uv1r+gbObJkj4eK4a1JpvnQ45WNFyuZ8/1uQWZe8AT3N0wLy/YyFeijpoeZilgwf
	miAwrwaQnoP4b84g==
Received: (qmail 826652 invoked from network); 19 Dec 2024 23:55:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:50 +0100
X-UD-Smtp-Session: l3s3148p1@Y495bqcpFKkujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 3/5] hwmon: (lm75) Remove superfluous 'client' member from private struct
Date: Thu, 19 Dec 2024 23:55:25 +0100
Message-ID: <20241219225522.3490-10-wsa+renesas@sang-engineering.com>
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

The regmap-only conversion allows us to store the client-pointer as the
'context' parameter for regmap. This not only makes the private struct
smaller, but also allows proper separation of I2C and I3C in the future.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/lm75.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 4d0fd1c93c63..0f034110daed 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -105,9 +105,7 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 #define LM75_REG_MAX		0x03
 #define PCT2075_REG_IDLE	0x04
 
-/* Each client has this additional data */
 struct lm75_data {
-	struct i2c_client		*client;
 	struct regmap			*regmap;
 	u16				orig_conf;
 	u8				resolution;	/* In bits, 9 to 16 */
@@ -572,8 +570,8 @@ static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
 
 static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
-	struct lm75_data *data = context;
-	struct i2c_client *client = data->client;
+	struct i2c_client *client = context;
+	struct lm75_data *data = i2c_get_clientdata(client);
 	int ret;
 
 	if (reg == LM75_REG_CONF) {
@@ -592,8 +590,8 @@ static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
 
 static int lm75_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
 {
-	struct lm75_data *data = context;
-	struct i2c_client *client = data->client;
+	struct i2c_client *client = context;
+	struct lm75_data *data = i2c_get_clientdata(client);
 
 	if (reg == PCT2075_REG_IDLE ||
 	    (reg == LM75_REG_CONF && !data->params->config_reg_16bits))
@@ -645,14 +643,13 @@ static int lm75_probe(struct i2c_client *client)
 	/* needed by custom regmap callbacks */
 	dev_set_drvdata(dev, data);
 
-	data->client = client;
 	data->kind = (uintptr_t)i2c_get_match_data(client);
 
 	err = devm_regulator_get_enable(dev, "vs");
 	if (err)
 		return err;
 
-	data->regmap = devm_regmap_init(dev, &lm75_i2c_regmap_bus, data,
+	data->regmap = devm_regmap_init(dev, &lm75_i2c_regmap_bus, client,
 					&lm75_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
-- 
2.45.2


