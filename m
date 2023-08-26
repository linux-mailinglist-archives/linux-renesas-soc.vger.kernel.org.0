Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB337898A9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 20:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjHZST0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 14:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjHZSTS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 14:19:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7CD2100
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 11:19:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177757765"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 03:19:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B384B400752F;
        Sun, 27 Aug 2023 03:19:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: ltc3589: Convert enum->pointer for data in the match tables
Date:   Sat, 26 Aug 2023 19:19:09 +0100
Message-Id: <20230826181909.96318-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert enum->pointer for data in the match tables, so that the hw
differences can be stored in pointer and there by simpily the code.

Add struct ltc3589_info for hw differences between the devices and replace
ltc3589_variant->ltc3589_info for data in the match table. Simplify the
probe() by replacing of_device_get_match_data() and ID lookup for
retrieving data by i2c_get_match_data(). Drop enum ltc3589_variant and
variant from struct ltc3589_info as there are no users.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/regulator/ltc3589.c | 59 ++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/regulator/ltc3589.c b/drivers/regulator/ltc3589.c
index d892c2a5df7b..2389bfe05045 100644
--- a/drivers/regulator/ltc3589.c
+++ b/drivers/regulator/ltc3589.c
@@ -58,12 +58,6 @@
 #define LTC3589_VRRCR_SW3_RAMP_MASK	GENMASK(5, 4)
 #define LTC3589_VRRCR_LDO2_RAMP_MASK	GENMASK(7, 6)
 
-enum ltc3589_variant {
-	LTC3589,
-	LTC3589_1,
-	LTC3589_2,
-};
-
 enum ltc3589_reg {
 	LTC3589_SW1,
 	LTC3589_SW2,
@@ -76,10 +70,14 @@ enum ltc3589_reg {
 	LTC3589_NUM_REGULATORS,
 };
 
+struct ltc3589_info {
+	int fixed_uV;
+	const unsigned int *volt_table;
+};
+
 struct ltc3589 {
 	struct regmap *regmap;
 	struct device *dev;
-	enum ltc3589_variant variant;
 	struct regulator_desc regulator_descs[LTC3589_NUM_REGULATORS];
 	struct regulator_dev *regulators[LTC3589_NUM_REGULATORS];
 };
@@ -379,8 +377,8 @@ static irqreturn_t ltc3589_isr(int irq, void *dev_id)
 
 static int ltc3589_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct device *dev = &client->dev;
+	const struct ltc3589_info *info;
 	struct regulator_desc *descs;
 	struct ltc3589 *ltc3589;
 	int i, ret;
@@ -390,21 +388,13 @@ static int ltc3589_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, ltc3589);
-	if (client->dev.of_node)
-		ltc3589->variant = (uintptr_t)of_device_get_match_data(&client->dev);
-	else
-		ltc3589->variant = id->driver_data;
+	info = i2c_get_match_data(client);
 	ltc3589->dev = dev;
 
 	descs = ltc3589->regulator_descs;
 	memcpy(descs, ltc3589_regulators, sizeof(ltc3589_regulators));
-	if (ltc3589->variant == LTC3589) {
-		descs[LTC3589_LDO3].fixed_uV = 1800000;
-		descs[LTC3589_LDO4].volt_table = ltc3589_ldo4;
-	} else {
-		descs[LTC3589_LDO3].fixed_uV = 2800000;
-		descs[LTC3589_LDO4].volt_table = ltc3589_12_ldo4;
-	}
+	descs[LTC3589_LDO3].fixed_uV = info->fixed_uV;
+	descs[LTC3589_LDO4].volt_table = info->volt_table;
 
 	ltc3589->regmap = devm_regmap_init_i2c(client, &ltc3589_regmap_config);
 	if (IS_ERR(ltc3589->regmap)) {
@@ -444,27 +434,28 @@ static int ltc3589_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct ltc3589_info ltc3589_info = {
+	.fixed_uV = 1800000,
+	.volt_table = ltc3589_ldo4,
+};
+
+static const struct ltc3589_info ltc3589_12_info = {
+	.fixed_uV = 2800000,
+	.volt_table = ltc3589_12_ldo4,
+};
+
 static const struct i2c_device_id ltc3589_i2c_id[] = {
-	{ "ltc3589",   LTC3589   },
-	{ "ltc3589-1", LTC3589_1 },
-	{ "ltc3589-2", LTC3589_2 },
+	{ "ltc3589",   (kernel_ulong_t)&ltc3589_info },
+	{ "ltc3589-1", (kernel_ulong_t)&ltc3589_12_info },
+	{ "ltc3589-2", (kernel_ulong_t)&ltc3589_12_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc3589_i2c_id);
 
 static const struct of_device_id __maybe_unused ltc3589_of_match[] = {
-	{
-		.compatible = "lltc,ltc3589",
-		.data = (void *)LTC3589,
-	},
-	{
-		.compatible = "lltc,ltc3589-1",
-		.data = (void *)LTC3589_1,
-	},
-	{
-		.compatible = "lltc,ltc3589-2",
-		.data = (void *)LTC3589_2,
-	},
+	{ .compatible = "lltc,ltc3589",   .data = &ltc3589_info },
+	{ .compatible = "lltc,ltc3589-1", .data = &ltc3589_12_info },
+	{ .compatible = "lltc,ltc3589-2", .data = &ltc3589_12_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ltc3589_of_match);
-- 
2.25.1

