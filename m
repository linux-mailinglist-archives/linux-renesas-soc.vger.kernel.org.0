Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6074C78984C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 18:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjHZQxz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 12:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjHZQxY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 12:53:24 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1901719A0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 09:53:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="174046975"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2023 01:53:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B922E400296A;
        Sun, 27 Aug 2023 01:53:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: max20086: Make similar OF and ID table
Date:   Sat, 26 Aug 2023 17:53:16 +0100
Message-Id: <20230826165316.77949-1-biju.das.jz@bp.renesas.com>
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

Make similar OF and ID table to extend support for ID match using
i2c_match_data(). Currently it works only for OF match tables as the
driver_data is wrong for ID match.

While at it, drop blank lines before MODULE_DEVICE_TABLE*.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/regulator/max20086-regulator.c | 61 ++++++++++++--------------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index 32f47b896fd1..9aba4f8ebe46 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -223,7 +223,7 @@ static int max20086_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	chip->dev = &i2c->dev;
-	chip->info = device_get_match_data(chip->dev);
+	chip->info = i2c_get_match_data(i2c);
 
 	i2c_set_clientdata(i2c, chip);
 
@@ -275,45 +275,42 @@ static int max20086_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
+static const struct max20086_chip_info max20086_chip_info = {
+	.id = MAX20086_DEVICE_ID_MAX20086,
+	.num_outputs = 4,
+};
+
+static const struct max20086_chip_info max20087_chip_info = {
+	.id = MAX20086_DEVICE_ID_MAX20087,
+	.num_outputs = 4,
+};
+
+static const struct max20086_chip_info max20088_chip_info = {
+	.id = MAX20086_DEVICE_ID_MAX20088,
+	.num_outputs = 2,
+};
+
+static const struct max20086_chip_info max20089_chip_info = {
+	.id = MAX20086_DEVICE_ID_MAX20089,
+	.num_outputs = 2,
+};
+
 static const struct i2c_device_id max20086_i2c_id[] = {
-	{ "max20086" },
-	{ "max20087" },
-	{ "max20088" },
-	{ "max20089" },
+	{ "max20086", (kernel_ulong_t)&max20086_chip_info },
+	{ "max20087", (kernel_ulong_t)&max20087_chip_info },
+	{ "max20088", (kernel_ulong_t)&max20088_chip_info },
+	{ "max20089", (kernel_ulong_t)&max20089_chip_info },
 	{ /* Sentinel */ },
 };
-
 MODULE_DEVICE_TABLE(i2c, max20086_i2c_id);
 
 static const struct of_device_id max20086_dt_ids[] __maybe_unused = {
-	{
-		.compatible = "maxim,max20086",
-		.data = &(const struct max20086_chip_info) {
-			.id = MAX20086_DEVICE_ID_MAX20086,
-			.num_outputs = 4,
-		}
-	}, {
-		.compatible = "maxim,max20087",
-		.data = &(const struct max20086_chip_info) {
-			.id = MAX20086_DEVICE_ID_MAX20087,
-			.num_outputs = 4,
-		}
-	}, {
-		.compatible = "maxim,max20088",
-		.data = &(const struct max20086_chip_info) {
-			.id = MAX20086_DEVICE_ID_MAX20088,
-			.num_outputs = 2,
-		}
-	}, {
-		.compatible = "maxim,max20089",
-		.data = &(const struct max20086_chip_info) {
-			.id = MAX20086_DEVICE_ID_MAX20089,
-			.num_outputs = 2,
-		}
-	},
+	{ .compatible = "maxim,max20086", .data = &max20086_chip_info },
+	{ .compatible = "maxim,max20087", .data = &max20087_chip_info },
+	{ .compatible = "maxim,max20088", .data = &max20088_chip_info },
+	{ .compatible = "maxim,max20089", .data = &max20089_chip_info },
 	{ /* Sentinel */ },
 };
-
 MODULE_DEVICE_TABLE(of, max20086_dt_ids);
 
 static struct i2c_driver max20086_regulator_driver = {
-- 
2.25.1

