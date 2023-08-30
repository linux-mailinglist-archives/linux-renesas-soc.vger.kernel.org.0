Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B710778DC8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Aug 2023 20:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243112AbjH3SqA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Aug 2023 14:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245047AbjH3OYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 10:24:37 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8616D12F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 07:24:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; 
   d="scan'208";a="178194107"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2ED6142170F5;
        Wed, 30 Aug 2023 23:24:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 4/8] drm: adv7511: Add supply_names and num_supplies variables to struct adv7511_chip_info
Date:   Wed, 30 Aug 2023 15:23:54 +0100
Message-Id: <20230830142358.275459-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ADV7511 has 5 power supplies compared to 7 that of ADV75{33,35}. Add
supply_names and num_supplies variables to struct adv7511_chip_info to
handle this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Laurent.
 * Added trailing commas for num_supplies in adv753{3,5}_chip_info.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 27 ++++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index f8d61f2fa30e..edf7be9c21d3 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -337,6 +337,8 @@ struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned int max_mode_clock_khz;
 	unsigned int max_lane_freq_khz;
+	const char * const *supply_names;
+	unsigned int num_supplies;
 };
 
 struct adv7511 {
@@ -375,7 +377,6 @@ struct adv7511 {
 	struct gpio_desc *gpio_pd;
 
 	struct regulator_bulk_data *supplies;
-	unsigned int num_supplies;
 
 	/* ADV7533 DSI RX related params */
 	struct device_node *host_node;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 1c76aa5a5d5b..2bcd17953221 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1004,37 +1004,30 @@ static const char * const adv7533_supply_names[] = {
 
 static int adv7511_init_regulators(struct adv7511 *adv)
 {
+	const char * const *supply_names = adv->info->supply_names;
+	unsigned int num_supplies = adv->info->num_supplies;
 	struct device *dev = &adv->i2c_main->dev;
-	const char * const *supply_names;
 	unsigned int i;
 	int ret;
 
-	if (adv->info->type == ADV7511) {
-		supply_names = adv7511_supply_names;
-		adv->num_supplies = ARRAY_SIZE(adv7511_supply_names);
-	} else {
-		supply_names = adv7533_supply_names;
-		adv->num_supplies = ARRAY_SIZE(adv7533_supply_names);
-	}
-
-	adv->supplies = devm_kcalloc(dev, adv->num_supplies,
+	adv->supplies = devm_kcalloc(dev, num_supplies,
 				     sizeof(*adv->supplies), GFP_KERNEL);
 	if (!adv->supplies)
 		return -ENOMEM;
 
-	for (i = 0; i < adv->num_supplies; i++)
+	for (i = 0; i < num_supplies; i++)
 		adv->supplies[i].supply = supply_names[i];
 
-	ret = devm_regulator_bulk_get(dev, adv->num_supplies, adv->supplies);
+	ret = devm_regulator_bulk_get(dev, num_supplies, adv->supplies);
 	if (ret)
 		return ret;
 
-	return regulator_bulk_enable(adv->num_supplies, adv->supplies);
+	return regulator_bulk_enable(num_supplies, adv->supplies);
 }
 
 static void adv7511_uninit_regulators(struct adv7511 *adv)
 {
-	regulator_bulk_disable(adv->num_supplies, adv->supplies);
+	regulator_bulk_disable(adv->info->num_supplies, adv->supplies);
 }
 
 static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
@@ -1365,18 +1358,24 @@ static void adv7511_remove(struct i2c_client *i2c)
 
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
+	.supply_names = adv7511_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
 	.max_mode_clock_khz = 80000,
 	.max_lane_freq_khz = 800000,
+	.supply_names = adv7533_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
 	.max_mode_clock_khz = 148500,
 	.max_lane_freq_khz = 891000,
+	.supply_names = adv7533_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

