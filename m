Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E158781DE2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 14:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbjHTMyB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 08:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjHTMx5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 08:53:57 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0C484239;
        Sun, 20 Aug 2023 05:49:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="177088866"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Aug 2023 21:49:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 364064001DDB;
        Sun, 20 Aug 2023 21:49:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] hwmon: tmp513: Convert enum->pointer for data in the match tables
Date:   Sun, 20 Aug 2023 13:49:09 +0100
Message-Id: <20230820124910.71526-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert enum->pointer for data in the match tables, so that
device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
bus type match support added to it.

Introduce struct tmp51x_info with encum chips and replace enum chips with
struct *tmp51x_info in struct lm85_data. Replace enum->struct *tmp51x_info
for data in the match table. Simplify the probe() by replacing
device_get_match_data() and ID lookup for retrieving data by
i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/hwmon/tmp513.c | 43 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 7db5d0fc24a4..22f6000bc50a 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -156,6 +156,10 @@ enum tmp51x_ids {
 	tmp512, tmp513
 };
 
+struct tmp51x_info {
+	enum tmp51x_ids id;
+};
+
 struct tmp51x_data {
 	u16 shunt_config;
 	u16 pga_gain;
@@ -169,7 +173,7 @@ struct tmp51x_data {
 	u32 curr_lsb_ua;
 	u32 pwr_lsb_uw;
 
-	enum tmp51x_ids id;
+	const struct tmp51x_info *info;
 	struct regmap *regmap;
 };
 
@@ -434,7 +438,7 @@ static umode_t tmp51x_is_visible(const void *_data,
 
 	switch (type) {
 	case hwmon_temp:
-		if (data->id == tmp512 && channel == 4)
+		if (data->info->id == tmp512 && channel == 4)
 			return 0;
 		switch (attr) {
 		case hwmon_temp_input:
@@ -585,7 +589,7 @@ static int tmp51x_init(struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	if (data->id == tmp513) {
+	if (data->info->id == tmp513) {
 		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
 				   data->nfactor[2] << 8);
 		if (ret < 0)
@@ -600,22 +604,24 @@ static int tmp51x_init(struct tmp51x_data *data)
 	return regmap_read(data->regmap, TMP51X_STATUS, &regval);
 }
 
+static const struct tmp51x_info tmp512_info = {
+	.id = tmp512,
+};
+
+static const struct tmp51x_info tmp513_info = {
+	.id = tmp513,
+};
+
 static const struct i2c_device_id tmp51x_id[] = {
-	{ "tmp512", tmp512 },
-	{ "tmp513", tmp513 },
+	{ "tmp512", (kernel_ulong_t)&tmp512_info },
+	{ "tmp513", (kernel_ulong_t)&tmp513_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp51x_id);
 
 static const struct of_device_id tmp51x_of_match[] = {
-	{
-		.compatible = "ti,tmp512",
-		.data = (void *)tmp512
-	},
-	{
-		.compatible = "ti,tmp513",
-		.data = (void *)tmp513
-	},
+	{ .compatible = "ti,tmp512", .data = &tmp512_info },
+	{ .compatible = "ti,tmp513", .data = &tmp513_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tmp51x_of_match);
@@ -674,9 +680,9 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 		return ret;
 
 	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
-					    (data->id == tmp513) ? 3 : 2);
+					    (data->info->id == tmp513) ? 3 : 2);
 	if (ret >= 0)
-		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
+		memcpy(data->nfactor, nfactor, (data->info->id == tmp513) ? 3 : 2);
 
 	// Check if shunt value is compatible with pga-gain
 	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
@@ -698,7 +704,7 @@ static void tmp51x_use_default(struct tmp51x_data *data)
 static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
 {
 	data->shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT;
-	data->temp_config = (data->id == tmp513) ?
+	data->temp_config = (data->info->id == tmp513) ?
 			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
 
 	if (dev->of_node)
@@ -720,10 +726,7 @@ static int tmp51x_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	if (client->dev.of_node)
-		data->id = (uintptr_t)device_get_match_data(&client->dev);
-	else
-		data->id = i2c_match_id(tmp51x_id, client)->driver_data;
+	data->info = i2c_get_match_data(client);
 
 	ret = tmp51x_configure(dev, data);
 	if (ret < 0) {
-- 
2.25.1

