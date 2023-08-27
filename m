Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587C5789C8A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Aug 2023 11:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjH0JP7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Aug 2023 05:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjH0JPf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Aug 2023 05:15:35 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 885F3D8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Aug 2023 02:15:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,204,1688396400"; 
   d="scan'208";a="177795749"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 18:15:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B68AB41A6E4A;
        Sun, 27 Aug 2023 18:15:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kevin Cernekee <cernekee@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: tas571x: Simplify probe()
Date:   Sun, 27 Aug 2023 10:15:25 +0100
Message-Id: <20230827091525.39263-1-biju.das.jz@bp.renesas.com>
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

Simplify probe() by replacing of_match_device->i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/tas571x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 1756edb35961..a220342c3d77 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -829,14 +829,10 @@ static struct snd_soc_dai_driver tas571x_dai = {
 	.ops = &tas571x_dai_ops,
 };
 
-static const struct of_device_id tas571x_of_match[] __maybe_unused;
-static const struct i2c_device_id tas571x_i2c_id[];
-
 static int tas571x_i2c_probe(struct i2c_client *client)
 {
 	struct tas571x_private *priv;
 	struct device *dev = &client->dev;
-	const struct of_device_id *of_id;
 	int i, ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -844,14 +840,7 @@ static int tas571x_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 	i2c_set_clientdata(client, priv);
 
-	of_id = of_match_device(tas571x_of_match, dev);
-	if (of_id)
-		priv->chip = of_id->data;
-	else {
-		const struct i2c_device_id *id =
-			i2c_match_id(tas571x_i2c_id, client);
-		priv->chip = (void *) id->driver_data;
-	}
+	priv->chip = i2c_get_match_data(client);
 
 	priv->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(priv->mclk) && PTR_ERR(priv->mclk) != -ENOENT) {
-- 
2.25.1

