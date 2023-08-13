Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1663F77AA80
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Aug 2023 20:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjHMSGH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Aug 2023 14:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjHMSGH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2023 14:06:07 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C8A2170C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2023 11:06:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; 
   d="scan'208";a="172836586"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Aug 2023 03:06:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4109A405E63A;
        Mon, 14 Aug 2023 03:05:59 +0900 (JST)
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
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to struct adv7511_chip_info
Date:   Sun, 13 Aug 2023 19:05:12 +0100
Message-Id: <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per spec, it is allowed to pulse the HPD signal to indicate that the
EDID information has changed. Some monitors do this when they wake up
from standby or are enabled. When the HPD goes low the adv7511 is
reset and the outputs are disabled which might cause the monitor to
go to standby again. To avoid this we ignore the HPD pin for the
first few seconds after enabling the output. On the other hand,
adv7535 require to enable HPD Override bit for proper HPD.

Add hpd_override_enable feature bit to struct adv7511_chip_info to handle
this scenario.

While at it, drop the enum adv7511_type as it is unused.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  8 +-------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 +++++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 627531f48f84..c523ac4c9bc8 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -325,22 +325,16 @@ struct adv7511_video_config {
 	struct hdmi_avi_infoframe avi_infoframe;
 };
 
-enum adv7511_type {
-	ADV7511,
-	ADV7533,
-	ADV7535,
-};
-
 #define ADV7511_MAX_ADDRS 3
 
 struct adv7511_chip_info {
-	enum adv7511_type type;
 	unsigned long max_mode_clock;
 	unsigned long max_lane_freq;
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	unsigned has_dsi:1;
 	unsigned link_config:1;
+	unsigned hpd_override_enable:1;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6974c267b1d5..7b06a0a21685 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv7511)
 	 * first few seconds after enabling the output. On the other hand
 	 * adv7535 require to enable HPD Override bit for proper HPD.
 	 */
-	if (adv7511->info->type == ADV7535)
+	if (adv7511->info->hpd_override_enable)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE);
@@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 static void __adv7511_power_off(struct adv7511 *adv7511)
 {
 	/* TODO: setup additional power down modes */
-	if (adv7511->info->type == ADV7535)
+	if (adv7511->info->hpd_override_enable)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
 
@@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 			status = connector_status_disconnected;
 	} else {
 		/* Renable HPD sensing */
-		if (adv7511->info->type == ADV7535)
+		if (adv7511->info->hpd_override_enable)
 			regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 					   ADV7535_REG_POWER2_HPD_OVERRIDE,
 					   ADV7535_REG_POWER2_HPD_OVERRIDE);
@@ -1360,14 +1360,12 @@ static void adv7511_remove(struct i2c_client *i2c)
 }
 
 static const struct adv7511_chip_info adv7511_chip_info = {
-	.type = ADV7511,
 	.supply_names = adv7511_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
 	.link_config = 1
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
-	.type = ADV7533,
 	.max_mode_clock = 80000,
 	.max_lane_freq = 800000,
 	.supply_names = adv7533_supply_names,
@@ -1376,12 +1374,12 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
-	.type = ADV7535,
 	.max_mode_clock = 148500,
 	.max_lane_freq = 891000,
 	.supply_names = adv7533_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
-	.has_dsi = 1
+	.has_dsi = 1,
+	.hpd_override_enable = 1
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

