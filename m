Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99BF789505
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 11:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjHZJKb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 05:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjHZJK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 05:10:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0B8D8E6F
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 02:10:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177736982"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 18:10:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 935914002C15;
        Sat, 26 Aug 2023 18:10:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: max77541: Simplify probe()
Date:   Sat, 26 Aug 2023 10:10:20 +0100
Message-Id: <20230826091020.45621-1-biju.das.jz@bp.renesas.com>
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

Simplify probe() by replacing device_get_match_data() and ID lookup for
retrieving match data by i2c_get_match_data().

While at it, drop leading commas from OF table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/mfd/max77541.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/max77541.c b/drivers/mfd/max77541.c
index 10c2e274b4af..12585df2b8cb 100644
--- a/drivers/mfd/max77541.c
+++ b/drivers/mfd/max77541.c
@@ -162,7 +162,6 @@ static int max77541_pmic_setup(struct device *dev)
 
 static int max77541_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct device *dev = &client->dev;
 	struct max77541 *max77541;
 
@@ -173,12 +172,9 @@ static int max77541_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, max77541);
 	max77541->i2c = client;
 
-	max77541->id = (uintptr_t)device_get_match_data(dev);
+	max77541->id = (uintptr_t)i2c_get_match_data(client);
 	if (!max77541->id)
-		max77541->id  = (enum max7754x_ids)id->driver_data;
-
-	if (!max77541->id)
-		return -EINVAL;
+		return -ENODEV;
 
 	max77541->regmap = devm_regmap_init_i2c(client,
 						&max77541_regmap_config);
@@ -190,14 +186,8 @@ static int max77541_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id max77541_of_id[] = {
-	{
-		.compatible = "adi,max77540",
-		.data = (void *)MAX77540,
-	},
-	{
-		.compatible = "adi,max77541",
-		.data = (void *)MAX77541,
-	},
+	{ .compatible = "adi,max77540", .data = (void *)MAX77540 },
+	{ .compatible = "adi,max77541", .data = (void *)MAX77541 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max77541_of_id);
-- 
2.25.1

