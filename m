Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D133C78953A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 11:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjHZJi3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 05:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjHZJiP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 05:38:15 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4909894
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 02:38:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177737945"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 18:38:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6372141991DC;
        Sat, 26 Aug 2023 18:38:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: da9062: Simplify probe()
Date:   Sat, 26 Aug 2023 10:38:07 +0100
Message-Id: <20230826093807.60993-1-biju.das.jz@bp.renesas.com>
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
 drivers/mfd/da9062-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 45da007d3e70..28c5fcdafcfa 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -597,7 +597,6 @@ MODULE_DEVICE_TABLE(of, da9062_dt_ids);
 
 static int da9062_i2c_probe(struct i2c_client *i2c)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
 	struct da9062 *chip;
 	unsigned int irq_base = 0;
 	const struct mfd_cell *cell;
@@ -611,10 +610,7 @@ static int da9062_i2c_probe(struct i2c_client *i2c)
 	if (!chip)
 		return -ENOMEM;
 
-	if (i2c->dev.of_node)
-		chip->chip_type = (uintptr_t)of_device_get_match_data(&i2c->dev);
-	else
-		chip->chip_type = id->driver_data;
+	chip->chip_type = (uintptr_t)i2c_get_match_data(i2c);
 
 	i2c_set_clientdata(i2c, chip);
 	chip->dev = &i2c->dev;
-- 
2.25.1

