Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E37C789000
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 22:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbjHYUyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 16:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjHYUyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 16:54:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A53B71FF0;
        Fri, 25 Aug 2023 13:53:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,201,1688396400"; 
   d="scan'208";a="173998517"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2023 05:53:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0589940031FF;
        Sat, 26 Aug 2023 05:53:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and variable id from struct tmp51x_data
Date:   Fri, 25 Aug 2023 21:53:44 +0100
Message-Id: <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
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

Drop variable id from struct tmp51x_data and enum tmp51x_ids as all the
hw differences can be handled by max_channels.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated the macro TMP51X_TEMP_CONFIG_DEFAULT by adding bit definitions.
 * Dropped unused macros TMP51{2,3}_TEMP_CONFIG_DEFAULT.
---
 drivers/hwmon/tmp513.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 99f66f9d5f19..6bbae4735a4b 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -19,6 +19,7 @@
  * the Free Software Foundation; version 2 of the License.
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
@@ -73,9 +74,6 @@
 #define TMP51X_PGA_DEFAULT		8
 #define TMP51X_MAX_REGISTER_ADDR	0xFF
 
-#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
-#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
-
 // Mask and shift
 #define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
 #define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
@@ -116,6 +114,22 @@
 #define TMP512_MAX_CHANNELS		3
 #define TMP513_MAX_CHANNELS		4
 
+#define TMP51X_TEMP_CONFIG_GPM_MASK	BIT(2)
+#define TMP51X_TEMP_CONFIG_RC_MASK	BIT(10)
+#define TMP51X_TEMP_CONFIG_CONT_MASK	BIT(15)
+
+#define TMP51X_TEMP_CONFIG_GPM		FIELD_PREP(GENMASK(1, 0), 0)
+#define TMP51X_TEMP_CONFIG_GP		FIELD_PREP(TMP51X_TEMP_CONFIG_GPM_MASK, 0)
+#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)
+#define TMP51X_TEMP_CONFIG_RC		FIELD_PREP(TMP51X_TEMP_CONFIG_RC_MASK, 1)
+#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11), GENMASK(n, 0) > 1)
+#define TMP51X_TEMP_CONFIG_CONT		FIELD_PREP(TMP51X_TEMP_CONFIG_CONT_MASK, 1)
+
+#define TMP51X_TEMP_CONFIG_DEFAULT(n) \
+			(TMP51X_TEMP_CONFIG_GPM | TMP51X_TEMP_CONFIG_GP | \
+			 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC | \
+			 TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT)
+
 static const u8 TMP51X_TEMP_INPUT[4] = {
 	TMP51X_LOCAL_TEMP_RESULT,
 	TMP51X_REMOTE_TEMP_RESULT_1,
@@ -155,10 +169,6 @@ static struct regmap_config tmp51x_regmap_config = {
 	.max_register = TMP51X_MAX_REGISTER_ADDR,
 };
 
-enum tmp51x_ids {
-	tmp512, tmp513
-};
-
 struct tmp51x_data {
 	u16 shunt_config;
 	u16 pga_gain;
@@ -172,7 +182,6 @@ struct tmp51x_data {
 	u32 curr_lsb_ua;
 	u32 pwr_lsb_uw;
 
-	enum tmp51x_ids id;
 	u8 max_channels;
 	struct regmap *regmap;
 };
@@ -589,7 +598,7 @@ static int tmp51x_init(struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	if (data->id == tmp513) {
+	if (data->max_channels == TMP513_MAX_CHANNELS) {
 		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
 				   data->nfactor[2] << 8);
 		if (ret < 0)
@@ -672,9 +681,9 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 		return ret;
 
 	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
-					    (data->id == tmp513) ? 3 : 2);
+					    data->max_channels - 1);
 	if (ret >= 0)
-		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
+		memcpy(data->nfactor, nfactor, data->max_channels - 1);
 
 	// Check if shunt value is compatible with pga-gain
 	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
@@ -696,8 +705,7 @@ static void tmp51x_use_default(struct tmp51x_data *data)
 static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
 {
 	data->shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT;
-	data->temp_config = (data->id == tmp513) ?
-			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
+	data->temp_config = TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
 
 	if (dev->of_node)
 		return tmp51x_read_properties(dev, data);
@@ -719,10 +727,6 @@ static int tmp51x_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->max_channels = (uintptr_t)i2c_get_match_data(client);
-	if (data->max_channels == TMP513_MAX_CHANNELS)
-		data->id = tmp513;
-	else
-		data->id = tmp512;
 
 	ret = tmp51x_configure(dev, data);
 	if (ret < 0) {
-- 
2.25.1

