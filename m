Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41CD787989
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 22:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243574AbjHXUpl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 16:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243569AbjHXUpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 16:45:15 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A3DA1707;
        Thu, 24 Aug 2023 13:45:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,195,1688396400"; 
   d="scan'208";a="173867909"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2023 05:45:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD6FB4005B25;
        Fri, 25 Aug 2023 05:45:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels in struct tmp51x_data
Date:   Thu, 24 Aug 2023 21:44:56 +0100
Message-Id: <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
using tmp51x_ids for this HW difference by replacing
tmp51x_ids->max_channels in struct tmp51x_data and drop
enum tmp51x_ids as there is no user.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/hwmon/tmp513.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 9a180b1030c9..d45d358087be 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -113,6 +113,10 @@
 
 #define MAX_TEMP_HYST			127500
 
+#define TMP512_MAX_CHANNELS		3
+#define TMP513_MAX_CHANNELS		4
+#define TMP51X_TEMP_CONFIG_DEFAULT(a) (0x8780 | GENMASK(11 + (a) - 1, 11))
+
 static const u8 TMP51X_TEMP_INPUT[4] = {
 	TMP51X_LOCAL_TEMP_RESULT,
 	TMP51X_REMOTE_TEMP_RESULT_1,
@@ -152,10 +156,6 @@ static struct regmap_config tmp51x_regmap_config = {
 	.max_register = TMP51X_MAX_REGISTER_ADDR,
 };
 
-enum tmp51x_ids {
-	tmp512, tmp513
-};
-
 struct tmp51x_data {
 	u16 shunt_config;
 	u16 pga_gain;
@@ -169,7 +169,7 @@ struct tmp51x_data {
 	u32 curr_lsb_ua;
 	u32 pwr_lsb_uw;
 
-	enum tmp51x_ids id;
+	u8 max_channels;
 	struct regmap *regmap;
 };
 
@@ -434,7 +434,7 @@ static umode_t tmp51x_is_visible(const void *_data,
 
 	switch (type) {
 	case hwmon_temp:
-		if (data->id == tmp512 && channel == 3)
+		if (data->max_channels == channel)
 			return 0;
 		switch (attr) {
 		case hwmon_temp_input:
@@ -585,7 +585,7 @@ static int tmp51x_init(struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	if (data->id == tmp513) {
+	if (data->max_channels == TMP513_MAX_CHANNELS) {
 		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
 				   data->nfactor[2] << 8);
 		if (ret < 0)
@@ -601,8 +601,8 @@ static int tmp51x_init(struct tmp51x_data *data)
 }
 
 static const struct i2c_device_id tmp51x_id[] = {
-	{ "tmp512", tmp512 },
-	{ "tmp513", tmp513 },
+	{ "tmp512", TMP512_MAX_CHANNELS },
+	{ "tmp513", TMP513_MAX_CHANNELS },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp51x_id);
@@ -610,11 +610,11 @@ MODULE_DEVICE_TABLE(i2c, tmp51x_id);
 static const struct of_device_id tmp51x_of_match[] = {
 	{
 		.compatible = "ti,tmp512",
-		.data = (void *)tmp512
+		.data = (void *)TMP512_MAX_CHANNELS
 	},
 	{
 		.compatible = "ti,tmp513",
-		.data = (void *)tmp513
+		.data = (void *)TMP513_MAX_CHANNELS
 	},
 	{ },
 };
@@ -674,9 +674,9 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 		return ret;
 
 	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
-					    (data->id == tmp513) ? 3 : 2);
+					    data->max_channels - 1);
 	if (ret >= 0)
-		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
+		memcpy(data->nfactor, nfactor, data->max_channels - 1);
 
 	// Check if shunt value is compatible with pga-gain
 	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
@@ -698,8 +698,7 @@ static void tmp51x_use_default(struct tmp51x_data *data)
 static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
 {
 	data->shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT;
-	data->temp_config = (data->id == tmp513) ?
-			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
+	data->temp_config = TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
 
 	if (dev->of_node)
 		return tmp51x_read_properties(dev, data);
@@ -720,7 +719,7 @@ static int tmp51x_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	data->id = (uintptr_t)i2c_get_match_data(client);
+	data->max_channels = (uintptr_t)i2c_get_match_data(client);
 
 	ret = tmp51x_configure(dev, data);
 	if (ret < 0) {
-- 
2.25.1

