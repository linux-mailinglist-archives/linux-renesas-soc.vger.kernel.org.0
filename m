Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA5C789873
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 19:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjHZRjO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 13:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjHZRiu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 13:38:50 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6CC410A
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 10:38:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177756427"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 02:38:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C29384000C72;
        Sun, 27 Aug 2023 02:38:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: mp886x: Make similar OF and ID table
Date:   Sat, 26 Aug 2023 18:38:41 +0100
Message-Id: <20230826173841.91807-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/regulator/mp886x.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index 9911be2e6bac..48dcee5287f3 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -315,7 +315,7 @@ static int mp886x_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(di->en_gpio))
 		return PTR_ERR(di->en_gpio);
 
-	di->ci = of_device_get_match_data(dev);
+	di->ci = i2c_get_match_data(client);
 	di->dev = dev;
 
 	regmap = devm_regmap_init_i2c(client, &mp886x_regmap_config);
@@ -341,20 +341,14 @@ static int mp886x_i2c_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id mp886x_dt_ids[] = {
-	{
-		.compatible = "mps,mp8867",
-		.data = &mp8867_ci
-	},
-	{
-		.compatible = "mps,mp8869",
-		.data = &mp8869_ci
-	},
+	{ .compatible = "mps,mp8867", .data = &mp8867_ci },
+	{ .compatible = "mps,mp8869", .data = &mp8869_ci },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mp886x_dt_ids);
 
 static const struct i2c_device_id mp886x_id[] = {
-	{ "mp886x", },
+	{ "mp886x", (kernel_ulong_t)&mp8869_ci },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mp886x_id);
-- 
2.25.1

