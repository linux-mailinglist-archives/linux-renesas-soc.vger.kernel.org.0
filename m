Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A999A789CC9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Aug 2023 11:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjH0JqI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Aug 2023 05:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjH0Jps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Aug 2023 05:45:48 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8264111B
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Aug 2023 02:45:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,204,1688396400"; 
   d="scan'208";a="177796622"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 18:45:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8836E41AE7AD;
        Sun, 27 Aug 2023 18:45:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Date:   Sun, 27 Aug 2023 10:45:36 +0100
Message-Id: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
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

Simplify probe() by replacing of_match_node() and i2c_match_id() with
i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 49b33a256cd7..513f257818ca 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -16,9 +16,6 @@
 
 #include "tlv320aic32x4.h"
 
-static const struct of_device_id aic32x4_of_id[];
-static const struct i2c_device_id aic32x4_i2c_id[];
-
 static int aic32x4_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap *regmap;
@@ -30,17 +27,7 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c)
 
 	regmap = devm_regmap_init_i2c(i2c, &config);
 
-	if (i2c->dev.of_node) {
-		const struct of_device_id *oid;
-
-		oid = of_match_node(aic32x4_of_id, i2c->dev.of_node);
-		dev_set_drvdata(&i2c->dev, (void *)oid->data);
-	} else {
-		const struct i2c_device_id *id;
-
-		id = i2c_match_id(aic32x4_i2c_id, i2c);
-		dev_set_drvdata(&i2c->dev, (void *)id->driver_data);
-	}
+	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));
 
 	return aic32x4_probe(&i2c->dev, regmap);
 }
-- 
2.25.1

