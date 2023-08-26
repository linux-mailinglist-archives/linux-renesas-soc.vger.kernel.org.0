Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3841F789866
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 19:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjHZRZS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 13:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjHZRZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 13:25:06 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25460C9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 10:25:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177755965"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 02:25:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3D2234005B51;
        Sun, 27 Aug 2023 02:25:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: fan53555: Simplify probe()
Date:   Sat, 26 Aug 2023 18:24:58 +0100
Message-Id: <20230826172458.88078-1-biju.das.jz@bp.renesas.com>
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

Simplify probe() by replacing of_device_get_match_data() and ID lookup for
retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/regulator/fan53555.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index 48f312167e53..b64274686af8 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -659,7 +659,6 @@ MODULE_DEVICE_TABLE(of, fan53555_dt_ids);
 
 static int fan53555_regulator_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct device_node *np = client->dev.of_node;
 	struct fan53555_device_info *di;
 	struct fan53555_platform_data *pdata;
@@ -682,10 +681,8 @@ static int fan53555_regulator_probe(struct i2c_client *client)
 				     "Platform data not found!\n");
 
 	di->regulator = pdata->regulator;
-	if (client->dev.of_node) {
-		di->vendor =
-			(unsigned long)of_device_get_match_data(&client->dev);
-	} else {
+	di->vendor = (unsigned long)i2c_get_match_data(client);
+	if (!client->dev.of_node) {
 		/* if no ramp constraint set, get the pdata ramp_delay */
 		if (!di->regulator->constraints.ramp_delay) {
 			if (pdata->slew_rate >= ARRAY_SIZE(slew_rates))
@@ -695,8 +692,6 @@ static int fan53555_regulator_probe(struct i2c_client *client)
 			di->regulator->constraints.ramp_delay
 					= slew_rates[pdata->slew_rate];
 		}
-
-		di->vendor = id->driver_data;
 	}
 
 	regmap = devm_regmap_init_i2c(client, &fan53555_regmap_config);
-- 
2.25.1

