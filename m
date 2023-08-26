Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EACAD789656
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 13:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbjHZLte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 07:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjHZLt1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 07:49:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE07019BA
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 04:49:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177743260"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 20:49:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C7D9E4008575;
        Sat, 26 Aug 2023 20:49:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: pv880x0: Simplify probe()
Date:   Sat, 26 Aug 2023 12:49:19 +0100
Message-Id: <20230826114919.73897-1-biju.das.jz@bp.renesas.com>
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

Replace pv88080_types->pv88080_compatible_regmap in OF/ID tables and
simplify the probe() by replacing of_match_node() and ID lookup for
retrieving match data by i2c_get_match_data(). After this there is
no user of enum pv88080_types. So drop it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
 Checkpatch complains belwo warnig:
 DT compatible string vendor "pvs" appears un-documented
 -- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
---
 drivers/regulator/pv88080-regulator.c | 51 ++++++++-------------------
 1 file changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/regulator/pv88080-regulator.c b/drivers/regulator/pv88080-regulator.c
index 7ab3e4a9bd28..602a81253b63 100644
--- a/drivers/regulator/pv88080-regulator.c
+++ b/drivers/regulator/pv88080-regulator.c
@@ -28,11 +28,6 @@ enum {
 	PV88080_ID_HVBUCK,
 };
 
-enum pv88080_types {
-	TYPE_PV88080_AA,
-	TYPE_PV88080_BA,
-};
-
 struct pv88080_regulator {
 	struct regulator_desc desc;
 	unsigned int mode_reg;
@@ -198,14 +193,22 @@ static const struct pv88080_compatible_regmap pv88080_ba_regs = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id pv88080_dt_ids[] = {
-	{ .compatible = "pvs,pv88080",    .data = (void *)TYPE_PV88080_AA },
-	{ .compatible = "pvs,pv88080-aa", .data = (void *)TYPE_PV88080_AA },
-	{ .compatible = "pvs,pv88080-ba", .data = (void *)TYPE_PV88080_BA },
+	{ .compatible = "pvs,pv88080",    .data = &pv88080_aa_regs },
+	{ .compatible = "pvs,pv88080-aa", .data = &pv88080_aa_regs  },
+	{ .compatible = "pvs,pv88080-ba", .data = &pv88080_ba_regs },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pv88080_dt_ids);
 #endif
 
+static const struct i2c_device_id pv88080_i2c_id[] = {
+	{ "pv88080",    (kernel_ulong_t)&pv88080_aa_regs },
+	{ "pv88080-aa", (kernel_ulong_t)&pv88080_aa_regs },
+	{ "pv88080-ba", (kernel_ulong_t)&pv88080_ba_regs },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
+
 static unsigned int pv88080_buck_get_mode(struct regulator_dev *rdev)
 {
 	struct pv88080_regulator *info = rdev_get_drvdata(rdev);
@@ -376,11 +379,9 @@ static irqreturn_t pv88080_irq_handler(int irq, void *data)
  */
 static int pv88080_i2c_probe(struct i2c_client *i2c)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
 	struct regulator_init_data *init_data = dev_get_platdata(&i2c->dev);
 	struct pv88080 *chip;
 	const struct pv88080_compatible_regmap *regmap_config;
-	const struct of_device_id *match;
 	struct regulator_config config = { };
 	int i, error, ret;
 	unsigned int conf2, conf5;
@@ -398,16 +399,9 @@ static int pv88080_i2c_probe(struct i2c_client *i2c)
 		return error;
 	}
 
-	if (i2c->dev.of_node) {
-		match = of_match_node(pv88080_dt_ids, i2c->dev.of_node);
-		if (!match) {
-			dev_err(chip->dev, "Failed to get of_match_node\n");
-			return -EINVAL;
-		}
-		chip->type = (unsigned long)match->data;
-	} else {
-		chip->type = id->driver_data;
-	}
+	chip->regmap_config = i2c_get_match_data(i2c);
+	if (!chip->regmap_config)
+		return -ENODEV;
 
 	i2c_set_clientdata(i2c, chip);
 
@@ -452,15 +446,6 @@ static int pv88080_i2c_probe(struct i2c_client *i2c)
 		dev_warn(chip->dev, "No IRQ configured\n");
 	}
 
-	switch (chip->type) {
-	case TYPE_PV88080_AA:
-		chip->regmap_config = &pv88080_aa_regs;
-		break;
-	case TYPE_PV88080_BA:
-		chip->regmap_config = &pv88080_ba_regs;
-		break;
-	}
-
 	regmap_config = chip->regmap_config;
 	config.dev = chip->dev;
 	config.regmap = chip->regmap;
@@ -546,14 +531,6 @@ static int pv88080_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-static const struct i2c_device_id pv88080_i2c_id[] = {
-	{ "pv88080",    TYPE_PV88080_AA },
-	{ "pv88080-aa", TYPE_PV88080_AA },
-	{ "pv88080-ba", TYPE_PV88080_BA },
-	{},
-};
-MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
-
 static struct i2c_driver pv88080_regulator_driver = {
 	.driver = {
 		.name = "pv88080",
-- 
2.25.1

