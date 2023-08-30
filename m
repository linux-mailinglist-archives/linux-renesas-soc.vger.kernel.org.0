Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690C878DC8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Aug 2023 20:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237592AbjH3Sp7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Aug 2023 14:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245046AbjH3OYc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 10:24:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 746DA12F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 07:24:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; 
   d="scan'208";a="178194102"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5805F42170F5;
        Wed, 30 Aug 2023 23:24:21 +0900 (JST)
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
Subject: [PATCH v2 3/8] drm: adv7511: Add max_lane_freq_khz variable to struct adv7511_chip_info
Date:   Wed, 30 Aug 2023 15:23:53 +0100
Message-Id: <20230830142358.275459-4-biju.das.jz@bp.renesas.com>
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

The ADV7533 supports a maximum lane clock of 800MHz whereas it is 891MHz
for ADV7535. Add max_lane_freq_khz variable to struct adv7511_chip_info to
handle this difference.

While at it, drop the unused local variable max_lane_freq.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Laurent.
 * Replaced max_lane_freq->max_lane_freq_khz in struct adv7511_chip_info.
 * Replaced variable type from unsigned long->unsigned int.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 ++
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index b9c6c1e8a353..f8d61f2fa30e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -336,6 +336,7 @@ enum adv7511_type {
 struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned int max_mode_clock_khz;
+	unsigned int max_lane_freq_khz;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 12ceffd6a9eb..1c76aa5a5d5b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1370,11 +1370,13 @@ static const struct adv7511_chip_info adv7511_chip_info = {
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
 	.max_mode_clock_khz = 80000,
+	.max_lane_freq_khz = 800000,
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
 	.max_mode_clock_khz = 148500,
+	.max_lane_freq_khz = 891000,
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 1d113489754c..4481489aaf5e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -103,7 +103,6 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
 enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 					const struct drm_display_mode *mode)
 {
-	unsigned long max_lane_freq;
 	struct mipi_dsi_device *dsi = adv->dsi;
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
@@ -112,9 +111,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 		return MODE_CLOCK_HIGH;
 
 	/* Check max clock for each lane */
-	max_lane_freq = (adv->info->type == ADV7533 ? 800000 : 891000);
-
-	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
+	if (mode->clock * bpp > adv->info->max_lane_freq_khz * adv->num_dsi_lanes)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.25.1

