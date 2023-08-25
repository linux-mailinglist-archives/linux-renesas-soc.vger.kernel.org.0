Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97F1788FFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 22:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjHYUyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 16:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjHYUx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 16:53:56 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B34981FF0;
        Fri, 25 Aug 2023 13:53:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,201,1688396400"; 
   d="scan'208";a="177704970"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 05:53:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9957C4001976;
        Sat, 26 Aug 2023 05:53:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] hwmon: tmp513: Add max_channels variable to struct tmp51x_data
Date:   Fri, 25 Aug 2023 21:53:43 +0100
Message-Id: <20230825205345.632792-2-biju.das.jz@bp.renesas.com>
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

The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
using tmp51x_ids for this HW difference by replacing OF/ID table
data with maximum channels supported by the device.

Add max_channels variable to struct tmp51x_data and fix the logic for
invalid channel in tmp51x_is_visible().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch split from patch #3
 * Avoided Yoda style logic.
 * Replaced OF/ID data from tmp51x_ids->max_channels
---
 drivers/hwmon/tmp513.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 9a180b1030c9..99f66f9d5f19 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -113,6 +113,9 @@
 
 #define MAX_TEMP_HYST			127500
 
+#define TMP512_MAX_CHANNELS		3
+#define TMP513_MAX_CHANNELS		4
+
 static const u8 TMP51X_TEMP_INPUT[4] = {
 	TMP51X_LOCAL_TEMP_RESULT,
 	TMP51X_REMOTE_TEMP_RESULT_1,
@@ -170,6 +173,7 @@ struct tmp51x_data {
 	u32 pwr_lsb_uw;
 
 	enum tmp51x_ids id;
+	u8 max_channels;
 	struct regmap *regmap;
 };
 
@@ -434,7 +438,7 @@ static umode_t tmp51x_is_visible(const void *_data,
 
 	switch (type) {
 	case hwmon_temp:
-		if (data->id == tmp512 && channel == 3)
+		if (channel >= data->max_channels)
 			return 0;
 		switch (attr) {
 		case hwmon_temp_input:
@@ -601,21 +605,15 @@ static int tmp51x_init(struct tmp51x_data *data)
 }
 
 static const struct i2c_device_id tmp51x_id[] = {
-	{ "tmp512", tmp512 },
-	{ "tmp513", tmp513 },
+	{ "tmp512", TMP512_MAX_CHANNELS },
+	{ "tmp513", TMP513_MAX_CHANNELS },
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
+	{ .compatible = "ti,tmp512", .data = (void *)TMP512_MAX_CHANNELS },
+	{ .compatible = "ti,tmp513", .data = (void *)TMP513_MAX_CHANNELS },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tmp51x_of_match);
@@ -720,7 +718,11 @@ static int tmp51x_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	data->id = (uintptr_t)i2c_get_match_data(client);
+	data->max_channels = (uintptr_t)i2c_get_match_data(client);
+	if (data->max_channels == TMP513_MAX_CHANNELS)
+		data->id = tmp513;
+	else
+		data->id = tmp512;
 
 	ret = tmp51x_configure(dev, data);
 	if (ret < 0) {
-- 
2.25.1

