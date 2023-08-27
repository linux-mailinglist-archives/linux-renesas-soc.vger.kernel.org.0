Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786B8789C0D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Aug 2023 10:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjH0IJ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Aug 2023 04:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjH0IJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Aug 2023 04:09:46 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C55C12E
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Aug 2023 01:09:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,204,1688396400"; 
   d="scan'208";a="177793568"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 17:09:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 78A3A4004474;
        Sun, 27 Aug 2023 17:09:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: cs42xx8-i2c: Simplify probe()
Date:   Sun, 27 Aug 2023 09:09:31 +0100
Message-Id: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Simplify probe() by replacing of_match_device->i2c_get_match_data() and
extend matching support for ID table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/cs42xx8-i2c.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index a422472820fb..0f8e2d8cc876 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -18,21 +18,15 @@
 
 #include "cs42xx8.h"
 
-static const struct of_device_id cs42xx8_of_match[];
-
 static int cs42xx8_i2c_probe(struct i2c_client *i2c)
 {
 	int ret;
 	struct cs42xx8_driver_data *drvdata;
-	const struct of_device_id *of_id;
-
-	of_id = of_match_device(cs42xx8_of_match, &i2c->dev);
-	if (!of_id) {
-		dev_err(&i2c->dev, "failed to find driver data\n");
-		return -EINVAL;
-	}
 
-	drvdata = (struct cs42xx8_driver_data *)of_id->data;
+	drvdata = (struct cs42xx8_driver_data *)i2c_get_match_data(i2c);
+	if (!drvdata)
+		return dev_err_probe(&i2c->dev, -ENODEV,
+				     "failed to find driver data\n");
 
 	ret = cs42xx8_probe(&i2c->dev,
 		devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config), drvdata);
-- 
2.25.1

