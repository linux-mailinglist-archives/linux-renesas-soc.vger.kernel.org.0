Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6EA431F45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Oct 2021 16:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhJROSf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Oct 2021 10:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhJROSb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 10:18:31 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A76C061786
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Oct 2021 07:01:14 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e87a:7c37:aec5:5884])
        by andre.telenet-ops.be with bizsmtp
        id 7S1D2600322VXnz01S1DK3; Mon, 18 Oct 2021 16:01:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcTCS-005v0i-Pv; Mon, 18 Oct 2021 16:01:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcTCS-00Ddmw-6W; Mon, 18 Oct 2021 16:01:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Adam Ford <aford173@gmail.com>, patches@opensource.cirrus.com
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: wm8962: Convert to devm_clk_get_optional()
Date:   Mon, 18 Oct 2021 16:01:11 +0200
Message-Id: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the existing devm_clk_get_optional() helper instead of building a
similar construct on top of devm_clk_get() that fails to handle all
errors but -EPROBE_DEFER.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 sound/soc/codecs/wm8962.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index ba16bdf9e478ca5f..a5584ba962dcf005 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3538,9 +3538,8 @@ static int wm8962_set_pdata_from_of(struct i2c_client *i2c,
 				pdata->gpio_init[i] = 0x0;
 		}
 
-	pdata->mclk = devm_clk_get(&i2c->dev, NULL);
-
-	return 0;
+	pdata->mclk = devm_clk_get_optional(&i2c->dev, NULL);
+	return PTR_ERR_OR_ZERO(pdata->mclk);
 }
 
 static int wm8962_i2c_probe(struct i2c_client *i2c,
@@ -3572,14 +3571,6 @@ static int wm8962_i2c_probe(struct i2c_client *i2c,
 			return ret;
 	}
 
-	/* Mark the mclk pointer to NULL if no mclk assigned */
-	if (IS_ERR(wm8962->pdata.mclk)) {
-		/* But do not ignore the request for probe defer */
-		if (PTR_ERR(wm8962->pdata.mclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		wm8962->pdata.mclk = NULL;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(wm8962->supplies); i++)
 		wm8962->supplies[i].supply = wm8962_supply_names[i];
 
-- 
2.25.1

