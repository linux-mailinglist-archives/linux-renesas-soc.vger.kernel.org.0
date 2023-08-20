Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11C2781DE0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 14:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjHTMyB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 08:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjHTMx5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 08:53:57 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A5AF4486;
        Sun, 20 Aug 2023 05:49:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="173391628"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Aug 2023 21:49:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4D7CA4001DDB;
        Sun, 20 Aug 2023 21:49:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: tmp513: Add temp_config to struct tmp51x_info
Date:   Sun, 20 Aug 2023 13:49:10 +0100
Message-Id: <20230820124910.71526-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
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

Move temp_config from struct tmp51x_data to struct tmp51x_info and
remove unnecessary check in tmp51x_configure().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/hwmon/tmp513.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 22f6000bc50a..138e02a99304 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -158,6 +158,7 @@ enum tmp51x_ids {
 
 struct tmp51x_info {
 	enum tmp51x_ids id;
+	u16 temp_config;
 };
 
 struct tmp51x_data {
@@ -165,7 +166,6 @@ struct tmp51x_data {
 	u16 pga_gain;
 	u32 vbus_range_uvolt;
 
-	u16 temp_config;
 	u32 nfactor[3];
 
 	u32 shunt_uohms;
@@ -574,7 +574,8 @@ static int tmp51x_init(struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_write(data->regmap, TMP51X_TEMP_CONFIG, data->temp_config);
+	ret = regmap_write(data->regmap, TMP51X_TEMP_CONFIG,
+			   data->info->temp_config);
 	if (ret < 0)
 		return ret;
 
@@ -606,10 +607,12 @@ static int tmp51x_init(struct tmp51x_data *data)
 
 static const struct tmp51x_info tmp512_info = {
 	.id = tmp512,
+	.temp_config = TMP512_TEMP_CONFIG_DEFAULT,
 };
 
 static const struct tmp51x_info tmp513_info = {
 	.id = tmp513,
+	.temp_config = TMP513_TEMP_CONFIG_DEFAULT,
 };
 
 static const struct i2c_device_id tmp51x_id[] = {
@@ -704,9 +707,6 @@ static void tmp51x_use_default(struct tmp51x_data *data)
 static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
 {
 	data->shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT;
-	data->temp_config = (data->info->id == tmp513) ?
-			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
-
 	if (dev->of_node)
 		return tmp51x_read_properties(dev, data);
 
-- 
2.25.1

