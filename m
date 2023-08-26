Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E64B7898B0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 20:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjHZSad (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 14:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjHZSa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 14:30:29 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C632E1736
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 11:30:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177758093"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 03:30:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B0E15405DF49;
        Sun, 27 Aug 2023 03:30:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Saravanan Sekar <sravanhome@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: mp5416: Make similar OF and ID table
Date:   Sat, 26 Aug 2023 19:30:20 +0100
Message-Id: <20230826183020.102196-1-biju.das.jz@bp.renesas.com>
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
 drivers/regulator/mp5416.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/mp5416.c b/drivers/regulator/mp5416.c
index d068ac93d373..e07222c166f5 100644
--- a/drivers/regulator/mp5416.c
+++ b/drivers/regulator/mp5416.c
@@ -200,7 +200,7 @@ static int mp5416_i2c_probe(struct i2c_client *client)
 		return PTR_ERR(regmap);
 	}
 
-	desc = of_device_get_match_data(dev);
+	desc = i2c_get_match_data(client);
 	if (!desc)
 		return -ENODEV;
 
@@ -228,8 +228,8 @@ static const struct of_device_id mp5416_of_match[] = {
 MODULE_DEVICE_TABLE(of, mp5416_of_match);
 
 static const struct i2c_device_id mp5416_id[] = {
-	{ "mp5416", },
-	{ "mp5496", },
+	{ "mp5416", (kernel_ulong_t)&mp5416_regulators_desc },
+	{ "mp5496", (kernel_ulong_t)&mp5496_regulators_desc },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mp5416_id);
-- 
2.25.1

